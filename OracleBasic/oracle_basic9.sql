-- ����Ŭ 2���� ����
/*
      SELECT / INSERT / UPDATE / DELETE
      CREATE / ALTER / DROP / TRUNCATE / RENAME
      GRANT / REVOKE
      COMMIT / ROLLBACK
      ------------------------------------------
          TABLE / VIEW / SEQUENCE / PROCEDURE / FUNCTION / TRIGGER
          -------------------------------------------------------- JDBC => Oracle_Basic
          *** DESC table��
              ------------- �÷���, ��������
                                   -------
                                   ������ : NUMBER
                                   ------------------------------
                                   ������ : CHAR , VARCHAR2
                                   ��¥�� : DATE , TIMESTAMP
                                   
          ����Ŭ ���� => ��ɹ��� ����Ǹ� �ݵ�� ;�� ����Ѵ�
                        (�� �ڹٿ��� SQL������ ���۽ÿ��� ;�� ����ϸ� ��������) => ��ɹ��� �ٸ� ��찡 ����
          => ���� ���� : Ű����� �빮�� ��� (��ҹ��� ������ ���� �ʴ´� (SQL����), ����� �����ʹ� ��ҹ��� ����
          
        1) SELECT : ������ ���� (ȭ�� ����� ������) => ������ �˻� => �� (65 - 75%)
            = ����
               ==============================================================================
               SELECT [ALL[DISTINCT] column1, colum2 ... | * (�÷� ��ü��)
                                     ------------------- ��¿� �ʿ��� �÷��� ������´�
               FROM table_name : table(�����Ͱ� ����Ǿ� �ִ� �ּҴ���) => ����
               ============================================================================== �ʼ�
               [
                    1) WHERE �÷��� ������ �� => ���� �˻�
                    2) GROUP BY �÷���, �Լ� => �׷��� ��� �׷캰 ó��
                    3) HAVING �׷��Լ� => �׷� ����
                    4) ORDER BY �÷���, �Լ��� ASC/DESC
               ]
            = ������
               ��������� : + , - , * , / (����/���� = �Ǽ�)
                          '10' => �ڵ����� ��ȯ => TO_NUMBER()
               ******** �񱳿����� : = , <> , != , ^=
                          --  -------------  JavaScript => === , !==
               *** �������� : AND , OR
               IN ==> OR(������ IN(��...))
               NULL => ����ó���� �ȵȴ� => IS NULL , IS NOT NULL
               NOT => ���� => NOT IN , NOT BETWEEN , NOT LIKE
               *** BETWEEN : �Ⱓ , ���� ==>  >= AND <=
               *** LIKE : % , _
                      A%
                      %A
                      %A%
            = ���� �Լ�
            = JOIN (����Ŭ ���� / ANSI ����) => SELECT
            = SubQuery ( WHERE , ���̺� ��� , �÷� ���) => INSERT, UPDATE, DELETE
              (�μ�����)
              
              �ڹ� => ����Ŭ�� SQL ** ���ֿ����ؾ��� **
              String sql = "SELECT ename, job, hiredate, sal, deptno "; // ���� �ʿ� 
                            + "FROM emp ";
                            + "WHERE ename = 'KING'";  --> �빮�ھ��� ��ĭ�� ���ߵȴ�
                            
*/
-- select * from emp;
DESC zipcode;