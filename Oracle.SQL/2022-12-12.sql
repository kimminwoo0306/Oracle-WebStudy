 -- 179 page ������ ���� ���(DDL)
 /*
    DQL 
       SELECT
    DML
       INSERT, UPDATE, DELETE
    DDL
       CREATE, ALTER, DROP, TRUNCATE
    DCL
       GRANT, REVOKE
    TCL
       COMMIT, ROLLBACK
       
  -----------------------------------------------
    DDL : ���� (Table : ������ ���� ���)
        View : ���� ���̺�
        Index : �˻� �ӵ� ��� (����ȭ)
        Sequence : �ڵ� ������ȣ => �ߺ��� ���� ������ ==> MAX()+1
        PL/SQL => Function, Procedure, Trigger
    Table : ���̺� ���� ��� �����
            1. ��������
               ������
                 CHAR(1~2000byte)
                   => ���� ����Ʈ (���ڼ��� ���� => ����/����, y/n, y/n)
                   => CHAR(10) -> �޸� ���������� ����
                       ==> ���� ������ 'A'
                       ==> -------------
                            A \0 \0...
                           -------------
                 VARCHAR2(1~4000byte) **default (����Ŭ������ ����� ����)
                   => ���� ����Ʈ -> �ణ ũ�� ��Ƶ� ����
                   => VARCHAR2(10) -> �޸� ���������� ����
                     -> ���� ������ 'A'
                     => 1byte�� �޸� �Ҵ�
                 CLOB(4GB) : ���� ����Ʈ => ���ڿ��� ���� => �ٰŸ�, �ڱ�Ұ�..
                 -------------------------------------------String
               ������
               NUMBER(38) => int, long
               NUMBER(4)  => ������ �� �ִ� ������ => 0~9999
               NUMBER -> 8�ڸ����� ����(default) =>(NUMBER8,2)
               NUMBER(7,2) => 7�ڸ� ������ ����, �Ҽ��� 2�ڸ��� ����� �� �ִ�
                                              ----------- ����5, �Ҽ��� 2
                            ������ �Ǽ��� �����ϴ� ���� �ƴ�, ������ ���� ����
                    => ����� ������ => �Ǽ�,  ����
                                    double  int
               ��¥��
               DATE : default
               TIMESTAMP : ��� ��� ...
               ��Ÿ�� -> ������, �̹���(�ΰ�), ������� ...
               => BLOB(2�� ����), BFILE(file�������� ����) => ������ ���� �� => ������ �о ���
               => HTML�� ��ũ (����)�� �̿��Ͽ� ������ ����
            1-1. 
                ���̺��(�ĺ���)
                  1) ���� �����ͺ��̽� (XE)���� ���� �̸��� ���̺��� ���� �� ����
                  2) ���ڷ� �����Ѵ� (���ĺ�, �ѱ�) -> ��������� ���ĺ�
                      => �ü������ �ѱ� �д� ����� �޶� ������ ���� (AWS -> ȣ����)
                      => ���ĺ� ���� ��ҹ��� ������ ����
                      => ** ���� ����Ŭ�� ����� �� �빮�ڷ� ������ �ȴ� (���� ���̺��� ������ ���� ��)
                        WHERE table_name='emp' -> ����
                        WHERE table_name='EMP' -> ����
                  3) ���̺�� (30) -> 15�������� ���� : ���̺�� �÷����� ���� �� �� �ִ�
                  4) ���ڴ� ����� �� �ִ� (�� �տ� ��� �Ұ�)
                  5) Ű����� ��� �� �� ���� (SELECT, INSERT...)
                  6) Ư������ ��� ���� ( _ )
                  
            2. �������� : �̻������� ����(���α׷��� �ʿ��� �����͸� ����)
                        ------------- ����, ���� => ������ �ʴµ����Ͱ� ����, ���� �� ���� �ִ�
                        ��)
                           id name sex
                           aaa hong man
                           aaa shim woman
                           -------------- DELETE FROM member WHERE id='aaa'
                    1) NOT NULL : NULL�� ������� �ʴ´� (������ �����Ͱ��� �ʿ�� �Ѵ�)
                          * �ʼ� �Է�
                    2) UNIQUE : ���ϰ� (�ߺ��� ���� ������ => NULL���� ���)
                          * �ĺ�Ű(��üŰ) => �⺻Ű�� �Ҿ���� ��� => �̸���, ��ȭ��ȣ
                    3) PRIMARY KEY : �⺻Ű => ������, ID => �ߺ��� ���� ��
                          * ��� ���̺��� Primary Key �Ѱ� �̻� ���� => ����
                            NOT NULL, UNIQUE
                            �Խù� ��ȣ, ��ȭ��ȣ ...(ID)
                    4) FOREIGN KEY : �ܷ�Ű(����Ű) => �����ϰ� �ִ� �����Ͱ��� ���� (�ٸ� ���̺� ����)
                       �Խ��� <-> ���
                       ��ȭ <-> ����
                    5) CHECK : ������ ������ ���� �Է��� �����ϰ� �����
                              => �μ���, �ٹ���
                              => �����ڽ�, �޺�
                    6) DEFAULT : �̸� �⺻���� ������ �Ŀ� ==> �����Ͱ��� ���� ��� �ڵ����� ���� �Է�
                                regdate DATE DEFAULT SYSDATE
                                hit NUMBER DEFAULT 0
                    --------------------------------------------------
                    2-1. TABLE �����
                         1) ������ ���̺��� ����(�����Ͱ�_���̺�����)
                             CREATE TABLE table_name
                             AS
                             SELECT ~
                         2) ���̺� ���¸� ����
                             CREATE TABLE table_name
                             AS
                             SELECT ~
                             WHERE 1=2;
                         3) ����� ����(*************)
            
            3. ����, ����, ������ �ڸ���
            
            
 */
