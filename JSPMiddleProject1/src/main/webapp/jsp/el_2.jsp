<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		EL => 연산자 (자바가 아니다)
		1) 산술연산자
		   + : 순수하게 산술 연산만 가능 (문자열 결합(X)) => +=
		   -
		   *
		   / : 정수 / 정수 = 실수    div
		   ${10 / 5 } = 2
		   ${10 div 5}
		        ---
		   ${10 div 3} = 3.3333...
		   % : 나머지               mod
		   ${10 % 3} == 1
		   ${10 mod 3} == 1
		   ${10+10} => 20
		   ${"10"+10} => 20 --> 자동 변환이 된다
		   ${"10 "+10} => 오류 발생
		   ${null+10} => 10 (null값은 0으로 인식을 한다)
		2) 비교연산자
		3) 논리연산자
		4) 삼항연산자
		5) Empty
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1> EL 연산자 (산술연산자 = +, -, *, /(div), %(mod)) : 문자열 결합은 +=, null은 자동으로 0으로 인식</h1>
<%--  &#36; {10+10}=${10+10 } <br>
 &#36; {"10"+10}=${"10"+10}<br>
 &#36; {"10 "+10}=${"10 "+10}<br>   공백잇으면 오류 
 &#36; {null+100}=${null+100 }<br>null값은 0으로 취급
 &#36; {"Hello"+="EL"}=${"Hello"+="EL" }<br> 문자열 결합은 +(x) +=(O)
 &#36; {10-5}=${10-5 }<br>
 &#36; {"10"-5}=${"10"-5}<br>
 &#36; {"10"*5}=${"10"*5}<br>
 &#36; {10/3}=${10/3 }<br>
 &#36; {10 div 3}=${10 div 3 }<br>
 &#36; {10%3}=${10%3 }<br>
 &#36; {10 mod 3}=${10 mod 3 }<br> --%>
 <h1>비교 연산자 (결과 : true/false : 조건문 사용시)</h1>
 <h1>비교 연산자 종류 (==(eq),!=(ne), <(lt), >(gt), <=(le), >=(ge))</h1>
 <h1>비교 연산자 주의점 : 문자열, 날짜, 숫자가 동일하다</h1>
 <h1>"hong"=="hong" "hong"!="hong"</h1>
<%--  &#36; {10==10}=${10==10 }<br>
 &#36; {10 eq 10}=${10 eq 10 }<br>
 &#36; {"hong"=="hong"}=${"hong"=="hong" }<br>
 &#36; {"hong"eq"hong"}=${"hong"eq"hong" }<br>
 &#36; {"hong"!="hong"}=${"hong"!="hong" }<br>
 &#36; {"hong"ne"hong"}=${"hong"ne"hong" }<br>
 &#36; {"hong"<"hong"}=${"hong"<"hong" }<br>
 &#36; {"hong"lt"hong"}=${"hong"lt"hong" }<br>
 &#36; {"hong"<="hong"}=${"hong"<="hong" }<br>
 &#36; {"hong"le"hong"}=${"hong"le"hong" }<br>
 &#36; {"hong">"hong"}=${"hong">"hong" }<br>
 &#36; {"hong"gt"hong"}=${"hong"gt"hong" }<br>
 &#36; {"hong">="hong"}=${"hong">="hong" }<br>
 &#36; {"hong"ge"hong"}=${"hong"ge"hong" }<br> --%>
 <h1>논리연산자 (&&(and:직렬),||(or:병렬)), not()</h1>
<%--  &#36; {(10==10)&&(10!=10)}=${(10==10) and (10!=10) }<br>
 &#36; {(10==10)||(10!=10)}=${(10==10) or (10!=10) }<br>
 &#36; {(10==10)&& not(10!=10)}=${(10==10) and not (10!=10) }<br> --%>
 <h1>삼항연산자 (조건?값1:값2)= if~else => 조건 true:값1, false:값2=> page 변경</h1>
 &#36; {(10==10)?'A':'B'}=${(10==10)?'A':'B' }
 <%-- page=${curpage>1?curpage-1:curpage} : style적용--%>
<%--  <h1>Empty 연산자 : true/false </h1>
<%
 	request.setAttribute("name","");
%>
 &#36; {empty name}=${empty name}<br>
 ${name=="" } --%>
</body>
</html>



