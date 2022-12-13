/*
    SELECT => ����, JOIN, SubQuery
              ������, �����Լ�
              
    1) ����
       = �÷����� �� ��� : ��Ī
         �÷��� ��Ī, �÷��� as ��Ī, �÷��� "��Ī"
                                   ----------- ������ �ִ� ���
       = || ���ڿ� ����
       = DISTINCT : �ߺ� ����
       
       *** SELECT���� => �÷���� ���, ���̺� ��� ����� ���� --> (���̺� ��� ����� �ζ��� ��, Top-N) => ����¡ ��� (������� 100%)
                        -------- ��Į�� ��������                  
       SELECT * | column_list ==> *�� ���� �󵵰� ���� (null��) => nvl
       FROM table_name | view_name | SELECT~
       [
          WHERE ���ǹ� (�÷���|�Լ���) ������ ��
          GROUP BY �÷���|�Լ��� => �׷캰�� ������ ó�� ==> ���������� ���
          HAVING �׷쿡 ���� ���� => ������ GROUP BY�� ���ÿ� ����
          ORDER BY �÷���|�Լ��� => default(asc) | desc�� ������ �Ұ���
       ]
            => �����Ͱ� ���� ��� ORDER BY�� ���, ������ => �ε���(�˻� ����ȭ *** 100%)
       WHERE ���� ��� (���ǹ� => if)
       -------------- ������, ���� �Լ�
       ������
        1) ��������� : �ڵ�����ȯ => '10' -> 10, Only -> ����� ó��
                      ����/���� = �Ǽ�
                      => ROW���� ��� => CUBE / ROLLUP
        2) �񱳿����� : = (����) , != , <> (����Ŭ���� ���� ���� ���), < , > , <= , >=
                     �ڹ� : == , �ڹٽ�ũ��Ʈ : ===
                     => ���ڿ�, ��¥�� �񱳿����ڸ� ����Ѵ� ==> �ݵ�� ''
                     String sql = "SELECT ~~~ "
                                + "FROM ~~ "
                                + "WHERE name = ȫ�浿"; ==> ���� ('ȫ�浿'���� ����� ��)
                                ����Ŭ�� ������ null�θ� ���ͼ� ����ã�Ⱑ ����
             ����� ��û ===> �ڹ� ===> ����Ŭ ===> �ڹ� ===> ������ ==> ��
                                 SQL        �����    ArrayList
                                 --- String���� ����
                                 --- ���� ó�� => ����(Ű���带 �빮��)
                                 
        3) �������� : AND(���� ����, �Ⱓ ����) , OR(�����ʰ�)
                      *** && (�Է°� ���� ��), || (���ڿ� ����) 
        4) IN������ : OR�� �������� ��� ����ϴ� ������
                     WHERE �÷��� IN(��, �� ...)
        5) NULL������ : NULL => �������� �ʴ� �� => ������ó���� �� �� ����
                       => IS NULL (NULL����?? ó��), IS NOT NULL (NULL���� �ƴ� ���)
        6) BETWEEN������ : �Ⱓ =>  >= AND <=  --> ���� ����
                          ������ ������
                          -----------  ==> ����Ʈ (�Ѵ��� ���� �����) => ���̺�(20), �̹���(15)
        7) LIKE������ : ���繮�ڿ� ã��
                      => _(�ѱ���) , %(���ڼ� �������) ==> �˻����� ���� ���
                      A% , %A , %A% ==> �ֱٿ��� REGEXP_LIKE => ����
           WHERE name Like '%A%' OR name LIKE '%B%' OR name LIKE '%C%' OR name LIKE '%D%' OR name LIKE '%E%'
           WHERE REGEXP_LIKE(name, '[A-E]')
        
        ----------------------------------------------------------------------------
        �����Լ�
        -------
          ����Ŭ ��������
          -------------
           ������ --> �ڹ� (String)
             = CHAR(CHAR) => 1~2000byte => ������  ==> ����, ����Ȯ��
             = VARCHAR2(VARCHAR) => 1~4000byte => ������ (���ڰ����� ���� �޸� ũ�Ⱑ �޶�����) => ���ڿ��߿� ���� ���� ���
             = CLOB(TEXT) => 4�Ⱑ => ������ => �ٰŸ�, ȸ��Ұ�, ����������
               ** ������ ���ڼ��� �Ѿ������ �Ұ�
           ������
             = NUMBER(4) ==> 4�ڸ� �������� ��� ==> int
             = NUMBER(7,2) ==> 7�ڸ��߿� 2�ڸ��� �Ҽ��� ��� ==> double
             = NUMBER ==> �⺻���� 8�ڸ�
           ��¥�� ===> java.util.Date
             = DATE : �Ϲ� ��¥
             = TIMESTAMP : ��� ���
           ��Ÿ�� ==> 4�Ⱑ (������, ���� ...)
             --------------------------
             = BLOB : binary ����
             = BFILE : file ���·� ����
             -------------------------- ������!
             
          = �Լ��� �����͸� ����
            ������ �Լ� ==> ROW ����
                = ���ڰ��� �Լ� (�� ���� => ����)
                  ***1) LENGTH() : ������ ���� => LENGTH('ABC') => 3
                                             --------------
                  ***2) SUBSTR(���ڿ�, ������ġ, �ڸ�����) ==> SUBSTR('Hello Oracle', 1, 2) ==> He
                  ***3) INSTR(���ڿ�, 'ã�� ����', ������ġ, ���°)
                     ==> INSTR('Hello Oracle', 'l', 1, 2) ==> 4
                     ==>                            - +1 (�տ���) , -1(�ڿ��� ã��)
                     ==> ������ �ε�����ȣ�� 1������ ����
                  4) UPPER(), LOWER(), INITCAP() ==> �빮��, �ҹ���, �̴ϼ�
                                       --------- �ڹٿ� ����
                  *** ���������� ��û ==> �ڹٰ� ��û���� �޴´� ======> �����Ŀ� ����Ŭ ����
                                      �ڹٿ� �ִ� �޼ҵ�, ���� ��쿡�� ����Ŭ
                  5) TRIM(), LTRIM(), RTRIM() ==> trim() in java : ���鸸 ����
                     ------------------------ ���ϴ� �����͸� ����
                  6) LPAD(), ***RPAD()
                             ------ ���̵�ã��, ��й�ȣ ã�� (JavaMail)
                             RPAD('ABC', 5, '*') ==> ABC**
                                         -- 5���� ��� => ���ڼ��� ���ڶ�� *�� ����Ѵ�
                = ���ڰ��� �Լ� (Math)
                  1) MOD : ������ -> MOD(10,3) = 1
                  ***2) ROUND() : �ݿø� -> ROUND(10.123756, 3) = 10.124
                  3) TRUNC() : ���� -> TRUNC(10.123756, 3) = 10.123
                  ***4) CEIL() : �ø� -> CEIL(10.1) = 11
                = ��¥���� �Լ� (Calendar)
                  ***1) SYSDATE : �ý����� ��¥, �ð� ==> ������ (��¥ + �ð�) => �Ǽ���
                  ***2) MONTHS_BETWEEN : �Ⱓ������ �������� ������ �´�
                        MONTHS_BETWEEN(����, ����)
                     3) ADD_MONTHS() => �����
                = ��ȯ���� �Լ�
                  1) TO_CHAR : ���ڿ� ��ȯ ==> �ڹٿ����� ������ String���� ���� �޴´�
                     ��¥
                      YYYY(RRRR) : �⵵
                      MM (M) : ��
                      DD (D) : ��
                      HH/HH24 : �ð�
                      MI : ��
                      SS : ��
                      DY : ����
                      *** ��ҹ��� ������ ����
                     ����
                        999,999 => $, L(��)
                = ��Ÿ�Լ�
                  *** 1) NVL() => NULL�� �ٸ� ������ �����ؼ� ���  => String���� ���� ���� ��� NULL�̸� �޼ҵ带 ����� �� ����
                      String s;
                      s.substring() => ���� - NullPointerException
                      JSP ���� => ������� ����
                  *** 2) DECODE => switch case ���� ==> ����, ���ΰ�
                      3) CASE => �ڵ� ���ǹ� (�ڵ�ȭ)
                                1 => UPDATE, 2 => DELETE, 3 => INSERT  ==> TRIGGER
                                ��ȭ / ��� ==> �м��� ��ƴ� (�� ���� ������)
                                �԰� => ���, ��� => ���
            ������ �Լ� ==> Column ��ü ����
            (�׷��Լ�) => �Ϲ� �÷��̳�, ������ �Լ��� ���� ����� �Ұ���
                        =------------ GROUP BY�� �̿��ؼ� ���
            SELECT deptno, AVG(), MAX()
            FROM emp; ===> ���� (�Ϲ��÷��� deptno�� ���� �� �� ����)
            
            SELECT deptno, AVG(), MAX()
            FREM emp
            GROUP BY deptno;
            *** 1) COUNT() : ROW�� ���� => �α���, ID�ߺ�ó��, �˻���� ...
            *** 2) MAX() : �ڵ� ������ȣ
            3) MIN, SUM, AVG
            *** 4) RANK(), DENESE_RANK()
                   -----   ------------ 1 2 2 3
                   1 2 2 4 ..
                   => RANK() OVER(ORDER BY sal DESC) ==> �ڵ����� ����
        
        ==> JOIN (162page, 169page)
            ----- 2�� �̻��� ���̺��� �ʿ��� �����͸� ���� ���ο� ���̺��� �����
            ----- ����ȭ (���̺��� ������ ���� => ������ �����͸� ������ �´�)
            1) ����
                �����ͺ��̽�
                  *** ���� : SQLite (������, �ڵ���)
                  *** ���� : Oracle, MySQL, MariaDB
                                    --------------- ����
                  *** ��뷮 : ���̺��̽�, DB2
                = INNER JOIN
                  1. ���� : ������ (���� ���� ������ ������ ���) = null�� ��쿡�� ó������ ���Ѵ�
                  = (=)������ ��� (��������, EQUI_JOIN)
                    = ����Ŭ���� ����ϴ� ����
                      ����)
                            SELECT A.column, B.column...
                            FROM A, B
                            WHERE A.column = B.column ==> ���н� (���̺��, ��Ī)
                            --------------------------
                            SELECT a.column, b.column...
                            FROM A a, B b
                            WHERE a.column = b.column
                            *** �ڵ��ν� => �÷����� �ٸ� ��� (���� �÷���տ����� �ݵ�� ����)
                    = ǥ��ȭ�� ���� (��� �����ͺ��̽����� ��� : MySQL, MariaDB) *** �ǹ�
                            
                            SELECT A.column, B.column...
                            FROM A JOIN B
                            ON A.column = B.column ==> ���н� (���̺��, ��Ī)
                            --------------------------
                            SELECT a.column, b.column...
                            FROM A a JOIN B b
                            ON a.column = b.column
                  = (=)�� �ƴ� ������ (�� ����, NON_EQUI_JOIN)
                     �����ȿ� ���� ...
                     SELECT A.column, B.column
                     FROM A, B
                     WHERE A.column BETWEEN B.column AND B.column1;
                     
                     SELECT A.column, B.column
                     FROM A JOIN B
                     ON A.column BETWEEN B.column AND B.column1;
                     
                     ==> , ��� JOIN
                        WHERE ��� ON
                = OUTER JOIN : INNER JOIN�� ���� (null�� ��쿡�� ó��)
                  = LEFT OUTER JOIN
                    = ����
                      - ����Ŭ ����
                        SELECT A.column, B.column
                        FROM A, B
                        WHERE A.column = B.column(+)
                      - ANSI JOIN
                        SELECT A.column, B.column
                        FROM A LEFT OUTER JOIN B
                        ON A.column = B.column
                  = RIGHT OUTER JOIN
                    = ����
                      - ����Ŭ ����
                        SELECT A.column, B.column
                        FROM A, B
                        WHERE A.column(+) = B.column
                      - ANSI JOIN
                        SELECT A.column, B.column
                        FROM A RIGTH OUTER JOIN B
                        ON A.column = B.column
                  = FULL OUTER JOIN
                    = ����
                      - ANSI JOIN
                        SELECT A.column, B.column
                        FROM A FULL OUTER JOIN B
                        ON A.column = B.column
            JOIN�� ���̺��� ���� ����
            *** �������� (�μ�����) ==> SQL�� ������ �����ؼ� ���
            (MainQuery) = (SUBQUERY)
                              1 ==> ����� MainQuery�� ������ ó��
            WHERE �ڿ� ==> ������ ��������, ������ ��������, �����÷� ��������, ���� ��������
                          ----------------------------
            SELECT �ڿ� ==> ��Į�� ��������
            FROM �ڿ� ==> �ζ��κ�
            
            *** JOIN�� SELECT������ ���, SUBQUERY�� DML��ü���� ����� ����
            1) ������ �������� : �÷��� �Ѱ� ���� �Ѱ��� ���
            2) ������ �������� : �÷��� �Ѱ� ���� �������� ���
                = �� ��ü�� ��� ==> IN
                = ���߿� �ּҰ� 
                = ���߿� �ִ밪
                -------------------------
                ANY, SOME, ALL
                
                <ANY(1,2,3) ==> �ִ밪 (3) ==> SOME()
                >ANY(1,2,3) ==> �ּҰ� (1)
                
                <ALL(1,2,3) ==> �ּҰ� (1)
                >ALL(1,2,3) ==> �ִ밪 (3)
                ----------------------------- ������ MAX(), MIN()
                SQL������ ������ ��Ƽ� �ѹ��� ó�� ==> �ڹ�
                ---------------------------------------
                �ڹٿ���
                   emp���� ��ձ޿����� �۰� �޴� ����� ����� ���
                   
                   ����Ŭ ����
                   ��հ��� ���ؿ´�
                   ����Ŭ �ݱ�
                   ����Ŭ ����
                   ����� �����ؼ� ����� ���
                   ����Ŭ �ݱ�
                   ---------------------------
                   ����Ŭ ����
                   ����� �����ؼ� ����� ���
                   ����Ŭ �ݱ�
                   
*/
/*
SELECT ename, job FROM emp; -- ���� �÷�
SELECT deptno FROM emp WHERE ename = 'KING'; -- ������ �������� (�÷� �Ѱ��� ������� �Ѱ��� ���)
SELECT DISTINCT deptno FROM emp; -- ������ (�÷� �Ѱ� => ������� ������)
*/
-- ����߿� ��� �޿����� �۰� �޴� ����� ��� ������ ���
-- 1. ��� �޿�
SELECT ROUND(AVG(Sal)) FROM emp;
-- 2. ��� �޿��� �����ؼ� => ��û ����� ���
SELECT * FROM emp
WHERE sal < 2073;

