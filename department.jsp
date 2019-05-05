<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>E-Learning | Manage Department</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>E-</b>L</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>E-</b>Learning</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
       
           <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
             
              <span class="hidden-xs"><%=session.getAttribute("uname") %></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
               

                <p>
                  Admin
                  
                </p>
              </li>
              <!-- Menu Body -->
            
              <!-- Menu Footer-->
              <li class="user-footer">
        
                <div class="pull-right">
                  <a href="logout.jsp" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
        
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
      <!-- Sidebar user panel -->
      
      <!-- search form -->
     
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
          <a href="dashboard.jsp">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>MANAGE MEMBERS</span>
            
          </a>
          <ul class="treeview-menu">
            <li><a href="user.jsp"><i class="fa fa-circle-o"></i> USERS</a></li>
            <li><a href="admin.jsp"><i class="fa fa-circle-o"></i> ADMIN</a></li>
            <li><a href="professor.jsp"><i class="fa fa-circle-o"></i>PROFESSOR</a></li>
          
          </ul>
		  
        </li>
		
		
		<li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>MANAGE COURSES</span>
            
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="courses.jsp"><i class="fa fa-circle-o"></i> COURSES</a></li>
            
          
          </ul>
        </li>
		 
	<li class="active treeview">
          <a href="department.jsp">
            <i class="fa fa-files-o"></i>
            <span>MANAGE DEPARTMENT</span>
            
          </a>
          
		  
        </li>
                <li class="treeview">
          <a href="viewContactus.jsp">
            <i class="fa fa-files-o"></i>
            <span>Complaints</span>
            
          </a>
          
		  
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
<sql:setDataSource
	var="ds"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/elearning_db"
	user="root" password="root"
/>
<sql:query var="listdepartment" dataSource="${ds}">
SELECT * FROM `department_details`
</sql:query>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        MANAGE DEPARTMENT
      
      </h1>
    
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Info boxes -->
      <div class="row">
       <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Department Details</h3>

        </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tr>
                  <th>Id</th>
                  <th>Department Name</th>
                  <th>Action</th>
                 
                </tr>
                <c:forEach var="department" items="${listdepartment.rows}">
                <tr>
                  <td><c:out value="${department.department_id}"></c:out></td>
                  <td><c:out value="${department.department_name}"></c:out></td>
                  <td><a href="<%=request.getContextPath()%>/deletedepartment?id=${department.department_id}"><button type="button" class="btn btn-block btn-primary btn-xs">DELETE</button></a></td>
                </tr>
               </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        
        
              <!-- /.row -->
<div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">ADD DEPARTMENT</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
           <form role="form" action="<%=request.getContextPath()%>/adddepartment" method="post">
              <div class="box-body">
			  <div class="form-group">
                  <label for="exampleInputEmail1">Department Name</label>
                  <input type="text" class="form-control" name="dname" id="exampleInputEmail1" placeholder="Enter Department Name">
                </div>
				
			</div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
          </div>
		  </div>

 
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>DOCS BOX</b> BETA
    </div>
    
  </footer>

  <!-- Control Sidebar -->
    <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