CREATE TABLE myEMP
AS
SELECT * FROM emp;

SELECT * FROM myEMP;

CREATE TABLE myEMP2
AS
SELECT * FROM emp
WHERE 100=200;

SELECT * FROM myEMP2;
-- ����
DROP TABLE myEMP;
DROP TABLE myEMP2;

CREATE TABLE myEmp
AS
SELECT Emp.*, dname, loc
FROM emp, dept
WHERE emp.deptno=dept.deptno;

SELECT * FROM myEmp;
DROP TABLE myEmp;
DESC myEmp;

TRUNCATE TABLE myEmp;

/*
     �ʿ���� ������ ���� : DELETE -> ���
     ��ü ������ ���� : TRUNCATE => ��� �Ұ���(������ �� ����)
     ���̺� ��ü ���� : DROP => ��� �Ұ���(�����Ҽ� ����)
     -> DML (��������), DDL(������ �� ����) => ���
*/
DESC myEmp;
-- ���̺� �� ���� => RENAME old_name TO new_name
RENAME myEmp To myEmp2;

/*
         ����� ���� ���̺�
         ---------------
         ����)
             CREATE TABLE table_name(
                �÷��� �������� [��������], --> �÷����� (�÷��� ���ÿ� ����) -> NOT NULL, DEFAULT
                �÷��� �������� [��������],
                �÷��� �������� [��������],
                �÷��� �������� [��������],
                �÷��� �������� [��������],
                [��������] -> ���̺� ���� => ���̺��� ������� ������ ���� -> PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE
             );
             => ���
                CREATE TABLE member
                (
                   id VARCHAR2(20) PRIMARY KEY,
                   pwd VARCHAR2(10) NOT NULL;
                   name VARCHAR2(34) NOT NULL;
                   sex CHAR(10) CHECK(sex IN('����', '����')),
                   email VARCHAR2(100) UNIQUE,
                   tel VARCHAR2(13) UNIQUE,
                   regdate DATE DEFAULT SYSDATE
                );
             => �������ǿ� �̸� �ο� ==> ���� (�������Ǹ� ����, ����)
            CREATE TABLE member
            (
                id VARCHAR2(20),
                pwd VARCHAR2(10) CONSTRAINT member_pwd_nn NOT NULL,
                                           -------------- �ߺ��� ������� �ʴ´�
                                           ���̺��_�÷���_�������� ����
                                           --> pk (PRIMARY KEY)
                                           --> nn (NOT NULL)
                                           --> fk (FOREIGN KEY)
                                           --> ck (CHECK)
                                           --> uk (UNIQUE)
                name VARCHAR2(34) CONSTRAINT member_name_nn NOT NULL,
                sex CHAR(10),
                email VARCHAR2(100),
                tel VARCHAR2(13),
                regdate DATE DEFAULT SYSDATE,
                CONSTRAINT member_id_pk PRIMARY KEY(id)
                CONSTRAINT member_sex_ck CHECK(sex IN('����','����'))
                CONSTRAINT member_et_uk UNIQUE(email, tel)
                
            )
            
            emp
            
          EMPNO    NOT NULL NUMBER(4)    
          ENAME             VARCHAR2(10) 
          JOB               VARCHAR2(9)  
          MGR               NUMBER(4)    
          HIREDATE          DATE         
          SAL               NUMBER(7,2)  
          COMM              NUMBER(7,2)  
          DEPTNO            NUMBER(2) 
          
          dept
          DEPTNO NOT NULL NUMBER       
          DNAME           VARCHAR2(20) 
          LOC             VARCHAR2(20) 
          
          CREATE TABLE dept(
            deptno NUMBER(2),
            dname VARCHAR2(20) CONSTRAINT dept_dname_nn NOT NULL,
            loc VARCHAR2(20) CONSTRAINT dept_loc_nn NOT NULL,
            CONSTRAINT dept_deptno_pk PRIMARY KEY(deptno)
          );
          
          CREATE TABLE emp(
            empno NUMBER(4),
            ENAME VARCHAR2(10) CONSTRAINT emp_ename_nn NOT NULL,
            JOB VARCHAR2(9) CONSTRAINT emp_job_nn NOT NULL,  
            MGR NUMBER(4),    
            HIREDATE DATE DEFAULT SYSDATE,    
            SAL NUMBER(7,2) CONSTRAINT emp_sal_nn NOT NULL,
            COMM NUMBER(7,2)  
            DEPTNO NUMBER(2),
            CONSTRAINT emp_empno_pk PRIMARY KEY(empno),
            CONSTRAINT emp_deptno_fk FOREIGN KEY(deptno)
            REFERENCES dept(deptno)
          );
          
          
*/
DESC emp;
DESC dept;
SELECT * FROM emp;

