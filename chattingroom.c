#include <stdio.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>

#include <pthread.h>

#define MAX_BUFF 100
#define MAX_MESSAGE_LEN 256
#define MAX_USER_NAME 10

typedef struct Message {
    int user_id;
    char user_name[MAX_USER_NAME];
    char str[MAX_MESSAGE_LEN];
}Message;


void *sendThread();
void *recvThread(void *data);
void *sendThreadClient(void *data);
int isFull();
int isEmpty();
int enqueue(Message item);
Message* dequeue();

int sock_main, sock_client[10];
Message *msgbuff;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int front = -1;
int rear = -1;

int main()
{
	int mode;
    int room;   // 채팅방의 번호를 저장하기 위한 변수
    char name[MAX_USER_NAME];   // 사용자 이름을 저장하기 위한 변수
	int count = 0;
	int th_id;
    int server_info;
	Message buff;
	pthread_t th_send;

	struct sockaddr_in addr, client_addr;
    int client_addr_size;

	printf("1. Server, 2. Client : ");
	scanf("%d", &mode);
	getchar();

	if (mode == 1) {
		pthread_t th_recv[10];
        printf("방 번호를 입력해주세요 : ");
        scanf("%d", &room);

		msgbuff = (Message *)malloc(sizeof(Message) * MAX_BUFF);

		// Create Send Thread
		th_id = pthread_create(&th_send, NULL, sendThread, 0);

		if (th_id < 0) {
			printf("Send Thread Creation Failed\n");
			exit(1);
		}

		addr.sin_family = AF_INET;  // 주소 체계 (TCP/IP)
		addr.sin_port = htons(room); // 포트 번호 htons() -> 네트워크 바이트 정렬로 변환한 값
		addr.sin_addr.s_addr = INADDR_ANY; // IP주소 자동으로 찾아서 대입

        // AF_INET -> IPv4, SOCK_STREAM -> TCP
		if ((sock_main = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
			printf("Socket Open Failed\n");
			exit(1);
		}

		if (bind(sock_main, (struct sockaddr*)&addr, sizeof(addr)) == -1) {
			printf("Bind Failed\n");
			exit(2);
		}

		// listen -> 연결 요청 대기
		if (listen(sock_main, 5) == -1) {
			printf("Listen Failed\n");
			exit(3);
		}
        
        client_addr_size = sizeof(client_addr);
        printf("=====[방 번호] : %d =====\n",room);

		while (1) {
			if ((sock_client[count] = accept(sock_main, (struct sockaddr *)&client_addr,(socklen_t *)&client_addr_size)) == -1) {
				printf("Accept Failed\n");
				break;
			} else {
				if (count < 10) {
                    int idx = count;

					th_id = pthread_create(&th_recv[count], NULL, recvThread, (void *)&idx);

					if (th_id < 0) {
						printf("Receive Thread #%d Creation Failed\n", count + 1);
						exit(1);
					}

					count++;
				}
			}
		}
	}
	else {
        printf("입장하실 방의 번호를 입력해주세요 : ");
        scanf("%d", &room);
        printf("이름을 알려주세요 : ");
        scanf("%s", &name);
        
		addr.sin_family = AF_INET;
		addr.sin_port = htons(room);
		addr.sin_addr.s_addr = inet_addr("127.0.0.1");

		if ((sock_main = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
			printf("Socket Open Failed\n");
			exit(1);
		}

		// Connect
		if (connect(sock_main, (struct sockaddr*)&addr, sizeof(addr)) == -1) {
			printf("Connect Failed\n");
			exit(4);
		}

		// Client Send Thread
		th_id = pthread_create(&th_send, NULL, sendThreadClient, (void *)&name);
        

		if (th_id < 0) {
			printf("Send Thread Creation Failed\n");
			exit(1);
		}


		while (1) {
			memset(&buff, 0, sizeof(buff));

			if (recv(sock_main, (char*)&buff, sizeof(buff), 0) > 0) {
				printf("[ %s ] : %s\n", buff.user_name, buff.str);
			}
			else {
				printf("Disconnected\n");
				exit(5);
			}
		}
	}

	return 0;
}

void *sendThread() {
	Message *tmp;

	while (1) {
		if ((tmp = dequeue()) != NULL) {
			for (int i = 0; i < 10; i++) {
				if (i != tmp->user_id) {
					send(sock_client[i], (char*)tmp, sizeof(Message), 0);
				}
			}
		}

		usleep(1000);
	}
}

void *recvThread(void *data) {
	Message buff;
	int thread_id = *((int*)data);
    
    printf("현재 인원 %d명\n", thread_id+1);

	memset(&buff, 0, sizeof(Message));

	while (recv(sock_client[thread_id], (char*)&buff, sizeof(buff), 0) > 0) {
		buff.user_id = thread_id;
		if (enqueue(buff) == -1) {
			printf("Messag Buffer Full\n");
		}
	}
}

void *sendThreadClient(void *data) {
	Message tmp;
    int count;
    char user_name[MAX_USER_NAME];
    strcpy(user_name,((char *)data));
    printf("[ 사용자 이름 : %s ]\n",user_name);

	while (1) {
		memset(&tmp, 0, sizeof(tmp));
		fgets(tmp.str, MAX_MESSAGE_LEN, stdin);
		tmp.str[strlen(tmp.str) - 1] = '\0';
		tmp.user_id = -1;
        strcpy(tmp.user_name,user_name);
        
		count = send(sock_main, (char *)&tmp, sizeof(Message), 0);
	}
}

int isFull() {
	if ((front == rear + 1) || (front == 0 && rear == MAX_BUFF - 1)) {
		return 1;
	}
	return 0;
}

int isEmpty() {
	if (front == -1) {
		return 1;
	}
	return 0;
}

int enqueue(Message item) {

	if (isFull()) {
		return -1;
	}
	else {
		pthread_mutex_lock(&mutex);
		if (front == -1) {
			front = 0;
		}
		rear = (rear + 1) % MAX_BUFF;
		msgbuff[rear].user_id = item.user_id;
        strcpy(msgbuff[rear].user_name, item.user_name); // 사용자 이름 저장
		strcpy(msgbuff[rear].str, item.str);
		pthread_mutex_unlock(&mutex);
	}
	return 0;
}

Message* dequeue() {
	Message *item;

	if (isEmpty()) {
		return NULL;
	}
	else {
		pthread_mutex_lock(&mutex);
		item = &msgbuff[front];

		if (front == rear) {
			front = -1;
			rear = -1;
		}
		else {
			front = (front + 1) % MAX_BUFF;
		}
		pthread_mutex_unlock(&mutex);
		return item;
	}

}

