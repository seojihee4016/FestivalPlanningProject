--신청 양식 테이블 
CREATE TABLE FESTIVAL_FORM(
FNO NUMBER NOT NULL, 												-- 신청 양식 고유 번호
writer varchar2(50) not null, 							--작성자
FESTIVAL_NAME varchar2(200) not null,				--행사 이름
place varchar2(100) not null, 							--장소 구분 (실내 / 실외 /실내 + 실외)
address_event varchar2(200) not null, 			--행사 주소
Number_of_people varchar2(100) not null,		--예상 인원 수
carrying_difficulty varchar2(200) not null, --행사 난이도
start_date date not null,										--행사 시작 일(날짜, 시간)
end_date date not null,											--행사 종료 일(날짜, 시간)
budget_range varchar2(100) not null,				-- 예상 금액 
commissioning_agency varchar2(100) not null,--의뢰 기관
NAME varchar2(100) not null,								--담당자 이름 
CONSTRAINT FESTIVAL_FORM_PK PRIMARY KEY (FNO)
);
--신청 양식 시퀀스
CREATE SEQUENCE FESTIVAL_FORM_SEQ
START WITH 1
INCREMENT BY 1;


--문의 게시판 테이블
CREATE TABLE Bulletin_Board(
    BNO NUMBER NOT NULL,										--게시판 고유 번호
    TITLE VARCHAR2(100)     NOT NULL,				--제목
    TYPE_OF_INQUIRY VARCHAR2(100)  NOT NULL,--글 유형
    CONTENT VARCHAR2(2000)  NOT NULL,				--내용
    WRITER VARCHAR2(100)    NOT NULL,				--작성자
    REGDATE DATE            DEFAULT SYSDATE,--등록일자	
    PRIMARY KEY(BNO)
);
--문의 게시판 시퀀스
CREATE SEQUENCE Bulletin_Board_SEQ
START WITH 1
INCREMENT BY 1;
 

--댓글 테이블
create table comments (
    bno number not null, 						 --게시판 고유 번호
    cno number not null,						 --댓글 고유 번호
    content varchar2(1000) not null, --댓글 내용
    writer varchar2(50) not null,		 --작성자
    regdate date default sysdate,		 --등록일자
    primary key(bno, cno)
);


--공통 코드 
create table common_code (
code_type varchar2(100) not null,
code_name varchar2(100) not null,
CONSTRAINT common_code_PK PRIMARY KEY (code_type)
);

insert into common_code values ('level1', '실외 행사장 / 차량이 행사 현장까지 진입 가능');
insert into common_code values ('level2', '실외 행사장 / 차량이 행사 현장까지 진입 불가능');
insert into common_code values ('level3', '실내 행사장 / 1층이라 엘레베이터 필요 없음');
insert into common_code values ('level4', '실내 행사장 / 지하 또는 지상층이지만 엘레베이터 있음');
insert into common_code values ('level5', '실내 행사장 / 지하 또는 지상층이지만 엘레베이터 없음');

insert into common_code values ('budgetRange 100', '100만원 이하');
insert into common_code values ('budgetRange 100~200', '100만원 ~ 200만원');
insert into common_code values ('budgetRange 200~300', '200만원 ~ 300만원');
insert into common_code values ('budgetRange 300~400', '300만원 ~ 400만원');
insert into common_code values ('budgetRange 400~500', '400만원 ~ 500만원');
insert into common_code values ('budgetRange 500~600', '500만원 ~ 600만원');
insert into common_code values ('budgetRange 600~1000', '600만원 ~ 1000만원');
insert into common_code values ('budgetRange 1000~3000', '1000만원 ~ 3000만원');
insert into common_code values ('budgetRange 3000~', '3000만원 이상');

insert into common_code values ('NumberOfPeople 50', '50명 이내');
insert into common_code values ('NumberOfPeople 51~100', '51~100명');
insert into common_code values ('NumberOfPeople 101~200', '101명~200명');
insert into common_code values ('NumberOfPeople 201~300', '201명 ~ 400명');
insert into common_code values ('NumberOfPeople 301~400', '400명 이상');

insert into common_code values ('inside', '실내');
insert into common_code values ('outdoors', '실외');
insert into common_code values ('inAndOut', '실내 + 실외');
