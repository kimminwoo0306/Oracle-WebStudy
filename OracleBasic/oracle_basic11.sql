/*CREATE TABLE SALGRADE(
	GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER
	);
INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);
COMMIT;*/

-- SELECT * FROM salgrade;

/*
    �� ���� (NON EQUI_JOIN) => = �̿��� ������ ���� ==> ���� ����
*/
SELECT empno, ename, job, hiredate, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;
/*
    emp, dept, salgrade => 3�� ����
*/
SELECT empno, ename, job, hiredate, sal, dname, loc, grade
--     -------------------------------- emp ------ dept --- salgrade
FROM emp, dept, salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal;

-- ANSI JOIN
SELECT empno, ename, job, hiredate, sal, dname, loc, grade
FROM emp JOIN dept
ON emp.deptno = dept.deptno
JOIN salgrade
ON sal BETWEEN losal AND hisal;

-- NATURAL JOIN
SELECT empno, ename, job, hiredate, dname, loc, grade
FROM emp NATURAL JOIN dept
JOIN salgrade
ON sal BETWEEN losal AND hisal;

-- JOIN USING
SELECT empno, ename, job, hiredate, dname, loc, grade
FROM emp JOIN dept USING (deptno)
JOIN salgrade
ON sal BETWEEN losal AND hisal;

-- emp => empno, ename, job, hiredate, sal => dname, loc ==> SOCTT����� ����
-- ��� ����, �μ� ���� => �� ���̺��� �ʿ��� �����͸� ���� ==> JOIN
SELECT empno, ename, job, hiredate, sal, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND ename = 'SCOTT';

SELECT empno, ename, job, hiredate, sal,
      (SELECT dname FROM dept WHERE deptno = emp.deptno) dname,
      (SELECT loc FROM dept WHERE deptno = emp.deptno) loc
FROM emp
WHERE ename = 'SCOTT';
/*
    162page
    => 2�� �̻��� ���̺��� �����Ͱ� �б� vuerd => �����ͺ��̽� ���� ==> dbleaver
    1) JOIN : 2�� �̻��� ���̺� �����͸� �����ϴ� ���
              = 165page
                �������� ���̺��� �����ؼ� �ϳ��� ���̺��� ������ ����
                ��������(equl join) ==> ������ ���ÿ� =�� ����Ѵ�
                WHERE ���̺��.�÷� = ���̺��.�÷�
                ------------------------------- => ���̺�� ���̺��� ���� ���� �����ϰ� �־�� ������ ����
                ------------------------------- ���� : null�� ������ ������ �˻��� �� ���� (null�� �������� �ʴ´�)
                ------------------------------- ���� ���� ���Ǵ� �����̴�
                ȸ�� => ���Ÿ���� ����� �� ����
                aaa �̸� ����           aaa A
                aaa �̸� ����           aaa B
                �������� => ��Ī
                ���� => ���̺�, ��Ī (Natual JOIN, JOIN ~ USING������ ��Ī ��� ����)
    2) SubQuery : 2�� �̻��� SQL������ �����ؼ� ó��
    INNER JOIN => INTERSECT (������)
    168page => outer join (innerJOIN + null�� �����ؼ� �����͸� ������ �´�)
      = LEFT OUTER JOIN ==> INTERSECT + MINUS (A-B)
        ����)
            = Oracle JOIN
              SELECT A.column, B.column
              FROM A, B
              WHERE A.column = B.column(+)
            = ANSI JOIN
              SELECT A.cloumn, B.column
              FROM A LEFT OUTER JOIN B
              ON  A.column = B.column
                   
      = RIGHT OUTER JOIN ==> INTERSECT + MINUS (B-A)
            =  = Oracle JOIN
              SELECT A.column, B.column
              FROM A, B
              WHERE A.column(+) = B.column
            = ANSI JOIN
              SELECT A.cloumn, B.column
              FROM A RIGHT OUTER JOIN B
              ON  A.column = B.column
              
      = FULL OUTER JOIN ==> UNION
            = ANSI JOIN
              SELECT A.cloumn, B.column
              FROM A FULL OUTER JOIN B
              ON  A.column = B.column
*/
-- SELECT * FROM emp;
-- SELECT * FROM dept;
CREATE TABLE test1(no NUMBER);
CREATE TABLE test2(no NUMBER);
INSERT INTO test1 VALUES(1);
INSERT INTO test1 VALUES(2);
INSERT INTO test1 VALUES(3);
INSERT INTO test1 VALUES(4);
INSERT INTO test2 VALUES(3);
INSERT INTO test2 VALUES(4);
INSERT INTO test2 VALUES(5);
INSERT INTO test2 VALUES(6);
COMMIT;
-- ��
SELECT no FROM test1
UNION ALL
SELECT no FROM test2;

SELECT no FROM test1
UNION
SELECT no FROM test2; -- �ߺ��� ����

SELECT no FROM test1
INTERSECT
SELECT no FROM test2; -- �������� �����´�

SELECT no FROM test1
MINUS
SELECT no FROM test2;

SELECT no FROM test2
MINUS
SELECT no FROM test1;

-- right
SELECT ename, empno, job, hiredate, sal, dname, loc, dept.deptno
FROM emp, dept
WHERE emp.deptno(+) = dept.deptno;

SELECT ename, empno, job, hiredate, sal, dname, loc, dept.deptno
FROM emp RIGHT OUTER JOIN dept
ON emp.deptno = dept.deptno;

-- left
SELECT ename, empno, job, hiredate, sal, dname, loc, dept.deptno
FROM emp, dept
WHERE emp.deptno = dept.deptno(+);

SELECT ename, empno, job, hiredate, sal, dname, loc, dept.deptno
FROM emp LEFT OUTER JOIN dept
ON emp.deptno = dept.deptno;

-- ANSI JOIN���� �ٲٴ¹� ( , -> JOIN // WHERE -> ON)
/*
    169page (���ι��� �ܿ�����)
*/