/*
     �Խ��� / ��� ==> �� ����
     ----------------------
     �����ϴ� ���̺�
     �����Ǵ� ���̺� (�켱���� ����)
     
     ����
     �Խù���ȣ => �ߺ��� �ȵǴ� ������ PK => �ڵ� ���� (������) => MAX -> NUMBER(8)
     �̸� -> NOT NULL VARCHAR2
     ���� -> NOT NULL VARCHAR2
     ���� -> NOT NULL CLOB
     ��й�ȣ -> ����/���� �� ���� Ȯ�� ==> NOT NULL
     **����� -> DEFAULT SYSDATE
     **��ȸ�� -> DEFAULT 0
     ---------------------------------------------------------------
     �÷���      no   name   subject   content   pwd   regdate   hit
     ---------------------------------------------------------------
Ű����(��������)   pk    nn      nn        nn      nn    DEFAULT   DEFAULT
     ---------------------------------------------------------------
     �������̺�
     ---------------------------------------------------------------
     ���� �÷�
     ---------------------------------------------------------------
     üũ�Ӽ�
     ---------------------------------------------------------------
     ��������   NUMBER VARCHAR2 VARCHAR2 CLOB VARCHAR2   DATE    NUMBER
     ---------------------------------------------------------------
     ũ��         8      34      4000           10                 8
     ---------------------------------------------------------------
*/
DROP TABLE board;
CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(34) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(4) CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    address VARCHAR2(100),
    CONSTRAINT board_no_pk PRIMARY KEY(no)
);

