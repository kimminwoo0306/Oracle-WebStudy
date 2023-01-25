<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    	= 자바스크립트 역할
    	  브라우저에서 이벤트 기능 처리(동적) : HTML(정적) => 동적 변경
    	  --------------------------------------------------
    	  1. 브라우저에서 처리
    	  2. 브라우저에서 출력
    	  3. 데이터 관리 : 자바
    	     자바스크립트에서 오라클 연결 (x) => 서버사이드 (NodeJS <=> 스프링)
    	  => 브라우저 (HTML, JavaScript) <========> 프로그램 언어 (자바, C#, 파이썬)
    	  
    	     자바 <======> 오라클 연결이 가능
    	     => 자바 : 자바스크립트 매칭
    	        -------------------
    	        ~VO  ==> {} => Object
    	        ~List ==> [{}, {}, {}....] => Array
    	                  -------------------------- JSON(자바스크립트 객체 표현법)
    	  => 브라우저안에서 자바에서 전송된 데이터를 받아서 동적으로 변환
    	                ------------------
    	  => 사용법
    	     1) 내부 스크립트 (한개의 파일에서만 사용이 가능)
    	        <head>
    	          <script>
    	              처리
    	          </script>
    	        </head>
    	     2) 외부 스크립트 (여러개 파일에서 사용이 가능) => 라이브러리
    	        .js(확장자)
    	        원격 <script src="원격(URL)"> (O) => 임포트
    	        내부 <script src="경로명">
    	     3) 인라인 스크립트 (한개의 태그에서만 제어)
    	        <a href="javascript:함수호출">
    	   = 버전 (ES6)
    	     ES5 : var (변수 => 자동 지정 변수) var i=10; ==> i:Number, var i="aaa" ==> i:String
    	          => 단점 : 스코프가 명확하지 않다.
    	                  -------- 사용범위
    	                  function a()
    	                  {
    	                  	   if()
    	                  	   {
    	                  	   	   var i=10;
    	                  	   }
    	                  	   (i)사용이 가능
    	                  }
    	     ES6 : let => 블럭이 종료하면 사라진다
    	           const => 상수형 변수 => final
    	           람다식 (화살표 함수)
    	           function display(){}
    	           let display=function(){}
    	           let display=()=>{}      ==>    =>는 function을 제거, return을 제거
    	           -------------------
    	           같다 (== , ===), 같지않다 (!=, !==)
    	           생략이 가능 ;
    	           
    	     자바 스크립트 출력 (System.out.println())
    	     -------------------------------------
    	     1. alert() => Modal
    	     2. console.log() : 디버깅
    	     3. document.write() : 브라우저 화면에 출력
    	     4. 태그.innerHTML=""  => Ajax, VueJS, ReactJS
    	     =============================================== 문자열 (비교연산자)
    	     
    	     => 자바스크립트 문법사항
    	        1) 변수 선언 (변수의 데이터형이 없다) => 값에 따라서 자동으로 데이터형 변경
    	        let i=10;
    	            - 변수
    	              => 식별자 (288page)
    	                  키워드는 사용할 수 없다(if, let ....)
    	                  특수문자 사용 가능( _ , $ )
    	                  숫자로 시작할 수 없다
    	                  공백이 있으면 안된다
    	                  대소문자를 구분한다
    	                  문자 길이는 상관없다 (3~10)
    	              => 규칙
    	                 생성자는 대문자
    	                 변수나 메소드, 함수는 소문자
    	                 단어라 여러개인 경우 => 시작은 대문자, _
    	        2) 데이터형
    	           let i=10   ===> i:int
    	           let i=10.5 ===> i:double
    	           let i="aaa" ==> i:String
    	           let i='A'  ===> i:char
    	           let i=true ===> i:boolean
    	           ------------------------- Boolean(1) => true, Boolean(0)=> false (C언어) : 연산처리가 되면 숫자로 가능
    	           let i={}  ==> 객체 => i:object
    	           let i={name:'홍길동', age:30}
    	                  ----         ----
    	                    |           |
    	                    -------------
    	                          |
    	                       멤버 변수
    	                     i.name, i.age
    	           let i=[] ==> 배열 ==> i:Array
    	           let i=function(){} ==> i:function
    	           --------------------------------- 연산자, 제어문처리, 함수, 클래스(객체지향), 프로토타입 => 라이브러리
    	      1) main 함수 => 시작과 동시에 자동 호출되는 함수
    	         = 일반 자바스크립트
    	           window.onload=function()
    	           {
    	           
    	           }
    	         = Jquery
    	           $(function(){
    	           
    	           })
    	         = VueJS
    	           mounted(){}
    	         = ReactJS
    	           componentDidMount(){} => 15 이전
    	           => Hooks  => 18버전
    	              Effect()
    	        -------------------------------------- MVC
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//  한 줄 주석 => 289page 
/*
    여러 줄 주석
 */
window.onload=function(){
	// main함수
	// 1. 변수 선언
	let a=10;
	let b=10.5;
	let c='ABC';
	let d="ABC";
	let e=[1,2,3,4,5,"홍길동"]; // Array배열 (Object형이기 때문에 다른 데이터형 첨부도 가능)
	let f={name:"홍길동", sex:"남자", age:20};
	// ;는 생략이 가능, 대소문자 구분 : 스크립트(단순한 언어)
	// 출력
	console.log("a:"+a);  // System.out.println()
	console.log("b:"+b);
	console.log("c:"+c);
	console.log("d:"+d);
	console.log("e:"+e);
	console.log("f:"+f);
	// 출력 => 브라우저에 출력
	document.write("a="+a+"<br>");
	document.write("b="+b+"<br>");
	document.write("c="+c+"<br>");
	document.write("d="+d+"<br>");
	document.write("e="+e+"<br>");
	document.write("f="+f+"<br>");
	document.write("<hr>");
	/*
		자바 스크립트에서 지원하는 데이터형
		1. number : 정수, 실수 (숫자형)
		2. string : 문자(''), 문자열("")
		           ---------- 여러문자 취급이 가능 'ABC'
		3. object : 배열([]), 객체({})
		4. boolean : true/false ==> Boolean(1) => true, Boolean(0) => false
		5. null : 값이 없는 경우
		6. undefined : 선언이 안된 경우
		데이터 확인 : typeof
	*/
	document.write("a="+typeof a+"<br>")
	document.write("b="+typeof b+"<br>")
	document.write("c="+typeof c+"<br>")
	document.write("d="+typeof d+"<br>")
	document.write("e="+typeof e+"<br>")
	document.write("f="+typeof f+"<br>")
	let i
	document.write("i="+typeof i+"<br>")
	document.write("j="+typeof j+"<br>")
	let k='';
	document.write("k="+typeof k+"<br>") // string
	
	let o=10
	document.write("o="+typeof o+"<br>")
	o='ABC';
	document.write("o="+typeof o+"<br>")
	o={name:"홍길동"}
	document.write("o="+typeof o+"<br>")
	/*
	 	문자열 => '', "" 안쓰면 => 오류
	*/
}
</script>
</head>
<body>

</body>
</html>