-- SQL������ �����ؼ� ���
SELECT * FROM emp
WHERE sal < (SELECT ROUND(AVG(Sal)) FROM emp);

-- ���� ���̺����� ������� �ʴ´�, �ٸ� ���̺��� ����� �� �ִ�
-- KING�� �μ���, �ٹ����� ����Ѵ�
-- 1. King�� �ִ� �μ���ȣ ���
SELECT deptnom, FROM emp
WHERE ename = 'KING';
-- 2. �μ���ȣ�� �̿��ؼ� => �μ���, �ٹ����� ã�´�
SELECT dname, loc FROM dept
WHERE deptno = 10;
-- 3. �������� �̿�
SELECT dname, loc FROM dept
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'KING');
-- deptno�� ���� ������ ���
-- SCOTT�� ���� �μ��� �ٹ��ϴ� ����� ��� ������ ��� ==> deptno
-- 1. SCOTT�� ������ �ִ� deptno
SELECT deptno FROM emp
WHERE enmae = 'SCOTT';
-- 2. ��� �˻�
SELECT * FROM emp
WHERE deptno = 20;
-- 3. �������� �̿� (�ݵ�� ������� 1���� ���)
SELECT * FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'SCOTT');

-- �μ���ȣ�� 10, 20, 30 ==> ������ �������� ==> �Ѱ��� �÷��� ���� ������ �ִ� ��� => ANY, ALL, MAX, MIN
SELECT * FROM emp
WHERE deptno IN(SELECT DISTINCT deptno FROM emp);