-- ALTER -> �÷��� ����, �÷��� ����, �÷� �߰�, �������� ����
-- ���̺� => �����Ͱ� �ִ� ��� ALTER ���
/*
   ALTER
     �߰� : ADD
     ���� : DROP COLUMN
     ���� : MODIFY
*/
-- hit �߰�
ALTER TABLE board ADD hit NUMBER DEFAULT 0;
DESC board;
-- subject���ڼ� ����
ALTER TABLE board MODIFY subject VARCHAR2(4000);
DESC board;
-- address ����
ALTER TABLE board DROP COLUMN address;
DESC board;
ALTER TABLE board ADD address VARCHAR(100) CONSTRAINT board_address_nn NOT NULL;
-- �÷��� ����
ALTER TABLE board RENAME COLUMN address To Email;
-- ���������� �߰��ϴ� ��쿡 => �����Ͱ� ���� ��쿡�� ������ ����
--                          �����Ͱ� �ִ� ��� : NOT NULL, PRIMARY KEY, FOREIGN KEY, CHECK

SELECT * FROM tab;
DROP TABLE member;
/*
    member
    id  ==> PK
    pwd ==> NN
    sex ==> CHECK
    name ==> NN
    address
    tel
*/
CREATE TABLE member(
  id VARCHAR2(20),
  pwd VARCHAR2(10) CONSTRAINT member_pwd_nn NOT NULL,
  sex VARCHAR2(6),
  name VARCHAR2(34) CONSTRAINT member_name_nn NOT NULL,
  CONSTRAINT member_id_pk PRIMARY KEY(id),
  CONSTRAINT member_sex_ck CHECK(sex IN('����','����'))
);

INSERT INTO member VALUES('aaa', '1234', '����', 'ȫ�浿');
INSERT INTO member VALUES('ccc', ' ', '����', 'ȫ�浿');
--'' (NULL), ' '(����)

SELECT * FROM member;
ALTER TABLE member ADD adress VARCHAR2(100) DEFAULT ' ' CONSTRAINT member_address_nn NOT NULL;
-- ���������� �Ѱ��� ����ϴ� ���� �ƴϰ� ������ ����� ����
-- ������ NOT NULL UNIQUE CHECK
DROP TABLE board;
CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(34),
    subject VARCHAR2(4000),
    content CLOB,
    pwd VARCHAR2(10),
    regdate DATE,
    address VARCHAR2(100)
);
-- ALTER�� �̿��ؼ� �������� �߰�
-- PRIMARY KEY �߰�
ALTER TABLE board ADD CONSTRAINT board_no_pk PRIMARY KEY(no);
-- NOT NULL
-- PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE(ADD), NOT NULL(MODIFY)
ALTER TABLE board MODIFY name CONSTRAINT board_name_nn NOT NULL;
ALTER TABLE board MODIFY pwd CONSTRAINT board_pwd_nn NOT NULL;
-- DEFAULT ���������� �ƴϴ�
ALTER TABLE board MODIFY regdate DATE DEFAULT SYSDATE;
--�������� ����
ALTER TABLE board DROP CONSTRAINT board_name_nn;
/*
    name VARCHAR2(10) NOT NULL
    sex VARCHAR2(10) NOT NULL
*/
-- �÷��� ������ ������� -> id, email-- 
-- A a=new A(), A b=new A()
DESC member2;
DROP TABLE member2;
CREATE TABLE member2(
    id VARCHAR2(20),
    name VARCHAR2(30) CONSTRAINT member2_name_nn NOT NULL,
    email VARCHAR2(100),
    pwd VARCHAR2(10) CONSTRAINT member2_pwd_nn NOT NULL,
    CONSTRAINT mem_id_email_pk PRIMARY KEY(id,email)
);

INSERT INTO member2 VALUES ('aaa', 'ȫ�浿', 'hong@naver.com', '1234');
INSERT INTO member2 VALUES ('aaa', '��û��', 'shim@naver.com', '1234');
INSERT INTO member2 VALUES ('aaa', '������', 'park@naver.com', '1234');
INSERT INTO member2 VALUES ('bbb', '�����', 'kim@naver.com', '1234');
-- INSERT �� COMMIT ���� ������ ���� �ȵ�.





