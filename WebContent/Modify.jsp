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
                    <h1 class="page-header">가맹점 등록 정보 관리</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            가맹점 등록 현황<!-- 자바 테이블 이름변경 -->
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            <form role="form" action="ModifyOk.jsp" method="post">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>사업자번호</th>
                                            <th>사업자격증</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>가게정보</th>
                                            <th>영업시간</th>
                                            <th>지도(위치)</th>
                                            <th>메뉴</th>
                                            <th>혜택</th>
                                            <th>사진</th>
                                            <th>사업Lat</th>
                                            <th>사업Lng</th>
                                            <th>수정/탈퇴</th>
                                        </tr><!-- 테이블 맨 윗줄 th로 항목 개수설정 -->
                                    </thead>
                                    
                                    <tbody>
                                    
                                     <!-- db연동 시작, 선언 -->
         <%@ page import = "java.sql.*" %>
     <%@ page import = "java.util.*" %>
     <% request.setCharacterEncoding("utf-8"); %>
 	<!-- /db연동 선언 -->
 	
<%!
PreparedStatement pstmt=null;
ResultSet rs=null;
Connection conn = null;
 
int businessId; String businessLicense; String businessName; String businessTel; String businessInfo; String businessTime; String businessAddress; String businessMenu; String businessBenefit; String businessPhoto;
String businessLat; String businessLng;
//boolean result = false;%><!-- 자바 선언부 -->
<%
//필요한 함수선언
String key=request.getParameter("key");//이건 맞으니까 밑에서 뽑아낼 수 있는거야
try{
	
Class.forName("com.mysql.jdbc.Driver");//mysql연결

String url="jdbc:mysql://localhost:3306/ttowang";//url써놓고

conn=DriverManager.getConnection(url, "root", "1234");//연결! url이랑 아이디랑 비번

pstmt=conn.prepareStatement("select * from ttowang.business where businessId="+key);//sql문 너놓고, passwd 주의

rs=pstmt.executeQuery();//쿼리실행
if(rs.next()){
	businessId=rs.getInt(1);
	businessLicense=rs.getString(2);
	businessName =rs.getString(3);
	businessTel=rs.getString(4);
	businessInfo=rs.getString(5);
	businessTime=rs.getString(6);
	businessAddress=rs.getString(7);
	businessMenu=rs.getString(8);
	businessBenefit=rs.getString(9);
	businessPhoto=rs.getString(10);
 	businessLat=rs.getString(11);
	businessLng=rs.getString(12);
	%>
	
                                        <tr><!--  <tr class="odd gradeX"> -->
                                            <td><input type="text" name="businessId" value="<%=businessId%>" style="width:100%; border: 0;">
                                          <input type="hidden" name="key2", value="<%=key%>"></td>
                                            </td>
                                            <td><input type="text" name="businessLicense" value="<%=businessLicense%>"style="width:100%; border: 0;">
                                            <td><input type="text" name="businessName" value="<%=businessName %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessTel" value="<%=businessTel %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessInfo" value="<%=businessInfo %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessTime" value="<%=businessTime %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessAddress" value="<%=businessAddress %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessMenu" value="<%=businessMenu %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessBenefit" value="<%=businessBenefit %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessPhoto" value="<%=businessPhoto %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessLat" value="<%=businessLat %>"style="width:100%; border: 0;"></td>
                                            <td><input type="text" name="businessLng" value="<%=businessLng %>"style="width:100%; border: 0;"></td>
                                            <td>
                                            <button class="btn btn-default" type="submit" OnClick="window.location='Modify.jsp?key=<%=businessId%>'">확인</button>
                                            <button class="btn btn-default" type="button" OnClick="window.location='chain_submit.jsp'">취소</button>
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
                                 </form>
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
