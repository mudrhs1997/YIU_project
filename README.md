# YIU

## 3-1 Database Project

Swift, SQLite을 이용해서 축구 팀 기록 관리 어플을 만들고자 합니다.

팀원들의 기록, 팀, 일정 등의 기능을 구현합니다.



![E-R 다이어그램 drawio](https://user-images.githubusercontent.com/77499260/169853615-339200c1-1f0e-494c-8e19-decd3731e978.png)
![Internal Schema drawio](https://user-images.githubusercontent.com/77499260/169853939-60ddbc1b-19b7-4bff-ae9a-1707a0b799cd.png)
![Schema drawio](https://user-images.githubusercontent.com/77499260/169853934-248ac0f5-1668-45b0-af9c-382c54306365.png)

<hr>

# 요구사항 명세서

- 회원
    - 이 어플을 이용하기 위해선 회원가입을 해야 한다.
    - 회원은 아이디, 비밀번호, 이름을 입력해야 한다.
    - 회원은 하나 이상의 팀에 가입할 수 있다.
    
- 팀
    - 팀은 여러 명의 팀원을 가질 수 있다.
    - 팀은 한 명의 단장을 가진다.
    - 팀은 반드시 팀 id, 팀 이름, 팀마크를 포함한다.
    - 팀은 일정을 가질 수 있다.
    - 일정은 상대팀의 정보, 날짜를 가진다.
    
- 팀원
    - 팀원 기록 반드시 이름, 골, 어시스트, 출장횟수을 포함한다.
    - 팀원은 이름이로 인식한다.


    

| 개체 | 속성 |
| --- | --- |
| 회원 | 회원아이디, 비밀번호, 이름 |
| 팀 | 창단일자, 팀이름, 멤버 수, 단장이름 |
| 팀원 | 등번호, 이름, 골 , 어시스트, 출장횟수, 평점 |
| 기록 | 팀 기록, 개인 기록, 상대팀 정보 |
| 일정 | 상대팀의 정보, 시간과 날짜 |

| 관계 | 관계에 참여하는 개체 | 관계 유형 | 속성 |
| --- | --- | --- | --- |
| 팀 | 유저,팀 | 다대다 | 유저id,팀id |
| 관리 | 팀, 팀원 | 일대일 | 이름 |
| 기록 | 일정, 팀원 | 다대다 | 골, 어시스트, 출장횟수, 평점 |
| 작성 | 팀원, 게시판 | 일대다 |  |


<hr>

-USER

    CREATE TABLE User( id TEXT NOT NULL PRIMARY KEY, password TEXT NOT NULL, name TEXT NOT NULL )
    
    
-USERTEAM

    CREATE TABLE UserTeam( user_id TEXT NOT NULL PRIMARY KEY,
    team_id TEXT NOT NULL,
    CONSTRAINT userid_fk FOREIGN KEY (user_id) REFERENCES User(id)
    , CONSTRAINT teamid_fk FOREIGN KEY (team_id) REFERENCES TEAM(id) )
    
    
-TEAM

    CREATE TABLE Team( id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, image TEXT NOT NULL DEFAULT 'swift' )
    
-Stats

    CREATE TABLE Stats( team_id INTEGER NOT NULL PRIMARY KEY, name Text NOT NULL,
    goals INTEGER DEFAULT 0,
    assists INTEGER DEFAULT 0,
    games INTEGER DEFAULT 0,
    CONSTRAINT teamid_fk FOREIGN KEY (team_id) REFERENCES TEAM(id) 
    )
    
    
-SCHEDULE

    CREATE TABLE Schedule( opp_name TEXT NOT NULL PRIMARY KEY, date TEXT DEFAULT '1999-99-99' )
    
    
