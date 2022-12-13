-- SQL (DML => ����� �����͸� �����ϴ� ���α׷�) => �˻�,�߰�,����,���� (CURD)
/*
      DML (������ ����) 
        = SELECT (�����͸� �˻�=>����)
          ** �÷��� Ȯ�� => DESC table��
        = 1) ����) 
            SELECT * | column1,column2...
            FROM table_name (table������ ���� ����)
            [
                WHERE => ���� �˻� 
                GROUP BY �׷����� ������ => �׷� ó���� ó�� (�б⺰,�μ���, ������)
                HAVING �׷� �˻� => �ݵ�� GROUP BY�� �־ ����� ���� (�ܵ������� ����� �Ұ���)
                ORDER BY ���� (ASC/DESC)
            ]
          2) ���� �˻� (������) ==> 149page
             WHERE ������ (�÷��� ������ ��)
                                -----
             ��������� : SELECT�ڿ��� �ַ� ����Ѵ� ( + , - , * , / ) => ����/����=�Ǽ�  => ROW���� ��� => ����� ���� �Լ�
                         '10' => �ڵ����� ���������� ���� 
                         +�� Only����� �� �� �ִ� , (���ڿ� ���� => ||)
                         => ����Ŭ�� ""=> ''
                         => ''�� ����ؼ� ǥ�� = ���ڿ� , ��¥�� 
             �񱳿����� : = , (!=,<>,^=) , < , > , <= , >=  
             �������� : AND , OR ==> & (�Է°��� ���� �� ���), ||(���ڿ� ����)
             IN : OR�� ������ ���� ��쿡 ��� 
                  WHERE �÷��� IN(��,��,��..) 
             LIKE : % (���ڿ��� �� �� ����) , _ (�ѱ���)
                    A%  , %A  , %A% , _A% , _A_
             BETWEEN : �Ⱓ , ���� => ����¡ ���  ==>    >= AND <=
                   WHERE �÷��� BETWEEN �� AND ��
                   ==> ��¥,���ڵ� �����Ѵ� 
                   ==> WHERE hiredate BETWEEN '81/01/01' AND '81/12/31'
                   ==> WHERE hiredate>='81/01/01' AND hiredate='81/12/31'
                   ==> WHERE hiredate LIKE '81%'
                   ==> WHERE SUBSTR(hiredate,1,2)=81
             NOT : ���� (������ �ƴ� ��, ������ �ȵ�...)
                   NOT IN() , NOT BETWEEN  , NOT LIKE
             NULL : null���� ���� ����ó���� ���� ���Ѵ� 
                    null���� ó���ϴ� ������ 
                    1) null �� ��� ======> IS NULL
                    2) null ���� �ƴ� ��� ===> IS NOT NULL
          -----------------------------> 
          3) ���� �Լ� 
          4) JOIN
          5) SubQuery 
*/
--1. emp���� �޿��� 2000 �̻��� ����� ����ϼ���. (�񱳿�����) *
-- ��ü �÷��� ��� ==> *
SELECT *
FROM emp
WHERE sal>=2000;
--2. emp���� �޿� sal�� 2000 �̻��� ����� �̸� ename�� ��� empno�� ����ϼ���.(�񱳿�����)
SELECT ename,empno --���ϴ� �÷��� ��� 
FROM emp
WHERE sal>=2000;

