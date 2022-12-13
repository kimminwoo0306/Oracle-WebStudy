/*
      SQL ���� (3��)
      => ���̺� ��ġ (emp, dept)
      => SQLDevleoper, XE
      => SQL�Ұ�
         DML, DDL, DCL, TCL
         --- SELECT, INSERT, UPDATE, DELETE, MERGE
             ------ ������ ����
             
      145page
       => SELECT ����
          1) ����
             SELECT [ALL|DISINCT] * | coulumn1, column2...
             FROM table_name|view_name|SELECT~
             ---------------------------------------------
             {
                WHERE ������ (�÷���, ������ ��)
                GROUP BY �׷��÷�|�Լ�
                HAVING �׷쿡 ���� ���� ==> GROUP BY�� ���� ��쿡�� ����� �� ����
                ORDER BY �÷� (ASC|DESC) => ASC�� ������ ����
             }
        2) ��Ī => �÷�, ���̺�
                  �÷� "", �÷� as ��Ī
                  ------  -----------
        3) ���ڿ� ���� ==> || *** ����Ŭ�� ���ڿ�, ��¥ǥ�� ''
        4) �ߺ����� �����͸� ��� : DISTINCT �÷���
                                ---------------
       => ������ ó�� / �����Լ� / ����
       *** ���� ==> FROM table_name
           ==> ������ ���̺� : DUAL (���ó���� ����)
       1) ��������� => �ַ� SELECT �ڿ� �ٿ��� ���
          +, -, *, / ==> ���ڿ��� ����ó���ϸ� ���� �߻� ==> ||
                     ==> /�� 0���� ���� �� ����, ����/���� = �Ǽ�
                     ==> �÷��� ���� ���� ��� => NULL�� ����ó���� �ȵȴ�
                     null + 1 = null
       ---------------------- ���� �˻��ÿ� ���
       2) �񱳿����� : =(����), != , <> , ^= (���� �ʴ�), < , > , <= , >=   ==> true/false
                                   -- ����Ŭ������
                              -- ���α׷���
                                   
       3) �������� : AND , OR
                      && : Scanner : �Է°��� �޴� ��쿡 ���
                      || : ���ڿ� ����
       4) ���Կ����� : =
          ------------- WHERE, HAVING�ܿ� �ٸ� ������ ���
                        ------------- ���ǹ� (=����)
          ��) SELECT * FROM emp WHERE empno = 7788
                                      ------------ ����(�񱳿�����)
              UPDATE emp SET
              ename = 'ȫ�浿'; ----- ���Կ�����
       ----------------- �� ����Ŭ������ ���� ������
       5) NOT ������ : ���� (!�� ����ϸ� �ȵȴ�) 
                      NOT LIKE , NOT BETWEEN , NOT IN
                      NOT (����ó��)
       6) NULL ������ : ���� �������� �ʴ´� (����ó���� �� �� ����)
            = IS NULL => NULL �� ���
            = IS NOT NULL => NULL���� �ƴ� ���
       7) IN ������ ==> OR�� �������� ��쿡 ó���ϴ� ������
          WHERE deptno = 10 OR deptno = 20 OR deptno = 30 OR deptno = 40
          WHERE deptno IN(10, 20, 30, 40)
       8) BETWEEN ~ AND : �Ⱓ�̳� ������ ��Ÿ���ش�
          BETWEEN 1 AND 10 ==> �� �� 
          >=1 AND <=10
          ------------------- üũ��, ���డ�� ��, ������ ������
       9) LIKE => ���繮�ڿ� �˻� (�˻�)
                  % : ���ڿ� ������ �𸣴� ���
                      'A%' => A�� �����ϴ� ��� ���ڿ� (startsWith)
                      '%A' => A�� ������ ��� ���ڿ� (endsWith)
                      '%A%' => A�� ���Ե� ��� ���ڿ� ==> ��� �󵵰� ���� (contains)
                  _ : �ѱ���
                      __A__ ==> 5���� -> ��� A�� ���ԵǾ� �ִ�
                      __A%  ==> 3��° �ڸ��� A�� ��� ����
                  REGEXP_LIKE (���Խ�)
       ---------------------- WHERE, HAVING���� �ַ� ��� => true/false
*/

