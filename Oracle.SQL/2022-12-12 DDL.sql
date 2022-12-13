-- DDL
/*
        DQL : SELECT (데이터 검색)
              SELECT 컬럼명, (SELECT~) => 스칼라 서브쿼리
              FROM table_name(SELECT~) => 인라인 뷰
              WHERE 컬럼명 연산자(SELECT~) => 서브쿼리 (단일, 다중) ==> ROW 단위
              
        DDL : 정의 언어(table, view, index..) => Column 단위
              CREATE
                 table 제작
                 CREATE TABLE table_name
                 CREATE VIEW view_name
                 CREATE INDEX index_name
                 CREATE SEQUENCE seq_name
                 CREATE FUNCTION func_name
                 CREATE PROCEDURE pro_name
                 CREATE TRIGGER trigger_name
              ALTER : 수정
                     ADD : 추가
                     MODIFY : 수정
                     DROP COLUMN : 삭제
                     RENAME COLUMN : 이름변경
              DROP : 완전 삭제
              TRUNCATE : 잘라내기 (테이블은 존재, 데이터만 삭제)
              RENAME : 테이블 이름 변경
        데이터 조작(DML) -> ROW 단위
             데이터 추가 : INSERT
             데이터 수정 : UPDATE
             데이터 삭제 : DELETE
*/
SELECT * FROM emp;

/*
개념 설계 ===> 논리 설계, 물리 설계 
                      -------- 데이터 크기
             -------- 데이터 형
------- 데이터 추출
판매전표
----------------------------------------------------------
컬럼명     전표번호   판매일자   고객명   총액
----------------------------------------------------------
제약조건      PK       NN       NN     CK
                   DEFAULT  
----------------------------------------------------------
참조테이블
----------------------------------------------------------
참조컬럼
----------------------------------------------------------
체크                                  >0
----------------------------------------------------------
데이터형  VARCHAR2    DATE   VARCHAR2  NUMBER -> NUMBER(8,2)
----------------------------------------------------------
크기        13                 34
----------------------------------------------------------
CREATE TABLE 판매전표(
    전표번호 VARCHAR2(13),
    판매일자 DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL,
    고객명 VARCHAR2(34) CONSTRAINT 판매전표_고객명_nn NOT NULL,
    총액 NUMBER,
    CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호),
    CONSTRAINT 판매전표_총액_ck CHECK(총액>0)
);
-- DEFAULT 추가
ALTER TABLE 판매전표 MODIFY 판매일자 DEFAULT SYSDATE;


-------

제품
----------------------------------------------------------
컬럼명     제품번호   제품명   제품 단가
----------------------------------------------------------
제약조건      PK       NN       CK
----------------------------------------------------------
참조테이블
----------------------------------------------------------
참조컬럼
----------------------------------------------------------
체크                                  >0
----------------------------------------------------------
데이터형  VARCHAR2   VARCHAR2  NUMBER -> NUMBER(8,2)
----------------------------------------------------------
크기        13        100
----------------------------------------------------------
테이블 만들기
CREATE TABLE 제품(
    제품번호 VARCHAR2(12),
    제품명 VARCHAR2(100) CONSTRAINT 제품_제품명_nn NOT NULL,
    제품단가 NUMBER,
    CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호),
    CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0)
);
-- DEFAULT 추가
ALTER TABLE 판매전표 MODIFY 판매일자 DEFAULT SYSDATE;

-------

전표상세
----------------------------------------------------------
컬럼명     전표번호   제품번호    수량     단가     금액
----------------------------------------------------------
제약조건    PK/FK      FK       NN      NN      CK
----------------------------------------------------------
참조테이블  판매전표     제품
----------------------------------------------------------
참조컬럼    전표번호   제품번호
----------------------------------------------------------
체크                                           >0
----------------------------------------------------------
데이터형  VARCHAR2   VARCHAR2  NUMBER   NUMBER  NUMBER
----------------------------------------------------------
크기        13        100
----------------------------------------------------------
테이블 만들기
CREATE TABLE 전표상세(
    전표번호 VARCHAR2(13),
    제품번호 VARCHAR2(100),
    수량 NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL,
    단가 NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL,
    금액 NUMBER,
    CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
    CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
    REFERENCES 판매전표(전표번호),
    CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
    REFERENCES 제품(제품번호),
    CONSTRAINT 전표상세_금액_ck CHECK(금액>0)
);
  -- 테이블_컬럼_  -> 중복코딩이 거의 없다
  -- 모든 테이블명은 대문자로 저장이 되어 있다
*/
-- 테이블의 제약조건 확인
SELECT * FROM user_constraints
WHERE table_name='SEOUL_LOCATION';
/*
    CONSTRAINT Type
    C : CHECK, NOT NULL
    P : PRIMARY KEY
    R : FOREIGN KEY
    U : UNIQUE
*/ 
/*
CREATE TABLE 판매전표(
    전표번호 VARCHAR2(13),
    판매일자 DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL,
    고객명 VARCHAR2(34) CONSTRAINT 판매전표_고객명_nn NOT NULL,
    총액 NUMBER,
    CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호),
    CONSTRAINT 판매전표_총액_ck CHECK(총액>0)
);
CREATE TABLE 제품(
    제품번호 VARCHAR2(12),
    제품명 VARCHAR2(100) CONSTRAINT 제품_제품명_nn NOT NULL,
    제품단가 NUMBER,
    CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호),
    CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0)
);
CREATE TABLE 전표상세(
    전표번호 VARCHAR2(13),
    제품번호 VARCHAR2(100),
    수량 NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL,
    단가 NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL,
    금액 NUMBER,
    CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
        CONSTRAINT 전표상세_금액_ck CHECK(금액>0),
    CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
    REFERENCES 판매전표(전표번호),
    CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
    REFERENCES 제품(제품번호)
);

    제약조건 변경
    -----------
      NOT NULL => MODIFY
       - ALTER TABLE table_name MODIFY column CONSTRAINT cons_name NOT NULL
      CHECK, FOREIGN KEY, PRIMARY KEY, UNIQUE => ADD
       - ALTER TABLE table_name ADD CONSTRAINT cons_name CHECK
                                                        FOREIGN KEY
                                                        PRIMARY KEY
                                                        UNIQUE
*/
DROP TABLE 판매전표;
DROP TABLE 제품;
DROP TABLE 전표상세;
CREATE TABLE 판매전표(
    전표번호 VARCHAR2(13), -- pk
    판매일자 DATE,  -- nn
    고객명 VARCHAR2(34), --nn
    총액 NUMBER --ck
);
ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호);
ALTER TABLE 판매전표 MODIFY 판매일자 DATE CONSTRAINT 판매전표_판매일자_nn NOT NULL;
ALTER TABLE 판매전표 MODIFY 고객명 VARCHAR2(34) CONSTRAINT 판매전표_고객명_nn NOT NULL;
ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_총액_ck CHECK(총액>0);
CREATE TABLE 제품(
    제품번호 VARCHAR2(12), -- pk
    제품명 VARCHAR2(100),  -- uk
    제품단가 NUMBER -- ck
);
ALTER TABLE 제품 ADD CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호);
ALTER TABLE 제품 ADD CONSTRAINT 제품_제품명_uk UNIQUE(제품명);
ALTER TABLE 제품 ADD CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0);
 -- CHECK(dname IN('개발부', '영업부', '자재부', '총무부', '기획부'))
 -- CHECK(isLogin IN('y','n'))
