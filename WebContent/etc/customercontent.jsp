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
<b>��������</b>
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
    		<td width="100">���̵�</td>
    	<td width="100">��ȭ��ȣ</td>
    	<td width="100">�̸�</td>
    	<td width="100">����</td>
    	<td width="100">������</td>
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
 	out.write("����̹� �ε� ����");
 	e.printStackTrace();
 }catch(SQLException e){
 	out.write("mysql ���� ����");
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