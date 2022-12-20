/*
    1. ����Ŭ���� ���α׷���
    ---------------------------------
    2. �ڹٿ��� ����Ŭ ���� (JDBC)
    3. ������ �ڹٸ� ���ؼ� ����Ŭ ����
    --------------------------------- �� ���α׷���
    PL/SQL (����Ŭ ���α׷�)
    ------ ���ν����� ����� ���
           ------�Լ� -> ����
                 ---
                 1. FUNCTION : �������� ������ �ִ� �Լ�(�����Լ�)
                 2. PROCEDURE : �������� ���� ��ɸ� �����ϴ� �Լ�
                 3. TRIGGER : �ڵ� ó��
    1) ����
        = �Ϲ� ���� (��Į�󺯼�)
          ���� ��������
          no NUMBER
          name VARCHAR2(10)
        = ���� ���̺� �����ϴ� ������ ��������
          %TYPE
          => no emp, empno%TYPE
                --------------- �������� (���� ���� ���Ǵ� ����)
        = ���̺� ��ü�� ������ ��� �������� �б�
          %ROWTYPE
          => vemp emp%ROWTYPE
        = ������ ��ü => ResultSet, ArrayList
          = Cursor
        = ����� ���� �������� => ���̺��� ������ ��� ��� : RECORD
    2) ������
        = ������ ��� �����ڸ� ���
    3) ���
        = ���ǹ�
          = IF (���� ���ǹ�)
          = IF ~ ELSE (�������ǹ�)
          = IF ~ ELSIF ~ ELSIF ~ ELSE (���� ���ǹ�)
          = CASE (���ù�)
        = �ݺ���
          = BASIC LOOP
          = WHILE
          = FOR
    4) SQL => DML/DQL
       ---------------
    PL/SQL ���� ����
    --------------
    DECLARE -> ����� (��������)
      ���� ������ġ
    BEGIN (
      ������
    END; )
      /
*/
-- 1. ����Ŭ���� ����
-- ��� / �Է�
-- DBMS_OUTPUT.PUTLINE() => System.out.println()
-- & => Scanner
SET SERVEROUTPUT ON;
DECLARE
-- ������ ����Ǵ� ��ġ
-- CREATE FUNCTION => ()
-- CREATE PROCEDURE => ()
-- CREATE TRIGGER => ()
pEmpno NUMBER(4) := 10; -- �ʱⰪ �ٶ� := ��� (: ���)
pEname VARCHAR2(34);
pJob VARCHAR2(20);
pHiredate DATE;
pSal NUMBER(7, 2);
BEGIN
-- ������ (SQL)
    SELECT empno, ename, job, hiredate, sal INTO pEmpno, pEname, pJob, pHiredate, pSal
    FROM emp
    WHERE empno = 7788;
    -- SELECT�� ���ؼ� ������ �� �ʱ�ȭ => ROW ����
    DBMS_OUTPUT.PUT_LINE('-------------- ��� ----------------');
    DBMS_OUTPUT.PUT_LINE('��� : ' || pEmpno);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || pEname);
    DBMS_OUTPUT.PUT_LINE('���� : ' || pJob);
    DBMS_OUTPUT.PUT_LINE('�Ի��� : ' || pHiredate);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || pSal);
END;
/

-- ���� ���̺��� �÷� �������� �б� : %TYPE
/*
    CREATE OR REPLACE PROCEDURE pro_name (
        �Ű�����
    )
    IS
      => ��������
    BEGIN 
        ������
    END;
    /
    
    CREATE [OR REPLACE] FUNCTION func_name(
      �Ű�����
    ) RETURN ��������
    IS
      ��������
    BEGIN
      ����
      RETURN ��
    END;
    /
    ----------- �Ű������� ���� ���� (�ڹٿ��� ȣ������ �ʴ´�) => �ڵ�ȣ��
    CREATE [OR REPLACE] TRIGGER tri_name
    -> INSERT | UPDATE | DELETE ON(���̺��)
    IS
        ��������
    BEGIN
        ������
        => �̹� �����ϸ� => UPDATE
        => �������� ������ => INSERT
    END;
    /
    
*/
DECLARE
-- �������� ��ġ
vEmpno emp.empno%TYPE;
vEname emp.ename%TYPE;
vJob emp.job%TYPE;
vDname dept.dname%TYPE;
vLoc dept.loc%TYPE;
vGrade salgrade.grade%TYPE;
BEGIN
-- ������
SELECT empno,ename,job,dname,loc,grade INTO vEmpno, vEname, vJob, vDname, vLoc, vGrade
FROM emp JOIN dept
ON emp.deptno=dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal
WHERE empno=7788;
   
   -- ���(�����) -> �Լ�
