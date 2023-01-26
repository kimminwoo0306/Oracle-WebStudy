<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 전역변수 = 자바에서 보내준다
let sawons=[
	{sabun:1,name:"차범근",dept:"경영부",job:"사장",pay:8000},
	{sabun:2,name:"박지성",dept:"개발부",job:"부장",pay:6000},
	{sabun:3,name:"손흥민",dept:"기획부",job:"과장",pay:5000},
	{sabun:4,name:"기성용",dept:"영업부",job:"대리",pay:4000},
	{sabun:5,name:"이강인",dept:"총무부",job:"사원",pay:2800}
]
window.onload=function(){
	sawonList();
	sawonDetail(3);
	sawonInsert();
	sawonDelete()
	sawonSlice()
}
const sawonList=function(){
	console.log(sawons)
}
const sawonDetail=(sabun)=>{
	let sawon=sawons.find(sa=>sa.sabun==sabun) // sa = {sabun:1,name:"차범근",dept:"경영부",job:"사장",pay:8000} 하나씩 갖고온다, find => JSON 1개
	console.log(sawons)
}
const sawonInsert=function(){
	sawons.push({sabun:6,name:"황인범",dept:"인사부",job:"총무",pay:3400})
	console.log(sawons)
}
const sawonDelete=()=>{
	sawons.pop();
	console.log(sawons)
}
const sawonSlice=()=>{
	let sa=sawons.slice(1,3)
	// start(배열첨자) end : 미포함
	console.log(sa);
	/*
		let arr=[1,2,3,4,5,6,7]
		let a=arr.slice(1,5)
		a=[2,3,4,5] => 페이징
	*/
}
</script>
</head>
<body>

</body>
</html>