<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	   비교 연산자 ( ===(권장) ==, !== (권장) !=, <, >, <=, >=) boolean
	      => 문자열도 포함
	   // 제어문, 함수, 이벤트 처리 (태그제어) , 내장 객체
	                                      ------- window, document, form, location, history
       // 화면 제어 => DOMScript => Jquery(Ajax), Vue, React
       // Spring-Boot, Vue, React, Json(스웨거)
         ------------  ----------  JSP (HTML => ThymeLeaf)
       ==는 경고를 받는다 (실제 => Front 편집기 (vscode, 아톰, 웹스톰, 웹clipse)
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=10;
	let b=5;
	console.log("a===b :"+(a===b)) //f
	console.log("a!==b :"+(a!==b)) //t
	console.log("a<b :"+(a<b)) //f
	console.log("a>b :"+(a>b)) //t
	console.log("a<=b :"+(a<=b)) //f
	console.log("a>=b :"+(a>=b)) //t
	
	let c="Hello"
	let d="JavaScript"
		console.log("c===d :"+(c===d)) //f
		console.log("c!==d :"+(c!==d)) //t
		console.log("c<d :"+(c<d)) //t
		console.log("c>d :"+(c>d)) //f
		console.log("c<=d :"+(c<=d)) //t
		console.log("c>=d :"+(c>=d)) //f
		// 비교연산자에 문자열을 포함하고 있다 ====> 유효성검사 if(name===""), session.id===name
		
		/*
			논리 연산자
			&&  ||
			(조건) && (조건)
			----     -----
			결과       결과
			 |         |
			 -----------
			      |
			   최종 결과
			 && : 범위에 포함 : 예약일, 예약일 아닌 날, 체크인, 체크아웃
			      직렬 연산자 ==> 조건이 모두 true일때만 true
			 || : 병렬 연산자 ==> 조건중에 한개 이상이 true => true
			 
			 -------------------------------------------------------
			                          &&                ||
			 -------------------------------------------------------
			 true true                true              true
			 -------------------------------------------------------
			 true false               false             true
			 -------------------------------------------------------
			 false true               false             true
			 -------------------------------------------------------
			 false false              false             false
			 -------------------------------------------------------
		*/
		let i=(6>7) && (6===7)
		console.log("i="+i)
		i=(6<7) || (6==7)
		console.log("i="+i)
}
</script>
</head>
<body>

</body>
</html>