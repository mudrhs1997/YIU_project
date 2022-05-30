# YIU

## 3-1 Database Project

Swift, SQLite을 이용해서 축구 팀 기록 관리 어플을 만들고자 합니다.

팀원들의 기록, 포메이션, 일정, 게시판, 영상관리 등의 기능을 구현합니다.



![E-R 다이어그램 drawio](https://user-images.githubusercontent.com/77499260/169853615-339200c1-1f0e-494c-8e19-decd3731e978.png)
![Internal Schema drawio](https://user-images.githubusercontent.com/77499260/169853939-60ddbc1b-19b7-4bff-ae9a-1707a0b799cd.png)
![Schema drawio](https://user-images.githubusercontent.com/77499260/169853934-248ac0f5-1668-45b0-af9c-382c54306365.png)

<hr>

# 요구사항 명세서

- 회원
    - 이 어플을 이용하기 위해선 회원가입을 해야 한다.
    - 회원은 아이디(이메일), 비밀번호, 이름을 입력해야 한다.
    - 회원 가입 승인이 되기 전까지 활동은 제한된다.
    - 회원은 하나 이상의 팀에 가입할 수 있다.
    
- 팀
    - 팀은 여러 명의 팀원을 가질 수 있다.
    - 팀은 한 명의 단장을 가진다.
    - 팀은 반드시 창단일자, 팀 이름, 멤버 수, 단장의 정보를 포함한다.
    - 팀은 일정을 가질 수 있다.
    - 일정은 상대팀의 정보, 날짜를 가진다.
    
- 팀원
    - 팀원 정보는 반드시 등번호, 이름, 골, 어시스트, 출장횟수, 평점을 포함한다.
    - 팀원은 등번호로 인식한다.

- 기록
    - 기록은 개인 기록, 팀 기록으로 나눈다.
    - 팀 기록은 승리, 무승부, 패배를 가진다.
    - 승무패 기록시에 상대팀의 정보도 포함한다.

- 게시판
    - 팀원은 게시글에 코멘트르 여러 개 작성 가능하고, 게시글은 단장만 작성할 수 있다.
    - 게시글에 대한 글번호, 글제목, 글내용, 작성일자 정보를 유지해야 한다.
    - 게시글은 글번호로 식별한다.



    

| 개체 | 속성 |
| --- | --- |
| 회원 | 회원아이디, 비밀번호, 이름 |
| 팀 | 창단일자, 팀이름, 멤버 수, 단장이름 |
| 팀원 | 등번호, 이름, 골 , 어시스트, 출장횟수, 평점 |
| 기록 | 팀 기록, 개인 기록, 상대팀 정보 |
| 게시판 | 글번호, 글제목, 글내용, 작성일자 |
| 일정 | 상대팀의 정보, 시간과 날짜 |

| 관계 | 관계에 참여하는 개체 | 관계 유형 | 속성 |
| --- | --- | --- | --- |
| 관리 | 팀, 팀원 | 일대일 | 이름 |
| 기록 | 일정, 팀원 | 다대다 | 골, 어시스트, 출장횟수, 평점 |
| 작성 | 팀원, 게시판 | 일대다 |  |


<hr>

-USER

    CREATE TABLE USER (
    USER_ID TEXT NOT NULL PRIMARY KEY,
    USER_PASSWORD TEXT NOT NULL,
    USER_NAME TEXT NOT NULL,
    );
    
    
-BOARD

    CREATE TABLE BOARD (
    BOARD_NUM INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    BOARD_TITLE TEXT NOT NULL,
    BOARD_DETAIL TEXT,
    DETAIL_DATE TEXT
    );
    
    
    
-TEAM

    CREATE TABLE TEAM (
    TEAM_NAME TEXT NOT NULL,
    TEAM_DATE TEXT,
    MEMBER_NUM INT
    );
    
-MEMBER

    CREATE TABLE MEMBER (
    MEMBER_NUMBER INT NOT NULL PRIMARY KEY,
    MEMBER_NAME TEXT NOT NULL,

    MEMBER_GOAL INT,
    MEMBER_ASSIST INT,
    MEMBER_PERFORM INT
    );
    
    
-SCHEDULE

    CREATE TABLE SCHEDULE (
    TEAM_NAME TEXT NOT NULL,
    OPPONENT_TEAM TEXT NOT NULL,
    GAME_DATE TEXT,
    GAME_LOCATION TEXT,
    FOREIGN KEY(TEAM_NAME)
    REFERENCES TEAM(TEAM_NAME) ON UPDATE CASCADE,
    FOREIGN KEY(OPPONENT_TEAM)
    REFERENCES GAME(OPPONENT_TEAM) ON UPDATE CASCADE
    );
    
-GAME

    CREATE TABLE GAME (
    OPPONENT_TEAM TEXT NOT NULL
    );
