<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
textarea{
resize: none;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
    <h2 class="sectiontitle">수정하기</h2>
    <div style="height: 5px"></div>
    <div style="height: 550px">
		<div class="row">
			<form method="submit" action="../board/update_ok.jsp">
			<table class="table">
				<tr>
					<th class="text-center success" width=20%>이름</th>
					<td width=80%>
						<input type=text name=name size=15 class="input-sm" value="${vo.name }" required>
						<input type=hidden name=no value="${vo.bno }">
					</td>
				</tr>
				<tr>
					<th class="text-right success" width=20%>제목</th>
					<td width=80%>
						<input type=text name=subject size=50 class="input-sm" value="${vo.title }" required>
					</td>
				</tr>
				<tr>
					<th class="text-right success" width=20%>내용</th>
					<td width=80%>
						<textarea rows="10" cols="50" name=content required>${vo.content }</textarea>
					</td>
				</tr>
				<tr>
					<th class="text-right success" width=20%>비밀번호</th>
					<td width=80%>
						<input type="password" name=pwd size=10 class="input-sm" required>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type=submit class="btn btn-sm btn-info" value="수정">
						<input type=button class="btn btn-sm btn-warning" onclick="javascript:history.back()" value="취소">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	</main>
	</div>
</body>
</html>