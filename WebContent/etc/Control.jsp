<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
request.setCharacterEncoding("euc-kr");

String product=request.getParameter("product");
String CONTROL=null;
String CONTENTPAGE=null;
String PAGETITLE=null;

if(product.equals("a")){//가맹점일 때
	CONTROL="store";
	CONTENTPAGE="storecontent.jsp";
}
else{
	CONTROL="customer";
	CONTENTPAGE="customercontent.jsp";
}
%>
<jsp:forward page="View.jsp">
<jsp:param value="<%=CONTROL%>" name="CONTROL"/>
<jsp:param value="<%=CONTENTPAGE%>" name="CONTENTPAGE"/>
</jsp:forward>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>