DBMS_OUTPUT.PUT_LINE('-----------���-----------');
DBMS_OUTPUT.PUT_LINE('���: '||vEmpno);
DBMS_OUTPUT.PUT_LINE('�̸�: '||vEname);
DBMS_OUTPUT.PUT_LINE('����: '||vJob);
DBMS_OUTPUT.PUT_LINE('�μ���: '||vDname);
DBMS_OUTPUT.PUT_LINE('�ٹ���: '||vLoc);
DBMS_OUTPUT.PUT_LINE('ȣ��: '||vGrade);
END;
/

-- ���̺� ��ü�� �������� �ޱ� -> 7900, 7902
SELECT * FROM emp;
-- %ROWTYPE => �ڹ�(~VO) -> �Ѹ� ���� ��� ����
DECLARE
 -- ���� ���� ��ġ -> ���� (���̺� �Ѱ��� ����� ����) -> ���� (ERP=> ���ν����� ����)
 -- SUBSTR() : 
 vEmp emp%ROWTYPE; -- �÷� ��������
BEGIN
 -- ����
 SELECT * INTO vEmp
 FROM emp
 WHERE empno=7900;
 
 DBMS_OUTPUT.PUT_LINE('-----------���-----------');
 DBMS_OUTPUT.PUT_LINE('���: '||vEmp.empno);
 DBMS_OUTPUT.PUT_LINE('�̸�: '||vEmp.ename);
 DBMS_OUTPUT.PUT_LINE('����: '||vEmp.job);
 DBMS_OUTPUT.PUT_LINE('�����ȣ: '||vEmp.mgr);
 DBMS_OUTPUT.PUT_LINE('�Ի���: '||vEmp.hiredate);
 DBMS_OUTPUT.PUT_LINE('�޿�: '||vEmp.sal);
 DBMS_OUTPUT.PUT_LINE('������: '||vEmp.comm);
 DBMS_OUTPUT.PUT_LINE('�μ���ȣ: '||vEmp.deptno);
END;
/

/*
    RECORD ����� (����� ����) -> ROWTYPE (�Ѹ� ���� ������ ���� �� �ִ�) => VO(���� Ŭ����)
    ------------- CURSOR
    TYPE record�� IS RECORD(
        �������� ....
    );
*/
DECLARE
  -- ����� ���� �������� ����
  TYPE empDept IS RECORD(
    empno emp.empno%TYPE,
    ename emp.ename%TYPE,
    job emp.job%TYPE,
    hiredate emp.hiredate%TYPE,
    dname dept.dname%TYPE,
    loc dept.loc%TYPE
  );
  -- ��������
  /*
    class ClassName(
    )
    
    ClassName s=new ClassName();
  */
  ed empDept;
BEGIN
  -- ������
  SELECT empno, ename, job, hiredate, dname, loc INTO ed
  FROM emp, dept
  WHERE emp.deptno=dept.deptno
  AND empno=7902;
 DBMS_OUTPUT.PUT_LINE('-----------���-----------');
 DBMS_OUTPUT.PUT_LINE('���: '||ed.empno);
 DBMS_OUTPUT.PUT_LINE('�̸�: '||ed.ename);
 DBMS_OUTPUT.PUT_LINE('����: '||ed.job);
 DBMS_OUTPUT.PUT_LINE('�Ի���: '||ed.hiredate);
 DBMS_OUTPUT.PUT_LINE('�μ���: '||ed.dname);
 DBMS_OUTPUT.PUT_LINE('�ٹ���: '||ed.loc);
END;
/

