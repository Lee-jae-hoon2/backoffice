<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
     <%@ page import = "java.util.*" %>
     <% request.setCharacterEncoding("euc-kr"); %>

<%
PreparedStatement pstmt=null;
ResultSet rs=null;
Connection conn = null;
String key2=request.getParameter("key2");//잘넘어옴
	int businessId=Integer.parseInt(request.getParameter("businessId"));
	String businessLicense=request.getParameter("businessLicense");
	String businessName=request.getParameter("businessName");
	String businessTel=request.getParameter("businessTel");
	String businessInfo=request.getParameter("businessInfo");
	String businessTime=request.getParameter("businessTime");
	String businessAddress=request.getParameter("businessAddress");
	String businessMenu=request.getParameter("businessMenu");
	String businessBenefit=request.getParameter("businessBenefit");
	String businessPhoto=request.getParameter("businessPhoto");
	String businessLat=request.getParameter("businessLat");
	String businessLng=request.getParameter("businessLng");
	out.println(businessId);
	out.println(businessLicense);
	out.println(businessName);
	out.println(businessTel);
	out.println(businessInfo);
	out.println(businessTime);
	out.println(businessAddress);
	out.println(businessMenu);
	out.println(businessBenefit);
	out.println(businessPhoto);
	out.println(businessLat);
	out.println(businessLng);
try{
Class.forName("com.mysql.jdbc.Driver");//mysql연결

String url="jdbc:mysql://localhost:3306/ttowang?useUnicode=true& useUnicode=true&characterEncoding=euc_kr";//ttowang뒤에 이렇게 해야 db에 넣을 때 한글 안깨진다.

conn=DriverManager.getConnection(url, "root", "1234");//연결! url이랑 아이디랑 비번

pstmt=conn.prepareStatement("update ttowang.business set businessId=?, businessLicense=?, businessName=?, businessTel=?, businessInfo=?, businessTime=?, businessAddress=?, businessMenu=?, businessBenefit=?, businessPhoto=?, businessLat=?, businessLng=? where businessId=?");
pstmt.setInt(1, businessId);
pstmt.setString(2, businessLicense);
pstmt.setString(3, businessName);
pstmt.setString(4, businessTel);
pstmt.setString(5, businessInfo);
pstmt.setString(6, businessTime);
pstmt.setString(7, businessAddress);
pstmt.setString(8, businessMenu);
pstmt.setString(9, businessBenefit);
pstmt.setString(10, businessPhoto);
pstmt.setString(11, businessLat);
pstmt.setString(12, businessLng);
pstmt.setString(13, key2);


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

