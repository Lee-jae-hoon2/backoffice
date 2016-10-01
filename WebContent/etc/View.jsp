<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String control=request.getParameter("CONTROL");
	String pageTitle=request.getParameter("PAGETITLE");
	String content=request.getParameter("CONTENTPAGE");
	String left=control+"Left.jsp";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="100%" border="1" cellpadding="2" cellspacing="0"> 
<tr>
	<td colspan="2">
		<jsp:include page="top.jsp" flush="False" />
	</td>
</tr>
<tr>
	<td width="15%" height="700" valign="Top">
		<jsp:include page="<%=left%>" flush="false" />
	</td>
	<td width="85%" valign="top">
		<jsp:include page="<%=content%>" flush="false"/>
	</td>
</tr>
<tr>
	<td colspan="2">
	<jsp:include page="bottom.jsp" flush="false"/>
	</td>
</tr>
</table>
</body>
</html>