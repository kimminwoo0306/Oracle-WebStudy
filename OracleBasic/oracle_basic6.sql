-- 2022-12-06 ����Ŭ (���� �Լ�) => 209page
-- �����Լ�, GROUP BY, HAVING
-- JOIN / SUBQUERY
-- DDL => DML
-- VIEW, SEQUENCE, INDEX
-- PL/SQL
-- �����ͺ��̽� �𵨸�
/*
        �����Լ�, ����� ���� �Լ� (PL/SQL) => ��ü���� ������ �ִ�
        ------- ����Ŭ���� �����ϴ� �Լ�
          |
       �������Լ�  �������Լ�
       ------------------- ���ó ��) COUNT => �α���, ���̵��ߺ�
       ������ �Լ�
       ---------
        1) ����Ŭ���� �����ϴ� ��������
           ------------------------
                ������ / ������ / ��¥�� / ��Ÿ��
        2) ���������� �°� �Լ� ����
           1) �����Լ� => String
              => ��ȯ�Լ�
                 1. UPPER() => �빮�� ��ȯ
                    UPPER("abc") ==> ABC
                 2. LOWER() => �ҹ��� ��ȯ
                    LOWER("ABC") ==> abc
                 3. INITCAP() => �̴ϼ� ����
                    INITCAP("ABC") ==> Abc
                                       - ù���ڸ�
              => �����Լ� CONCAT => ���ڿ� ���� => ||
                        ------- WHERE ename LIKE '%' || �� || '%' ==> ����Ŭ
                                WHERE ename LIKE CONCAT('%',��,'%') ==> MYSQL
                 ***1. SUBSTR()  ==> substring()
                 ***2. INSTR()  ==> indexOf()
                 3. REPLACE()
                 4. TRIM()  ==>  LTRIM(), RTMIM() ==> trim()
                 5. PAD()  ==> LPAD(), ***RPAD()
                              ���̵�ã��, ��й�ȣã��
                              admin ==> ad***
                 6. LENGTH() : ���� ����
              => ���Խ� �Լ� (å������)
           2) �����Լ� => Math
           3) ��¥�Լ� => Date, Calendar
           4) ��ȯ�Լ� => Format
           5) ��Ÿ�Լ� => ����Ŭ�� ������ �ִ�
*/
-- �빮��, �ҹ���, �̴ϼ� ��� (���α׷� => �����)
SELECT ename "����� ������", UPPER(ename) "�빮��", LOWER(ename) "�ҹ���", INITCAP(ename) "�̴ϼ�"
FROM emp;

SELECT INITCAP('hello java!!') FROM DUAL;

-- or �ڹٿ��� �����ؼ� ���� ==> ���� ����
/*SELECT ename, sal, job
FROM emp
WHERE ename = UPPER('king');
SELECT ename, sal, job
FROM emp
WHERE LOWER(ename) = 'king';*/

-- LENGTH => ���� ���� , LENGTHB => ������ byte�� ==> 215page
-- ���� => VARCHAR2(5) => byte �ѱ��� 1���ڹۿ� ���� (1~4000)���� ���� ==> CLOB
SELECT ename, LENGTH(ename), LENGTHB(ename) FROM emp;
SELECT LENGTH('ABC'), LENGTH('ȫ�浿'), LENGTHB('ABC'), LENGTHB('ȫ�浿') FROM DUAL;

SELECT ename
FROM emp
WHERE LENGTH(ename) = 4;

SELECT ename
FROM emp
WHERE LENGTH(ename) BETWEEN 4 AND 5;
-- �ڹ� => ����Ŭ
-- ���� ��ȯ (�ڹ�) => �ϼ��� �����͸� ����Ŭ�� ����
-- REPLACE => 214page : ����, ���ڿ� ����
-- || , &
SELECT REPLACE('Hello Java&Spring', '&', '^') FROM DUAL; -- Java���� ó���ϰ���°� ���� ����Ŭ�� &�� �Է��̶�
SELECT REPLACE('Hello Java', 'a', 'b') FROM DUAL;
--                  ���    ������  ������ ������
SELECT REPLACE('Hello Java', 'Java', 'Spirng') FROM DUAL;

-- SUBSTR : ���ڿ��� �ڸ��� ��쿡 ��� (substring()) ==> 215page
-- ------ 1������ �����Ѵ�
/*
        HELLO JAVA
        0123456789 - Java
        HELLO JAVA
        12345678910 - Oracle
*/
-- SUBSTR(���ڿ�, ���۹�ȣ(1), ����)
SELECT SUBSTR('Hello Java', 5, 1) FROM DUAL;
--                        index => 1, 1 (�ڹ� index���� index����)
--                        index => ���� (����Ŭ index���� ������ŭ �߶��)
-- 81�⿡ �Ի��� ��� ��� ��� YY/MM/DD
SELECT ename, hiredate
FROM emp
WHERE SUBSTR(hiredate, 1, 2) = 81;

-- 12���� �Ի��� ����� �̸�, �Ի���
SELECT ename, hiredate
FROM emp
WHERE SUBSTR(hiredate, 4, 2) = 12;

SELECT ename, SUBSTR(hiredate, 7, 2)
FROM emp;

SELECT ename, SUBSTR(hiredate, -2, 2)
FROM emp;
/*
        81 / 12 / 01
        12 3 45 6 78
       -8-7-6-5-4-3-2-1
*/
SELECT SUBSTR(hiredate, 1, 2), SUM(sal), ROUND(AVG(sal), 1)
FROM emp
GROUP BY SUBSTR(hiredate, 1, 2)
ORDER BY SUBSTR(hiredate, 1, 2) DESC;
-- ó��(1 ~) , ��(-1 ~)
-- LPAD / RPAD => ���ڼ��� ���� Ư�����ڸ� ���
-- ###��, ��###
SELECT LPAD('Hello Oracle', 15,'#'), RPAD('Hello Oracle', 15,'#') FROM DUAL;
SELECT ename, RPAD(SUBSTR(ename, 1, 2), LENGTH(ename), '*') FROM emp;
-- ��й�ȣ => �缳�� , �̸��� ���� (JavaMail)
-- trim(), LTRIM(), RTRIM() ==> ������ ���ڸ� ���� => ���ڸ� �������� ������ ��������
SELECT LTRIM('AAABBBCCC', 'A'), RTRIM('AAABBBCCC', 'C') FROM DUAL;
SELECT TRIM('A' FROM 'AAABBBAAA') FROM DUAL;
-- �ڹ� ���鸸 ����
-- CONCAT : ���ڿ� ���� ==> ||
SELECT CONCAT('Hello ', 'Java') FROM DUAL; -- MYSQL (LIKE)
SELECT 'Hello ' || 'Java' FROM DUAL; -- Oracle(LIKE)
-- INSTR => indexOf() : ���� ã��
SELECT ename, INSTR(ename, 'A', 1, 1) FROM emp; -- indexOf(+)
SELECT INSTR('Hello Java', 'l', 1, 2) FROM DUAL;
SELECT INSTR('Hello Java', 'l', -1, 2) FROM DUAL; -- �ڿ������� ã�� index�� lastIndexOf (-) 