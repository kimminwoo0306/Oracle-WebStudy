/*
        6��
          = �䱸���� �м� ( ��ġ��ŷ ) => � ����� ���� (3�� �̻� ����Ʈ)
          = ������ ���� : ȭ�����ۿ� �ʿ��� ������ ���� (ER-��)
              => ER-�� : ��ƼƼ(���̺�) -> �Ӽ�(�÷�)
                                         ---------- Ÿ����
                          ----------- �簢��
          = ���� ���� : KEY ����
                        = �⺻Ű (Primary KEY) => �̻����� ���� (����,����)
                          -> ��� ���̺��� �⺻Ű�� �Ѱ� ������ �ִ�
                          -> 2�� ���� ==> 2����ȭ���� ���� �߻�
                          -> ����(�ڵ�����) => Sequence
                        = ��üŰ (UNIQUE) -> �⺻Ű�� �Ҿ���� ���¿��� ã��...
                        = ����ȭ�� ���ؼ� ���̺��� ������ ��� => ���� -> Foreign Key(����Ű)
                        *** ������Ʈ���� ���� �߻� �� -> ������ ����ó�� x �п� ���ð�
                        = �������� ����
          = ������ ���� : ���� ����Ŭ�� ���� (���̺�)
                          ER�� => DBA
                          ---------- �ڹ� Ŭ������ ��Ī
          ==================================== �����ͺ��̽� ����
          
          389page
          -------
              �̻����� : ���̺��� �߸� ���� => ����, ����, ���� ������ �߻��ϴ� ����
                       => ���ʿ��� ������ �ߺ����� ���� ���̺� ������ ���� ���� �߻�
                       => �ּ�ȭ -> ����ȭ
*/

CREATE TABLE test_1(
    name VARCHAR2(20),
    subject VARCHAR2(20)
);
INSERT INTO test_1 VALUES('ȫ�浿', '����');
INSERT INTO test_1 VALUES('ȫ�浿', '����');
INSERT INTO test_1 VALUES('�������', '����');
INSERT INTO test_1 VALUES('���ع���', '����');
INSERT INTO test_1 VALUES('�̽±�', '����');

DELETE FROM test_1
WHERE name='ȫ�浿';

SELECT * FROM test_1;

CREATE TABLE Summer(
    sid NUMBER,
    class VARCHAR2(20),
    price NUMBER
);

INSERT INTO Summer VALUES(100, 'JAVA', 25000);
INSERT INTO Summer VALUES(200, 'ORACLE', 30000);
INSERT INTO Summer VALUES(300, 'JSP', 20000);
INSERT INTO Summer VALUES(400, 'HTML/CSS', 15000);
INSERT INTO Summer VALUES(500, 'SPRING', 25000);
COMMIT;

-- 1. ������ ������ ������ ���
SELECT sid,class FROM Summer;

-- 2. �ڹ��� ������?
SELECT price
FROM Summer
WHERE class='JAVA';

-- 1. ����
DELETE FROM summer
WHERE sid=100;

SELECT * FROM summer;

-- �����͸� �߰��Ҷ� �����߻�
INSERT INTO summer VALUES(100, '�ڹ�', 25000);
commit;
SELECT * FROM summer;
-- �����߻� (��� - ��� = ȸ������)

-- ���� => ���� ���� ������ �ִ� ��� -> ������ �ʴ� �����Ͱ� ����
-- ���� => ���� ���� ������ �ִ� ��� -> ������ �ʴ� �����Ͱ� ����
/*
   1����ȭ
   2����ȭ
   3����ȭ
*/
CREATE TABLE member_event(
    id VARCHAR2(10),
    event VARCHAR2(20),
    aaa CHAR(1),
    name VARCHAR2(34),
    PRIMARY KEY(id,event)
);

INSERT INTO member_event VALUES('hong', 'aaa', 'y', 'ȫ�浿1');
INSERT INTO member_event VALUES('hong', 'bbb', 'n', 'ȫ�浿2');
INSERT INTO member_event VALUES('shim', 'aaa', 'y', 'ȫ�浿3');
INSERT INTO member_event VALUES('ki', 'aaa', 'n', 'ȫ�浿4');

SELECT * FROM member_event
WHERE id='hong' AND event='aaa';


   /*
      389page -> �̻�����
      390~391 -> �̻������� ����
         ���� �̻� => �������
         ���� �̻� => Null�� ���� �߻�
         => �Խ��� (���) -> ���̺� �и�
         ���� �̻�
         => �ϰ����� ������ -> ����ġ
         ----------------------------�����ϱ� ���� -> ����ȭ(���̺��� ��ɺ��� ���� ����)
         => ���̺�� ���̺��� ���� => Foreign Key
         => ���̺��� ���õ� ���븸 ���� (�ϰ���), �ݵ�� �����ڸ� �����
                                                ------- �⺻Ű => �÷� �Ѱ��� ��� �÷��� ����
            ��)
                 ID �̸�, ����, ����, �ּ�, ��ȭ ==> ROW(����,����,�˻�)
                 ID -> �̸�
                 ID -> ����....
            ----------------------------------------------------------------
            ����ȭ : 1����ȭ : ���ڰ� => �����Ͱ��� 1���� ���� (, |)
                    2����ȭ : �ߺ��� ����, ����Ű�� ������� �ʴ´� => ���̺� �и�
                    3����ȭ : �����ڸ� 1���� ��� (���̺��� ���� ����)
      
   */