-- �޿��� ���� ���� �޴� ����� ���� �μ����� �ٹ��ϴ� ��� ��� ���� ���
-- 1. �޿��� ���� ���� ���
SELECT MAX(sal) FROM emp; -- 5000
SELECT ename FROM emp WHERE sal = 5000;
-- 2. ã�� ��� �μ���ȣ
SELECT deptno FROM emp WHERE ename = 'KING';
-- 3. ���� �μ����� �ٹ��� ����
SELECT * FROM emp WHERE deptno = 10;

SELECT * FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = (SELECT ename FROM emp WHERE sal = (SELECT MAX(sal) FROM emp)));

-- IN, ANY, ALL ==> ������� ������ �ִ� ��� (�÷��� 1��) => ������ ���� ����
SELECT * FROM emp
WHERE deptno IN (SELECT DISTINCT deptno FROM emp);

SELECT * FROM emp
WHERE deptno < ANY(SELECT DISTINCT deptno FROM emp); -- deptno�� 30���� ���� ���� < ANY() �ִ밪

SELECT * FROM emp
WHERE deptno > ANY(SELECT DISTINCT deptno FROM emp); -- 10, 20, 30 --> �ּҰ��� ���� 10���� ū��
-- ANY�� SOME�� ����
SELECT * FROM emp
WHERE deptno < SOME(SELECT DISTINCT deptno FROM emp); -- deptno�� 30���� ���� ���� < ANY() �ִ밪

