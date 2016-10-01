<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>

    <%
    Class.forName("com.mysql.jdbc.Driver");
    
    String url="jdbc:mysql://localhost:3306/ddowang";
    
    
    Connection conn=DriverManager.getConnection(url, "root", "1234");
    PreparedStatement pstmt=conn.prepareStatement("SELECT * FROM ddowang.member");
    
    ResultSet rs=pstmt.executeQuery();
    
    while(rs.next()){
       String id=rs.getString(1);
       String passwd=rs.getString(2);
       out.println(id+passwd);
    }
    rs.close();
    pstmt.close();
    conn.close();
    
 
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br>끝<br>
</body>
</html>