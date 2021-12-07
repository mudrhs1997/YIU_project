#include <iostream>
#include <stack>
#include <cstdio>
#include <utility>
#define MAX_LIST_SIZE 100;
using namespace std;

int dx[4] = {0,1,0,-1};
int dy[4] = {1,0,-1,0};
bool visited[6][6];
int maze[6][6] =
{   {1,1,1,1,1,1},
    {0,0,0,0,0,1},
    {1,0,1,0,1,1},
    {1,1,1,0,0,0},
    {1,1,1,0,1,1},
    {1,1,1,1,1,1}
};



class Node {
    Node* link;
    pair<int, int> point;
public:
    Node( int x = 0, int y = 0 ) {
        link = NULL;
        point = make_pair(x, y);
    }
    ~Node(void) { }
    Node* getLink() { return link; }
    void setLink( Node *p ) { link = p; }
    void display() {
        printf("(%d, %d) ",point.first,point.second);
    }
    bool hashData(int x, int y) { return point == make_pair(x, y); }
    
    pair<int, int> getPoint() {
        return point;
    }
    
    void insertNext( Node *n ) {
        if( n != NULL ) {
            n -> link = link;
            link = n;
        }
    }
    
    Node* removeNext() {
        Node* removed = link;
        if( removed != NULL ) {
            link = removed -> link;
        }
        return removed;
    }
};

class LinkedStack {
    Node* top;
public:
    LinkedStack() { top = NULL; }
    ~LinkedStack() {
        while(!isEmpty()) {
            delete pop();
        }
    }
    bool isEmpty() { return top == NULL; }
    
    void push( Node *p ) {
        if ( isEmpty() ) { top = p; }
        else {
            p -> setLink( top );
            top = p;
        }
    }
    Node* pop() {
        if( isEmpty() ) { return NULL; }
        Node *p = top;
        top = top -> getLink();
        return p;
    }
    Node* peek() { return top; }
    
    void display() {
        for ( Node *p = top; p != NULL; p = p ->getLink() ) {
            p -> display();
        }
    }
};

LinkedStack st;
pair<int, int> ex = make_pair(3, 5);

void search(pair<int, int> start) {
    visited[start.first][start.second] = true;
    maze[start.first][start.second] = 2;
    for (int i = 0; i < 4; i++) {
        int point_x = start.first+dx[i];
        int point_y = start.second+dy[i];
        if (0 <= point_x && point_x < 6 && 0 <= point_y && point_y < 6) {
            if (visited[point_x][point_y] == false) {
                st.push(new Node(point_x,point_y));
            }
        }
    }
    printf("Stack : ");
    st.display();
    printf("\n");
    if (start == ex) {
        for (int i = 0; i < 6; i++) {
            for (int j = 0; j < 6; j++) {
                printf("%d ",maze[i][j]);
            }
            printf("\n");
        }
        printf("\narrive!\n");
    } else if (!st.isEmpty()) {
        for (int i = 0; i < 6; i++) {
            for (int j = 0; j < 6; j++) {
                printf("%d ",maze[i][j]);
            }
            printf("\n");
        }
        printf("\n");
        Node *n = st.pop();
        pair<int, int> next = n -> getPoint();
        search(next);
    }
}


int main() {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) {
            if (maze[i][j] == 1) {
                visited[i][j] = true;
            }
        }
    }
    search(make_pair(1, 0));
}

//class LinkedQueue {
//    Node* front;
//    Node* rear;
//public:
//    LinkedQueue(): front(NULL), rear(NULL) { }
//    ~LinkedQueue() { while(!isEmpty()) delete dequeue(); }
//    bool isEmpty() { return front == NULL; }
//
//    void enqueue ( Node* p ) {
//        if( isEmpty() ) {front = rear = p;}
//        else {
//            rear -> setLink(p);
//            rear = p;
//        }
//    }
//    Node* dequeue() {
//        if ( isEmpty() ) { return NULL; }
//        Node* p = front;
//        front = front -> getLink();
//        if (front == NULL ) { rear == NULL; }
//        return p;
//    }
//    void display() {
//        printf("[큐 내용] : ");
//        for (Node* p = front; p != NULL; p = p->getLink() ) {
//            p->display();
//        }
//        printf( " \n");
//    }
//};