SELECT * FROM emp
WHERE deptno > SOME(SELECT DISTINCT deptno FROM emp); -- 10, 20, 30 --> �ּҰ��� ���� 10���� ū��
----------------
SELECT * FROM emp
WHERE deptno < (SELECT MAX(deptno) FROM emp); -- deptno�� 30���� ���� ���� < ANY() �ִ밪

SELECT * FROM emp
WHERE deptno > (SELECT MIN(deptno) FROM emp); -- 10, 20, 30 --> �ּҰ��� ���� 10���� ū��
---------------- ALL - ANY�� �ݴ�
SELECT * FROM emp
WHERE deptno <= ALL(SELECT DISTINCT deptno FROM emp); -- 10,20,30 �ּҰ��� ����

SELECT * FROM emp
WHERE deptno >= ALL(SELECT DISTINCT deptno FROM emp); -- 10, 20, 30 �ִ밪�� ���� 
/*
     > ANY(10, 20, 30) ==> 10
     < ANY(10, 20, 30) ==> 30
     
     > ALL(10, 20, 30) ==> 30
     < ALL(10, 20, 30) ==> 10  ==> ANY() = SOME()
     --------------------------------------------- MIN, MAX�� ���󵵰� ����
*/

/*
     = ��Į�� �������� => ���� ��ſ� ����� ����  ==>  �÷���� ���
     = �ζ��κ� => rownum (ROW�� ��ȣ)  ===> ���̺� ��� ���
                  ------------------- ������ ������
                  ------------------- ����/����
*/
/*
    for(=> emp) {
        for(=> dept) {
            if(emp.deptno == dept.deptno)
            => ���
        }
    }
        
*/
SELECT ename, job, hiredate, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno;
-- ��Į�� �������� ==> �ݵ�� �Ѱ� �÷��� ������ �´�
SELECT ename, job, hiredate,
       (SELECT dname FROM dept WHERE deptno = emp.deptno) dname,
       (SELECT loc FROM dept WHERE deptno = emp.deptno) loc
