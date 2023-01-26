<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
 *    ES5 -> ES6 (type="text/babel") js=>jsx(vue,react)
      = type = "text/javascript"
      
      ajax, vue, react = 사용 목적
      a.jsp == 서버 == a.jsp(새로운 jsp생성)
      ----- 종료(메모리해제)
      a.jsp (ajax) = 서버 = a.jsp
      -----               ------
        |                    |
        ---------------------- 동일한 jsp
        
        자바스크립트 : 동적 (태그제어) => 클릭, 변경, 마우스, 키보드
                                 => 데이터를 변경하기 위해서는 어느 태그에 값을 첨부, 스타일
                   1) 태그를 가지고 오는 방법 (문서객체 모델 : 335page)
                      태그 1개
                         => document.getElementById("아이디명") => 아이디 중복없는 속성
                            = Element(태그), Attribute(속성)
                              태그 <a href=""> => a는 클래스, href는 멤버변수 => object
                              모든 태그명은 클래스로 인식, 속성 멤버로 인식
                              let a=document.getElementById("aaa");
                              a.href="" a.target
                         => document.querySelector("#아이디명"); => CSS (id=#, class=.)
                         ------------------------------------------------------------ 라이브러리화 Jquery : $('#aaa') : SM(대부분 Jquery)
                            -------- 문서저장 (브라우저=출력화면)
                      태그 여러개
                         => document.getElementsByName("이름") => <input type=text name="">
                                        -------- name을 동일 (checkbox, radio)
                         => document.getElementsByClassName("클래스명")
                         => document.querySelectorAll(선택자)
                                                     ------- 태그를 선택할 때 (CSS) => 태그 선택
                         => jquery ($()), vue => v-model, react => $ref
                                           -------------  -------------
                                              양방향         단방향
                         
 */
 window.onload=function(){
     document.querySelector("h1").style.color='red'; // $("h1").css("color","red").css("backgroundColor","yellow")
     document.querySelector("h1").style.backgroundColor='pink';
     document.querySelector("h2").style.color='blue';
     document.querySelector("#id").value="admin"
     document.getElementById("id").value="hello"
  }
</script>
</head>
<body>
	<h1>Hello</h1>
	<h2>JavaScript</h2>
	<input type=text id="id" size=20>
</body>
</html>