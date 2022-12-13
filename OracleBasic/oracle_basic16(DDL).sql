-- DML
/*
       DQL : SELECT (������ �˻�)
             SELECT �÷���, (SELECT~) => ��Į�� ��������
             FROM table_name | (SELECT~) => �ζ��� ��
             WHERE �÷��� ������ (SELECT~) => �������� (����, ����) ==> ROW����
       DDL : ���� ���(table, view, index..) ==> �÷�����
             CREATE
                table����
                CREATE TABLE table_name
                CREATE VIEW view_name
                CREATE INDEX index_name
                CREATE SEQUENCE seq_name
                CREATE FUNCTION func_name
                CREATE PROCEDURE pro_name
                CREATE TRIGGER trigger_name
             ALTER : ����
                     ADD : �߰�
                     MODIFY : ����
                     DROP COLUMN : ����
                     RENAME COLUMN : �̸�����
             DROP : ���� ����
             TRUNCATE : ������ �߶󳻱� (���̺��� ���� => �����͸� ����)
             RENAME : ���̺� �̸� ����
        ������ ���� (DML) ==> ROW ����
            ������ �߰� : INSERT
            ������ ���� : UPDATE
            ������ ���� : DELETE
*/
SELECT * FROM emp;

/*     
      ���� ���� ====> �� ���� ====> ���� ����
      -------        --------       --------
      ������ ����     �������� ���    �޸� ũ��
      
      �Ǹ���ǥ
      ----------------------------------------------------------------------
      �÷���           ��ǥ��ȣ        �Ǹ�����        ����         �Ѿ�
      ----------------------------------------------------------------------
      ��������          PK              NN            NN            CK
                                     DEFAULT
      ----------------------------------------------------------------------
      �������̺�
      ----------------------------------------------------------------------
      �����÷�
      ----------------------------------------------------------------------
      üũ                                                          > 0
      ----------------------------------------------------------------------
      ��������        VARCHAR2         DATE         VARCHAR2      NUMBER --> NUMBER(8, 2)
      ----------------------------------------------------------------------
      ũ��              13                            34      
      ----------------------------------------------------------------------
      
      ���̺� �����
      CREATE TABLE �Ǹ���ǥ (
            ��ǥ��ȣ VARCHAR2(13),
            �Ǹ����� DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL,
            ���� VARCHAR2(34) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL,
            �Ѿ� NUMBER,
            CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
            CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0)
      );
      ALTER TABLE �Ǹ���ǥ MODIFY �Ǹ����� DEFAULT SYSDATE;
      
      ��ǰ
      ----------------------------------------------------------------------
      �÷���           ��ǰ��ȣ        ��ǰ��        ��ǰ�ܰ�         
      ----------------------------------------------------------------------
      ��������          PK              NN            CK          
                                     DEFAULT
      ----------------------------------------------------------------------
      �������̺�
      ----------------------------------------------------------------------
      �����÷�
      ----------------------------------------------------------------------
      üũ                                                      
      ----------------------------------------------------------------------
      ��������        VARCHAR2        VARCHAR2      NUMBER --> NUMBER(8, 2)
      ----------------------------------------------------------------------
      ũ��              13             100   
      ----------------------------------------------------------------------
      
      CREATE TABLE ��ǰ (
          ��ǰ��ȣ VARCHAR2(13),
          ��ǰ�� VARCHAR2(100) CONSTRAINT ��ǰ_��ǰ��_nn NOT NULL,
          ��ǰ�ܰ� NUMBER,
          CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ),
          CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ� > 0)
      );
      
      ��ǥ��
      ----------------------------------------------------------------------
      �÷���           ��ǥ��ȣ        ��ǰ��ȣ        ����        �ܰ�       �ݾ�         
      ----------------------------------------------------------------------
      ��������          PK/FK           FK            NN         NN        CK        
      ----------------------------------------------------------------------
      �������̺�        �Ǹ���ǥ         ��ǰ
      ----------------------------------------------------------------------
      �����÷�         ��ǥ��ȣ        ��ǰ��ȣ
      ----------------------------------------------------------------------
      üũ                                                                 > 0
      ----------------------------------------------------------------------
      ��������        VARCHAR2        VARCHAR2      NUMBER     NUMBER    NUMBER
      ----------------------------------------------------------------------
      ũ��              13             100   
      ----------------------------------------------------------------------
      
      CREATE TABLE ��ǥ�� (
            ��ǥ��ȣ VARCHAR2(13),
            ��ǰ��ȣ VARCHAR2(100),
            ���� NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL,
            �ܰ� NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL,
            �ݾ� NUMBER,
            CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
            CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0),
            CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
            REFERENCES �Ǹ���ǥ(��ǥ��ȣ),
            CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
            REFERENCES ��ǰ(��ǰ��ȣ)
      );
      
      -- ���̺�_�÷�_
      -- ��� ���̺���� �빮�ڷ� ������ �Ǿ� �ִ�
      
*/
-- ���̺��� �������� Ȯ��
SELECT * FROM user_constraints
WHERE table_name = 'SEOUL_LOCATION';
/*
    CONSTRAINT Type
    C : CHECK, NOT NULL
    P : PRIMARY KEY
    R : FOREIGN KEY
    U : UNIQUE
*/
/*
CREATE TABLE �Ǹ���ǥ (
            ��ǥ��ȣ VARCHAR2(13),
            �Ǹ����� DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL,
            ���� VARCHAR2(34) CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL,
            �Ѿ� NUMBER,
            CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
            CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0)
      );
CREATE TABLE ��ǰ (
          ��ǰ��ȣ VARCHAR2(13),
          ��ǰ�� VARCHAR2(100) CONSTRAINT ��ǰ_��ǰ��_nn NOT NULL,
          ��ǰ�ܰ� NUMBER,
          CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ),
          CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ� > 0)
      );
      
CREATE TABLE ��ǥ�� (
            ��ǥ��ȣ VARCHAR2(13),
            ��ǰ��ȣ VARCHAR2(100),
            ���� NUMBER CONSTRAINT ��ǥ��_����_nn NOT NULL,
            �ܰ� NUMBER CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL,
            �ݾ� NUMBER,
            CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ),
            CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ�>0),
            CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
            REFERENCES �Ǹ���ǥ(��ǥ��ȣ),
            CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
            REFERENCES ��ǰ(��ǰ��ȣ)
      );
      
      �������� ���� 
      -----------
        NOT NULL => MODIFY
        ALTER TABLE table_name MODIFY column_name CONSTRAINT cons_name NOT NULL
        CHECK, FOREIGN, PRIMARY, UNIQUE => ADD
        ALTER TABLE table_name ADD CONSTRAINT cons_name CHECK ~
        
*/
DROP TABLE �Ǹ���ǥ;
DROP TABLE ��ǰ;
DROP TABLE ��ǥ��; -- fk�ִ� ���̺��� ���� �����ؾ��Ѵ� // ���鶩 �ݴ��
 CREATE TABLE �Ǹ���ǥ (
            ��ǥ��ȣ VARCHAR2(13), -- PRIMARY KEY
            �Ǹ����� DATE,         -- NOT NULL
            ���� VARCHAR2(34),   -- NOT NULL
            �Ѿ� NUMBER            -- CHECK
      );
      ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ); -- primary key����
      ALTER TABLE �Ǹ���ǥ MODIFY �Ǹ����� DATE CONSTRAINT �Ǹ���ǥ_�Ǹ�����_nn NOT NULL;
      ALTER TABLE �Ǹ���ǥ MODIFY ���� CONSTRAINT �Ǹ���ǥ_����_nn NOT NULL;
      ALTER TABLE �Ǹ���ǥ ADD CONSTRAINT �Ǹ���ǥ_�Ѿ�_ck CHECK(�Ѿ�>0);
      ALTER TABLE �Ǹ���ǥ MODIFY ���� VARCHAR(34);
      
 CREATE TABLE ��ǰ (
          ��ǰ��ȣ VARCHAR2(13), -- pk
          ��ǰ�� VARCHAR2(100), -- uk
          ��ǰ�ܰ� NUMBER -- ck
      );
      ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ��ȣ_pk PRIMARY KEY(��ǰ��ȣ);
      ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ��_uk UNIQUE(��ǰ��);
      ALTER TABLE ��ǰ ADD CONSTRAINT ��ǰ_��ǰ�ܰ�_ck CHECK(��ǰ�ܰ� > 0);
      -- CHECK(dname IN('���ߺ�', '������', '�����', '�ѹ���', '��ȹ��')) ������ ���ö�
      -- CHECK(isLogin IN ('y', 'n')) 
      
