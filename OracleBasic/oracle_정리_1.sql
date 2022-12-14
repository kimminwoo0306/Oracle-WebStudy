/*
     = VIEW : 가상 테이블 (기존의 테이블을 참조해서 사용)
              1개 사용 : 단순 뷰
              여러개 사용 : 복합 뷰
            ---------------------- 뷰에는 SQL문장만 저장 => 보안(금융권, 공기업(국세청, 학교))
              인라인 뷰
              => 재사용목적, 보안
              => user_view(view를 저장하고 있는 테이블)
              => CREATE VIEW view_name
                 AS
                   SELECT ~~
              => CREATE OR REPLACE VIEW view_name
                 AS
                   SELECT ~~
              => SELECT ~~
                 FROM (SELECT~~)
              => DROP VIEW view_name
              => View의 내용을 확인
                 SELECT text FROM user_views WHERE view_name='대문자';
     = SEQUENCE : 자동 증가 번호(PRIMARY KEY => 번호설정)
                 => 생성
                    CREATE SEQUENCE seq_name
                      START WITH  => 시작번호
                      INCREMENT BY => 증가번호
                      NOCASHE => 저장없이 사용
                      NOCYCLE => 되돌림 없음
                 => 값읽기
                    현재값 : currval
                    다음값 : nextval
                 => 삭제
                    DROP SEQUENCE seq_name
     ------------------------------------------------
     = SYNONYM : 테이블의 별칭 => 실무(동의어) => 보안
       = 생성
         CREATE SYNONYM 별칭명
         FOR 테이블
       = 삭제
         DROP SYNONYM 별칭명
     = INDEX
     = PL/SQL : FUNCTION, PROCEDURE / TRIGGER
     
     권한부여
     system/happy -> 계정으로 접근
     
     GRANT CREATE view TO hr
     GRANT CREATE SYNONYM TO hr
     GRANT CREATE FUNCTION TO hr
     GRANT CREATE PROCEDURE TO hr
     GRANT CREATE TRIGGER TO hr
*/
--생성
CREATE SYNONYM 사원정보
FOR emp;

SELECT * FROM 사원정보;
DROP SYNONYM 사원정보;

DESC food_location;