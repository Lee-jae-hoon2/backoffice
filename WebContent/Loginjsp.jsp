<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import = "java.sql.*" %>
     <%@ page import = "java.util.*" %>
     <% request.setCharacterEncoding("utf-8"); %>
 
<%
PreparedStatement pstmt=null;
ResultSet rs=null;
Connection conn = null;
//boolean result = false;
try{
String id=request.getParameter("id");//login.jsp���� ���� ������ �о����
String pw=request.getParameter("pw");

Class.forName("com.mysql.jdbc.Driver");//mysql����

String url="jdbc:mysql://localhost:3306/ttowang";//url�����

conn=DriverManager.getConnection(url, "root", "1234");//����! url�̶� ���̵�� ���

pstmt=conn.prepareStatement("select * from ttowang.user where userId=? and userCode=?");//sql�� �ʳ���, passwd ����
pstmt.setString(1,id);//? ù��°�� id��
pstmt.setString(2,pw);//? �ι�°�� ��й�ȣ

rs=pstmt.executeQuery();//��������
if(rs.next()){

	//result=true; //�����ϸ�
	out.println(id+pw);//�׳� �ѹ� ����غ���
	session.setAttribute("ID",id);//���̵�� ���Ǹ����
	out.println("���ǿϷ�");
	response.sendRedirect("index2.jsp");
}
else{//����
	out.println("����");
}

}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
	if(conn != null) try {conn.close();} catch (SQLException ex) {}
	if(rs != null) try {rs.close();} catch (SQLException ex) {}
}
%>
