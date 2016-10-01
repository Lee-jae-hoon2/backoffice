<html lang="en"><head>
<html lang="en"><%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="bower_components/morrisjs/morris.css" rel="stylesheet">

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
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0px;">
            <div class="navbar-header">
               
                <a class="navbar-brand" href="index2.jsp">�ǿ�!</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                
                <li class="dropdown">
                    
                    <a class="dropdown-toggle" aria-expanded="false" href="#" data-toggle="dropdown">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a><ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>����� ������</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>����</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>�α׾ƿ�</a>
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
                            <a href="#"><i class="fa fa-building fa-fw"></i> ������<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse in" aria-expanded="true">
                                <li>
                                    <a href="chain_submit.jsp">������ ��� ���� ����</a><!-- �ڹ� ��ũ ���� -->
                                </li>
                                <li>
                                    <a href="chain_chart.jsp">������ ���</a><!-- �ڹ� ��ũ ���� -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li class="active">
                            <a href="#"><i class="fa fa-user fa-fw"></i> ȸ��<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse in" aria-expanded="true">
                                <li>
                                    <a href="member_submit.jsp">ȸ�� ��� ���� ����</a><!-- �ڹ� ��ũ ���� -->
                                </li>
                                <li>
                                    <a href="member_chart.jsp">ȸ�� ���</a><!-- �ڹ� ��ũ ���� -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="notify.jsp"><i class="fa fa-square fa-fw"></i> �������� ����</a><!-- �ڹ� ��ũ ���� -->
                        </li>
                        
                        <li>
                            <a href="alarm.jsp"><i class="fa fa-bell-o fa-fw"></i> �˸� ����</a><!-- �ڹ� ��ũ ���� -->
                        </li>
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper" style="min-height: 912px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">������ ���</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
           <div class="row"></div><!-- �� -->
                 <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped">
                                        
                                          <!-- db���� ����, ���� -->
         <%@ page import = "java.sql.*" %>
     <%@ page import = "java.util.*" %>
    
 	<!-- /db���� ���� -->
 	
<%!
PreparedStatement pstmt, pstmt2, pstmt3=null;
ResultSet rs, rs2, rs3=null;
Connection conn = null;
 
int AllCount, DayCount, MonthCount, RestaurantCount, CafeCount, AccomodateCount, TenCount, TwoCount, ThreeCount, FourCount, FiveoverCount;
String MostshopCount;

//boolean result = false;%><!-- �ڹ� ����� -->

<%
//�ʿ��� �Լ�����
try{
Class.forName("com.mysql.jdbc.Driver");//mysql����

String url="jdbc:mysql://localhost:3306/ttowang";//url�����

conn=DriverManager.getConnection(url, "root", "1234");//����! url�̶� ���̵�� ���

pstmt=conn.prepareStatement("select count(*) from ttowang.business");
pstmt2=conn.prepareStatement("select count(*) from ttowang.business where businessInfo='pizza'");//sql�� �ʳ���, passwd ����
pstmt3=conn.prepareStatement("SELECT businessName from ttowang.business where businessId=( SELECT businessId FROM couponlist group by couponlist.businessId order by count(businessId) desc limit 1)");

rs2=pstmt2.executeQuery();
rs=pstmt.executeQuery();//��������
rs3=pstmt3.executeQuery();

if(rs.next()){
AllCount=rs.getInt(1);
}

if(rs2.next()){
	RestaurantCount=rs2.getInt(1);
}

if(rs3.next()){
	MostshopCount=rs3.getString(1);
}
	%>
	


                                            <thead>
                                                <tr>
                                                    <th>�з��׸�</th>
                                                    <th>����</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                    <td>�� ���� ��</td>
                                                    <td><%=AllCount %></td>
                                                </tr>
                                                <tr>
                                                    <td>���� ���� ��</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>���� ���� ��</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>�Ĵ�</td>
                                                    <td><%=RestaurantCount %></td>
                                                </tr>
                                                <tr>
                                                    <td>ī��</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>����</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>10��</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>20��</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>30��</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>40��</td>
                                                    <td>no</td>
                                                </tr>
                                                <tr>
                                                    <td>50�� �̻�</td>
                                                    <td>43</td>
                                                </tr>
                                                <tr>
                                                    <td>���� ���� ���� ��� �� ����</td>
                                                    <td><%=MostshopCount %></td>
                                                </tr>
                                                
                                                <%

//ajax
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt != null) try {pstmt.close();} catch (SQLException ex) {}
	if(conn != null) try {conn.close();} catch (SQLException ex) {}
	if(rs != null) try {rs.close();} catch (SQLException ex) {}
}
%>
<!-- /db���� --> 
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                <!-- ���� --> 
        </div>
            <!-- /.row -->
       

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="bower_components/raphael/raphael-min.js"></script>
    <script src="bower_components/morrisjs/morris.min.js"></script>
    <script src="js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>




</body></html>