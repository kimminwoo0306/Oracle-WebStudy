-- ����Ŭ 2���� -> SELECT (�����Լ�)
/*
      SQL : �����ͺ��̽����� ���Ǵ� ���
            => ���� : ��� ����ڿ��� ������ ���� (������Ʈ)
            => �����ͺ��̽��� ����� �����͸� ���� => DBMS(�����ͺ��̽� �ý���) => �����Ҷ� ���Ǵ� ��� : SQL
            => �ʿ��� �����͸� ���� => ����(�÷�)
               ------------------ ���̺� ���۽� (Ű�� ���� ���� , ��������)
            => readonly : �б����� => View , �ߺ��� �ּ�ȭ => ������ , �Լ�...
      emp/dept 
      => ���� 
         1) DML => ������ ���� (CURD) => �����α׷��� 
            ����ڴ� �ʿ��� �����͸� �Է� ==> SQL������ ���� => ����Ŭ�� ���� 
            ��) ��ȭ �˻� : ��
                WHERE title LIKE '%��%'
            = SELECT : ����ڿ��� �����͸� �˻��� �ִ� ���� 
                       ������ , �󼼺��� , �˻�, ��õ������ �б�...(65%) 
                       ���̺� ���� (JOIN,SubQuery) 
                       ��) ��ȭ �󼼺��� => ��� , �Խ��� => ��� , ���� => id�� ������´� 
                           
            = INSERT : ����ڰ� ��û�� �����͸� ����Ŭ�� �߰� 
                       ��) ȸ������ , �۾��� , ��� �ø��� , ���ϱ� , ���ſ�û 
            = UPDATE : ����� ��û�� ���� �����͸� ���� 
                       ��) ȸ������ , �����ϱ� , ��ٱ��� ...
            = DELETE : ������ ���� 
                       ��) ȸ��Ż�� , ���� ��� , ���� ��� 
         2) DDL : ������� �����(���̺�) , �Լ� , �������̺� , �ε��� , �ڵ� ������ȣ ...
            = CREATE : ���� 
                       CREATE TABEL , CREATE VIEW , CREATE SEQUENCE , CREATE INDEX , CREATE FUNCTION...
                       ------------ �������� , �������� , Ű
                       ------------ �����ͺ��̽� �𵨸� => ����ȭ
            = ALTER : ���� 
                      *** ����Ŭ : �ѱ� (3byte) 
                      ---- 1.ADD(�÷��߰�) , 2. MODIFY (�÷� ����), 3. DROP(�÷� ����), 4. TRUNCATE(������ �߶󳻱�)
            = DROP : ���̺� , VIEW�� ���� ���� 
            = RENAME 
         3) DCL : GRANT , REVOKE => ����� ���� (View,Index�� ����� ������ ����)
         4) TCL : �ϰ� ó�� (COMMIT,ROLLBACK)
         
         => SELECT : ������ �˻� 
            1) ���� (��������) => 145page
               SELECT * | column1,column2... (�÷�����Ʈ)
               FROM table_name|view_name|SELECT~ 
               [
                  WHERE ���ǰ˻� => ������ 
                  --------------------------------
                  GROUP BY �׷캰�� ������ ���� ó�� : ���������� ����� ���� 
                  HAVING : �׷� ���� => �ݵ�� GROUP BY�� ������ �Ǿ� ������ ����� ���� (���������� ����� �Ұ���)
                  --------------------------------
                  ORDER BY ����
               ]
               => SELECT���� => �÷���� , ���̺� ��� ����� ����(�ζ��κ�) 
                               ------- ��Į�� �������� 
            2) ���� �˻� : ������ 
               ��������� : +,-,*,/ => '10' => ��������� ����ϸ� => �ڵ����� ���ڷ� ������ �ȴ� (���ڿ������� �� �� ���� Only ���)
                           / => ����/����=�Ǽ�
               �񱳿����� : = , (<>,!=,^=) , < , > , <= ,>=
               �������� : AND , OR
                          || =>  ���ڿ� ����
                          && =>  �Է°� �޴� ��� 
               ----------- �����ͺ��̽����� �ִ� ������ 
               IN : OR�� ������ �϶� ���Ǵ� ������ 
                    WHERE empno IN(��,��...)
                          �÷���
               NOT : ���������� ==> NOT LIKE , NOT BETWEEN , NOT IN ==> !(������)
               NULL : NULL(��ü�� ���� ��) => ��� ����ó���� �Ұ��� ==> IS NULL , IS NOT NULL
                      ==> NVL()
               BETWEEN : �Ⱓ,���� ==>   >= AND <= (����)
               LIKE : ���繮�忭 �˻� 
                      % : ���ڼ��� �������
                      A% => A�� ����
                      %A => A�� ��
                      %A% => A�� ���� 
                      _ : �ѱ��� 
                      REGEXP_LIKE : ���Խ� ==> 149~155page 
            3) ���ϴ� �����͸� ���� : �����Լ� 
            4) �������� => ������ , ������ , ��¥��
                                  -------------- �ݵ�� ''
            5) ���ڿ� ���� : ||
            6) �÷����̳�,���̺���� �� ��� : ��Ī���  => �÷��� "" , �÷��� as ��Ī
            7) �ߺ����� ������ ���� : DISTINCT
       
            => 155page : ���� => �����ؼ� �������� �ʴ´� ==> ORDER BY (�������̸� ������� ����) => ��ü�ϴ� ��ɾ� (***INDEX)
            ORDER BY ���� => �������� ���� 
            
            ����)
              SELECT empno,ename,job 
              FROM emp
              ORDER BY empno;  ==> ASC���� (�ø�����)
              
              SELECT empno,ename,job 
              FROM emp
              ORDER BY empno DESC;  ==> (��������)
                      1      2    3
              SELECT empno,ename,job 
              FROM emp
              ORDER BY 3;
              
              ***** �ڹ� (0) , ����Ŭ (1)
              
              ���� ���� 
              --------- ������ϱ� 
              SELECT empno,ename,job,deptno
              FROM emp
              ORDER BY deptno ASC,ename DESC
                       ----------
                         10  ccc
                         10  bbb
                         10  aaa
                         20  ddd
                         30  eee
            SELECT empno,ename,job,deptno
            FROM emp
            ORDER BY 4 ASC,2 DESC
                         
              
              
            
*/
--SELECT LENGTHB('ȫ�浿') FROM DUAL;
/*SELECT empno,ename,dname,loc
FROM emp,dept
WHERE emp.deptno=dept.deptno;

SELECT empno,ename,(SELECT dname FROM dept WHERE deptno=emp.deptno) "dname",
 (SELECT loc FROM dept WHERE deptno=emp.deptno) "loc"
FROM emp;

SELECT * 
FROM (SELECT * FROM emp);*/
-- emp ���̺��� ����� ���� => �ø����� ���� 
SELECT * 
FROM emp
ORDER BY empno ASC;

SELECT * 
FROM emp
ORDER BY empno DESC; -- �������� 

-- �޿��� ���� ������ ��� 
SELECT *
FROM emp
ORDER BY sal DESC;
-- �Ի����� ���� ������ ��� 
SELECT *
FROM emp
ORDER BY hiredate ASC;
-- �̸��� ���ĺ� ���� 
SELECT *
FROM emp
ORDER BY ename ASC;

-- �μ����� ��� => ���� , GROUP BY
SELECT *
FROM emp
ORDER BY deptno ASC;

-- ���� ���� 
SELECT ename,deptno
FROM emp
ORDER BY 2,1 DESC;





