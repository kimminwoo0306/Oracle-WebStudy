/*
    SQL
      = DML ==> O
      = DQL ==> O
      -----------------
      = DDL ==> 테이블명, 컬럼명, 제약조건, 데이터형 => 기본 테이블은 제작이 가능해야 한다
      = DCL
      ----------------- DBA
      = TCL ==> O
      응용프로그램
          - 오라클
          - 자바 (O)
      데이터베이스 설계 => DBA
      => VIEW / SEQUENCE
     요구사항
        1) Back-End : 자바 / 데이터베이스 / JSP / Spring / Spring-Boot
        2) Front-End : 자바스크립트, JQuery(Ajax), VueJS, ReactJS, NodeJS (데이터베이스 연결)
        3) 툴 사용 : 이클립스 / STS / SQL-Developer  웹스톰 / vs-Code  DBlaver
        
        PL/SQL
        => 프로시저 , 함수, 트리거
        1) 데이터형, 변수 (매개변수, 지역변수)
        --------------------------------
        1. 스칼라 변수 : 일반 오라클 데이터형 사용
                       문자 / 숫자 / 날짜
                                -  ---- DATE
                             ----- NUMBER, NUMBER
                      ----- CHAR, VARCHAR2, CLOB
            변수 데이터형
             예) no NUMBER
                name VARCHAR2(20)
        2. %TYPE : 실제 테이블에 설정된 데이터형 읽어 온다 (가장 많이 사용)
           예)
              empno NUMBER(4)
              vempno emp.empno%TYPE
                    --------------- NUMBER(4)
                    테이블명.컬럼명%TYPE
        3. %ROWTYPE : 테이블을 전체의 데이터형을 가지고 올때 ==> ~VO
                     => 한개의 테이블 컬럼(JOIN, SubQuery는 사용할 수 없는 경우도 있다)
            예)
               emp : empno NUMBER(4), ename VARCHAR2(20), job ... (8)
               vemp emp%ROWTYPE
                    ------------- 테이블이 가지고 있는 모든 컬럼의 데이터형을 가지고 온다
                    테이블명%ROWTYPE
        4. RECORD : 사용자 정의 (테이블 여러개를 묶어서 데이터 제어)
           ------  JOIN / SubQuery
           형식)   
                TYPE 변수명 IS RECORD(
                    필요한 데이터 설정 ...
                    ...
                    ...
                    ...
                )
        -----------------------------------단점 (ROW 1개에 대한 데이터만 저장이 가능)
        5. CURSOR : 전체 ROW에 대한 데이터를 저장할 수 있는 변수 (자바 => ResultSet)
           형식)
                CURSOR cur명 IS
                   SELECT ~~ ==> View와 유사
    2) 연산처리
        산술연산자 / 논리연산자 / 비교연산자 / 대입연산자 / NOT / IN / BETWEEN ~ AND / LIKE / NULL
    3) 제어문
       조건문
          = 단일 조건
            IF 조건문 THEN
               실행문장
            END IF;
          = 선택 조건
            IF 조건문 THEN
               실행문장
            ELSE
               실행문장
            END IF;
          = 다중 조건
            IF 조건문 THEN
               실행문장
            ELSIF 조건문 THEN
               실행문장
            ELSIF 조건문 THEN
               실행문장
            ELSE 
               실행문장
            END IF;
           = 선택문
             CASE
               WHEN 조건문 THEN
                   실행문장
               WHEN 조건문 THEN
                   실행문장
                WHEN 조건문 THEN
                   실행문장
                ELSE
                   실행문장
                END;
         반복문
             = WHILE      --> BREAK, CONTINUE
               변수(초기화)
               WHILE (조건문) LOOP
                  반복 처리문장
                  변수의 증가( ++, --가 없다)
                  =no=no+1
               END LOOP
             = FOR 변수 IN [REVERSE] lo..hi LOOP
                처리문장
                END LOOP
    4) 형식
       = 프로시저 : 일반 기능 (INSERT, UPDATE, DELETE, SELECT, 페이징) => 재사용 -> 댓글
                  맛집, 여행, 레시피 => 
         CREATE [OR REPLACE] PROCEDURE pro_name(
           매개변수
         )
         IS|AS
            지역변수
        --------------------------------------선언부
        BEGIN
          구현부 : SQL
        END;
        /
        = 사용자 정의 함수 => SubQuery를 대체 (SELECT, WHERE) => 결과값이 반드시 필요
          CREATE [OR REPLACE] FUNCTION func_name(
              매개변수
          ) RETURN 데이터형
          IS | AS
            지역변수
          BEGIN
            구현부
            RETURN 값
          END;
          /
          
          = 트리거
            = 자동이벤트 처리
            = 미리 설정된 조건에 맞는 경우로 실행 (오라클자체에서 실행 => 자바에서 호출하지 않는다)
            = INSERT, UPDATE, DELETE에서만 사용이 가능
            = 입고 => INSERT => 재고 (자동 변경)
            = 출고 => INSERT => 재고 (자동 변경)
            = 형식)
                 CREATE [OR REPLACE] TRIGGER tri_name
                 BEFORE|AFTER (INSERT|UPDATE|DELETE)
                 FOR EACH ROW-- 전체 ROW에 대한 처리
                 -----------------------------------------
                 DECLARE
                   변수 선언 --> 설정할 변수가 없는 경우 (생략이 가능)
                 BEGIN -- (
                    구현
                 END; -- )
                 /
                 -----------------------------------------
                 
                 = 삭제
                   DROP TRIGGER tri_name
                 = 수정
                   ALTER TRIGGER tri_name => 사용빈도가 적용 => OR REPLACE
*/ 
CREATE TABLE 상품(
    품번 NUMBER,
    상품명 VARCHAR2(30),
    단가 NUMBER
);
CREATE TABLE 입고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER
);
CREATE TABLE 출고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER,
    누적금액 NUMBER
);
CREATE TABLE 재고(
    품번 NUMBER,
    수량 NUMBER,
    금액 NUMBER,
    누적금액 NUMBER
);

