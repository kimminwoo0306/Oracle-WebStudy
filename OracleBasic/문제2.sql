/*
GROUP BY ����
----------- ��� => �Ϻ� �Ǹŷ�, ���� ���ŷ�
            ���� ���� ������ �ִ� �׷��� ��� �׷캰ó���� ���� �ϴ� SQL
            SELECT ~ ==> 5
            FROM ============== 1
            WHERE ============= 2
            GROUP BY �÷���|�Լ� === 3
            => ������ �ִ� ��� => HAVING == 4
            ORDER BY == 6
*/
-- GROUP BY ����
-- 1. �� �μ����� �ִ� �޿��� ���ϼ���.
SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno
ORDER BY deptno;

-- ���� �׷�
SELECT deptno, TO_CHAR(hiredate, 'YYYY'), MAX(sal)
FROM emp
GROUP BY deptno, TO_CHAR(hiredate, 'YYYY')
ORDER BY deptno;

-- 2. �� ����(job)���� �ִ� �޿��� ���ϼ���. 
SELECT job, MAX(sal)
FROM emp
GROUP BY job;

-- 3. �� �μ����� ��� �޿��� ���ϼ���.
SELECT deptno, ROUND(AVG(sal))
FROM emp
GROUP BY deptno;

-- �����Լ� : COUNT() , AVG , SUM , MAX , MIN => ������ �Լ�, �Ϲ� �÷��� ���� ����� �� ����
--           ------------------------------- �Ϲ� �÷��� ���ÿ� ��� => GROUP BY ���
--           => ��ü�� ������� ���� ����(����), ���δ����� ����� �� ����(ROW) => ����� ���Ƿ� ����
-- 4. �� ����(job)���� �ο����� ���ϼ���.
SELECT job, COUNT(job)
FROM emp
GROUP BY job;

-- 5. �� �μ��� ���ʽ�(comm)�� �޴�  �ο��� ��� . 
SELECT deptno, COUNT(comm)
FROM emp
WHERE comm IS NOT NULL
GROUP BY deptno;

-- 6. �� �⵵���� �Ի��� �ο����� ���ϼ���.
SELECT TO_CHAR(hiredate, 'YYYY'), COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate, 'YYYY');

SELECT TO_CHAR(hiredate, 'day'), COUNT(*), SUM(sal), ROUND(AVG(sal))
FROM emp
GROUP BY TO_CHAR(hiredate, 'day');

-- 7.  �μź� ��ձ޿��� ���ϰ� �� ��� ��ձ޿��� 2000 �̻��� �μ��� ����ϼ���.
SELECT deptno, ROUND(AVG(sal))
FROM emp
GROUP BY deptno
HAVING AVG(sal) >= 2000;

-- WHERE => �׷� �Լ��� ����� �� ����, �׷��Լ��� ���ÿ��� HAVING�� �̿��Ѵ�

-- JOIN ���� (Oracle JOIN, ANSI JOIN, SubQuery, �ڹٷ� �б� -> �� ������ �̷��� �װ� �����غ�!!)
-- 1. ��� �̸��� SCOTT�� ����� ���(empno), �̸�(ename), �μ���(dname)�� ����ϼ���.
SELECT e.empno, e.ename, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno AND e.ename = 'SCOTT';

SELECT empno, ename, (SELECT dname FROM dept WHERE deptno = emp.deptno) dname
FROM emp
WHERE ename = 'SCOTT';

-- 2. ����̸��� �޿�(sal)�� �޿����(grade)�� ����ϼ���.
SELECT ename, sal, grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal; -- NON EQUI_JOIN �������̿� ������ grade�� �����´� (=�� ������� �ʴ� ��� => ������)

SELECT ename, sal, grade -- ANSI JOIN
FROM emp JOIN salgrade
ON sal BETWEEN losal AND hisal;

SELECT ename, sal, (SELECT grade FROM salgrade WHERE emp.sal BETWEEN losal AND hisal) "grade"
FROM emp;

-- 3. �� 2���������� �μ����� �߰����� ����ϼ���.
SELECT ename, sal, grade, dname
FROM emp, salgrade, dept
WHERE dept.deptno = emp.deptno AND sal BETWEEN losal AND hisal;