-- ��� -> Record (GROUP BY, JOIN, SUBQUERY)
/*
   => �ڹ�, ����Ŭ, �ڹٽ�ũ��Ʈ
      --------------------= ���̺귯��
      JSP/Spring -> �ڹ� �� ���̺귯��
      Ajax, VueJS, ReactJS => �ڹٽ�ũ��Ʈ ���̺귯�� === !==
      ------------------------------------------------- ������ ����
   => HTML / XML / CSS -> ȭ�����
            ---- ������ �±װ� ���� (�±� ����� ����)
    ���
      = ���ǹ�
      IF(���� ���ǹ�)
      ����)
          IF ���ǹ� THEN
             ���๮�� => ������ true�϶��� ���
          END IF;
      IF ~ ELSE (���� ���ǹ�)
      ����)
          IF ���ǹ� THEN
             ���๮�� -> ���� true
          ELSE
             ���๮�� -> ���� false
          END IF;
          
          IF ~ ELSIF ~ ELSIF ~ ELSE (���� ���ǹ�)
            ����) => �Ѱ��� ���常 ���� (��ü�� �ѹ������� ����)
                 IF ���ǹ� THEN
                    ó������ -> ���� true�϶� ���� => ����
                        false�϶�
                        |
                 ELSE ���ǹ� THEN
                    ó������
                 ELSE ���ǹ� THEN
                    ó������
                 ELSE
                    ó������ => �ش� ������ ���� ��쿡 ó���Ǵ� ����
                 END IF;   
        �ݺ���
          BASIC ~ LOOP
          WHILE ~ LOOP
          FOR [REVERSE]~ LOOP ===> �Ϲ� for, ForEach ���� (������ ������ ����)
             ---------- �������� ���
             
    ���� => CURSOR
*/
-- IF���� (���� ���ǹ�)
-- CRMS = 3400, ����, (Vue)
DECLARE
 -- ��Į�󺯼�
 vEmpno NUMBER(4):=0;
 vEname VARCHAR2(20):=' ';
 vJob VARCHAR2(20):=' ';
 vDname VARCHAR2(20):=' ';
 vDeptno NUMBER(2):=0;
BEGIN
 -- ���� ������ ���� �о ������ ����
 -- ����Ŭ ���α׷������� ����
 SELECT empno, ename, job, deptno INTO vEmpno, vEname, vJob, vDeptno
 FROM emp
 WHERE empno=&empno; -- &�Է��� ���� ��쿡 ��� (������ ���� :img, a) => replace�� �̿��ؼ� ����
 
 IF vDeptno=10 THEN
   vDname:='������';
 END IF;
 
 IF vDeptno=20 THEN
   vDname:='���ߺ�';
 END IF;
 
 IF vDeptno=30 THEN
   vDname:='�����';
 END IF;
 
 IF vDeptno=40 THEN
   vDname:='����';
 END IF;
 
 DBMS_OUTPUT.PUT_LINE('--------------���--------------');
 DBMS_OUTPUT.PUT_LINE('���: '|| vEmpno);
 DBMS_OUTPUT.PUT_LINE('�̸�: '|| vEname);
 DBMS_OUTPUT.PUT_LINE('����: '|| vJob);
 DBMS_OUTPUT.PUT_LINE('�μ���: '|| vDname);
 DBMS_OUTPUT.PUT_LINE('�μ���ȣ: '|| vDeptno);
 
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
   -- vComm =0, null => ����ó���� �Ұ��� => ELSE������ ����
  IF vComm >0 THEN
    DBMS_OUTPUT.PUT_LINE(vEname||'���� �޿��� ' ||vSal||'�̰� �������� '||vComm||'�̸�  �ѱ޿��� '||vTotal||' �Դϴ�');
  ELSE
    DBMS_OUTPUT.PUT_LINE(vEname||'���� �޿��� ' ||vSal||'�̰� �������� ���� �ѱ޿��� '||vTotal||'�Դϴ�');
  END IF;
END;
/
 
 -- ���� ���ǹ�
 DECLARE
   vEname emp.ename%TYPE;
   vDname dept.dname%TYPE;
   vDeptno emp.deptno%TYPE;
BEGIN
  SELECT ename, deptno INTO vEname, vDeptno
  FROM emp
  WHERE empno=7902;
  
  -- vDeptno 10,20,30 => 10(�μ�����)
  IF vDeptno=10 THEN
     vDname:='������';
  ELSIF vDeptno=20 THEN
     vDname:='��ȹ��';
  ELSIF vDeptno=30 THEN
     vDname:='���ߺ�';
  ELSE
     vDname:='����';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(' ------ ��� ------');
  DBMS_OUTPUT.PUT_LINE('�̸�: '|| vEname);
  DBMS_OUTPUT.PUT_LINE('�μ���: '|| vDname);
END;
/

-- ���ù� switch~case => CASE

DECLARE
  vEname emp.ename%TYPE;
  vDeptno emp.deptno%TYPE;
  vDname dept.dname%TYPE;
