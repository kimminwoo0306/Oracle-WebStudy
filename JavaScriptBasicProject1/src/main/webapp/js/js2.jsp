<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
		연산자
		1. 단항연산자 (++, --, !)
		2. 형변환연산자
		   Number(), parseInt(), String, Boolean
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 292page => 연산자
window.onload=function(){
	// 단항연산자 (++, --, !)
	let a=10;
	let b=a++;
	console.log("a="+a+",b="+b);  // b=10, a=11
	
	a=10;
	b=++a;
	console.log("a="+a+",b="+b); // b=11, a=11
	
	let c=false;
	c=!c
	console.log("c="+c) // true => 부정 연산자
	
	// 주의점
	let d=1;
	d=!d;
	console.log('d='+d) // false => 모든 숫자
	
	// 형변환 연산자 => 자바에서 전송 (String)
	let e="10";
	console.log("e="+typeof e) // string
	console.log("e="+typeof Number(e)) // 숫자형 변환
	console.log("e="+typeof parseInt(e)) // 숫자형 변환
	
	console.log("e="+typeof Boolean(e)+","+Boolean(e));
	// 자바와 다른점
	/*
		숫자 => 문자열, Boolean으로 변경이 가능
		변수에는 데이터형을 사용하지 않는다 (let, const) => 확인시 typeof
	*/
}
</script>
</head>
<body>

</body>
</html>