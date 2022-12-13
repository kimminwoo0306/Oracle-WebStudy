<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, com.sist.dao.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String dong=request.getParameter("dong");
	ArrayList<ZipcodeVO> list=null;
	ZipcodeDAO dao=new ZipcodeDAO();
	int count=0;
	if(dong!=null) // ����ڰ� ���� �Է� ���� ��
	{
		list=new ArrayList<ZipcodeVO>();
		list=dao.postFind(dong);
		count=dao.postCount(dong);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>�����ȣ �˻�</h1>
		<table border=0 width=600>
		<tr>
			<td>
				<form method=post action=>
				�Է�:<input type=text size=20 name=dong>
				<input type=submit value="�˻�">
				</form>
			</td>
		</tr>
		</table>
		<table border=1 bordercolor=black>
			<tr>
				<th width=20%>�����ȣ</th>
				<th width=80%>�ּ�</th>
			</tr>
			<tr>
				<td colspan="2" aligh=right>
				�˻����:<%=count %>��
				</td>
			</tr>
			<%
			if(list!=null)
			{
				for(ZipcodeVO vo:list)
				{
			%>		
						<tr>
							<td width=20%><%=vo.getZipcode() %></td>
							<td width=80%><%=vo.getAddress() %></td>
						</tr>
			<%
				}
			}
			%>
		</table>
	</center>
</body>
</html>