CREATE TABLE ��ǥ�� (
            ��ǥ��ȣ VARCHAR2(13), -- PK, FK
            ��ǰ��ȣ VARCHAR2(100), -- FK
            ���� NUMBER,  -- NN
            �ܰ� NUMBER,  -- NN
            �ݾ� NUMBER   -- CK
      );
      ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_��ǥ��ȣ_pk PRIMARY KEY(��ǥ��ȣ);
      ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_��ǥ��ȣ_fk FOREIGN KEY(��ǥ��ȣ)
      REFERENCES �Ǹ���ǥ(��ǥ��ȣ);
      -- ��ǰ (��ǰ��ȣ ���� ==>) ��ǰ��ȣ�� ���� ����� �� �ִ�
      ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_��ǰ��ȣ_fk FOREIGN KEY(��ǰ��ȣ)
      REFERENCES ��ǰ(��ǰ��ȣ);
      
      ALTER TABLE ��ǥ�� MODIFY ���� CONSTRAINT ��ǥ��_����_nn NOT NULL;
      ALTER TABLE ��ǥ�� MODIFY �ܰ� CONSTRAINT ��ǥ��_�ܰ�_nn NOT NULL;
      ALTER TABLE ��ǥ�� ADD CONSTRAINT ��ǥ��_�ݾ�_ck CHECK(�ݾ� > 0);
      
