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

--DROP TABLE staff_recruitment;
--DROP TABLE staff_recruitment_apply;
--DROP TABLE common_code;

SELECT * FROM staff_recruitment ORDER BY SRNO DESC;
SELECT * FROM staff_recruitment_apply ORDER BY SRANO DESC;
SELECT * FROM common_code;

INSERT INTO common_code VALUES ('rf0', '기타');
INSERT INTO common_code VALUES ('rf1', '안내도우미');
INSERT INTO common_code VALUES ('rf2', '안전요원');

INSERT INTO common_code VALUES ('inside', '실내');
INSERT INTO common_code VALUES ('outdoors', '실외');
INSERT INTO common_code VALUES ('inAndOut', '실내 + 실외');





SELECT ff.FESTIVAL_NAME, ff.address_event, ff.place,
        sra.id, sra.support_period_start, sra.support_period_end,
        cc.code_name
FROM FESTIVAL_FORM ff, staff_recruitment_apply sra, common_code cc
WHERE ff.fno = sra.srno AND sra.recruitment_field = cc.code_type AND sra.id = 'admin';