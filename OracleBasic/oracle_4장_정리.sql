/*
        ==> DML, DQL, DDL, JOIN, �����Լ�, ������, �������� -> BASIC
        ==> JOIN����, View ����, �������� VS JOIN, PROCEDURE vs TRIGGER, Ʈ�����
        4�� SQL ���
        ------------
          1. �����Լ� (205)
             ����Ŭ���� �����ϴ� �Լ� (�̹� ���� => ���̺귯��) => ��ü �������� �ʴ´�, �ʿ��ϸ� ����� ���� �Լ��� ����
                                                                              PL / SQL
                                                                              => ó������ �Լ�(ȸ�縶�� �ٸ���)
             ���� �Լ� ==> �����α׷��� (�ڹ� String)
                LENGTH()
                SUBSTR()
                RPAD()
             ���� �Լ� ==> �ڹ� Math
                ROUNT()
                CEIL()
             ��¥ �Լ�
                SYSDATE
                MONTHS_BETWEEN()
             ��ȯ �Լ�
                TO_CHAR() --> �ڹٿ��� ��ȯ�ϸ� �Էµ� �ð��� ���� ��� => 12:00
                                            -------------------- ���, ��������
             ��Ÿ �Լ�
                NVL() => NULL ��ü�ϴ� �Լ�
                ---------------------------- �������� �ڹٿ��� ����
             
          1-1. �������� => 224page ����
               SQL������ �����ؼ� �Ѱ��� ��ɹ��� �����
               WHERE => ��ø���� (�ΰ��� ���̺� ����) => ����, ���� (������Ʈ)
                        = ������ �������� (�÷�1, �����1) => id(�ּ�, ��ȭ), ��ȭ��ȣ => ��ȭ����
                         -> orders
                        = ������ �������� (�÷�1, ����� ������)
                           => ��ü�� ���� ���� => IN()
                           => ���� => ANY(SOME),ALL => �ִ�, �ּڰ� -> MAX, MIN
                                   > ANY => �ּڰ�
                                   < ANY => �ִ�
                                   < ALL => �ּڰ�
                                   > ALL => �ִ�
          **    SELECT => ��Į�� �������� : JOIN�� ��� ��� (JOIN���� �ӵ��� ������)
                          **** ���α׷� => �����ս� (�ӵ� ����ȭ), ������, ���뼺
                              ��� 1�� (MS - ���������Ʈ) , ��� ������ (IBM - OS2)
                              ------- ��� (������ ��� => ��ũ��Ʈ��) => servlet => JSP
                          **** �÷��� ����ϴ� ���
                          SELECT �÷���, (SELECT ~~) ��Ī...
                                        ----------- ������ : �ݵ�� �÷��� 1���� ���´� => ����(�ҽ��� ���)
                                        ----------- �ǹ� (17�� ~ 120��)
                          FROM table_name
          **    FROM => �ζ��κ� : ������ �پ�� (��ũ�� �������� �ʴ´�), ������, ROW�� ������ ó��
                        ==> ������
          2. VIEW : 236page
                    1) ���� => �ϳ� �̻��� ���̺��� ���ļ� ���� ���� ���̺� (����, ����, SQL���� �ּ�ȭ)
                              �� �� ���� : �ܼ� ��
                              ������ ���� : ���� �� (������ ��������, SQL������ �� ��쿡 => SQL���� �����Ŀ� ����)
                                                 ----------------------------- JOIN, SubQuery
                             ***** ����Ǵ� ���� �����Ͱ� �ƴ϶� => SQL������ �����ϰ� �ִ�
                             ***** ������������ DML�� ������ �� �ִ� (DML�� ����� ���� ���̺� ������ �ִ�)
                                   => �б� �������� ���� ==> WITH READ ONLY 
                    2) ����
                       CREATE VIEW view_name
                       AS
                        SELECT ~~
                       ==> ���̺��ϰ� �����ϰ� ����Ѵ�
                    3) ����
                       CREATE OR REPLACE VIEW view_name
                       AS
                        SELECT ~~~
                    4) ����
                       DROP VIEW view_name
          3. INDEX : ���� (����) => �ڷḦ ���� ������ ã���� �ְ� ����� �ش� (�ӵ� ����ȭ)
             249page �˻��ӵ� ���, �ε����� ������ �� �ִ� ��������� �ʿ��ϴ� => �����ð��� �����ɸ���
                     ���� / ���� => �ٽ� ������
            ����) CREATE INDEX index_name ON table_name(�÷�) => �˻��� �ַ� ���� �÷�
            ����) DROP INDEX index_name 
            ������) ALTER INDEX index_name REBUILD
            ���)-> ���� INDEX_ASC(), INDEX_DESC() => ORDER BY ��� => PRIMARY KEY(�ε����� �ڵ� ����)
          4. SEQUENCE : �ڵ�����
            1) ����
               CREATE SEQUENCE seq_name
                    START WITH 1
                    INCREMENT BY 1
                    NOCACHE
                    NOCYCLE
            2) ����
               DROP SEQUENCE seq_name;
               
            3) ���簪 currval
               ������ nextval
*/
CREATE OR REPLACE FUNCTION getDname(pDeptno emp.deptno%TYPE)
RETURN VARCHAR2
IS
vdname dept.dname%TYPE;
BEGIN
    SELECT dname INTO vdname
    FROM dept
    WHERE deptno=pDeptno;
    return vdname;
END;
/
SELECT empno, ename, getDname(deptno) FROM emp;