/*
    209page => 내장함수
    ===> 오라클에서 지원하는 함수
    ===> SELECT () ==> SELECT TO_CHAR(hiredate,'YYYY');
         WHERE () ==> WHERE MOD(empno,2)=0;
         GROUP BY() ==> GROUP BY TO_CHAR(hiredate,'YYYY');
         HAVING () ==> AVG(sal)>3000;
         ORDER BY() ==> ORDER BY LENGTH(ename) DESC;
    1) 단일행함수 ==> 단위가 ROW => 한줄씩 처리
       문자함수 : LENGTH(), SUBSTR(), INSTR(), RPAD(), REPLACE()
       날짜함수 : SYSDATE, MONTH_BETWEEN
       숫자함수 : TRUNC(), CEIL(), ROUND()
       변환함수 : TO_CHAR()
                날짜 = 문자열
                  YYYY 년도
                  MM 월
                  DD 일
                  DY 요일
                  HH/HH24 시간
                  MI 분
                  SS 초
                숫자 = 문자열
                $999,999 -> 달러
                L999,999 -> 원
       기타함수 : NVL => NULL값 대체
       223page - ROWNUM -> 오라클 내부적으로 생성 => 가상컬럼(SQL 실행 시-> row의 번호 지정)
                 1) 페이징 2) 이전/다음 -> 상세보기
       224page - 서브쿼리(부속질의)
             => WHERE 문장 뒤에 -> 중첩질의(중첩서브쿼리)
             => 컬럼 대신 -> 스칼라질의 (스칼라서브쿼리)
             => 테이블 대신 -> 인라인 뷰
    2) 다중행 함수 ==> 단위 Column
      AVG, COUNT, MAX, SUM, MIN
          ------ -----
      RANK(), CUBE(), ROLLUP() => 통계
    --------------------------------------- 두 개를 동시에 사용할 수 없다
*/