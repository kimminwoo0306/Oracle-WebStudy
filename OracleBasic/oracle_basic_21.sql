/*
    1. 오라클에서 프로그래밍
    ---------------------------------
    2. 자바에서 오라클 연결 (JDBC)
    3. 웹에서 자바를 통해서 오라클 연결
    --------------------------------- 웹 프로그래머
    PL/SQL (오라클 프로그램)
    ------ 프로시저를 만드는 언어
           ------함수 -> 재사용
                 ---
                 1. FUNCTION : 리턴형을 가지고 있는 함수(내장함수)
                 2. PROCEDURE : 리턴형이 없는 기능만 수행하는 함수
                 3. TRIGGER : 자동 처리
    1) 변수
        = 일반 변수 (스칼라변수)
          변수 데이터형
          no NUMBER
          name VARCHAR2(10)
        = 실제 테이블에 존재하는 변수의 데이터형
          %TYPE
          => no emp, empno%TYPE
                --------------- 데이터형 (가장 많이 사용되는 변수)
        = 테이블 전체의 변수의 모든 데이터형 읽기
          %ROWTYPE
          => vemp emp%ROWTYPE
        = 데이터 전체 => ResultSet, ArrayList
          = Cursor
        = 사용자 정의 데이터형 => 테이블을 여러개 묶어서 사용 : RECORD
    2) 연산자
        = 기존에 배운 연산자를 사용
    3) 제어문
        = 조건문
          = IF (단일 조건문)
          = IF ~ ELSE (선택조건문)
          = IF ~ ELSIF ~ ELSIF ~ ELSE (다중 조건문)
          = CASE (선택문)
        = 반복문
          = BASIC LOOP
          = WHILE
          = FOR
    4) SQL => DML/DQL
       ---------------
    PL/SQL 문법 형식
    --------------
    DECLARE -> 선언부 (변수설정)
      변수 선언위치
    BEGIN (
      구현부
    END; )
      /
*/
-- 1. 오라클에서 실행
-- 출력 / 입력
-- DBMS_OUTPUT.PUTLINE() => System.out.println()
-- & => Scanner
SET SERVEROUTPUT ON;
DECLARE
-- 변수가 선언되는 위치
-- CREATE FUNCTION => ()
-- CREATE PROCEDURE => ()
-- CREATE TRIGGER => ()
pEmpno NUMBER(4) := 10; -- 초기값 줄때 := 사용 (: 사용)
pEname VARCHAR2(34);
pJob VARCHAR2(20);
pHiredate DATE;
pSal NUMBER(7, 2);
BEGIN
-- 구현부 (SQL)
    SELECT empno, ename, job, hiredate, sal INTO pEmpno, pEname, pJob, pHiredate, pSal
    FROM emp
    WHERE empno = 7788;
    -- SELECT를 통해서 변수의 값 초기화 => ROW 단위
    DBMS_OUTPUT.PUT_LINE('-------------- 결과 ----------------');
    DBMS_OUTPUT.PUT_LINE('사번 : ' || pEmpno);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || pEname);
    DBMS_OUTPUT.PUT_LINE('직위 : ' || pJob);
    DBMS_OUTPUT.PUT_LINE('입사일 : ' || pHiredate);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || pSal);
END;
/

-- 실제 테이블의 컬럼 데이터형 읽기 : %TYPE
/*
    CREATE OR REPLACE PROCEDURE pro_name (
        매개변수
    )
    IS
      => 지역변수
    BEGIN 
        구현수
    END;
    /
    
    CREATE [OR REPLACE] FUNCTION func_name(
      매개변수
    ) RETURN 데이터형
    IS
      지역변수
    BEGIN
      구현
      RETURN 값
    END;
    /
    ----------- 매개변수가 없는 이유 (자바에서 호출하지 않는다) => 자동호출
    CREATE [OR REPLACE] TRIGGER tri_name
    -> INSERT | UPDATE | DELETE ON(테이블명)
    IS
        지역변수
    BEGIN
        구현부
        => 이미 존재하면 => UPDATE
        => 존재하지 않으면 => INSERT
    END;
    /
    
*/
DECLARE
-- 변수선언 위치
vEmpno emp.empno%TYPE;
vEname emp.ename%TYPE;
vJob emp.job%TYPE;
vDname dept.dname%TYPE;
vLoc dept.loc%TYPE;
vGrade salgrade.grade%TYPE;
BEGIN
-- 구현부
SELECT empno,ename,job,dname,loc,grade INTO vEmpno, vEname, vJob, vDname, vLoc, vGrade
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal
WHERE empno=7788;
   
   -- 출력(결과값) -> 함수