--3. emp���� �̸��� 'FORD'�� ����� ��� empno�� �޿� sal�� ����ϼ��� (�񱳿�����)
-- ���ڿ��� �Է� => '' ��ҹ��ڸ� �����Ѵ� (emp => �빮�ڷ� ����)
SELECT empno,sal
FROM emp
WHERE ename='FORD';
/*4. emp���� �Ի����� hiredate�� 82�� ���Ŀ� �Ի��� �����
   �̸��� �Ի����ڸ� ����ϼ���.
(��¥�� �������� YY/MM/DD���¸� ����ϸ�ȴ�.) �������� / �񱳿����� */
-- ��¥ => ���ڿ��������� ���� => '' 
SELECT ename,hiredate
FROM emp
WHERE hiredate>'82/12/31';
--5. emp���� �̸��� J�� ���� ����� �̸��� ����� ����ϼ���. LIKE  => %J%
SELECT ename,empno
FROM emp
WHERE ename LIKE '%J%'; -- contains
--6. emp���� �̸��� S�� ������ ����� �̸��� ����� ����ϼ���. LIKE  ==> %S
SELECT ename,empno
FROM emp
WHERE ename LIKE '%ES'; -- endsWith
--7. emp���� �̸��� �ι�° ���ڰ� A�� ���� ����� �̸��� ����� ����ϼ���. LIKE
SELECT ename,empno
FROM emp
WHERE ename LIKE '_A%';
/*8. emp���� ���ʽ��� 300�̰ų� 5000�̰ų� 1400�� �����
    �̸�, ���, ���ʽ��� ����ϼ���. IN , OR*/
SELECT ename,empno,comm
FROM emp
WHERE comm=300 OR comm=500 OR comm=1400;

SELECT ename,empno,comm
FROM emp
WHERE comm IN(300,500,1400);
--9. emp���� ���ʽ��� 500���� 4000 ������ ����� �̸��� ���, ���ʽ��� ����ϼ���.AND BETWEEN
SELECT ename,empno,comm
FROM emp
WHERE comm>=500 AND comm<=4000;

SELECT ename,empno,comm
FROM emp
WHERE comm BETWEEN 500 AND 4000;
/*10. emp���� �μ��� 10�̰� ��å�� CLERK��
     �����̸�,���,��å(job),�μ�(deptno)�� ����ϼ���.  AND*/

SELECT ename,empno,job,deptno
FROM emp
WHERE deptno=10 AND job='CLERK'; -- ���� , ��¥ => ''
/*11. emp���� �Ի����ڰ� 82�� �����̰ų� ��å�� MANAGER�� �����
     �̸��� �Ի����ڸ� ����ϼ���. OR*/
SELECT ename,hiredate
FROM emp
WHERE hiredate>'82/12/31' OR job='MANAGER';
--12. emp���� �μ���ȣ�� 10�� �ƴ� ������ ���,�̸�,�μ���ȣ�� ����ϼ���. NOT
-- ���α׷��� !=
SELECT empno,ename,deptno
FROM emp
WHERE deptno!=10;
-- ����Ŭ => ���� �ʴ� <>
SELECT empno,ename,deptno
FROM emp
WHERE deptno<>10;
SELECT empno,ename,deptno
FROM emp
WHERE deptno^=10;
SELECT empno,ename,deptno
FROM emp
WHERE NOT (deptno=10);

--13. emp���� �̸��� A�� ���� ������ ����� �̸��� ����ϼ���. NOT LIKE
SELECT empno,ename
FROM emp
WHERE ename NOT LIKE '%A%';

--14. emp���� ���ʽ��� 500���� 1400�� �ƴ� ������ ����� ���ʽ��� ����ϼ���. NOT BEWEEN
SELECT empno,comm
FROM emp
WHERE comm  NOT BETWEEN 500 AND 1400 AND comm<>0;
-- 0�� ���� ���� , null�� ���� �����ϴ� �� 
--15. emp���� �Ŵ����� ���� ���� �����̸��� ����ϼ���. IS NULL
SELECT ename
FROM emp
WHERE mgr IS NULL;
-- null���� is null�� ǥ���Ѵ�.

--16. emp���� Ŀ�̼��� �޴�(Ŀ�̼��� null���� �ƴ�) �����̸��� Ŀ�̼��� ����ϼ���. IS NOT NULL
-----------------------------------------------------------------------------------ORDER BY 
SELECT ename,comm
FROM emp
WHERE comm  IS NOT NULL AND comm<>0;

SELECT DISTINCT job FROM emp;
-- || , �÷� "��Ī"  �÷� as ��Ī  129~155page 