-- 상품
 INSERT INTO 상품 VALUES(100, '새우깡', 1500);
 INSERT INTO 상품 VALUES(200, '감자깡', 1000);
 INSERT INTO 상품 VALUES(300, '고구마깡', 2000);
 INSERT INTO 상품 VALUES(400, '맛동산', 4000);
 INSERT INTO 상품 VALUES(500, '짱구', 3000);
 COMMIT;
 -- 입고시에 재고를 처리
 /*
        입고 => 재고 (상품이 존재하는지 확인)
                  존재할경우 : UPDATE
                  미존재할경우 : INSERT
        출고 => 재고 (상품의 갯수가 몇개)
                  0 -> DELETE
                <>0 -> UPDATE
                
                -> INSERT, UPDATE, DELETE -> :NEW.품번
                   INSERT INTO 입고 VALUES(100,10,1500)
                                         ---- -- -----
                                         :NEW.품번
                                         :NEW.수량
                                         :NEW.금액
                -> 재고에 있는 컬럼값 읽기
                                 :OLD.품번
 */
 CREATE OR REPLACE TRIGGER input_trigger
 AFTER INSERT ON 입고
 FOR EACH ROW
 DECLARE
   v_cnt NUMBER:=0;
 BEGIN
   SELECT COUNT(*) into v_cnt
   FROM 재고
   WHERE 품번=:NEW.품번;
   
   IF v_cnt=0 THEN -- 기존의 상품이 없는 경우
   -- INSERT
   INSERT INTO 재고 VALUES(:NEW.품번, :NEW.수량, :NEW.금액,:NEW.수량*:NEW.금액);
   ELSE -- 기존의 상품이 존재
   -- UPDATE
   UPDATE 재고 SET
   수량 = 수량+:NEW.수량,
   누적금액 = 누적금액+(:NEW.수량*:NEW.금액)
   WHERE 품번=:NEW.품번;
   -- 주의점 : AutoCommit 수행 => COMMIT을 사용하면 오류발생
   END IF;
 END;
 /
 
 INSERT INTO 입고 VALUES(100,3,1500);
 SELECT * FROM 입고;
 SELECT * FROM 재고;
 
 -- 출고 : UPDATE/DELETE
 CREATE OR REPLACE TRIGGER output_trigger
 AFTER INSERT ON 출고
 FOR EACH ROW
 DECLARE
  v_cnt NUMBER:=0;
 BEGIN
   SELECT 수량 INTO v_cnt
   FROM 재고
   WHERE 품번=:NEW.품번;
   
   IF :NEW.수량=v_cnt THEN
   -- 처리 -> 재고가 없는 상태 => DELETE
    DELETE FROM 재고
    WHERE 품번=:NEW.품번;
   ELSE
   -- 처리 ==> 수량 -:NEW.수량, 누적금액-:NEW... -> UPDATE
    UPDATE 재고 SET
    수량=수량-:NEW.수량,
    누적금액=누적금액-(:NEW.수량*:NEW.금액)
    WHERE 품번=:NEW.품번;
   END IF;
 END;
 /
 
 SELECT * FROM 재고;
 INSERT INTO 출고 VALUES(100,3,1500);
 
 DESC seoul_location;
 DESC seoul_nature;
 DESC seoul_shop;
 DESC seoul_guest;
 
 DESC food_location;
 
 SELECT fno,name,poster,score,num 
FROM (SELECT fno,name,poster,score,rownum as num FROM
    (SELECT /*+ INDEX_ASC(food_location pk_food_location)*/ fno,name,poster,score
FROM food_location))
WHERE num BETWEEN 21 AND 40;