/*
     ALTER : ���̺� ����
       �÷� �߰�
       �÷� ����
       �÷� ����
       �÷� �̸� ����
       �÷� �������� ����
       
     �����͸� ���� : TRUNCATE
       ����
            TRUNCATE TABLE table_name; => ���̺��� ������ ���� �ִ�
     ���̺� ���� : DROP
            DROP TABLE table_name; => ���̺��� �������� ����
     ���̺� �̸����� : RENAME
            RENAME old_name TO new_name;
            ALTER TABLE table�� RENAME A To B
*/
DROP TABLE student;
CREATE TABLE student (
    hakbun NUMBER,
    name VARCHAR2(34) CONSTRAINT std_name_nn NOT NULL,
    CONSTRAINT std_hakbun_pk PRIMARY KEY(hakbun)
);
-- �÷� �߰�
ALTER TABLE student ADD kor NUMBER DEFAULT 0;
ALTER TABLE student ADD eng NUMBER DEFAULT 0;
ALTER TABLE student ADD math NUMBER DEFAULT 0;
ALTER TABLE student ADD avg NUMBER NOT NULL;

-- �÷� ����
ALTER TABLE student MODIFY avg NUMBER(5, 2);
ALTER TABLE student MODIFY kor NUMBER(3);
ALTER TABLE student MODIFY eng NUMBER(3);
ALTER TABLE student MODIFY math NUMBER(3);
DESC student;

-- �÷� ����
ALTER TABLE student DROP COLUMN avg;

-- �÷��� ����
ALTER TABLE student RENAME COLUMN hakbun TO hak;

DROP TABLE ��ǥ��;
DROP TABLE ��ǰ;
DROP TABLE �Ǹ���ǥ;