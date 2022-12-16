/*
    DDL =>  ������ ���� ���
           1) ������ ���� ��� : table
           2) ���� ���̺� : ������ ���̺��� �����ؼ�(����) => ��ũ�� ������� �ʴ´� : view
           3) PRIMARY KEY (����) => �ߺ��� ���� ������ ÷�� : sequence
           4) �˻��̳� ������ �ӵ��� ����ȭ : index
           --------------------------------------- �䱸����(�Թ�)
           5) SQL ������ �ݺ� => �Լ�ȭ
                 => �Լ��� ����� ��� : PL/SQL
                 => �������� �ִ� �Լ� : function
                 => �������� ���� �Լ� : procedure
                 => �ڵ�ȭ ó�� : trigger
            ------------------------------------------------����Ʈ ��� ����� �Ѱ��� ����(procedure)
            => ���ڿ��� ��ɹ� => �����ؼ� ���� (table, view, index, sequence => ��ü) -> CREATE (new)
            1) ���� : CREATE / public class
            2) ���� : ALTER / �������� �ٽ� (CTRL+F11)
            3) ���� : DROP / GC (��ü=null)
            4) �̸� ���� : RENAME / class �̸� ���� -> �����丵(������)
            5) ������ �߶󳻱� : TRUNCATE
            -----------------------------------------------------------
            1. CREATE 
               ����)
                    CREATE TABLE table_name(
                      �÷�(�������) �������� [��������]-> NOT NULL|DEFAULT,
                      �÷�(�������) �������� [��������]-> NOT NULL|DEFAULT,
                      �÷�(�������) �������� [��������]-> NOT NULL|DEFAULT,
                      �÷�(�������) �������� [��������]-> NOT NULL|DEFAULT,
                      [��������]-> PRIMARY KEY|FOREIGN KEY|CHECK|UNIQUE,
                      [��������]
                      ...
                    );
                    
                    1) table_name, �÷��� ���� ����(�ĺ���)
                       1. ���ڷ� ���� (���ĺ�,�ѱ�) -> ��ҹ��ڸ� �������� �ʴ´�
                         => �� ����ÿ� ���ĺ��� �빮�� ������ �ȴ� (���̺� �˻��ÿ��� �ݵ�� �빮�ڷ� �Ѵ�)
                           SELECT * FROM user_tables WHERE table_name='emp'; (X)
                           SELECT * FROM user_tables WHERE table_name='EMP'; (O)
                       2. table���� 30byte => 5byte ~ 15byte (���ĺ��� ����(�ѱ��� ������ ����))
                       3. ���� ����� ���� (�տ� ��� �Ұ�, �ڿ� ���)
                       4. Ű����� ����� �� ���� (CREATE, DROP, INSERT, SELECT...)
                       5. Ư������ ����� ���� ( _ ) => �ΰ� �ܾ �ִ� ���
                           genie_music, melon_music, daum_movie, naver_movie
                           seoul_location, seoul_hotel
                    2) ��������
                       ������
                          = CHAR (1~2000byte) : ���� ����Ʈ => ���ڼ��� ������� ������ ������ ũ�⸸ŭ �޸𸮿� ����
                                               => �޸� ���� ����
                                               => ���� ���ڼ��� ���� (����/����, y/n)
                          = VARCHAR2(1~4000byte) : ��������Ʈ => ���ڼ��� ���� �޸� ũ�Ⱑ �޶�����
                            *** ����Ŭ���� �����ϴ� ��������
                          = CLOB : ���� �޸�, ��뷮 ������ ÷�� => 4�Ⱑ
                                   �ٰŸ�, �Ұ�... �޴� ��ü ���, �۾���
                       ������ : NUMBER
                          = �Ǽ� -> NUMBER(5,2)
                          = ���� -> NUMBER(4) , NUMBER(10)
                          = ���� => NUMBER -> NUMBER(8,2) => ������ ������ ����, �Ǽ��� ������ ����
                       ��¥�� : DATE, TIMESTAMP (��� ���)
                         = �Ϲ� ��¥ ���� => DATE
                    3) �������� : �̻�����(����, ����, �߰�) ��������, ����ȭ�� ������ -> ���ϴ� �����͸� �߰��� ����
                      -------- ������ȭ ������ (�ʿ���/���ʿ��� => ȥ�� => �ʿ��� �����͸� ����)
                                             => �ڿ��� ó��, ���, Ȯ�� => AI
                        *** ��� ���α׷��� ������ ����
                                          --------- �޸� / ���� / DBMS(����, ����)
                                          --------- XML(B2B, B2G, G2G -> ����(������)), JSON(RESTFUL)
                        = NOT NULL : �ݵ�� �Է°��� ����
                          => �÷��� �������� CONSTRAINT ���̺��_�÷���_nn NOT NULL (�÷��ڿ� ����)
                          => �÷��� �������� NOT NULL => ���� ��� �� �� ���� ������ -> ���̺��� ����� �����Ŀ� �ٽ� ���̺� ����
                          => ��) ������ ���� -> �����Ͱ� ���� ���
                        = UNIQUE : �ߺ��� ���� �� => NULL���� ��� (��üŰ, �ĺ�Ű) -> email, tel...
                          -> �÷��� �������� CONSTRAINT ���̺��_�÷���_uk UNIQUE
                          -> �÷��� �������� UNIQUE
                        = PRIMARY KEY : �⺻�� (���̺�� 1���̻� ���� ����) => ����, �����ÿ� ������ ���� �����
                                        ȸ�� (���ڿ�:ID) -> ���̵� �ߺ�üũ, ��Ÿ�� -> ����(��ȭ��ȣ, ��۹�ȣ, ����..)
                                        => NOT NULL + UNIQUE
                            => �÷��� �������� CONSTRAINT ���̺��_�÷���_pk PRIMARY KEY
                            => CONSTRAINT ���̺��_�÷���_pk PRIMARY KEY(�÷���)
                            => �÷��� �������� PRIMARY KEY
                        = CHECK : ������ �����Ͱ��� ���� (������ �����͸� ÷��)
                                  ����, �帣, ��������, �μ���, �ٹ��� ...
                            => CONSTRAINT ���̺��_�÷���_ck CHECK(�÷��� IN(��, ��...))
                        = FOREIGN KEY : �ܷ�Ű, ����Ű (�����ϴ� ���̺��� �÷����� ����� ����)
                          JOIN / (PRIMARY KEY <==> FOREIGN KEY)
                          => �����ÿ� ���� �߻� (�������ִ� ���̺� / �����ϴ� ���̺�)
                                                              -------------  1
                                             ---------------2
                          => �Խù� / ��� (��� ����, �Խñ� ����)
                          => CONSTRAINT ���̺��_�÷���_fk FOREIGN KEY(�÷���)
                             REFERENCE ���̺��(�÷���)
                          = DEFAULT : ���� �Է����� ���� ��쿡 �ڵ����� �߰�
                                      => ��¥ : DEFAULT SYSDATE
                                      => ��ȸ�� : hit DEFAULT 0
*/
-- ���̺� ���Ϲ���
-- liked, jjim -> ��ٱ���, ����
-- liked, jjim -> ���̺��� ���� ���� ����
CREATE TABLE genie_music(
    mno NUMBER,    --pk
    cno NUMBER(2) CONSTRAINT gm_cno_nn NOT NULL, --nn
    title VARCHAR2(200) CONSTRAINT gm_title_nn NOT NULL, --nn
    singer VARCHAR2(100) CONSTRAINT gm_singer_nn NOT NULL,--nn
    album VARCHAR2(200) CONSTRAINT gm_album_nn NOT NULL, --nn
    poster VARCHAR2(260) CONSTRAINT gm_poster_nn NOT NULL,--nn
    state VARCHAR2(30),  --ck
    idcrement NUMBER(3) CONSTRAINT gm_idcrement_nn NOT NULL, --nn
    key VARCHAR2(30),
    hit NUMBER DEFAULT 0, --default 0
    CONSTRAINT gm_mno_pk PRIMARY KEY(mno),
    CONSTRAINT gm_state_ck CHECK(state IN('����','���','�ϰ�'))
);
-- ALTER -> �̿�
/*
    ALTER : ����, ����, �߰� (�÷�, �������� �߰��� ����)
    �÷�����
    1) �߰�
       ALTER TABLE table_name ADD �÷��� �������� [��������]
    2) ����
       ALTER TABLE table_name DROP �÷���
    3) ����
       ALTER TABLE table_name MODIFY �÷��� ��������
    ��������
    1) �߰�
       => PRIMARY KEY, FOREIGN KEY, CHECK, UNIQUE => ADD
    2) ����
       => DROP
    3) ����
       => NOT NULL => MODIFY
*/
-- �ڵ�ȭó�� (trigger)
ALTER TABLE genie_music ADD liked NUMBER;
ALTER TABLE genie_music ADD jjim NUMBER;
DESC genie_music;

