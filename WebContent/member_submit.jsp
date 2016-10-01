<html lang="en"><head>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
     <div class="navbar-header">
               
                <a class="navbar-brand" href="index2.jsp">또왕!</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    
                    <a class="dropdown-toggle" aria-expanded="false" href="#" data-toggle="dropdown">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a><ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>사용자 프로필</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>설정</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>로그아웃</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                        
                        <li class="active">
                            <a href="#"><i class="fa fa-building fa-fw"></i> 가맹점<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse in" aria-expanded="true">
                                <li>
                                    <a href="chain_submit.jsp">가맹점 등록 정보 관리</a><!-- 자바 링크 수정 -->
                                </li>
                                <li>
                                    <a href="chain_chart.jsp">가맹점 통계</a><!-- 자바 링크 수정 -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li class="active">
                            <a href="#"><i class="fa fa-user fa-fw"></i> 회원<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse in" aria-expanded="true">
                                <li>
                                    <a href="member_submit.jsp">회원 등록 정보 관리</a><!-- 자바 링크 수정 -->
                                </li>
                                <li>
                                    <a href="member_chart.jsp">회원 통계</a><!-- 자바 링크 수정 -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="notify.jsp"><i class="fa fa-square fa-fw"></i> 공지사항 관리</a><!-- 자바 링크 수정 -->
                        </li>
                        
                        <li>
                            <a href="alarm.jsp"><i class="fa fa-bell-o fa-fw"></i> 알림 관리</a><!-- 자바 링크 수정 -->
                        </li>
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원 등록 정보 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            회원 등록 현황<!-- 자바 테이블 이름변경 -->
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>사용자코드</th>
                                            <th>이메일</th>
                                            <th>수정/탈퇴</th>
                                        </tr><!-- 테이블 맨 윗줄 th로 항목 개수설정 -->
                                    </thead>
                                    
                                    <tbody>
                                    
                                     <!-- db연동 시작, 선언 -->
         <%@ page import = "java.sql.*" %>
     <%@ page import = "java.util.*" %>
    
 	<!-- /db연동 선언 -->
 	
<%!
PreparedStatement pstmt=null;
ResultSet rs=null;
Connection conn = null;
 
int userId; String userTel; String userName; String userBirth; String userGender; int userCode; String userEmail;
//boolean result = false;%><!-- 자바 선언부 -->
<%
//필요한 함수선언
try{
Class.forName("com.mysql.jdbc.Driver");//mysql연결

String url="jdbc:mysql://localhost:3306/ttowang";//url써놓고

conn=DriverManager.getConnection(url, "root", "1234");//연결! url이랑 아이디랑 비번

pstmt=conn.prepareStatement("select * from ttowang.user");//sql문 너놓고, passwd 주의

rs=pstmt.executeQuery();//쿼리실행
while(rs.next()){
	userId=rs.getInt(1);
	userTel=rs.getString(2);
	userName =rs.getString(3);
	userBirth=rs.getString(4);
	userGender=rs.getString(5);
	userCode=rs.getInt(6);
	userEmail=rs.getString(7);
	%>
	
	
                                        <tr><!--  <tr class="odd gradeX"> -->
                                            <td><%=userId %></td>
                                            <td><%=userTel %></td>
                                            <td><%=userName %></td>
                                            <td><%=userBirth%></td>
                                            <td><%=userGender %></td>
                                            <td><%=userCode %></td>
                                            <td><%=userEmail %></td>
                                            <td>
                                            <button class="btn btn-default" type="button" OnClick="window.location='MemModify.jsp?key=<%=userId%>'">수정</button>
                                             <button class="btn btn-default" type="submit" OnClick="window.location='Member_submit_delete.jsp?key=<%=userId%>'">탈퇴</button>
                                            </td>
                                        </tr><!-- td 넣으면 순서대로 들어간다.-->
                                       <!-- 테이블 반복 -->
	<%
}

}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
	if(conn != null) try {conn.close();} catch (SQLException ex) {}
	if(rs != null) try {rs.close();} catch (SQLException ex) {}
}
%>
<!-- /db연동 --> 
                                       
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
           
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