CREATE TABLE 전표상세(
    전표번호 VARCHAR2(13),  -- pk, fk
    제품번호 VARCHAR2(100), -- fk
    수량 NUMBER, -- nn
    단가 NUMBER, -- nn
    금액 NUMBER  -- ck
);
ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호);
ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
REFERENCES 판매전표(전표번호);

ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
REFERENCES 제품(제품번호);

ALTER TABLE 전표상세 MODIFY 수량 CONSTRAINT 전표상세_수량_nn NOT NULL;
ALTER TABLE 전표상세 MODIFY 단가 CONSTRAINT 전표상세_단가_nn NOT NULL;
ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_금액_ck CHECK(금액>0);
-- ALTER로 제약 조건 넣기
  /*
        ALTER : 테이블 수정
        컬럼 추가
        컬럼 수정
        컬럼 삭제
        컬럼 이름 변경
        컬럼 제약조건 변경
        
     데이터만 삭제 : TRUNCATE
        형식
            TRUNCATE TABLE table_name; -> 테이블의 구조는 남아있다
     테이블 삭제 : DROP
        형식
            DROP TABLE table_name;
     테이블 이름 변경 : RENAME
        형식
            RENAME old_name To new_name;
  */
  DROP TABLE student;
 CREATE TABLE student(
    hakbun NUMBER,
    name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
    CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun)
 );
 -- 컬럼 추가
 ALTER TABLE student ADD kor NUMBER DEFAULT 0;
 ALTER TABLE student ADD eng NUMBER DEFAULT 0;
 ALTER TABLE student ADD math NUMBER DEFAULT 0;
 ALTER TABLE student ADD avg NUMBER NOT NULL;
 -- 컬럼 수정
 ALTER TABLE student MODIFY avg NUMBER(5,2);
 ALTER TABLE student MODIFY kor NUMBER(3);
 ALTER TABLE student MODIFY eng NUMBER(3);
 ALTER TABLE student MODIFY math NUMBER(3);
 DESC student;
 -- 컬럼 삭제
 ALTER TABLE student DROP COLUMN avg;
 -- 컬럼명 변경
 ALTER TABLE student RENAME column 학번 To hakbun;

DROP TABLE 전표상세;
DROP TABLE 판매전표;
DROP TABLE 제품;