ALTER TABLE genie_music MODIFY liked DEFAULT 0 CONSTRAINT gm_liked_nn NOT NULL;
ALTER TABLE genie_music MODIFY jjim DEFAULT 0 CONSTRAINT gm_jjim_nn NOT NULL;

/*
     ������Ʈ => ������ ����
            => ũ��
            => ��������
   ------------------------ �ΰ��� �߰� : ALTER, �������� => ALTER
*/
--���̺� Melon ����
CREATE TABLE melon_music(
    mno NUMBER,
    cno NUMBER(2) CONSTRAINT mm_cno_nn NOT NULL,
    title VARCHAR2(200) CONSTRAINT mm_title_nn NOT NULL,
    singer VARCHAR2(200) CONSTRAINT mm_singer_nn NOT NULL,
    album VARCHAR2(200) CONSTRAINT mm_album_nn NOT NULL,
    poster VARCHAR2(260) CONSTRAINT mm_poster_nn NOT NULL,
    state VARCHAR2(30),
    idcrement NUMBER(3) CONSTRAINT mm_idcrement_nn NOT NULL,
    key VARCHAR2(30),
    hit NUMBER DEFAULT 0,
    liked NUMBER DEFAULT 0 CONSTRAINT mm_liked_nn NOT NULL,
    jjim NUMBER DEFAULT 0 CONSTRAINT mm_jjim_nn NOT NULL,
    CONSTRAINT mm_mno_pk PRIMARY KEY(mno),
    CONSTRAINT mm_state_ck CHECK(state IN('����','���','�϶�'))
);