--ANSI JOIN
SELECT ename, sal, grade, dname
FROM emp JOIN salgrade
ON sal BETWEEN losal AND hisal
JOIN dept
ON emp.deptno = dept.deptno;

-- SubQuery
SELECT ename, sal, (SELECT grade FROM salgrade WHERE emp.sal BETWEEN losal AND hisal) grade,
(SELECT dname FROM dept WHERE deptno = emp.deptno) dname
FROM emp;

SELECT sal, grade, dname
FROM emp NATURAL JOIN dept --> ���ϴ� ���� �÷����� ������ �ִ� ��쿡 ��� (�ڿ� ����)
JOIN salgrade
ON sal BETWEEN losal AND hisal;

SELECT sal, grade, dname
FROM emp JOIN dept USING(deptno)
JOIN salgrade
ON sal BETWEEN losal AND hisal;

    -- ==> Oracle JOIN, ANSI JOIN, Subquery
    --     --------------------------------- ���� ������ų �� �־����!
    
-- 4. ����̸��� �Ŵ����� �̸��� �Ʒ��� ���� �������� ����ϼ���.
--    "XXX"�� �Ŵ����� "XXX" �Դϴ�. => SELF JOIN
SELECT e1.ename || '�� �Ŵ����� ' || e2.ename || '�Դϴ�.'
FROM emp e1, emp e2 -- ���� ���̺�� �̿� --> ��Ī�� �̿��ؼ� ���� (Natural JOIN, JOIN USING ����� �� ����)
WHERE e1.mgr = e2.empno;
----- �÷����� �޶� ���� ���� ������ ������ �񱳰� �ȴ�

-- ANSI JOIN (ǥ��ȭ)
SELECT e1.ename || '�� �Ŵ����� ' || e2.ename || '�Դϴ�.'
FROM emp e1 INNER JOIN emp e2 -- INNER�� ������ ����
ON e1.mgr = e2.empno;

-- SUBQUERY
SELECT e1.ename || '�� �Ŵ����� ' || (SELECT ename FROM emp WHERE e1.mgr = empno) || '�Դϴ�.'
FROM emp e1;

-- 5. �μ���ȣ�� 30���� ������� �̸�, ����(job), �μ���ȣ(deptno), �μ���ġ(loc)�� ����ϼ���.
                              ----------------------------- emp ---------- dept
SELECT ename, job, emp.deptno, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.deptno = 30;

SELECT ename, job, e.deptno, loc
FROM emp e JOIN dept d
ON e.deptno = d.deptno AND e.deptno = 30;

SELECT ename, job, deptno, (SELECT loc FROM dept WHERE deptno = emp.deptno) loc
FROM emp
WHERE deptno = 30;


-- 6. ���ʽ�(comm)�� ��������� �̸�, ���ʽ�, �μ���, �μ���ġ�� ����ϼ���.
SELECT ename, comm, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND comm IS NOT NULL AND comm <> 0;

-- ANSI JOIN
SELECT ename, comm, dname, loc
FROM emp JOIN dept
ON emp.deptno = dept.deptno
AND comm IS NOT NULL AND comm <> 0;

-- SUBQUERY
SELECT ename, comm, (SELECT dname FROM dept WHERE deptno = emp.deptno) dname, 
(SELECT loc FROM dept WHERE deptno = emp.deptno) loc
FROM emp
WHERE comm IS NOT NULL AND comm <> 0;

-- 7. DALLAS���� �ٹ��ϴ� ������� �̸�, ����, �μ���ȣ, �μ����� ����ϼ���.
SELECT ename, job, emp.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND loc = 'DALLAS';

-- ANSI JOIN
SELECT ename, job, emp.deptno, dname
FROM emp JOIN dept
ON emp.deptno = dept.deptno
AND loc = 'DALLAS';

-- SUBQUERY
SELECT ename, job, e.deptno, (SELECT dname FROM dept WHERE deptno = e.deptno) dname
FROM emp e
WHERE (SELECT loc FROM dept WHERE deptno = e.deptno) = 'DALLAS';
-- WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'DALLAS');

-- 8. �̸��� 'A'�� ���� ������� �̸��� �μ����� ����ϼ���.
SELECT ename, dname
FROM emp, dept
WHERE ename LIKE '%A%' AND emp.deptno = dept.deptno;

