/*
        1. FUNCTION : �Լ� => �������� �ִ� �Լ� (������� 1����) => �����Լ�
        => SELECT ~~ => �÷���� ��� , WHERE ���ǹ����� ���
        => ROW ���� (������ �Լ�)
        ����)
            CREATE [OR REPLACE] FUNCTION func_name(
                �Ű�����....
            )
            IS
              �������� ����
            BEGIN
              ������
            END;
            /
        2. PROCEDURE : ���ν��� -> �������� ���� �Լ� (��� ����) => ����Ŭ�� �Լ� (���ν���)
           => �ݺ� ����, ������ => ī�� (�Խ���)
           => ������ ���
              IN, OUT ==> ���� ������ �� �Ű������� �̿��Ѵ� (������ �ּҰ��� ����), IN OUT
           => ����)
              CREATE [OR REPLACE] PROCEDURE pro_name(
                  �Ű�����...
              )
              IS
                 ��������
              BEGIN
                 ������
              END;
              /
*/
 -- FUNCTION ����
 SELECT empno, ename, job, hiredate, sal, comm, dname, loc, grade
 FROM emp, dept, salgrade
 WHERE emp.deptno=dept.deptno
 AND sal BETWEEN losal AND hisal;
 
 SELECT empno, ename, job, hiredate, sal, comm,
        (SELECT dname FROM dept WHERE deptno=emp.deptno) dname,
        (SELECT loc FROM dept WHERE deptno=emp.deptno) loc,
        (SELECT grade FROM salgrade WHERE emp.sal BETWEEN losal AND hisal) grade
 FROM emp;
 
 CREATE OR REPLACE FUNCTION getDname(
        vDeptno emp.deptno%TYPE
 ) RETURN VARCHAR2
 IS
   vDname dept.dname%TYPE;
BEGIN
    SELECT dname INTO vDname
    FROM dept
    WHERE deptno=vDeptno;
    RETURN vDname;
END;
/

 CREATE OR REPLACE FUNCTION getLoc(
        vDeptno emp.deptno%TYPE
 ) RETURN VARCHAR2
 IS
   vLoc dept.loc%TYPE;
BEGIN
    SELECT loc INTO vLoc
    FROM dept
    WHERE deptno=vDeptno;
    RETURN vLoc;
END;
/
-- ������ ��������, JOIN���� �ٸ� ���̺� ������ �б� => FUNCTION
-- �׻� => �ݺ��� �Ǵ� ���, ������ �ʿ��� ��
-- �����Ͱ�(���ϰ�)�� �Ѱ��� ������ �� �ִ� => ��¥, �̸�, �μ���..., �ִ밪, ��հ�
 CREATE OR REPLACE FUNCTION getGrade(
        vSal emp.sal%TYPE
 ) RETURN NUMBER
 IS
   vGrade salgrade.grade%TYPE;
BEGIN
    SELECT grade INTO vGrade
    FROM salGrade
    WHERE vSal BETWEEN losal AND hisal;
    RETURN vGrade;
END;
/

-- ���
SELECT empno, ename, job, hiredate, sal, getDname(deptno) dname, getLoc(deptno) loc, getGrade(sal) grade
FROM emp;

SELECT empno,ename,job,hiredate,sal
FROM emp
WHERE sal>(SELECT ROUND(AVG(sal)) FROM emp);

CREATE OR REPLACE FUNCTION getAvg
RETURN NUMBER
IS
 vAvg NUMBER;
 BEGIN
    SELECT ROUND(AVG(sal)) INTO vAvg
    FROM emp;
    RETURN vAvg;
 END;
 /
 
 SELECT empno, ename, job, hiredate, sal
 FROM emp
 WHERE sal>getAvg();
 
 CREATE OR REPLACE FUNCTION getMax
 RETURN NUMBER
 IS 
    vMax NUMBER;
 BEGIN
    SELECT MAX(empno)+1 INTO vMax
    FROM emp;
    
    RETURN vMax;
 END;
 /
 
 SELECT getMax() FROM DUAL;
 
 DROP FUNCTION getAvg;
 DROP FUNCTION getDname;
 DROP FUNCTION getGrade;
 DROP FUNCTION getLoc;
 DROP FUNCTION getMax;