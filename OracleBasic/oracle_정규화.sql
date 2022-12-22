/*
        6장
          = 요구사항 분석 ( 벤치마킹 ) => 어떤 기능을 제작 (3개 이상 사이트)
          = 개념적 설계 : 화면제작에 필요한 데이터 추출 (ER-모델)
              => ER-모델 : 엔티티(테이블) -> 속성(컬럼)
                                         ---------- 타원형
                          ----------- 사각형
          = 논리적 설계 : KEY 종류
                        = 기본키 (Primary KEY) => 이상현상 방지 (수정,삭제)
                          -> 모든 테이블에는 기본키를 한개 가지고 있다
                          -> 2개 설정 ==> 2정규화에서 문제 발생
                          -> 숫자(자동증가) => Sequence
                        = 대체키 (UNIQUE) -> 기본키를 잃어버린 상태에서 찾기...
                        = 정규화에 의해서 테이블이 나눠진 경우 => 연결 -> Foreign Key(참조키)
                        *** 프로젝트에서 오류 발생 시 -> 줌으로 에러처리 x 학원 나올것
                        = 데이터형 결정
          = 물리적 설계 : 실제 오라클에 저장 (테이블)
                          ER모델 => DBA
                          ---------- 자바 클래스와 배칭
          ==================================== 데이터베이스 수행
          
          389page
          -------
              이상현상 : 테이블을 잘못 설계 => 삽입, 수정, 삭제 문제가 발생하는 현상
                       => 불필요한 데이터 중복으로 인해 테이블에 데이터 관리 문제 발생
                       => 최소화 -> 정규화
*/

CREATE TABLE test_1(
    name VARCHAR2(20),
    subject VARCHAR2(20)
);
INSERT INTO test_1 VALUES('홍길동', '수학');
INSERT INTO test_1 VALUES('홍길동', '물리');
INSERT INTO test_1 VALUES('세종대왕', '국어');
INSERT INTO test_1 VALUES('샘해밍턴', '영어');
INSERT INTO test_1 VALUES('이승기', '음악');

DELETE FROM test_1
WHERE name='홍길동';

SELECT * FROM test_1;

CREATE TABLE Summer(
    sid NUMBER,
    class VARCHAR2(20),
    price NUMBER
);

INSERT INTO Summer VALUES(100, 'JAVA', 25000);
INSERT INTO Summer VALUES(200, 'ORACLE', 30000);
INSERT INTO Summer VALUES(300, 'JSP', 20000);
INSERT INTO Summer VALUES(400, 'HTML/CSS', 15000);
INSERT INTO Summer VALUES(500, 'SPRING', 25000);
COMMIT;

-- 1. 수강이 가능한 과목을 출력
SELECT sid,class FROM Summer;

-- 2. 자바의 수강료?
SELECT price
FROM Summer
WHERE class='JAVA';

-- 1. 삭제
DELETE FROM summer
WHERE sid=100;

SELECT * FROM summer;

-- 데이터를 추가할때 문제발생
INSERT INTO summer VALUES(100, '자바', 25000);
commit;
SELECT * FROM summer;
-- 문제발생 (취소 - 등록 = 회원가입)

-- 수정 => 같은 값을 가지고 있는 경우 -> 원하지 않는 데이터가 수정
-- 삭제 => 같은 값을 가지고 있는 경우 -> 원하지 않는 데이터가 삭제
/*
   1정규화
   2정규화
   3정규화
*/
CREATE TABLE member_event(
    id VARCHAR2(10),
    event VARCHAR2(20),
    aaa CHAR(1),
    name VARCHAR2(34),
    PRIMARY KEY(id,event)
);

INSERT INTO member_event VALUES('hong', 'aaa', 'y', '홍길동1');
INSERT INTO member_event VALUES('hong', 'bbb', 'n', '홍길동2');
INSERT INTO member_event VALUES('shim', 'aaa', 'y', '홍길동3');
INSERT INTO member_event VALUES('ki', 'aaa', 'n', '홍길동4');

SELECT * FROM member_event
WHERE id='hong' AND event='aaa';


   /*
      389page -> 이상현상
      390~391 -> 이상현상의 종류
         삭제 이상 => 연쇄삭제
         삽입 이상 => Null값 문제 발생
         => 게시판 (댓글) -> 테이블 분리
         수정 이상
         => 일관성이 없으면 -> 불일치
         ----------------------------방지하기 위해 -> 정규화(테이블을 기능별로 따로 생성)
         => 테이블과 테이블을 연결 => Foreign Key
         => 테이블은 관련된 내용만 저장 (일관성), 반드시 결정자를 만든다
                                                ------- 기본키 => 컬럼 한개로 모든 컬럼을 제어
            예)
                 ID 이름, 성별, 나이, 주소, 전화 ==> ROW(수정,삭제,검색)
                 ID -> 이름
                 ID -> 성별....
            ----------------------------------------------------------------
            정규화 : 1정규화 : 원자값 => 데이터값을 1개만 설정 (, |)
                    2정규화 : 중복을 제거, 복합키를 사용하지 않는다 => 테이블 분리
                    3정규화 : 결정자를 1개만 사용 (테이블을 따로 제어)
      
   */