/*
���� 5)
��Ī�� ������ �ִ� ��� "" �ٿ��� ��Ī ���
WHERE => ������
         -----
         ��������� (+,-,*,/)
         �񱳿����� (=,!=,<>,^=,<,>,<=,>=)
         �������� (AND, OR)
         IN => OR �������� ��쿡 ó��
         NOT => ����������
         NULL => IS NULL, iS NOT NULL
         LIKE => %, _
         BETWEEN => �Ⱓ ==> >= AND <=
         
���� 43)
        LOWER(SUBSTR(ensme, 2, LENGTH(ename)-1))
        
���� 45)
SELECT ename, hiredate
FROM emp
WHERE REGEXP_LIKE(ename, 'EN|IN') --> �ֱ� ���
ORDER BY hiredate DESC;
���� 71)
SELECT ename, TO_CHAR(sal, '999,999')
FROM emp;
NVL(�÷���, ��)
    --------- ���������� �����ؾߵȴ�
*/