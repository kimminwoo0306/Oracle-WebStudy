/*
    209page => �����Լ�
    ===> ����Ŭ���� �����ϴ� �Լ�
    ===> SELECT () ==> SELECT TO_CHAR(hiredate,'YYYY');
         WHERE () ==> WHERE MOD(empno,2)=0;
         GROUP BY() ==> GROUP BY TO_CHAR(hiredate,'YYYY');
         HAVING () ==> AVG(sal)>3000;
         ORDER BY() ==> ORDER BY LENGTH(ename) DESC;
    1) �������Լ� ==> ������ ROW => ���پ� ó��
       �����Լ� : LENGTH(), SUBSTR(), INSTR(), RPAD(), REPLACE()
       ��¥�Լ� : SYSDATE, MONTH_BETWEEN
       �����Լ� : TRUNC(), CEIL(), ROUND()
       ��ȯ�Լ� : TO_CHAR()
                ��¥ = ���ڿ�
                  YYYY �⵵
                  MM ��
                  DD ��
                  DY ����
                  HH/HH24 �ð�
                  MI ��
                  SS ��
                ���� = ���ڿ�
                $999,999 -> �޷�
                L999,999 -> ��
       ��Ÿ�Լ� : NVL => NULL�� ��ü
       223page - ROWNUM -> ����Ŭ ���������� ���� => �����÷�(SQL ���� ��-> row�� ��ȣ ����)
                 1) ����¡ 2) ����/���� -> �󼼺���
       224page - ��������(�μ�����)
             => WHERE ���� �ڿ� -> ��ø����(��ø��������)
             => �÷� ��� -> ��Į������ (��Į�󼭺�����)
             => ���̺� ��� -> �ζ��� ��
    2) ������ �Լ� ==> ���� Column
      AVG, COUNT, MAX, SUM, MIN
          ------ -----
      RANK(), CUBE(), ROLLUP() => ���
    --------------------------------------- �� ���� ���ÿ� ����� �� ����
*/