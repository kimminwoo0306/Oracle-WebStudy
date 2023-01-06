<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP
	1) 지시자
	   <%@  속성=값  속성=값...%>
	   page : 파일에 대한 정보
	   <%@ page  속성=값  속성=값... %>
	   taglib : 태그로 제어문, URL, Format, String ==> MVC/Spring/Spring-Boot
	   <%@ taglib 속성=값  속성=값...%>
	   include : JSP 특정 위치에 다른 JSP를 포함
	   <%@ include 속성=값  속성=값...%>
	2) 스크립트
	   자바 / HTML 구분
	   자바코딩
	   ------
	   일반자바 : 제어문, 메소드호출, 변수선언 .... <% %> : 스크립트릿
	   선언문  : 메소드, 전역 변수 : <%! %>
	   표현식 : <%= %> : 출력
	3) 내장객체 : 미리 객체 생성후에 사용이 가능하게 만든 객체
	   ***사용자 요청 값을 받는 경우, 클라이언트의 정보 : request (HttpServeletRequest)
	   ***사용자 요청 처리 후 응답, 화면 변경 : response (HttpServeletResponse)
	   ***서버에 필요한 데이터를 저장 : session (HttpSession)
	   ***서버 정보 관리 : application (ServletContext)
	   출력 버퍼 관리 : (메모리 관리) : out (JspWriter)
	   환경설정 (web.xml) : config (ServletConfig)
	   예외처리 : exception (Exception)
	   내장객체 관리 : pageContext (PageContext)
	   JSP 자신의 객체 : page (Object)
	4) JSTL/EL
	*****5) MVC ==> HTML / Java

 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>