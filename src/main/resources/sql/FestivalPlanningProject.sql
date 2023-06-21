--폼 양식 테이블 => 게시글 내용
CREATE TABLE FESTIVAL_FORM(
FNO NUMBER NOT NULL,
FESTIVAL_NAME varchar2(200) not null, --행사 이름
place varchar2(100) not null, --장소 구분 (실내 / 실외 /실내 + 실외)
address_event varchar2(200) not null, --행사 주소
Number_of_people varchar2(100) not null,--예상 인원 수 (라디오 버튼이라 varchar2) 
carrying_difficulty varchar2(200) not null, --행사 난이도
start_date date not null,--행사 시작 일(날짜, 시간)
end_date date not null,--행사 종료 일(날짜, 시간)
budget_range varchar2(100) not null,-- 예상 금액 / select option 기능이라서 varchar2
commissioning_agency varchar2(100) not null,--의뢰 기관
NAME varchar2(100) not null,--담당자 이름 (아이디가 있어서 불필요?)
CONSTRAINT FESTIVAL_FORM_PK PRIMARY KEY (FNO)
);

CREATE SEQUENCE FESTIVAL_FORM_SEQ
START WITH 1
INCREMENT BY 1;


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


 


