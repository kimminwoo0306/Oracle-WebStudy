<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.change.JspChange"%>
<%--
      1) 출력 영역
      JSP => 자바코딩영역 확인
            1) <% %> : 스크립트릿 = 자바 일반 코딩 (제어문, 메소드 호출, 변수 선언)
                       MVC, Spring => 일반 자바파일로 변경 <% %>가 사라질거임
            2) <%= %> : 표현식 = 변수나 메소드의 리턴값을 출력
                       MVC, Spring => ${}
            3) 제어문
                 <%
                     for() {
                 %>
                 
                 <%
                     }
                 %>
                 ↑ 이 코딩이
                 ==> 제어문을 태그형으로 바꾸는거 = JSTL
                 <c:forEach>
                     출력
                 </c:forEach>
                 ↑ 로 변경
                 
                 <%
                      if() {
                 %>
                 
                 <%
                      }
                 %>
                 => <c:if>
                        출력
                     </c:if>
                 ----------------------------------------------------------- HTML에서 제어문을 사용 (ThymeLeft)
       
       2) 지시자 (선언)
          <%@ %> : 정보, 라이브러리 로딩
          ** page
             contentType = "text/html;charset=UTF-8"
             errorPage=""
             isErrorPage=""
             import=""  
          ** taglib
             prefix="c"  => <c: ~> 으로 시작
             uri=""
          include => 액션태그로 대체 <jsp:include>
        ==> 내부객체
             request : 요청정보, 추가정보
               = getParameter() : 단일값
               = getParameterValues() : 다중값 (checkbox)
               = setCharacterEncoding() : 한글변환
               = setAtrribute(), getAtrribute() ==> MVC, getRequestURI(), getContextPath()
               = getCookie(), getSession()
               
             response
                 setHeader() : 업로드 / 다운로드
                 sendRedirect() : 실행할 파일 지정 => request가 초기화
             session : 서버에 클라이언트의 정보를 저장
                 => setAtrribute() 저장
                 => getAtrribute() 읽기
                 => invalidate() : 전체 해제
                 => removeAttribute() : 한개 삭제 => 장바구니
             application
                 getRealPath() : 실제 저장된 경로를 가지고 온다
             out
                 out.println() => <%= %> => ${} ==> 출력(메모리) => 출력버퍼
             pageContext => 내장 객체를 다시 생성해서 사용 (다운로드)
                 => 웹 흐름 (페이지 연결) => 파일(페이지)
                    include => <jsp:include>
                    forward => <jsp:forward>
                    ------- request를 공유
             ------------ MVC, Spring
             exception -> try ~ catch절로 처리가능
             config : web.xml
             page : this는 거의 생략
             ------------ 사용빈도가 거의 없음
        ==> 액션태그
            <jsp:include> : JSP안에 특정부분에 다른 JSP를 포함해서 사용
            <jsp:useBean> : 자바객체 생성
            <jsp:setProperty> : 자바객체에 setXxx()메소드를 호출해서 데이터값을 입력
        ==> 자바빈 : ~VO(Spring), ~DTO(MyBatis), ~Bean(JSP) => 데이터를 모아서 전송할 목적
                  ----------------
                    캡슐화방식을 이용한다 (변수 : private, 메소드 : public)
                                     --------------- 읽기/쓰기 => 읽기 : getter, 쓰기 : setter
        ==> 데이터베이스 / JDBC => DBCP만 책에서 참조 => 접속속도가 빠르게 (미리 Connection을 만든다)
             --------------- getConnection(), 보안 => 일반화 (모든 개발업체에서 사용이 된다) => MyBatis
             JDBC ===> DBCP ==> ORM(실무)
        ----------------------------------------- 일반 JSP (Model1방식 => 사이트 개발용이 아니고 홈페이지) : 2000~2003
        Model2 => 자바 / HTML분리 ==> 이 패턴이 (MVC) ==> 프론트, 백엔드
                 
 --%>
 <%
    // 화면 변경에 대한 요청값을 받는다
	request.setCharacterEncoding("UTF-8");
    String mode = request.getParameter("mode");
   // 처음에 한번은 default 지정
   if(mode == null) {
      mode = "0";
   }
    String jsp = JspChange.change(Integer.parseInt(mode));
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8691c9adbceec37fa95f10418713459a&libraries=services"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container {
   margin-top: 100px;
}
.row {
   width: 960px;
   margin: 0px auto;
}
</style>
</head>
<body>
  <%-- 메뉴 : include (pageContext) : <jsp:include> : pageContext.include() --%>
  <jsp:include page="header.jsp"></jsp:include>
  <div class="container">
    <%-- 화면 출력 : 사용자가 메뉴를 클릭시마다 화면 변경 --%>
    <jsp:include page="<%=jsp %>"></jsp:include>
  </div>
</body>
</html>






