<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
     <%@ page import = "java.util.*" %>
     <% request.setCharacterEncoding("euc-kr"); %>

<%
PreparedStatement pstmt=null;
ResultSet rs=null;
Connection conn = null;
String key2=request.getParameter("key2");//�߳Ѿ��

	int userId=Integer.parseInt(request.getParameter("userId"));
	String userTel=request.getParameter("userTel");
	String userName=request.getParameter("userName");
	String userBirth=request.getParameter("userBirth");
	String userGender=request.getParameter("userGender");
	int userCode=Integer.parseInt(request.getParameter("userCode"));
	String userEmail=request.getParameter("userEmail");
	
	out.println(userId);
	out.println(userTel);
	
try{
Class.forName("com.mysql.jdbc.Driver");//mysql����

String url="jdbc:mysql://localhost:3306/ttowang?useUnicode=true& useUnicode=true&characterEncoding=euc_kr";//ttowang�ڿ� �̷��� �ؾ� db�� ���� �� �ѱ� �ȱ�����.

conn=DriverManager.getConnection(url, "root", "1234");//����! url�̶� ���̵�� ���

pstmt=conn.prepareStatement("update ttowang.user set userId=?, userTel=?, userName=?, userBirth=?, userGender=?, userCode=?, userEmail=? where userId=?");
pstmt.setInt(1, userId);
pstmt.setString(2, userTel);
pstmt.setString(3, userName);
pstmt.setString(4, userBirth);
pstmt.setString(5, userGender);
pstmt.setInt(6, userCode);
pstmt.setString(7, userEmail);
pstmt.setString(8, key2);

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