DBMS_OUTPUT.PUT_LINE('-----------결과-----------');
DBMS_OUTPUT.PUT_LINE('사번: '||vEmpno);
DBMS_OUTPUT.PUT_LINE('이름: '||vEname);
DBMS_OUTPUT.PUT_LINE('직위: '||vJob);
DBMS_OUTPUT.PUT_LINE('부서명: '||vDname);
DBMS_OUTPUT.PUT_LINE('근무지: '||vLoc);
DBMS_OUTPUT.PUT_LINE('호봉: '||vGrade);
END;
/

-- 테이블 전체의 데이터형 받기 -> 7900, 7902
SELECT * FROM emp;
-- %ROWTYPE => 자바(~VO) -> 한명에 대한 모든 정보
DECLARE
 -- 변수 선언 위치 -> 단점 (테이블 한개만 사용이 가능) -> 보안 (ERP=> 프로시저가 많다)
 -- SUBSTR() : 
 vEmp emp%ROWTYPE; -- 컬럼 데이터형
BEGIN
 -- 구현
 SELECT * INTO vEmp
 FROM emp
 WHERE empno=7900;
 
 DBMS_OUTPUT.PUT_LINE('-----------결과-----------');
 DBMS_OUTPUT.PUT_LINE('사번: '||vEmp.empno);
 DBMS_OUTPUT.PUT_LINE('이름: '||vEmp.ename);
 DBMS_OUTPUT.PUT_LINE('직위: '||vEmp.job);
 DBMS_OUTPUT.PUT_LINE('사수번호: '||vEmp.mgr);
 DBMS_OUTPUT.PUT_LINE('입사일: '||vEmp.hiredate);
 DBMS_OUTPUT.PUT_LINE('급여: '||vEmp.sal);
 DBMS_OUTPUT.PUT_LINE('성과급: '||vEmp.comm);
 DBMS_OUTPUT.PUT_LINE('부서번호: '||vEmp.deptno);
END;
/

/*
    RECORD 사용방법 (사용자 정의) -> ROWTYPE (한명에 대한 정보만 읽을 수 있다) => VO(포함 클래스)
    ------------- CURSOR
    TYPE record명 IS RECORD(
        변수설정 ....
    );
*/
DECLARE
  -- 사용자 정의 데이터형 제작
  TYPE empDept IS RECORD(
    empno emp.empno%TYPE,
    ename emp.ename%TYPE,
    job emp.job%TYPE,
    hiredate emp.hiredate%TYPE,
    dname dept.dname%TYPE,
    loc dept.loc%TYPE
  );
  -- 변수선언
  /*
    class ClassName(
    )
    
    ClassName s=new ClassName();
  */
  ed empDept;
BEGIN
  -- 구현부
  SELECT empno, ename, job, hiredate, dname, loc INTO ed
  FROM emp, dept
  WHERE emp.deptno=dept.deptno
  AND empno=7902;
 DBMS_OUTPUT.PUT_LINE('-----------결과-----------');
 DBMS_OUTPUT.PUT_LINE('사번: '||ed.empno);
 DBMS_OUTPUT.PUT_LINE('이름: '||ed.ename);
 DBMS_OUTPUT.PUT_LINE('직위: '||ed.job);
 DBMS_OUTPUT.PUT_LINE('입사일: '||ed.hiredate);
 DBMS_OUTPUT.PUT_LINE('부서명: '||ed.dname);
 DBMS_OUTPUT.PUT_LINE('근무지: '||ed.loc);
END;
/

-- 제어문 -> Record (GROUP BY, JOIN, SUBQUERY)
/*
   => 자바, 오라클, 자바스크립트
      --------------------= 라이브러리
      JSP/Spring -> 자바 웹 라이브러리
      Ajax, VueJS, ReactJS => 자바스크립트 라이브러리 === !==
      ------------------------------------------------- 데이터 관리
   => HTML / XML / CSS -> 화면출력
            ---- 지정된 태그가 없다 (태그 사용자 정의)
    제어문
      = 조건문
      IF(단일 조건문)
      형식)
          IF 조건문 THEN
             실행문장 => 조건이 true일때만 사용
          END IF;
      IF ~ ELSE (선택 조건문)
      형식)
          IF 조건문 THEN
             실행문장 -> 조건 true
          ELSE
             실행문장 -> 조건 false
          END IF;
          
          IF ~ ELSIF ~ ELSIF ~ ELSE (다중 조건문)
            형식) => 한개의 문장만 수행 (전체를 한문장으로 본다)
                 IF 조건문 THEN
                    처리문장 -> 조건 true일때 수행 => 종료
                        false일때
                        |
                 ELSE 조건문 THEN
                    처리문장
                 ELSE 조건문 THEN
                    처리문장
                 ELSE
                    처리문장 => 해당 조건이 없는 경우에 처리되는 문장
                 END IF;   
        반복문
          BASIC ~ LOOP
          WHILE ~ LOOP
          FOR [REVERSE]~ LOOP ===> 일반 for, ForEach 구문 (무조건 증가만 가능)
             ---------- 역순으로 출력
             
    변수 => CURSOR
*/
-- IF조건 (단일 조건문)
-- CRMS = 3400, 양재, (Vue)
DECLARE
 -- 스칼라변수
 vEmpno NUMBER(4):=0;
 vEname VARCHAR2(20):=' ';
 vJob VARCHAR2(20):=' ';
 vDname VARCHAR2(20):=' ';
 vDeptno NUMBER(2):=0;
