/*
        �����Լ� (�����Լ�) => COLUMN������ ���
        ------------------------------------
        ***** COUNT() ���� ��� => ����� ROW�� ����
         ------
           COUNT(*) ==> NULL�� ����
           COUNT(column) ==> NULL�� �������� �ʴ´�
           ------------------------------------- �˻����, ������, ���̵� �ߺ�, �α���, ��ٱ��� Ȯ�� ...
           1
           2
           3
           4
           5
           --
           6
           --
           7
        ***** MAX() : �ִ밪 => �ڵ� ������ȣ MAX() + 1
        MIN() : �ּҰ�
        SUM() : ��
        AVG() : ���
        ------------------------------------------------- �����Լ�, �м��Լ� => �÷��ϰ� ���� ����� ����
        RANK() : �ǳʶٰ�
            1
            2
            2
            4
        DENSE_RANK() : ����������
            1
            2
            2
            3
        CUBE()
        ROLLUP()
        -------------------------- �������Լ�, ���� �÷��� ���� ����� �� ����
        SELECT AVG(sal), ename ~~ ����
               --- ����  ------ ���� �÷�
               => �����Լ��� GROUP BY�� ���� ����� ����
*/
SELECT COUNT(comm), COUNT(mgr), COUNT(*) FROM emp;
SELECT * FROM emp;
/*
CREATE TABLE my2(
    no NUMBER PRIMARY KEY,
    name VARCHAR2(20)
);
INSERT INTO my2 VALUES(1,'aaa');
INSERT INTO my2 VALUES((SELECT MAX(no) + 1 FROM my2), 'bbb');
SELECT * FROM my2; 
*/
-- �޿� ��, ��� (import)
SELECT SUM(sal) "��", ROUND(AVG(sal),2) "���"
FROM emp;

-- �޿� �ִ�, �ּ�
SELECT MAX(sal), MIN(sal) FROM emp;

-- rank
SELECT ename, hiredate, sal, DENSE_RANK() OVER(ORDER BY sal DESC) rank
FROM emp;

/*
       �α����, �뷡, ��ȭ
*/
-- GROUP BY => 157page
-- job, hiredate, deptno
SELECT * FROM emp
ORDER BY deptno ASC;

SELECT sum(sal), avg(sal), count(*)
FROM emp
WHERE deptno = 10;

SELECT sum(sal), avg(sal), count(*)
FROM emp
WHERE deptno = 20;

SELECT sum(sal), avg(sal), count(*)
FROM emp
WHERE deptno = 30;

-- �׷캰 ��� GROUP BY => �����Լ��� ����� ����
-- �׷캰�� ������ ��谡 ����
SELECT deptno, sum(sal), round(avg(sal),2), count(*)
FROM emp
GROUP BY deptno
ORDER BY deptno ASC;

-- �Ի翬���� => �ο���, �޿���, �޿����, �ִ�޿�, �ּұ޿�
SELECT TO_CHAR(hiredate, 'YYYY'), count(*) "�ο���", sum(sal) "�޿���", avg(sal) "�޿����", max(sal) "�ִ�޿�", min(sal) "�ּұ޿�"
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY')
ORDER BY TO_CHAR(hiredate, 'YYYY');

SELECT SUBSTR(hiredate,1,2), count(*) "�ο���", sum(sal) "�޿���", avg(sal) "�޿����", max(sal) "�ִ�޿�", min(sal) "�ּұ޿�"
FROM emp
GROUP BY SUBSTR(hiredate,1,2)
ORDER BY SUBSTR(hiredate,1,2);