SELECT 10+2, 10-2, 10*2, 10/3
FROM DUAL;
SELECT 10+2, 10-2, 10*2, 10/0
FROM DUAL;
-- ���ڰ� ���ڿ��� ���� ��쿡 �ڵ� => ���������� ��ȯ
-- �ڵ� Integer.parseInt() ����
SELECT '10'+2, 10-2, 10*2, 10/3
FROM DUAL;
SELECT ' 10'+2, 10-2, 10*2, 10/3 -- �������־ ó������ trim()
FROM DUAL;
-- NULL���� ��쿡 �븥 ���� ��ü
SELECT ename, sal + NVL(comm, 0) "�����޿�"
FROM emp;
-- % => �������� �Լ� ==> MOD(10, 2) => 10%2 

SELECT * FROM emp
WHERE empno = &sabun;
-- ��� ������
/*
        ����Ŭ => �����δ����δ� ��谡 ���� (����)
                 Ʃ�ô����� ��谡 ���� (����) ===> ��������ڸ� �̿��ؼ� ó��
*/
CREATE TABLE student(
    name VARCHAR2(34),
    kor NUMBER,
    eng NUMBER,
    math NUMBER
);
SELECT * FROM student;
INSERT INTO student VALUES('ȫ�浿', 89, 78, 67);
INSERT INTO student VALUES('��û��', 78, 76, 90);
INSERT INTO student VALUES('�ڹ���', 90, 90, 78);
COMMIT;
-- ��� ����
SELECT name, kor, eng, math, kor + eng +math "total", (kor + eng + math) / 3 "avg"
FROM student;

-- �񱳿�����
SELECT ename, sal FROM emp;
-- = ���� (emp���� �޿��� 3000�� ����� �̸�, ����, �Ի���, �޿�)
SELECT ename, job, hiredate, sal
FROM emp
WHERE sal = 3000;
-- <> ���� �ʴ� (emp���� �޿��� 3000�� �ƴ� ����� �̸�, ����, �Ի���, �޿�)
SELECT ename, job, hiredate, sal
FROM emp
WHERE sal <> 3000;

SELECT ename, job, hiredate, sal
FROM emp
WHERE sal != 3000;

SELECT ename, job, hiredate, sal
FROM emp
WHERE sal ^= 3000;

-- �۴� < ==> 2500�̸��� ����� ��� ���� ���
SELECT *
FROM emp
WHERE sal < 2500;
-- �񱳿����� => ����, ��¥�� �񱳿����ڸ� ����Ѵ�
-- ��¥ ==> YY/MM/DD   81/01/01
-- 81�� ���Ŀ� �Ի��� ����� ��� ������ ���
SELECT *
FROM emp
WHERE hiredate > '81/12/31'; -- '' (���ڿ��������� ����)
-- WHERE ������ �ڹ� if���� ==> true�϶� ó��
/*
    SQL���� => SELECT
    for (int i = 0; i < emp.length; i++) {
        Where
        if(hiredate > '81/12/31') {
        }
    }
*/
-- 81�⿡ �Ի��� ����� ��� ���� ���
/*SELECT *
FROM emp
WHERE hiredate >= '81/01/01' AND hiredate <= '81/12/31'; */
-- <= , >=
-- �޿��� 1500�̻��� ����� �̸�, �޿�
SELECT ename, sal
FROM emp
WHERE sal >= 1500;

-- �޿��� 3000������ ����� �̸�, �޿�, ����
SELECT ename, sal, job
FROM emp
WHERE sal <= 3000;

