<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
     <%@ page import = "java.util.*" %>
     <% request.setCharacterEncoding("utf-8"); %>
 
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
Connection conn = null;

try{
String key=request.getParameter("key");
Class.forName("com.mysql.jdbc.Driver");//mysql연결

String url="jdbc:mysql://localhost:3306/ttowang";//url써놓고

conn=DriverManager.getConnection(url, "root", "1234");//연결! url이랑 아이디랑 비번

pstmt=conn.prepareStatement("delete from ttowang.business where businessId="+key);//sql문 너놓고, passwd 주의

pstmt.executeUpdate();//쿼리실행
response.sendRedirect("chain_submit.jsp");
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
	if(conn != null) try {conn.close();} catch (SQLException ex) {}
	if(rs != null) try {rs.close();} catch (SQLException ex) {}
}
%>

