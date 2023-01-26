<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container {
   margin-top: 30px;
}
.row {
   width: 800px;
   margin: 0px auto;
}
</style>
<script type="text/javascript">
/*
 *   객체 지향(자바) = 매칭
     자바 SawonVO => {} (JSON)
     자바 ArrayList => Array [{},{},{},{}...]
     React : class aaa extends Component
             hooks => function aaa()
     Vue : new Vue({})
     1) Array 배열 []
        = push() : 배열에 값을 추가
        = pop() : 배열의 마지막 값을 제거
        = slice() : 원하는 위치까지 잘라서 새로운 배열을 만든다
        = indexOf() : 데이터의 위치 확인
        = find() : 검색
        = delete() : 배열을 완전 삭제
        = length() : 저장된 갯수 읽기
        = slice(), 클로저
 */
 window.onload=function(){
     // 배열 선언
     let names=[
    	 {name:"박지성"},
    	 {name:"손흥민"},
    	 {name:"이강인"},
    	 {name:"차범근"},
    	 {name:"기성용"}
     ]
     // 배열 출력
     console.log(names)
     // 배열의 크기
     console.log("인원수:"+names.length)
     // 인원 추가 -> 마지막에 추가 push
     names.push({name:"김민재"})
     // 추가된 데이터 출력
     console.log(names)
     // 추가된 배열 크기
     console.log("인원수:"+names.length)
     
     //배열 삭제
     names.pop(names)
     console.log(names)
     names.delete
     console.log(names.length)
     
 }
</script>
</head>
<body>

</body>
</html>








