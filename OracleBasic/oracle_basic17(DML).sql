/*
       187page => DML (������ ���۾��) ==> ROW ����
          = INSERT : ������ �߰�
               1. INSERT ALL
                  ��ü ������ ���, ������ ����
               2. ��ü ������ ��� (��� �÷��� ������ �߰�)
                  INSERT INTO table_name VALUES(��...)
                              ----------        -----
                               �÷� ������ ���� ������ �����ؾ���
               3. �ʿ��� �����͸� ��� (�÷��� �����ؼ� ó��)
                  INSERT INTO table_name(�÷�, �÷�...) VALUES(��..)
                                         -----------          ----
                                        ������ �÷��� ������ ���� ������ �����ؾ���
                                        => DEFAULT�� �ִ� ��쿡 ���� ���
          = UPDATE : ������ ����
              UPDATE table_name SET
              �÷��� = ��, �÷��� = �� ...
              [WHERE ����] // ���ǿ� �´°� �����ؼ� �Ⱦ��� ��ü���� [���� �ʼ�]
          = DELETE : ������ ����
              DELETE FROM table_name
              [WHERE ����]
          *** INSERT , UPDATE, DELETE => �ݵ�� COMMIT : �ڹٿ��� ������ ���µ� �����͸� ���� ���Ѵ� (COMMIT Ȯ��)
          
*/
/*
CREATE TABLE emp_10
AS
SELECT empno, ename, job, hiredate, sal FROM emp
WHERE 1 = 2;
SELECT * FROM emp_10;
CREATE TABLE emp_20
AS
SELECT empno, ename, job, hiredate, sal FROM emp
WHERE 1 = 2;
SELECT * FROM emp_20;
CREATE TABLE emp_30
AS
SELECT empno, ename, job, hiredate, sal FROM emp
WHERE 1 = 2;
SELECT * FROM emp_30;
-- ��Ƽ�����̺� --> �б⺰ ���
INSERT ALL
    WHEN deptno = 10 THEN
        INTO emp_10 VALUES(empno, ename, job, hiredate, sal)
    WHEN deptno = 20 THEN
        INTO emp_20 VALUES(empno, ename, job, hiredate, sal)
    WHEN deptno = 30 THEN
        INTO emp_30 VALUES(empno, ename, job, hiredate, sal)
SELECT * FROM emp;
SELECT * FROM emp_10;
SELECT * FROM emp_20;
SELECT * FROM emp_30;
SELECT DISTINCT TO_CHAR(hiredate, 'YYYY') FROM emp;
CREATE TABLE emp_1980
AS
SELECT empno, ename, job, hiredate, sal FROM emp
WHERE 1 = 2;
CREATE TABLE emp_1981
AS
SELECT empno, ename, job, hiredate, sal FROM emp
WHERE 1 = 2;
CREATE TABLE emp_1982
AS
SELECT empno, ename, job, hiredate, sal FROM emp
WHERE 1 = 2;
CREATE TABLE emp_1983
AS
SELECT empno, ename, job, hiredate, sal FROM emp
WHERE 1 = 2;
INSERT ALL
    WHEN TO_CHAR(hiredate, 'YYYY') = 1980 THEN
    INTO emp_1980 VALUES(empno, ename, job, hiredate, sal)
    WHEN TO_CHAR(hiredate, 'YYYY') = 1981 THEN
    INTO emp_1981 VALUES(empno, ename, job, hiredate, sal)
    WHEN TO_CHAR(hiredate, 'YYYY') = 1982 THEN
    INTO emp_1982 VALUES(empno, ename, job, hiredate, sal)
    WHEN TO_CHAR(hiredate, 'YYYY') = 1983 THEN
    INTO emp_1983 VALUES(empno, ename, job, hiredate, sal)
SELECT * FROM emp;
SELECT * FROM emp_1981;
-- ���� ==> �ѽ�/���/�߽�/�Ͻ�/��Ÿ
-- �뷡 ==> ����/POP/Ʈ��/ ...
DROP TABLE emp_1983;
*/
DROP TABLE student;
CREATE TABLE student (
    hakbun NUMBER,
    name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
    subject VARCHAR2(100),
    kor NUMBER(3),
    eng NUMBER(3),
    math NUMBER(3),
    regdate DATE DEFAULT SYSDATE,
    CONSTRAINT std_hak_pk PRIMARY KEY(hakbun)
);
-- TABLE ������� = �����͸� �߰� => INSERT
INSERT INTO student VALUES (1, 'ȫ�浿', '', 90, 80, 90, SYSDATE);
INSERT INTO student (hakbun, name, kor, eng, math) VALUES (2, '��û��', 89, 78, 90); -- DEFAULT�� ����Ǵ� �κ�
SELECT * FROM student;

SELECT hakbun, name, kor, eng, math, (kor + eng + math) total, ROUND((kor + eng + math) / 3 , 2) avg
FROM student;
-- �������� => INSERT, UPDATE, DELETE���� ����� ����
-- �ڵ� ������ȣ�� �̿�
INSERT INTO student (hakbun, name, kor, eng, math) VALUES((SELECT MAX(hakbun) + 1 FROM student), '�ڹ���', 90, 80, 67);

-- �ڵ�������ȣ , ���� (�ʿ��� ������ �߰�, ��ü ������ �߰�) 
-- default�� ���� ��� => ���������� �߰�
-- ����/��¥�� �ݵ�� ''�� �̿��ؼ� �߰��Ѵ�
-- �׷��� ���� ��� => ��ü������ �߰�

ALTER TABLE student DROP COLUMN subject;
ALTER TABLE student DROP COLUMN regdate;

CREATE TABLE emp_test
AS
SELECT * FROM emp;

SELECT * FROM emp_test;

TRUNCATE TABLE emp_test;

INSERT INTO emp_test(empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT * FROM emp;

SELECT * FROM student;

TRUNCATE TABLE student;