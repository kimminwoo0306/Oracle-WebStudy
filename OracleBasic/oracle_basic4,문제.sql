-- SQL (DML => ����� �����͸� �����ϴ� ���α׷�) => �˻�, �߰�, ����, ���� (CURD)
/*
        DML (������ ����)
          = SELECT (�����͸� �˻� => ����)
          ** �÷��� Ȯ�� => DESC table��
          = 1) ����)
               SELECT * | column1, column2 ...
               FROM table name (table ������ ���� ����)
               [
                    WHERE => ���� �˻�
                    GROUP BY => �׷����� ������ �׷캰 ó�� (�б⺰, �μ���, ������)
                    HAVING �׷� �˻� => �ݵ�� GROUP BY�� �־ ����� ���� (�ܵ������� ����� �Ұ���)
                    ORDER BY ���� (ASC/DESC)
               ]
            2) ���� �˻� (������)
               WHERE ������ (�÷��� ������ ��)
                                  -----
               ��������� : SELECT �ڿ��� �ַ� ����Ѵ� (+, -, *, /) => ����/���� => �Ǽ� => ROW���� ��� => ����� ���� �Լ�
                           '10' => �ڵ����� ���������� ����
                           +�� Only ����� �� �� �ִ�, (���ڿ� ���� = ||)
                           => ����Ŭ�� "" => ''
                           => ''�� ����ؼ� ǥ�� = ���ڿ�, ��¥��
               �񱳿����� : = , != , <> , ^= , < , > , <= , >=
               �������� : AND, OR ==> & : �Է°��� ���� �� ���
                                      || : ���ڿ� ���ս� ���
               IN : OR�� ������ ���� ��쿡 ���
                    WHERE �÷��� IN(��, ��, ��..)
               LIKE : % (���ڿ��� �� �� ����), _ (�ѱ���)
                      A% , %A , %A% , _A% , _A_
               BETWEEN : �Ⱓ, ���� => ����¡ ��� ==>    >= AND <=
                     WHERE �÷��� BETWEEN �� AND ��
                     ==> ��¥, ���ڵ� �����Ѵ�
                     ==> WHERE hiredate BETWEEN '81/01/01 AND '81/12/31';
                     ==> WHERE '81/01/01' <= hiredate AND hiredate <= '81/12/31';
                     ==> WHERE hiredate LIKE '81%';
                     ==> WHERE SUBSTA(hiredate, 1, 2) = 81;
               NOT : ���� (������ �ƴ� ��, ������ �ȵ�..)
                     NOT IN(), NOT BETWEEN, NOT LIKE
                     
               NULL : null ���� ���� ����ó���� ���� ���Ѵ�
                      null���� ó���ϴ� ������
                      1) null �� ��� ======> IS NULL
                      2) null ���� �ƴ� ��� ====> IS NOT NULL
            ------------------------------> ������� �����!
            3) ���� �Լ�
            4) JOIN
            5) SubQuery
*/

-- 1. emp���� �޿��� 2000 �̻��� ����� ����ϼ���.
SELECT * 
FROM emp 
WHERE sal >= 2000;

-- 2. emp���� �޿� sal�� 2000 �̻��� ����� �̸� ename�� ��� empno�� ����ϼ���.
SELECT ename, empno
FROM emp
WHERE sal >= 2000;

-- 3.?emp���� �̸��� 'FORD'�� ����� ��� empno�� �޿� sal�� ����ϼ���
-- ���ڿ��� �Է� ==> '' + ��ҹ��ڸ� �����Ѵ�
SELECT empno, sal
FROM emp
WHERE ename = 'FORD';

-- 4.?emp���� �Ի����� hiredate�� 82�� ���Ŀ� �Ի��� �����?? �̸��� �Ի����ڸ� ����ϼ���.
-- (��¥�� �������� YY/MM/DD���¸� ����ϸ�ȴ�.)
SELECT ename, hiredate 
FROM emp 
WHERE hiredate > '82/12/31';

-- 5.?emp���� �̸��� J�� ���� ����� �̸��� ����� ����ϼ���.
SELECT ename, empno 
FROM emp 
WHERE ename LIKE '%J%';

-- 6.?emp���� �̸��� S�� ������ ����� �̸��� ����� ����ϼ���.
SELECT ename, empno
FROM emp
WHERE ename LIKE '%S';

-- 7.?emp���� �̸��� �ι�° ���ڰ� A�� ���� ����� �̸��� ����� ����ϼ���.
SELECT ename, empno
FROM emp
WHERE ename LIKE '_A%';

-- 8.?emp���� ���ʽ��� 300�̰ų� 500�̰ų� 1400�� �����??? �̸�, ���, ���ʽ��� ����ϼ���.
SELECT ename, empno, comm
FROM emp
WHERE comm IN(300, 500, 1400);

-- 9.?emp���� ���ʽ��� 500���� 4000 ������ ����� �̸��� ���, ���ʽ��� ����ϼ���.
SELECT ename, empno, comm
FROM emp
WHERE 500 <= comm AND comm <= 4000;

-- 10.?emp���� �μ��� 10�̰� ��å�� CLERK�� �����̸�,���,��å(job),�μ�(deptno)�� ����ϼ���.
SELECT ename, empno, job, deptno
FROM emp
WHERE job = 'CLERK' AND deptno = 10;

-- 11.?emp���� �Ի����ڰ� 82�� �����̰ų� ��å�� MANAGER�� ����� �̸��� �Ի����ڸ� ����ϼ���.
SELECT ename, hiredate
FROM emp
WHERE hiredate > '82/12/31' OR job = 'MANAGER';

-- 12.?emp���� �μ���ȣ�� 10�� �ƴ� ������ ���,�̸�,�μ���ȣ�� ����ϼ���.
-- ���α׷��� !=
SELECT empno, ename, deptno
FROM emp
WHERE deptno <> 10;

-- 13.?emp���� �̸��� A�� ���� ������ ����� �̸��� ����ϼ���.
SELECT empno, ename
FROM emp
WHERE ename NOT LIKE '%A%';

-- 14.?emp���� ���ʽ��� 500���� 1400�� �ƴ� ������ ����� ���ʽ��� ����ϼ���.
SELECT empno, comm
FROM emp
WHERE comm NOT BETWEEN 500 AND 1400 AND comm <> 0;

-- 15.?emp���� �Ŵ����� ���� ���� �����̸��� ����ϼ���.
-- null���� is null�� ǥ���Ѵ�.
SELECT ename
FROM emp
WHERE mgr IS NULL;

-- 16. emp���� Ŀ�̼��� �޴�(Ŀ�̼��� null���� �ƴ�) �����̸��� Ŀ�̼��� ����ϼ���.
SELECT ename, comm
FROM emp
WHERE comm IS NOT NULL AND comm <> 0;

SELECT DISTINCT job FROM emp;
-- ||, �÷� "��Ī", �÷� as ��Ī 129 ~ 155page