-- ����
-- DROP TABLE table_name
DROP TABLE genie_music;
DROP TABLE melon_music;
ROLLBACK;
DESC genie_music;
DESC melon_music;
-- �̸�����
RENAME genie_music TO my_music;
DESC my_music;
RENAME my_music TO genie_music;
DESC genie_music;
-- ������ �߶󳻱� (���̺��� ����, �����͸� ����) => ROLLBACK�� ����� �� ����
-- TRUNCATE TABLE table_name
TRUNCATE TABLE genie_music;
-- ���̺� ���� => ������ ���� => DML(SELECT, INSERT, UPDATE, DELETE.. ��������)
-- ���̺� ���� ���� Ȯ��
/*
   ����
     1) table => user_tables
     2) constraint => user_constraints
     3) view => user_views
     *** ��� ��Ī�� �빮�ڷ� ����Ǿ� �ִ�
*/
SELECT owner, constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name='GENIE_MUSIC';
/*
    TYPE
    C => CHECK
    P => PRIMARY KEY
    R => FOREIGN KEY
    U => UNIQUE
*/

SELECT owner, constraint_name, table_name, column_name
FROM user_cons_columns
WHERE table_name='MELON_MUSIC';

-- FOREIGN KEY ���� => ���� ���̺��� �÷� => PRIMARY KEY, UNIQUE
/*
    1, 'aaa'
    1, 'bbb'
    2, 'bbb'
    2, 'aaa'
*/
-- PRIMARY KEY : ���̺�� 1���� ���� ����
-- �ΰ� �̻��� �ʿ�ÿ��� => UNIQUE
-- FOREIGN KEY�� ������� ���������� ���ÿ� ON DELETE CASCADE
-- ���̺� : 10, 15~20
CREATE TABLE test1(
    no NUMBER,
    id VARCHAR2(20),
    name VARCHAR2(34) CONSTRAINT test1_name_nn NOT NULL,
    sex VARCHAR2(20),
    CONSTRAINT test1_no_pk PRIMARY KEY(no, id),
    CONSTRAINT test1_sex_ck CHECK(sex IN('��', '��'))
 --   CONSTRAINT test_id_uk UNIQUE(id)
);
INSERT INTO test1 VALUES(1,'aaa','hong','��');
INSERT INTO test1 VALUES(1,'bbb','hong','��');
INSERT INTO test1 VALUES(2,'aaa','hong','��');
CREATE TABLE test2(
    no NUMBER,
    tno NUMBER,
    id VARCHAR2(20),
    address VARCHAR2(100) CONSTRAINT test2_address_nn NOT NULL,
    tel VARCHAR2(20) CONSTRAINT test2_tel_nn NOT NULL,
    CONSTRAINT test2_no_pk PRIMARY KEY(no),
    CONSTRAINT test2_tno_fk FOREIGN KEY(tno)
    REFERENCES test1(no) ON DELETE CASCADE,
    CONSTRAINT test2_id_fk FOREIGN KEY(id)
    REFERENCES test1(id)
);
DROP TABLE test1;
DROP TABLE test2;
-- INSERT
INSERT INTO test1 VALUES(1, 'ȫ�浿', '��');
INSERT INTO test1 VALUES(2, '��û��', '��');
COMMIT;
INSERT INTO test2 VALUES(1,1,'����','010-1111-1111');
INSERT INTO test2 VALUES(2,2,'����','010-2222-2222');
COMMIT;