BEGIN
 -- 실제 데이터 값을 읽어서 변수에 대입
 -- 오라클 프로그램에서만 가능
 SELECT empno, ename, job, deptno INTO vEmpno, vEname, vJob, vDeptno
 FROM emp
 WHERE empno=&empno; -- &입력을 받을 경우에 사용 (데이터 수집 :img, a) => replace를 이용해서 변경
 
 IF vDeptno=10 THEN
   vDname:='영업부';
 END IF;
 
 IF vDeptno=20 THEN
   vDname:='개발부';
 END IF;
 
 IF vDeptno=30 THEN
   vDname:='자재부';
 END IF;
 
 IF vDeptno=40 THEN
   vDname:='신입';
 END IF;
 
 DBMS_OUTPUT.PUT_LINE('--------------결과--------------');
 DBMS_OUTPUT.PUT_LINE('사번: '|| vEmpno);
 DBMS_OUTPUT.PUT_LINE('이름: '|| vEname);
 DBMS_OUTPUT.PUT_LINE('직위: '|| vJob);
 DBMS_OUTPUT.PUT_LINE('부서명: '|| vDname);
 DBMS_OUTPUT.PUT_LINE('부서번호: '|| vDeptno);
 
END;
/

-- IF ~ ELSE
DECLARE
  vEname emp.ename%TYPE:=' ';
  vComm emp.comm%TYPE:=0;
  vSal emp.sal%TYPE:=0;
  vTotal NUMBER(7,2):=0;
BEGIN
  SELECT ename, comm, sal, sal+NVL(comm,0) INTO vEname, vComm, vSal, vTotal
  FROM emp
  WHERE empno=&empno;
   -- vComm =0, null => 연산처리가 불가능 => ELSE문장이 수행
  IF vComm >0 THEN
    DBMS_OUTPUT.PUT_LINE(vEname||'님의 급여는 ' ||vSal||'이고 성과급은 '||vComm||'이며  총급여는 '||vTotal||' 입니다');
  ELSE
    DBMS_OUTPUT.PUT_LINE(vEname||'님의 급여는 ' ||vSal||'이고 성과급은 없고 총급여는 '||vTotal||'입니다');
  END IF;
END;
/
 
 -- 다중 조건문
 DECLARE
   vEname emp.ename%TYPE;
   vDname dept.dname%TYPE;
   vDeptno emp.deptno%TYPE;
BEGIN
  SELECT ename, deptno INTO vEname, vDeptno
  FROM emp
  WHERE empno=7902;
  
  -- vDeptno 10,20,30 => 10(부서결정)
  IF vDeptno=10 THEN
     vDname:='영업부';
  ELSIF vDeptno=20 THEN
     vDname:='기획부';
  ELSIF vDeptno=30 THEN
     vDname:='개발부';
  ELSE
     vDname:='신입';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(' ------ 결과 ------');
  DBMS_OUTPUT.PUT_LINE('이름: '|| vEname);
  DBMS_OUTPUT.PUT_LINE('부서명: '|| vDname);
END;
/

-- 선택문 switch~case => CASE

DECLARE
  vEname emp.ename%TYPE;
  vDeptno emp.deptno%TYPE;
  vDname dept.dname%TYPE;
BEGIN
  SELECT ename, deptno INTO vEname, vDeptno
  FROM emp
  WHERE empno=7788;
  
  vDname:=CASE vDeptno -- switch(vDeptno)
          WHEN 10 THEN '개발부' -- CASE 10
          WHEN 20 THEN '영업부' -- CASE 20
          WHEN 30 THEN '기획부' -- CASE 30
          ELSE
               '신입'
          END;
  DBMS_OUTPUT.PUT_LINE(' ------ 결과 ------');
  DBMS_OUTPUT.PUT_LINE('이름: '|| vEname);
  DBMS_OUTPUT.PUT_LINE('부서명: '|| vDname);