BEGIN
  SELECT ename, deptno INTO vEname, vDeptno
  FROM emp
  WHERE empno=7788;
  
  vDname:=CASE vDeptno -- switch(vDeptno)
          WHEN 10 THEN '���ߺ�' -- CASE 10
          WHEN 20 THEN '������' -- CASE 20
          WHEN 30 THEN '��ȹ��' -- CASE 30
          ELSE
               '����'
          END;
  DBMS_OUTPUT.PUT_LINE(' ------ ��� ------');
  DBMS_OUTPUT.PUT_LINE('�̸�: '|| vEname);
  DBMS_OUTPUT.PUT_LINE('�μ���: '|| vDname);
END;
/

-- �ݺ���
/*
  1) �⺻ �ݺ���
     ����)
          LOOP
             �ݺ� ó�� ����
             EXIT [����] => ����
          END LOOP;
  2) WHILE
     ����)
          WHILE ���� LOOP
             �ݺ�ó������
          END LOOP;
  3) FOR
     ����)
          FOR ���� IN [REVERSE] low..hi LOOP
              ó������
          END LOOP
          
          ��)  
             FOR i IN 1..9
                ���
             END LOOP ==> 1~9
             
             FOR i IN REVERSE 1..9
                ���
             END LOOP ==> 9~1
*/
-- LOOP ����
DECLARE
   sno NUMBER:=1;
   eno NUMBER:=10;
BEGIN
 LOOP
  -- ���๮��
  DBMS_OUTPUT.PUT_LINE(sno);
  -- ������
  sno:=sno+1;
  -- �����ϴ� ���ǽ�
  EXIT WHEN sno>eno;
  END LOOP;
END;
/
-- WHILE
DECLARE
   no NUMBER:=1;
BEGIN
   WHILE no<=10 LOOP
     -- �ݺ����๮��
     DBMS_OUTPUT.PUT_LINE(no);
     -- ������
     no:=no+1;
   END LOOP;
END;
/
/*
    �ʱⰪ
    while(���ǹ�)
    (
        �ݺ� ���๮
        ������
    )
    
*/
-- FOR�� (�ٽɹ���)
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

-- 1~100 ¦���� ��, Ȧ���� ��, ��ü�� ��
DECLARE
   total NUMBER:=0; -- NUMBER(8,2)
   even NUMBER:=0;
   odd NUMBER:=0;
BEGIN
  -- ������
  FOR i IN 1..100 LOOP
    total:=total+i; -- total+=i
    IF MOD(i,2)=0 THEN
      even:=even+i;
    END IF;
    IF MOD(i,2)<>0 THEN
      odd:=odd+i;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('------ ��� ------');
  DBMS_OUTPUT.PUT_LINE('1~100���� �� ��: '||total);
  DBMS_OUTPUT.PUT_LINE('1~100���� ¦�� ��: '||even);
  DBMS_OUTPUT.PUT_LINE('1~100���� Ȧ�� ��: '||odd);
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
 -- CURSOR => �ڹ� ��Ī Ŭ���� (ResultSet)
 -- CURSOR�� �̿��ϸ� �������� ���ÿ� ����� ���� (ArrayList)
 -- �ڹٿ� ��� ����� �� -> Cursor�� �̿��Ѵ�
 /*
      1. Cursor ����
         CURSOR Ŀ���� IS
            SELECT ~~ => ����� ������� ������ �ִ�
      2. Cursor ����
         OPEN Ŀ����;
      3. Loop ����(����)
            1) FETCH �޴� ������ IN Ŀ����
            2) ������� ����
               Ŀ����%NOUFOUND -> �����Ͱ� ���� ���
               Ŀ����%FOUND
               Ŀ����%COUNT
      4. Cursor �ݱ�
         CLOSE Ŀ����
 */
DECLARE
  vemp emp%ROWTYPE;
  -- Ŀ�� ����
  CURSOR cur IS
    SELECT * FROM emp;
BEGIN
  -- Ŀ�� ����
  OPEN cur;
  -- ����
  LOOP
    FETCH cur INTO vemp;
    -- ���� ����
    EXIT WHEN cur%NOTFOUND; -- �����Ͱ� ������ ���� ������ LOOP�� ����
    DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
  END LOOP;
  -- �ݱ�
  CLOSE cur;
END;
/
-- CURSOR�� FOR������ ���� (���� ���� ���Ǵ� ���)
DECLARE
  vemp emp%ROWTYPE;
  CURSOR cur IS
    SELECT * FROM emp; -- ����� ����� CURSOR�� ÷�� (JOIN, SubQuery)
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
-- JOIN�� �����͸� ���� => FOR�� �̿��ؼ� ���
-- �Լ�, ���ν���, Ʈ���� => ������ �� ���Ǵ� ��� -> ó�������� SQL  --> PL/SQL
-- 270page ���ν��� ���




