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
--댓글 시퀀스
create sequence comments_seq START WITH 1 MINVALUE 0;

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

--회원 테이블
  CREATE TABLE "SCOTT"."F_USER" 
   (	"LOGIN_ID" VARCHAR2(200 BYTE), 
	"LOGIN_PW" VARCHAR2(200 BYTE), 
	"NAME" VARCHAR2(100 BYTE), 
	"EMAIL" VARCHAR2(200 BYTE), 
	"TEL_NUMBER" VARCHAR2(200 BYTE), 
	"BIRTH" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
REM INSERTING into SCOTT.F_USER
SET DEFINE OFF;
Insert into SCOTT.F_USER (LOGIN_ID,LOGIN_PW,NAME,EMAIL,TEL_NUMBER,BIRTH) values ('admin','admin','관리자','pinata2023@gmail.com','010-2023-0704','2023-07-04');
--------------------------------------------------------
--  DDL for Index SYS_C007783
--------------------------------------------------------

  CREATE UNIQUE INDEX "SCOTT"."SYS_C007783" ON "SCOTT"."F_USER" ("LOGIN_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE" ;
--------------------------------------------------------
--  Constraints for Table F_USER
--------------------------------------------------------

  ALTER TABLE "SCOTT"."F_USER" MODIFY ("LOGIN_ID" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."F_USER" MODIFY ("LOGIN_PW" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."F_USER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."F_USER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."F_USER" MODIFY ("TEL_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "SCOTT"."F_USER" ADD PRIMARY KEY ("LOGIN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "EXAMPLE"  ENABLE;
  ALTER TABLE "SCOTT"."F_USER" MODIFY ("BIRTH" NOT NULL ENABLE);

--
CREATE TABLE staff_recruitment( --스탭 모집 공고
    SRNO NUMBER PRIMARY KEY,                  --스탭 모집 공고 고유 번호
    recruitment_to NUMBER NOT NULL,           --모집인원
    recruitment_field VARCHAR2(100) NOT NULL, --모집분야
    preferential_treatment VARCHAR2(100),     --우대사항
    application_period VARCHAR2(100) NOT NULL --접수기간
);

CREATE TABLE staff_recruitment_apply( --스탭 신청 양식
    SRNO NUMBER,                                 --스탭 모집 공고 고유 번호
    SRANO NUMBER,                                --스탭 신청 양식 고유 번호
    support_period_start VARCHAR2(100) NOT NULL, --지원기간 시작일
    support_period_end VARCHAR2(100) NOT NULL,   --지원기간 종료일
    recruitment_field VARCHAR2(100) NOT NULL,    --모집분야
    id VARCHAR2(100) NOT NULL,                   --아이디
    CONSTRAINT staff_recruitment_apply_pk PRIMARY KEY (SRNO, SRANO) --PK 2개 설정
);
--스탭 신청 양식 고유 번호 시퀀스
CREATE SEQUENCE staff_recruitment_apply_SEQ
START WITH 1
INCREMENT BY 1;

CREATE TABLE common_code( --공통 코드
    code_type VARCHAR2(100) PRIMARY KEY,
    code_name VARCHAR2(100) NOT NULL
);

SELECT * FROM staff_recruitment ORDER BY SRNO DESC;
SELECT * FROM staff_recruitment_apply ORDER BY SRANO DESC;
SELECT * FROM common_code;

INSERT INTO common_code VALUES ('rf0', '기타');
INSERT INTO common_code VALUES ('rf1', '안내도우미');
INSERT INTO common_code VALUES ('rf2', '안전요원');

--api 테이블
 CREATE TABLE "SCOTT"."FESTIVAL_INFO" 
   (	"FT_CODE" NUMBER(4,0), 
	"FSTVL_NM" VARCHAR2(200 BYTE), 
	"OPAR" VARCHAR2(200 BYTE), 
	"FSTVL_START_DATE" VARCHAR2(20 BYTE), 
	"FSTVL_END_DATE" VARCHAR2(20 BYTE), 
	"FSTVL_CO" VARCHAR2(2000 BYTE), 
	"MNNST" VARCHAR2(200 BYTE), 
	"AUSPC_INSTT" VARCHAR2(400 BYTE), 
	"SUPRT_INSTT" VARCHAR2(400 BYTE), 
	"PHONE_NUMBER" VARCHAR2(13 BYTE), 
	"HOMEPAGE_URL" VARCHAR2(300 BYTE), 
	"RELATE_INFO" VARCHAR2(200 BYTE), 
	"RDNMADR" VARCHAR2(200 BYTE), 
	"LNMADR" VARCHAR2(200 BYTE), 
	"LATITUDE" VARCHAR2(200 BYTE), 
	"LONGITUDE" VARCHAR2(200 BYTE), 
	"REFERENCE_DATE" VARCHAR2(200 BYTE), 
	"INSTT_CODE" VARCHAR2(200 BYTE), 
	"IMG_HREF" VARCHAR2(400 BYTE)
   ) 