-- ���ڰ���
/*
     211page
       ***=> MOD() : ������ �� = % in Java
             MOD(10,2) ==> 0 
       ***=> CEIL() : �ø��Լ� (�� ������)
             CEIL(10.2) ==> 11
       ***=> ROUND() : �ݿø�
             ROUND(10.5678, 2)
                        -     => 10.57
       => TRUNC() : ����
            TRUNC(10.5678, 2) => 10.56 (������ ����)
       ----------------------------------------------- ��¥�� (����)
*/
SELECT MOD(10, 3) FROM DUAL; -- 10%3
SELECT empno, ename, job
FROM emp
WHERE MOD(empno, 2) = 0
ORDER BY 1;

SELECT CEIL(10.1) FROM DUAL;
SELECT CEIL(10.0) FROM DUAL;
-- �� ������
SELECT CEIL(COUNT(*) / 10.0) FROM emp;
-- 14 / 10.0 -> 1.4 -> 2
-- ROUND
SELECT ROUND(10.23456,3) FROM DUAL; -- 10.235
-- TRUNC
SELECT TRUNC(10.23456,3) FROM DUAL; -- 10.234

-- 216page => ��¥�Լ�
/*
      ***SYSDATE : �ý����� ��¥�� �ð��� ���� �� ���
      ***MONTHS_BETWEEN : �Ⱓ�� �ش�Ǵ� ������
      ����) MONTHS_BETWEEN (����, ����)
                            �ֱ�, ����
      22/02/01 ~ 22/12/01 ==> 10
      ADD_MONTH : ���߰�
      ADD_MONTH(5) => ����, ����
      NEXT_DAY : SYSDATE, '��' ==> 
      LAST_DAY : ������ ���� �о� �´� SYSDATE => 12/31
                                    '22/10/10' => 10/31
      ***ROUND
      ***TRUNC
*/
/*CREATE TABLE my(
    name VARCHAR2(20),
    regdate DATE
);
INSERT INTO my VALUES ('hong', SYSDATE);
SELECT * FROM my;*/
SELECT SYSDATE FROM DUAL;
SELECT SYSDATE - 1 "����", SYSDATE "����", SYSDATE + 1 "����" FROM DUAL;
SELECT ename, hiredate, TRUNC(TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate)) / 12) "�ٹ�������"
FROM emp;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT LAST_DAY('22/02/01') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 'ȭ') FROM DUAL;

/*
      ��ȯ
        **** TO_CHAR : ���ڿ� ��ȯ
        TO_DATE : ��¥�� ����
        TO_NUMBER : ������ ���� '10' + 10 => 20
*/
SELECT TO_NUMBER('100') + TO_NUMBER('200') FROM DUAL;
SELECT '100' + '200' FROM DUAL; -- �ڵ���ȯ TO_NUMBER�� ���� �Ⱦ�

SELECT TO_DATE(SYSDATE) - 5 Before,
       TO_DATE(SYSDATE, 'YYYY-MM-DD') + 5 After
FROM DUAL;
-- TO CHAR
/*
     ��¥, ���ڸ� ���ڷ� ���� => valueOf()
     
     ��¥ ����
       d => 1 ~ 31
       dd => 1 ~ 9 => 01 ... 11 12
       yy (rr)
       yyyy (rrrr)
       m => month
       mm
       dy ����
       hh/hh24
       mi
       s
       ss
     ���� ����
       $999,999
       L999,999 (�� ǥ�� => L)
*/
SELECT ename, TO_CHAR(sal,'L999,999') FROM emp;
SELECT TO_CHAR(SYSDATE, 'RRRR-MM-DD'), TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DY') FROM DUAL;

-- emp ��� => �Ի� ������ ���
SELECT ename, TO_CHAR(hiredate, 'DY') || '����' FROM emp;
-- ����Ͽ� �Ի��� ����� ��� ���� ���
SELECT * FROM emp
WHERE TO_CHAR(hiredate, 'DY') = '��';

/*
      ��Ÿ �Լ�
        ***NVL() : NULL�� ��ü�ϴ� �Լ�
          NNL(������, ��)
          => NULL�� ��쿡�� ����ó���� �ȵȴ�
        DECODE() : switch����
        CASE : ���� ���ǹ�
*/
SELECT ename, sal, comm, sal + NVL(comm, 0) FROM emp;
SELECT zipcode, sido || ' ' || gugun || ' ' || dong || ' ' || NVL(bunji, ' ') FROM zipcode;
SELECT ename, job, hiredate, deptno FROM emp;
-- �Ϲ� SQL����
/*
     SELECT ename, job, hiredate, DECODE(deptno, 1, '�ڡ١١١�',
                                                 2, '�ڡڡ١١�',
                                                 3, '�ڡڡڡ١�'
                                                 4, '�ڡڡڡڡ�'
                                                 5, '�ڡڡڡڡ�') "dname"
    
*/
SELECT ename, job, hiredate, DECODE(deptno, 10, '���ߺ�',
                                            20, '�ѹ���',
                                            30, '��ȹ��') "dname"
FROM emp;
-- TRIGGER, PROCEDURE
/*
     �԰� => ���
     ��� => ���
*/
SELECT ename, job, hiredate, CASE
                             WHEN deptno = 10 THEN '���ߺ�'
                             WHEN deptno = 20 THEN '��Ȯ��'
                             WHEN deptno = 30 THEN '�����'
                             END "dname"
FROM emp;