/*
        SEQUENCE : �ڵ� ������ȣ (�ѿ��� ����) 1 2 3 4 5
                                                --���� 1 2 3 5 ... => PRIMARY KEY(�ߺ��� ���� ��)
                                                ���������� �̿��ؼ� (MAX()+1)
        --------
        MAXVALUE : ������
        MINVALUE : ���۰�
        -------------------------------���󵵴� ���� ���� (���Ѵ�)
        START WITH : ������ ������ ������ ����
                  START WITH 1, START WITH 100
        INCREMENT BY : ��� ���� ����
                  INCREMENT BY 1 ==> 1�� ����, INCREMENT BY 100
                                     ------- �Խù� ��ȣ, ��� ��ȣ, ��ٱ��� ��ȣ, �� ��ȣ...
                                     ����, ���� �� ���� �߻� -> �ذ�
        CACHE | NOCACHE
        -----  -------- ���
        1~20���� �̸� ��ȣ�� �����Ŀ� ��� =>
        CYCLE | NOCYCLE
        -----   ------- ���
        �������� ���� �� ==> �ٽ� ó������ ���� (1~100) => 100 => 1����
        
        *** ���簪 �б� => currVal
        *** ������ �б� => nextVal
        
        1) ����
           CREATE SEQUENCE seq_name
              START WITH 1
              INCREMENT BY 1
              NOCACHE
              NOCYCLE
         2) ����
            DROP SEQUENCE seq_name
       *** �������� ����
          ------------
          ���̺��_�÷���_seq;
          
          ��) 
             board ==> no
             board_no_seq
             
             notice ==> no
             notice_no_seq
             
             cart ==> no
             cart_no_seq
             reserve
             ----------------------> CREATE�� ����� ������ ���� ����
             PRIMARY KEY : �� ���̺��� ������ ���Ἲ ==> �ݵ�� �Ѱ� �̻� ����
                                            ------ ���ϴ� �����͸� ����, ���� (�̻����� ����)
                ��ü Ű, �ĺ�Ű�� ������ �����ϴ� ���� �ƴϴ� -> (�⺻Ű ã�� ==> ȸ������)
*/
CREATE SEQUENCE test_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
SELECT test_no_seq.nextval FROM DUAL;
SELECT test_no_seq.currval FROM DUAL;
DROP SEQUENCE test_no_seq;
/*
    ����ȭ�� ������ : ���α׷����� �ʿ��� �����͸� ���� => RDBMS(����Ŭ, MYSQL)
    ------------- �����͸� ������ ���� => ��������
    ������ȭ : �ʿ���� �����͸� ����, ������ �Ǿ��ִ� (HTML, XML, JSON)
    ������ȭ : �ʿ��� ������, �ʿ���� ������ �����ִ� , ���е� ���� (Ʈ����, ���̽���...)
    ------ ����ȭ(������) 
*/
CREATE TABLE board(
    no NUMBER,
    name VARCHAR2(34) CONSTRAINT board_name_nn NOT NULL,
    subject VARCHAR2(4000) CONSTRAINT board_subject_nn NOT NULL,
    content CLOB CONSTRAINT board_content_nn NOT NULL,
    pwd VARCHAR2(10) CONSTRAINT board_pwd_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    hit NUMBER DEFAULT 0,
    CONSTRAINT board_no_pk PRIMARY KEY(no)
    );
    
-- no ó�� (�ߺ��� ���� ������) => �ڵ����� ó��
-- �ߺ�(x) => 1. ���̺�� 2. �÷��� 3. View�� 4. Sequence�� 5. �������Ǹ�
                                          ------------------------- ���̺��_�÷���
-- ��� ���� (����, ����) => ������
CREATE SEQUENCE board_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
INSERT INTO board(no,name,subject,content,pwd)
VALUES(board_no_seq.nextval,'ȫ�浿','������ ���..', '������ ��� ��� ��������..','1234');
--����
COMMIT;

-- Ȯ��
SELECT * FROM board;

DELETE FROM board WHERE no=3;

CREATE TABLE notice(
    no NUMBER,
    name VARCHAR2(34) CONSTRAINT notece_name_nn NOT NULL,
    msg CLOB CONSTRAINT notece_msg_nn NOT NULL,
    CONSTRAINT notice_no_pk PRIMARY KEY(no)
);

CREATE SEQUENCE notice_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
INSERT INTO notice VALUES(notice_no_seq.nextval,'ȫ�浿','��������');
COMMIT;
SELECT * FROM notice;
    