-- 2022-12-09 SELECT���� ���� ==> DDL (�����ͺ��̽� ����) => �� ���� (vuerd)
/*
        => ����
            1) SQL���� ���� => �ڹٷ� ���� (SQL����, �ڹٿ��� SQL����) => �����α׷��� (�ڹ�)
            2) ���α׷� => �ݺ� => ��������
            3) �Խ���
    
*/
/*
        ���̺� (�����̼�)
            = �����͸� �����ϴ� ���� (������ ����)
            = ������ ���� (ROW, COLUMN) => ��, ��
            = ���� �����ͺ��̽�(����)���� ���̺�� 1���� ����� ����
            ---------------------- XE (default) => Create Database
             ~~ FROM table��
             --------------------------------------
               ID    SEX   NAME   Password   Address   ====> ���� (Column)
             --------------------------------------
                -     -     -        -         -   ==>  ����� �� ROW(RECORD) => �ڹٿ��� �������б� - RECORD ����
                -     -     -        -         -
             --------------------------------------
             ==> ���� �б�, ��ü, �ʿ��� �÷��� ... ==> ��ɹ� : SELECT (���ڿ� ���� => ������ �˻�)
             ==> �׷����� ��� ����, ���ǿ� �´� �����͸� ... �ٸ� ���̺�� ������ ����
                 GROUP BY           WHERE                   JOIN / SUBQUERY ...
             ==> ������ ���� (������) => ����
                 -------------------------- ����� ��û�� ���� ������ ����
                 => ����ڴ� �˻��� ==> �����α׷��� (�˻���� SQL���� ==> ������ ����)
                 => ����� => ��û�� ���� ���� => �䱸���� �м�
                                                   |
                                               �����ͺ��̽� ����
                                                   |
                                               �����͸� ���� (������ ����) - ��Ű��ó
                                                   |
                                                ȭ�� UI - �ۺ���
                                                   |
                                                  ���� - �����α׷���
                                                   |
                                                 �׽��� - �׽���
                                                   |
                                                  ���� (��ǥ) - �����α׷���
*/
/*
        �����͸� �˻� (����) => SELECT => �� ����Ʈ�� �⺻ �����ִ� ���� (75~80% SELECT)
                 ����Ʈ : user / admin
                         ----   ----- �ణ ÷�� (��������, ����, �̺�Ʈ, ���� üũ)
        ���� ����)
                 1. ������ ����
                    SELECT * | �ʿ��� ������ �÷� ����
                    FROM table_name
                 2. ����
                    WHERE ���ǹ� (�÷���|�Լ���) ������ ��
                                ---------------------- true�϶� ����
                 3. �׷�
                    GROUP BY (�÷���|�Լ�)
                             ----------- ���� ���� ������ �ִ� �� ��� (���� ó��) ==> ����߽�(Admin)
                                         => �б⺰ ��� (����������)
                 4. �׷쿡 ���� ���� => GROUP BY�� �ִ� ��츸 ����� ����
                    HAVING �׷����� (�����Լ��� ����ؼ� ������ �����)
                                    ------- AVG, SUM, MAX, MIN, COUNT
                 5. ���� => ������ �����Ͱ� ���� ��� (���� ��� : **INDEX = ����ȭ)
                 -----------------
                    ORDER BY �÷���|�Լ��� ASC|DESC
                                         ---
                                        �ø� / ���� ==> �ֽ� ���
                 6. JOIN
                 7. SQL�� ������ ����
*/
-- 1. ������ ���� : => ����ڿ��� �����ִ� ���� (���/��)
-- 1-1 => ���̺� : DESC table (���̺� ������� Ȯ��) ** ������ �ʼ�!
-- SEOUL_LOCATION
DESC SEOUL_LOCATION;
/*
    NO      NOT NULL NUMBER         
    TITLE   NOT NULL VARCHAR2(200)  
    POSTER  NOT NULL VARCHAR2(500)  
    MSG     NOT NULL VARCHAR2(4000) 
    ADDRESS NOT NULL VARCHAR2(300)  
    HIT              NUMBER
*/
-- ��� => ��� (�̹���, ����, ����)
SELECT poster, title, msg
FROM seoul_location;
-- �󼼺���
SELECT * FROM seoul_location;
-- **�α� ���� ==> 5�� => rownum (���� ����)
SELECT title, hit, rownum
FROM (SELECT title, hit FROM seoul_location ORDER BY hit DESC)
WHERE rownum <= 5;
-- �α� �Խù�, �α� ���, �α� �̺�Ʈ, �α� ��ȭ // ==> rownum, subquery�� �̿��ؼ� ������ ���� (�ζ��κ�)
-- ���� : Top-N (1~�)���� => �߰����� �ڸ��°� �ȵȴ�
-- SubQuery�� 2�� �̿� ==> ����¡ ���
-- �Ѱ��� ���� ������
SELECT *
FROM seoul_location
WHERE no = 1;
/*
        SELECT * | column_list
        ==> Option
            = �ߺ��� ���� ������ ��� ==> DISTINCT �÷���
                                       --------
            = ���ڿ� ���� => �÷��� || �÷���
            
            = ��Ī : �Լ��̿�, ��������
                    NVL(comm, 0) comm, (SELECT ~~~) dname
                    => ���� �ִ� ��� ��) dept name -> ���� -> "dept name"�� �ۼ�
            -------------------------------------- MyBatis / JPA => ��Ī�� ����ؾ� �����͸� ���� �� �ִ�
            FROM table_name | view_name | (SELECT ~~)
            WHERE �÷���|�Լ��� ������ �� ==> �������� (������ : �׳� ���, ��¥, ���� => '')
                        ----- -----
            => ������
                ��������� : WHERE���� ������� �ʴ´� (if => true/false)
                            '10' => �ڵ� ����ȯ
                            TO_NUMBER('10') => 10
                            --------------- ������� ���� �� �ִ� : ���� (TO_NUMBER�� �̿��ض� : �ӵ�����)
                            *** SQL�� �ӵ� => �����ս�
                            *** ����/���� = �Ǽ�
                -----------------------------------------------------
                �񱳿����� : = , <> , != , ^=
                �������� : AND (���� ����) , OR
                           --------------   ---
                           BETWEEN           IN
                NOT : !(�ڹ�) => NOT
                      WHERE !(no >= 1 AND no <= 10) => ����
                      WHERE NOT(no >= 1 AND no <= 10) => ���� ����
                IN : OR�� ������ ���
                     WHERE �÷��� IN(��....) => ���� ���
                     CHECK(sex IN('����', '����')) ==> ���� => ���������� ����
                NULL : ���� �������� �ʴ� �� ==> 1. ����ó���� �ȵȴ�, 2. ���������� null ==> ��ü (NVL())
                       IS NULL (null�� ���), IS NOT NULL(null�� �ƴ� ���)
                       => �ڹٿ��� NullPointerException �߻�
                BETWEEN : ī�װ�, ���ϴ� �����ȿ��� ������ ����
                        WHERE �÷��� BETWEEN �� AND ��
                                            -- ����, ��¥, ����  ===> ������������
                LIKE : �˻��ÿ� �ַ� ��� : �Խ���, ��ȭ, ���� ... , REGEXP_LIKE
                       % : ���ڿ��� ������ �������
                           A% : A�� ����
                           %A : A�� ��
                           %A% : A���� ==> ���� ���� ����
                                 SQL�����߿� �ڹٿ��� SQL �ٸ���
                                 => WHERE �÷��� LIKE '%A%'
                                    =>          LIKE '%' || �� || '%'
                                    =>          LIKE CONCAT('%', ��, '%') => MYSQL, MariaDB
                       _ : ���� �Ѱ�
                           _A                       
                --------------------------------------------- WHERE���忡�� ���Ǵ� ������
                �Լ�
                  = ���� ���� (String)
                    = LENGTH() : ���� ���� => LENGTH('ABC') => 3 ==> *** function / procedure
                                                                    => ������   �������� ���� �Լ� (***)
                                                                    CREATE FUNCTION RETURN NUMBER, CREATE PROCEDURE => PL / SQL
                    = SUBSTR() : ���ڸ� �ڸ��� => SUBSTR(���ڿ�, ������ġ, ����)
                                                SUBSTR('22/12/09', 4, 2) ==> 12
                                                ** ������ġ => 1
                    = INSTR() : ������ ��ġ Ȯ�� ==> INSTR(���ڿ�, ã�� ���ڿ�, ������ġ, ���°�ִ°���)
                                                INSTR('Hello Oracle', 'e', 1, 2) -> 12
                    = REPLACE() : ���ڳ� ���ڿ� ���� ==> REPLACE(���ڿ�, old, new)
                                                       REPLACE('Hello', 'l', 'k') ==> Hekko
                                                       => ������ &�� ^�� �ٲ�� |�� $�� �ٲ��
                                                         - &�� |�� ����Ŭ���� ����ϴ� ��ȣ�� ������ �޾ƿö� ��������
                    = RPAD() => �ٸ� ���ڿ��� ����Ҷ� => RPAD(���ڿ�, ���ڰ���, ����ҹ���)
                                RPAD('Oracle', 10, '*') ==> Oracle**** (����� 10���� ����)
                  = ���� ���� (Math)
                    = MOD() => ������ ==> �ڹٿ��� ó�� %
                    = ROUND() => �ݿø�
                    = CEIL() => �ø�
                  = ��¥ ���� (Date,Calendar)
                    = SYSDATE : �ý��� ��¥
                    = MONTH_BETWEEN : ������
                  = ��ȯ ���� (Format) ==> JSTL (��½� ǥ��������� �׻� ��ȯ�� �ʿ�)
                    = TO_CHAR
                        => YYYY,MM,DD,HH24,MI,SS,DY,day
                        => 999,999
                  = ��Ÿ
                     = NVL() => NULL�� ��ü
                  = GROUP BY , ORDER BY
                    => �׷캰�� ��� �׷캰�� ó��
                        GROUP BY �÷���|�Լ� ==> ���� ���� ������ �ִ� �ͳ��� ��� ó�� => ���
                        => ���� : HAVING
                  = SUBQUERY : SQL���� ������ ��� �ѹ� ����
                               MainQuery = (SubQuery)
                                               1
                                         �����
                                   2
                               => WHERE : ������ �������� (�÷� 1��, ����� 1��)
                                          ������ �������� (�÷� 1��, ����� ������)
                                            ����� ��ü ���� : IN
                                            �ִ밪 , �ּҰ� : ANY, ALL, SOME
                                            < ANY, SOME
                                              ANY(10, 20, 30) ==> 30
                                            > ANY, SOME
                                              ANY(10, 20, 30) ==> 10
                                            < ALL
                                              ALL(10, 20, 30) ==> 10
                                            > ALL
                                              ALL(10, 20, 30) ==> 30
                               ------------------------
                               => �÷� : ��Į�� ��������
                                  SELECT �÷���, (SELECT~~) ==> ������� 1���� ���;� �Ѵ�
                                  FROM table_name
                               => ���̺� : �ζ��κ�
                                  SELECT �÷��� ...
                                  FROM (SELECT ~)
                               ------------------------ �ٽ�
                  = JOIN
                    INNER JOIN
                      = Oracle JOIN
                        SELECT A.column, B.column
                        FROM A, B
                        WHERE A.column = B.column
                        
                        -- �÷��� 3��
                        SELECT A.column, B.column, C.column ==> ���̺�� ����, ��Ī���� ���� => �÷��� �ٸ� ���� �������� �ʾƵ� �ȴ�
                        FROM A, B, C
                        WHERE A.column = B.column
                        AND A.column = C.column;
                        ---
                        
                      = ANSI JOIN
                        SELECT A.column, B.column
                        FROM A JOIN B
                        ON A.column = B.column
                        
                        --�÷��� 3����
                        SELECT A.column, B.column
                        FROM A JOIN B
                        ON A.column = B.column
                        JOIN C
                        ------
                        ON A.column = C.column;
                    OUTER JOIN
                      = LEFT OUTER JOIN
                        = Oracle JOIN
                          SELECT A.column, B.column
                          FROM A, B
                          WHERE A.column = B.column(+)
                          
                        = ANSI JOIN
                          SELECT A.column, B.column
                          FROM A LEFT OUTER JOIN B
                                ---------------- ������ �Ұ���
                          WHERE A.column = B.column
                      = RIGHT OUTER JOIN
                        = Oracle JOIN
                          SELECT A.column, B.column
                          FROM A, B
                          WHERE A.column(+) = B.column
                          
                        = ANSI JOIN
                          SELECT A.column, B.column
                          FROM A RIGHT OUTER JOIN B
                                ---------------- ������ �Ұ���
                          WHERE A.column = B.column
                  
*/
SELECT deptno, ROUND(AVG(sal)), COUNT(*)
FROM emp
GROUP BY ROLLUP(deptno)
ORDER BY deptno;