<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	response : 서버 응답에 대한 정보, 헤더 정보를 가지고 있다, 변환 정보
	=> getContentType() : 실행시 어떤 형식의 데이터인지 확인
	      text/html, textxml, text.plain
	      (HTML)     (XML)     (JSON)  => JSON/JSONP
	=> getCharacterEncoding
    => setHeader() -- 업로드 / 다운로드
    ***=> sendRedirect() => GET방식, 화면을 서버에서 변경
    *** JSP한 개의 파일에서 1개만 응답이 가능
        -----------------------------
        브라우저로 전송 : Cookie, HTML
        ------------ cookir 전송 => 다른JPS HTML
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>response 메소드 : HttpServletResponse</h1>
	전송 방식:<%= response.getContentType() %> <%-- HTML형식으로 브라우저에 보낸다, 한글처리 --%><br>
	한글 코드:<%= response.getCharacterEncoding() %>
	<%--
		한글 변환
		EUC-KR
		  전송 : EUC-KR - EUC-KR(window용, 리눅스에서 인식하지 않는다) => AWS(리눅스)
		        EUC-KR - URF-8
		        
	    UTF-8
	      전송 : UTF-8 - EUC-KR (한글 깨짐)
	            UTF-8 - UTF-8
	 --%>
</body>
</html>