FROM emp;

-- �ζ��κ� ==> TOP-N
-- ������ : FROM �������� ����� SELECT������ �÷��� ����� ����
SELECT ename, job, hiredate, sal, deptno
FROM (SELECT * FROM emp); -- ������ �پ��

-- �޿��� ���� ��� 5���� ���� -- �α�Խù�, �α� ���, �α� ��ǰ, �α� ���� => 5~10
-- table�� rownum�� ����
-- �ζ��κ並 �̿��ؼ� rownum�� ���� ==> Top-N
SELECT ename, sal, rownum 
FROM (SELECT ename, sal FROM emp ORDER BY sal DESC)
WHERE rownum <= 5;

/*
    �������� : DML��ü, DDL���� ����� ���� ==> ������ �ִ� ���̺� ����
    ------- ���� ��� ���, ���̺� ��� ���, �����͸� ���ϴ� ������ŭ ����
    INSERT, UPDATE, DELETE
    CREATE TABLE ...
    
    �������� SQL������ 1���� �����ؼ� ���
    = ������ ���������� ���� ������ �ȴ� => ������� ���� ������ �����ؼ� ������ �ȴ�
      ------------------------ (�������� - ��ȣ�ȿ� ���)
*/
DESC dept;
DESC emp;

SELECT * FROM salgrade;