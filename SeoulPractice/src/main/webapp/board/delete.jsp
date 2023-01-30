<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle"></h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
    <table class="table">
		<h1 class="text-center">삭제하기</h1>
		<form method="post" action="../board/delete_ok.jsp">
		<table class="table">
			<tr>
				<td width=30% class="text-right">비밀번호</td>
				<td width=70% align=left>
					<input type=password name=pwd size=15 class="input-sm" required>
					<input type=hidden name=no value="${vo.bno }">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type=submit value="삭제" class="btn btn-sm btn-danger">
					<input type=button value="취소" class="btn btn-sm btn-primary" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
		</form>
	</table>
	</div>
	</main>
	</div>
</body>
</html>