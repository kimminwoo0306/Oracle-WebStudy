/*
     = VIEW : ���� ���̺� (������ ���̺��� �����ؼ� ���)
              1�� ��� : �ܼ� ��
              ������ ��� : ���� ��
            ---------------------- �信�� SQL���常 ���� => ����(������, �����(����û, �б�))
              �ζ��� ��
              => �������, ����
              => user_view(view�� �����ϰ� �ִ� ���̺�)
              => CREATE VIEW view_name
                 AS
                   SELECT ~~
              => CREATE OR REPLACE VIEW view_name
                 AS
                   SELECT ~~
              => SELECT ~~
                 FROM (SELECT~~)
              => DROP VIEW view_name
              => View�� ������ Ȯ��
                 SELECT text FROM user_views WHERE view_name='�빮��';
     = SEQUENCE : �ڵ� ���� ��ȣ(PRIMARY KEY => ��ȣ����)
                 => ����
                    CREATE SEQUENCE seq_name
                      START WITH  => ���۹�ȣ
                      INCREMENT BY => ������ȣ
                      NOCASHE => ������� ���
                      NOCYCLE => �ǵ��� ����
                 => ���б�
                    ���簪 : currval
                    ������ : nextval
                 => ����
                    DROP SEQUENCE seq_name
     ------------------------------------------------
     = SYNONYM : ���̺��� ��Ī => �ǹ�(���Ǿ�) => ����
       = ����
         CREATE SYNONYM ��Ī��
         FOR ���̺�
       = ����
         DROP SYNONYM ��Ī��
     = INDEX
     = PL/SQL : FUNCTION, PROCEDURE / TRIGGER
     
     ���Ѻο�
     system/happy -> �������� ����
     
     GRANT CREATE view TO hr
     GRANT CREATE SYNONYM TO hr
     GRANT CREATE FUNCTION TO hr
     GRANT CREATE PROCEDURE TO hr
     GRANT CREATE TRIGGER TO hr
*/
--����
CREATE SYNONYM �������
FOR emp;

SELECT * FROM �������;
DROP SYNONYM �������;

DESC food_location;