END;
/

-- 반복문
/*
  1) 기본 반복문
     형식)
          LOOP
             반복 처리 문장
             EXIT [조건] => 종료
          END LOOP;
  2) WHILE
     형식)
          WHILE 조건 LOOP
             반복처리문장
          END LOOP;
  3) FOR
     형식)
          FOR 변수 IN [REVERSE] low..hi LOOP
              처리문장
          END LOOP
          
          예)  
             FOR i IN 1..9
                출력
             END LOOP ==> 1~9
             
             FOR i IN REVERSE 1..9
                출력
             END LOOP ==> 9~1
*/
-- LOOP 실행
DECLARE
   sno NUMBER:=1;
   eno NUMBER:=10;
BEGIN
 LOOP
  -- 실행문장
  DBMS_OUTPUT.PUT_LINE(sno);
  -- 증가식
  sno:=sno+1;
  -- 종료하는 조건식
  EXIT WHEN sno>eno;
  END LOOP;
END;
/
-- WHILE
DECLARE
   no NUMBER:=1;
BEGIN
   WHILE no<=10 LOOP
     -- 반복수행문장
     DBMS_OUTPUT.PUT_LINE(no);
     -- 증가식
     no:=no+1;
   END LOOP;
END;
/
/*
    초기값
    while(조건문)
    (
        반복 수행문
        증가식
    )
    
*/
-- FOR문 (핵심문장)
DECLARE
BEGIN
    FOR i IN REVERSE 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
    
END;
/

-- DECLARE
BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i,2)=0 THEN
          DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;
/

-- 1~100 짝수의 합, 홀수의 합, 전체의 합
DECLARE
   total NUMBER:=0; -- NUMBER(8,2)
   even NUMBER:=0;
   odd NUMBER:=0;
BEGIN
  -- 구현부
  FOR i IN 1..100 LOOP
    total:=total+i; -- total+=i
    IF MOD(i,2)=0 THEN
      even:=even+i;
    END IF;
    IF MOD(i,2)<>0 THEN
      odd:=odd+i;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('------ 결과 ------');
  DBMS_OUTPUT.PUT_LINE('1~100까지 총 합: '||total);
  DBMS_OUTPUT.PUT_LINE('1~100까지 짝수 합: '||even);
  DBMS_OUTPUT.PUT_LINE('1~100까지 홀수 합: '||odd);
END;
/

DECLARE
   dan NUMBER:=&dan;
   result VARCHAR2(100):=' ';
BEGIN
   FOR i IN 1..9 LOOP
     result:=dan||'*'||i||'='||(dan*i);
     DBMS_OUTPUT.PUT_LINE(result);
   END LOOP;
END;
/
 -- CURSOR => 자바 매칭 클래스 (ResultSet)
 -- CURSOR를 이용하면 여러명을 동시에 출력이 가능 (ArrayList)
 -- 자바에 목록 출력할 때 -> Cursor만 이용한다
 /*
      1. Cursor 설정
         CURSOR 커서명 IS
            SELECT ~~ => 실행된 결과값을 가지고 있다
      2. Cursor 열기
         OPEN 커서명;
      3. Loop 설정(인출)
            1) FETCH 받는 변수명 IN 커서명
            2) 종료시점 설정
               커서명%NOUFOUND -> 데이터가 없는 경우
               커서명%FOUND
               커서명%COUNT
      4. Cursor 닫기
         CLOSE 커서명
 */
DECLARE
  vemp emp%ROWTYPE;
  -- 커서 설정
  CURSOR cur IS
    SELECT * FROM emp;
BEGIN
  -- 커서 열기
  OPEN cur;
  -- 인출
  LOOP
    FETCH cur INTO vemp;
    -- 종료 시점
    EXIT WHEN cur%NOTFOUND; -- 데이터가 인출이 없는 경우까지 LOOP를 수행
    DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
  END LOOP;
  -- 닫기
  CLOSE cur;
END;
/
-- CURSOR를 FOR문으로 제어 (가장 많이 사용되는 방법)
DECLARE
  vemp emp%ROWTYPE;
  CURSOR cur IS
    SELECT * FROM emp; -- 실행된 결과를 CURSOR에 첨부 (JOIN, SubQuery)
BEGIN
/*
   vemp => EmpVO
   cursor -> ArrayList
   
   for(EmpVO vo:list)
*/
  FOR vemp IN cur LOOP
    DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
  END LOOP;
END;
/
-- JOIN된 데이터를 저장 => FOR을 이용해서 출력
-- 함수, 프로시저, 트리거 => 제작할 때 사용되는 언어 -> 처리문장은 SQL  --> PL/SQL
-- 270page 프로시저 방법