SELECT ename, dname
FROM emp, dept
WHERE REGEXP_LIKE(ename,'A') AND emp.deptno = dept.deptno;
-- REGEXP_LIKE(ename, 'A|B|C|D|E')

-- ANSI JOIN
SELECT ename, dname
FROM emp JOIN dept
ON ename LIKE '%A%' AND emp.deptno = dept.deptno;

-- SUBQUERY
SELECT ename, (SELECT dname FROM dept WHERE deptno = emp.deptno) dname
FROM emp
WHERE ename LIKE '%A%';
/*
    �������̵� vs �����ε�
    �߻�Ŭ���� vs �������̽�
    ĸ��ȭ vs ����ȭ
    ����ȭ vs �񵿱�ȭ
    ���ܺ��� vs ����ȸ��
    ArrayList vs Vector
    DAO vs Service
    GET vs POST
    OOP vs AOP
    AOP vs ���ͼ�Ʈ
    
*/
-- JOIN�� SUBQUERY ����
-- ������ó�� or SQL����ó��
-- �������� ���̺��� �ʿ��� �����͸� ���� (JOIN)
-- �������� SQL������ �����ؼ� �ѹ��� ������ ���� (��������) => �ڹٿ��� �ַλ��
-- SUBQUERY ����
-- 1. SCOTT�� �޿��� �����ϰų� �� ���� �޴� ����� �̸��� �޿��� ����ϼ���.
SELECT ename, sal
FROM emp
WHERE sal >= (SELECT sal FROM emp WHERE ename = 'SCOTT');

-- 2. ����(job)�� 'CLERK'�� ����� �μ��� �μ���ȣ�� �μ����� ����ϼ���.
SELECT deptno, dname
FROM dept
WHERE deptno IN (SELECT deptno FROM emp WHERE job = 'CLERK');

-- 3. �̸��� T�� �����ϰ� �ִ� ������ �����μ����� �ٹ��ϴ� ����� ����� �̸��� ����ϼ���
SELECT empno, ename
FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE ename LIKE '%T%');
-- => ���� ����Ǵ� SQL(��������)
-- ��)
-- �޿��� ��պ��� ���� �޴� ����� ��� ����
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp); 

-- 4. �μ���ġ(loc)�� DALLAS�� ��� ����� �̸�, �μ���ȣ�� ����ϼ���
SELECT ename, deptno
FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'DALLAS');


-- 5. SALES �μ��� ������� �̸��� �޿��� ����ϼ���
SELECT ename, sal
FROM emp
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'SALES');

-- 6. �ڽ��� �޿��� ��� �޿����� ���� �̸��� S�� ���� �����
--    ������ �μ����� �ٹ��ϴ� ��� ����� �̸�, �޿��� ����ϼ���
-- 170 page
SELECT AVG(sal) FROM emp;

SELECT deptno
FROM emp
WHERE ename LIKE '%S%'
AND sal >= 2073;

SELECT ename, sal
FROM emp
WHERE deptno = 20;

SELECT ename, sal
FROM emp
WHERE deptno in (SELECT deptno FROM emp WHERE sal > (SELECT AVG(sal) FROM emp) AND ename LIKE '%S%');

-- 7. ��� �޿����� �� ���� �޿��� �޴� ����� �̸�, ���, �޿��� �˻��ϵ� �޿��� ���� �����γ����ϼ���.
SELECT ename, empno, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;




--2. ����(job)�� 'CLERK'�� ����� �μ��� �μ���ȣ�� �μ����� ����ϼ���.
select deptno, dname
from dept
where deptno in (select deptno from emp where job = 'CLERK');


SELECT ename, job, e.deptno, dname
FROM emp e, dept d
WHERE e.deptno = d.deptno AND job = 'CLERK';

SELECT ename, job, deptno, (SELECT dname FROM dept WHERE deptno = e.deptno)
FROM emp e
WHERE job = 'CLERK';

SELECT fno, name
FROM food_location
ORDER BY fno ASC;

-- �ζ��κ� (���̺� ��� ���) => Top-N ����̶� �߰����� �Ұ���
-- 2�� ����ϸ� �߰����� ����
SELECT fno, name, num
FROM (SELECT fno, name, rownum as num FROM  
     (SELECT fno, name FROM food_location ORDER BY fno ASC))
WHERE num BETWEEN 21 AND 30;