-- KING���� ���� �̸��� ���� ����� �̸�, �޿�, ����
SELECT ename, sal, job
FROM emp
WHERE ename > 'KING';
-- ������ => ���ڰ� �� ��� ��ҹ��ڸ� ����
-- king�� ��� ������ ������ �´�
SELECT *
FROM emp
WHERE ename = UPPER('king');

SELECT *
FROM emp
WHERE ename = 'KING';
-- �ڹٿ��� �빮�ڷ� �����Ŀ� ����Ŭ�� ���� (toUpperCase())
-- �������� (OR, AND)
/*
            AND : ����
            (����) AND (����)  => true and ture �϶��� true�� �Ǵ� ������ => ����, �Ⱓ�� ���Խ� ó��
            OR : ����
            (����) OR (����)  => ���� 1���� true�� true�� �Ǵ� ������ => �����ۿ� �ִ� ���
            
            --------------------------------------------
                            AND(�̰�)        OR(�̰ų�)
            --------------------------------------------
            true   true     true            true
            --------------------------------------------
            true   false    false           true
            --------------------------------------------
            false  true     false           true
            --------------------------------------------
            false  false    false           false
            --------------------------------------------
*/
-- OR ������ => IN������ ��ü�� ����
-- AND������ => BETWEEN ��ü�� ����

-- AND ==> 1500�̻� 3000������ �޿��� �޴� ����� ��� ���� ���
SELECT *
FROM emp
WHERE 1500 <= sal AND sal <= 3000;

-- 1500�̰ų� 3000�� ����� ��� ����
SELECT *
FROM emp
WHERE sal = 1500 OR sal = 3000;

-- �μ���ȣ�� 30���� ����� ��� ���� + 20��� ����
SELECT *
FROM emp
WHERE deptno = 30 OR deptno = 20;

-- NULL ������ ==> �� null�� ��쿡�� ����ó���� �ȵȴ�
-- IS NULL (comm = null), IS NOT NULL
-- comm ������ ==> �������� �޴� ����� ��� ����
SELECT *
FROM emp
WHERE comm IS NOT NULL AND comm <> 0;
-- WHERE comm IS NULL OR comm <> 0; ������ ���»����

-- IN������ => OR�� �������� ��쿡 ó��
-- �޿��� 5000, 2850, 1500, 3000, 950�� �޴� ����� ��� ����
SELECT *
FROM emp
WHERE sal = 5000 OR sal = 2850 OR sal = 1500 OR sal = 3000 OR sal = 950;

SELECT *
FROM emp
WHERE sal IN (5000, 2850, 1500, 3000, 950);
-- ����
-- ������ MANAGER, CLERK, SALESMAN
SELECT *
FROM emp
WHERE job NOT IN ('MANAGER', 'CLERK', 'SALESMAN');
-- BETWEEN AND ==> >= AND <=
-- ����, ����, ��¥ ����
-- �޿��� 1500 ~ 3000 ���̿� �ִ� ����� ��� ����
SELECT *
FROM emp
WHERE 1500 <= sal AND sal <= 3000;
-- �� (����¡)
SELECT *
FROM emp
WHERE sal BETWEEN 1500 AND 3000;
-- NOT IN, NOT BETWEEN, NOT LIKE
-- �������߿� ���� ���� ���Ǵ� ������ ==> LIKE ==> ��� �˻���
-- ���� ==> WHERE �÷��� LIKE '����'    A%, %A, %A%, __A%, __A__
-- ��� �̸��߿� A�ڷ� �����ϴ� ����� ��� ������ �����޶�
SELECT *
FROM emp
WHERE ename LIKE 'A%';

SELECT *
FROM emp
WHERE ename LIKE '%T';

SELECT *
FROM emp
WHERE ename LIKE '%A%';

SELECT *
FROM emp
WHERE ename LIKE '%EN' OR ename LIKE '%AN';

SELECT *
FROM emp
WHERE ename LIKE '__O__';

SELECT *
FROM emp
WHERE ename LIKE '_A%';