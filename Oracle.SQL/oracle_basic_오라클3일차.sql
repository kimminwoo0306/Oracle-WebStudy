/*
  CHR(65) => ���ڸ� ���ڷ� ����
*/
-- SELECT CHR(65) FROM DUAL;
-- HAVING: �׷캰 ������ ����� �� => �ݵ�� GROUP BY�� �־�� ��밡��
-- ������ �׷� -> �ο���, �޿���, �޿����, ��ü�޿��� ��պ��� ����
SELECT ROUND(AVG(sal)) FROM emp; -- 2073
SELECT job, COUNT(*), SUM(sal), ROUND(AVG(sal))
FROM emp
GROUP BY job
HAVING AVG(sal)>(SELECT ROUND(AVG(sal)) FROM emp);
--�������� (SQL������ ������ ��� �ѹ��� ó��) (�μ�����)

-- �⵵�� ==> �ο��� �θ��̻� -> �ο��� , �޿��ִ�, �޿��ּ�
SELECT TO_CHAR(hiredate,'YYYY'), COUNT(*), MAX(sal), MIN(sal)
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
HAVING COUNT(*)>=1;

/*
   JOIN
     �Ѱ� �̻��� ���̺��� ��¿� �ʿ��� �����͸� �����ϴ� ���
      = ����
        1) INNER JOIN ==> ������ (���� ���� ������ �ִ� ��� ó��) => ����:NULL�� ��쿡�� ó������ ���Ѵ�
           = EQUI_JOIN => ������ (=)
              = Oracle JOIN
                SELECT A.column, B.column
                FROM A,B
                WHERE A.column=B.column
              = ANSI JOIN
                SELECT A.column, B.column
                FROM A (INNER)JOIN B
                       ------- ��������
                ON A.column=B.column
               ----> column ���� => ���̺��.�÷�, ��Ī.�÷� => �÷����� �ٸ� ��쿡�� ����
                                => �÷����� ���� ��쿡 �����ϸ� �ָ������� ���� �߻�
           = NON_EQUI_JOIN => ������ (=������ ���� �ٸ� ������ ���) => ����(BETWEEN, �񱳿�����, ��������)
              = Oracle JOIN
              = ANSI JOIN
        ------------------------------------------------
           = NATURAL JOIN => �ڿ�����
           = JOUN~ USING
        ------------------------------------------�ݵ�� ���� �÷����� �־�� �Ѵ�
        2) OUTER JOIN => INNERJOIN+@ ==> ������ + ������ => NULL�� ��쿡�� ó�� �Ѵ�
           = LEFT OUTER JOIN => AB
             = Oracle JOIN
             = ANSI JOIN
           = RIGHT OUTER JOIN
             = Oracle JOIN
             = ANSI JOIN
           = FULL OUTER JOIN
             = ANSI JOIN
        3) SELF JOIN (���� ���̺���)
*/

--SELECT empno, ename, job, hiredate, sal, deptno
--FROM emp;

--SELECT * FROM dept;

-- ���, �̸�, ����, �Ի���, �޿�, �μ���, �ٹ���, �μ���ȣ ���
-- ------------------------emp -----------dept
SELECT empno, ename, job, hiredate, sal, dname, loc, emp.deptno
FROM emp, dept
WHERE emp.deptno=dept.deptno;
-- ���̺� ��Ī ���
-- �������� (equal)
SELECT empno, ename, job, hiredate, sal, dname, loc, e.deptno
FROM emp e, dept d
WHERE e.deptno=d.deptno;
-- ANSI JOIN => ǥ��ȭ (��� �����ͺ��̽� ����) => Oracle, MS_SQL, MYSQL...)
SELECT empno, ename, job, hiredate, sal, dname, loc, e.deptno
FROM emp e JOIN dept d
ON e.deptno=d.deptno;
-- ���̺�� ���̺� ���̿� ���� �÷����� �ִ� ��츸 ��� ���� => �ڿ�����
SELECT empno, ename, job, hiredate, sal, dname, loc, deptno
FROM emp NATURAL JOIN dept;
-- JOIN~USING

SELECT empno, ename, job, hiredate, sal, dname, loc, deptno
FROM emp JOIN dept USING(deptno);

-------------SELF JOIN (�������̺�) => ��Ī�� �̿��Ѵ�
SELECT e1.ename "����", e2.ename "���"
FROM emp e1, emp e2
WHERE e1.mgr=e2.empno(+);
SELECT * FROM emp;
--- ���� ���� ==> �̸��߿� A�� �����ϰ� �ִ� ����� �̸�,����,�μ���, �ٺ���
--- ������ ���� => ���� ���̺��� ���� ���� ������ �ִ� ������(�÷����� �������)
/*
   �Խ���               ���
     �Խù���ȣ           ��۹�ȣ
                        �Խù���ȣ
*/
SELECT * FROM dept;
