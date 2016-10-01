<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<b>고객컨텐츠</b>
<table width="100%" border="1">
 <%
 Connection          	conn = null;
 PreparedStatement    pstmt = null;
 ResultSet          	rs = null;
    try{
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ddowang","root","1234");
    	pstmt=conn.prepareStatement("select * from ddowang.member");
    	rs = pstmt.executeQuery();
    	while(rs.next()){
    		String id=rs.getString("MemberID");
    		String phoneNo=rs.getString("MemberPhonNo");
    		String Name=rs.getString("MemberName");
    		String BirthDay=rs.getString("MemberBirthDay");
    		String JoinDate=rs.getString("MemberJoinDate");
    		%>
    	<tr>
    		<td width="100">아이디</td>
    	<td width="100">전화번호</td>
    	<td width="100">이름</td>
    	<td width="100">생일</td>
    	<td width="100">가입일</td>
    	</tr>
    	
    	<tr>
    	<td width="100"><%=id%></td>
    	<td width="100"><%=phoneNo%></td>
    	<td width="100"><%=Name%></td>
    	<td width="100"><%=BirthDay%></td>
    	<td width="100"><%=JoinDate%></td>
    	</tr>
    	<%}
    }
 catch(ClassNotFoundException e){
 	out.write("드라이버 로드 실패");
 	e.printStackTrace();
 }catch(SQLException e){
 	out.write("mysql 연결 실패");
 	e.printStackTrace();
 }
 finally{	      
     if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
     if(conn != null) try {conn.close();} catch (SQLException ex) {}
     if(rs != null) try {rs.close();} catch (SQLException ex) {}
}
    	%>
    	
</table>
</body>
</html>