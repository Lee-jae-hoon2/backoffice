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
Class.forName("com.mysql.jdbc.Driver");//mysql����

String url="jdbc:mysql://localhost:3306/ttowang";//url�����

conn=DriverManager.getConnection(url, "root", "1234");//����! url�̶� ���̵�� ���

pstmt=conn.prepareStatement("delete from ttowang.user where userId="+key);//sql�� �ʳ���, passwd ����

pstmt.executeUpdate();//��������
response.sendRedirect("member_submit.jsp");
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
	if(conn != null) try {conn.close();} catch (SQLException ex) {}
	if(rs != null) try {rs.close();} catch (SQLException ex) {}
}
%>

