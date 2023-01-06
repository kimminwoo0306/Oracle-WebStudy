<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	JSP : Java Server Page => 서버에서 실행되는 파일
	      JSP : Java + HTML
	      
	      실행과정 : 
	      
	      1) 사용자가 요청 URL(파일명)
	         http://localhost/JSPBasicProject1/jsp/basic_1.jsp
	                                               ----------- 파일 요청
	                                               *** 파일의 확장을 변경할 수 있따
	                                               *** 파일 (구분자)
	      2) 톰캣이 요청을 받는다
	      3) 파일 찾기
	          = 찾은 경우
	            3-1) JSP 파일을 자바파일로 변경 basic_1_jsp.java
	            3-2) 변경된 파일을 컴파일 한다  basic_1.jsp.class
	            3-3) JVM에서 .class파일을 로딩
	          = 못찾은 경우 => 404 화면을 보여줌
	    
	    소스 코딩 : 
	            Java영역
	            1) <%@ page import=""%>
	            2) 일반 자바 코딩 영역
	               <%
	               		자바 영역
	               		변수 선언
	               		제어문
	               		메소드 호출
	               		문법은 자바와 동일
	               		주석: // /**/
	               %>
	            3) 출력 : 변수값
	               <%= 변수%>
	            HTML 영역
	               <%@ %> <% %> <%= %>를 제외한 영역
 --%>
 <%
 	out.println();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name="홍길동";
	out.println(name);
	 %>
</body>
</html>

















