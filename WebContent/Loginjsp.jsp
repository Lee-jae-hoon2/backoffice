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
String id=request.getParameter("id");//login.jsp에서 보낸 데이터 읽어오기
String pw=request.getParameter("pw");

Class.forName("com.mysql.jdbc.Driver");//mysql연결

String url="jdbc:mysql://localhost:3306/ttowang";//url써놓고

conn=DriverManager.getConnection(url, "root", "1234");//연결! url이랑 아이디랑 비번

pstmt=conn.prepareStatement("select * from ttowang.user where userId=? and userCode=?");//sql문 너놓고, passwd 주의
pstmt.setString(1,id);//? 첫번째에 id랑
pstmt.setString(2,pw);//? 두번째에 비밀번호

rs=pstmt.executeQuery();//쿼리실행
if(rs.next()){

	//result=true; //성공하면
	out.println(id+pw);//그냥 한번 출력해보기
	session.setAttribute("ID",id);//아이디로 세션만들기
	out.println("세션완료");
	response.sendRedirect("index2.jsp");
}
else{//실패
	out.println("실패");
}

}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
	if(conn != null) try {conn.close();} catch (SQLException ex) {}
	if(rs != null) try {rs.close();} catch (SQLException ex) {}
}
%>
