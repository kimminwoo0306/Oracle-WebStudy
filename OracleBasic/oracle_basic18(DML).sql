-- 189page UPDATE, DELETE
/*
    Ȱ�� / ���� => �ڹٷ� �� ==>
    =======> ����Ŭ(RDBMS) ==> ������ �˻� (������ ����
    DML
       INSERT : ������ �߰�
                �Խ��� �۾���, ȸ������, ���ϱ�, �����ϱ�, ��۾��� ...
                ����)
                     = ��ü ������ �߰�
                       INSERT INTO table_name VALUES(��, ��, '��' ...) => ���� ���ڿ�, ��¥�϶� ''�ȿ�
                                    -> ������ �÷��� ��� ���� ���� �߰�
                     = �ʿ��� �����͸� �߰� (����Ʈ���� ������ ���)
                       INSERT INTO table_name(�÷���, �÷��� ...) VALUES(��, �� ...)
                                              ---------------- ������ġ ----------
                                                               + �������� ��ġ
                       *** ������ (��������) ==> �ڹٽ�ũ��Ʈ(��ȿ��) => ������(���̺귯�� => ��ȿ���˻�)
                       *** ������ : �߰��� => �ݵ�� COMMIT�� �����ش�
                                   �ڹٴ� AutoCommit => executeUpdate()
                                   ----------------
                                   => �ڹٿ����� �Ѱ��� ����� ������?? (SQL������ ������ ������ �� �ִ�)
                                   ��) �󼼺���
                                        = UPDATE (��ȸ�� ����)
                                        = SELECT (������ �б�)
                                   DML���� - �������� �������� ������ �ϳ��� ����� ����
                                   
       UPDATE : ������ ����
                �Խ��� ����, ��� ����, ȸ�� ����, ��ٱ��� ����, ���ż���
                ����)
                     UPDATE table_name 
                     SET �÷��� = ��, �÷��� = '����', �÷��� = '��¥'
                     ----------------------------------------- ��ü ������ ���� (�޿��λ�)
                     [WHERE ����] ---- ���ϴ� �����͸� ����
       DELETE : ������ ����
                �Խù� ����, ��� ����, ȸ�� Ż��, ������� ...
*/
CREATE TABLE emp_update
AS
SELECT * FROM emp;

SELECT * FROM emp_update;

-- ���� ����
UPDATE emp_update
SET job = 'CLERK';

SELECT * FROM emp_update;
ROLLBACK; -- COMMIT�� �����ϸ� Rollback�� ������� �ʴ´� (�ڹ�)

-- �߰�
-- (SELECT NVL(MAX(empno) + 1, 1) FROM emp_update) -> ���� ���� ��� �ʱⰪ 1
INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), 'ȫ�浿', 'CLERK', 7788,
        SYSDATE, 2000, 100, 40);
INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), '��û��', 'MANAGER', 7788,
        '21/10/10', 3000, 500, 40);
INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), '�ڹ���', 'CLERK', 7788,
        SYSDATE, 2000, 100, 40);
COMMIT; -- ���� ����
SELECT * FROM emp_update;

-- �ڹ��� ����
UPDATE emp_update SET
job = 'SALESMAN', mgr = 7698, hiredate = '20/01/05', sal = 3500, comm = 700, deptno = 30
-- ����
WHERE empno = 7937;
-- �񱳿�����
COMMIT; -- DML -- �޸𸮿� ����

INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), 'ȫ�浿1', 'CLERK', 7788,
        SYSDATE, 2000, 100, 50);
INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), 'ȫ�浿5', 'CLERK', 7788,
        SYSDATE, 2000, 100, 50);
INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), 'ȫ�浿2', 'CLERK', 7788,
        SYSDATE, 2000, 100, 50);
INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), 'ȫ�浿3', 'CLERK', 7788,
        SYSDATE, 2000, 100, 50);
INSERT INTO emp_update VALUES((SELECT MAX(empno) + 1 FROM emp_update), 'ȫ�浿4', 'CLERK', 7788,
        SYSDATE, 2000, 100, 50);
COMMIT;

UPDATE emp_update SET
deptno = 60
WHERE deptno = (SELECT deptno FROM emp_update WHERE empno = 7938);
-- �������� ����� ����
SELECT * FROM emp_update;
-- ����, ��¥ ==> '', ������ ��� => byte DESC
COMMIT;

/*
       DELETE : ������ ����
       ����)
            DELETE FROM table_name
            [WHERE ����] -- ������ ������ ��ü����
*/
-- ��ü ����
DELETE FROM emp_update;

SELECT * FROM emp_update;
ROLLBACK;

DELETE FROM emp_update
WHERE deptno = 60;
COMMIT;

DELETE FROM emp_update
WHERE empno = 7937;
COMMIT;

DELETE FROM emp_update
WHERE deptno  = (SELECT MAX(deptno) FROM emp_update); 
COMMIT;

TRUNCATE TABLE emp_update; -- ROLLBACK �Ұ� (DML�� ����)
SELECT * FROM emp_update;
ROLLBACK;
DROP TABLE emp_update;
/*
    COMMIT/ROLLBACK => INSERT, UPDATE, DELETE
    ALTER, CREATE, RENAME, DROP, TRUNCATE => COMMIT/ROLLBACK�� ������� �ʴ´�
*/