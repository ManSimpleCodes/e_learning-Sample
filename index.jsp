<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="function" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>Dashboard</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="css/jquery.ui.1.10.2.ie.css"/><![endif]-->
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/plugins.css" rel="stylesheet" type="text/css" />
<link href="css/responsive.css" rel="stylesheet" type="text/css" />
<link href="css/icons.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css">
<!--[if IE 7]><link rel="stylesheet" href="css/font-awesome-ie7.min.css"><![endif]-->
<!--[if IE 8]><link href="css/ie8.css" rel="stylesheet" type="text/css"/><![endif]-->

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/lodash.compat.min.js"></script>
<!--[if lt IE 9]><script src="jshtml5shiv.js"></script><![endif]-->
<script type="text/javascript" src="js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="js/jquery.event.move.js"></script>
<script type="text/javascript" src="js/jquery.event.swipe.js"></script>
<script type="text/javascript" src="js/breakpoints.js"></script>
<script type="text/javascript" src="js/respond.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.min.js"></script>
<script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="js/jquery.slimscroll.horizontal.min.js"></script>
<!--[if lt IE 9]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
<script type="text/javascript" src="js/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="js/jquery.flot.min.js"></script>
<script type="text/javascript" src="js/jquery.flot.tooltip.min.js"></script>
<script type="text/javascript" src="js/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="js/jquery.flot.time.min.js"></script>
<script type="text/javascript" src="js/jquery.flot.growraf.min.js"></script>
<script type="text/javascript" src="js/jquery.easy-pie-chart.min.js"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/daterangepicker.js"></script>
<script type="text/javascript" src="js/jquery.blockUI.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.min.js"></script>
<script type="text/javascript" src="js/jquery.noty.js"></script>
<script type="text/javascript" src="js/top.js"></script>
<script type="text/javascript" src="js/default.js"></script>
<script type="text/javascript" src="js/jquery.uniform.min.js"></script>
<script type="text/javascript" src="js/select2.min.js"></script>
<script type="text/javascript" src="js/app.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<script type="text/javascript" src="js/plugins.form-components.js"></script>
<script>
	$(document).ready(function() {
		App.init();
		Plugins.init();
		FormComponents.init()
	});
</script>
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript" src="js/pages_calendar.js"></script>
<script type="text/javascript" src="js/chart_filled_blue.js"></script>
<script type="text/javascript" src="js/chart_simple.js"></script>
</head>
<body>

<%
if(session.getAttribute("prof_id")==null)
{
	response.sendRedirect(request.getContextPath()+"/user/login.jsp");
}
String user = (String) session.getAttribute("user_id");

HttpSession httpSession = request.getSession();
%>
 <sql:setDataSource
	var="ds"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/elearning_db"
	user="root" password="root"
/>
 <sql:query var="listcourses" dataSource="${ds}">
SELECT *
FROM `professor_details`
    LEFT JOIN `course_details` ON `course_details`.`professor_id` = `professor_details`.`professor_id`
    WHERE `course_details`.`professor_id` = <%=httpSession.getAttribute("prof_id") %>

</sql:query>


	<jsp:include page="header.jsp"></jsp:include>

	
	<div id="container">
	
	
		<!-- <div id="content">-->
			<div class="container">
				<div class="page-header">
					<div class="page-title">
						<h3>Courses Taught</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="container">

				<!-- row -->
						<div class="row">
			
							<div class="container">
			
			
								<!-- Mobile toggle -->
								<button class="navbar-toggle">
									<span></span>
								</button>
								<!-- /Mobile toggle -->
							</div>
			
							<!-- Navigation -->
						<c:forEach var="courses" items="${listcourses.rows}">
						<!-- single blog -->
						<div class="col-md-6">
							<div class="single-blog">
								<a href="./uploadVlink.jsp?id=${courses.course_id}">
								<div class="blog-img">
									 <img style="height: 200px; width: 400px" src="../user/<c:out value="${courses.image}"></c:out>"/>
									
								</div>
								<h4>
									<c:out value="${courses.course_name}"></c:out>
								</h4>
								</a>
								<div class="blog-meta">
									
									<div class="pull-right">

										
									</div>
								</div>
							</div>
						</div>
						<!-- /single blog -->
						</c:forEach>
							<!-- /Navigation -->
			
						</div>
				</div>
				<!-- row -->

			</div>
					</div>
				</div>
				</div>
				
</body>
</html>