DELETE FROM test1
WHERE no=1;


/*
    179page => ��ǥ (���̺� ���� ��ɾ�)
    180page => ���ڿ� ������ (VARCHAR2)
    181page => �⺻Ű => PRIMARY KEY
    183page => �������� (��ǥ)
               NUMBER => ����� �����Ϳ� ���� (�ڹٿ��� int, double)
                  NUMBER => NUMBER(8,2)
                                   - -
                                ����  �Ҽ���
                                30    -128
               CHAR, VARCHAR2, CLOB => String
               DATE => java.util.Date
    ALTER => 184~185 page
    DROP => 186page
*/
/*
    DML : �ַ� �� ���α׷��Ӱ� ���
    -------------------------- SELECT, INSERT, UPDATE, DELETE (CURD)
     INSERT : ������ �߰�(�ڹ�)
     UPDATE : ������ ����
     DELETE : ������ ����
     ----------------------���� ���� (����)=> COMMIT / ������ ����(���) => ROLLBACK
                            *** �ڹٿ����� AutoCommit()
    1. INSERT
    ����)
        = ��ü ������ ���
            INSERT INTO table_name VALUES(��....)
                   1) ���� �߰��� �� ����Ŭ�� ������ �÷� ������ �߰�
                   2) ���� �߰��� �� ����Ŭ�� ������ ��� ������ ����
                   ----------------------------------------- DESC table_name
                   3) ����, ��¥ �����ʹ� '' �߰�
        = �ʿ��� ������ ���
         *** NULL�� ����ϰų�, DEFAULT�� �ִ� ���
         INSERT INTO table_name(�÷�, �÷�....) VALUES(��, ��....)
               1) ���� �߰��� �� ������ �÷� ������� �߰�
               2) ���� �߰��� �� ������ ������ŭ �߰�
          = �� : ȸ������, �۾���, ��� �ø���, ����, ��ٱ���, ����
          => 187page (����), 188page
        
    2. UPDATE : ������ ����
      ����) => 189page �� ������
      UPDATE table_name SET
      �÷��� = ��, �÷��� = ��....
      -------------------------- ��ü ����
      [WHERE ����]
      -------------------------- ���ǿ� �´� �����͸� ����(******)
      *** ���� / ��¥ => ''�� ����Ѵ�
      *** �ʿ信 ���ϸ� ���� �����Ҷ� ���������� �̿��� �� �ִ�
      190 => page => �Ϲ� ���ǹ�, �������� -> ������� �޿� �λ�
                    ----------- ȸ������, �۾��� ����, ��� ����, ��ٱ��� ����, ������ ����
    3. DELETE : ������ ����
        191 page => ����
        DELETE FROM table_name
        ------------------------- ��ü ������ ����
        [WHERE ����]
        ------------------------- ���ǿ� �´� �����͸� ����
        => ȸ�� Ż��, ��� �����, ���� ���, ���� ���...
        ----------------------------------------------
        INSERT, UPDATE, DELETE => ���� �ٷ� ����Ŭ�� ������� �ʴ´�
        ���� : COMMIT, ��� : ROLLBACK
        => 192page
        ==> ���α׷��� �̿��ؼ� ������ ����� �ڵ����� ����
*/