<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>view courses</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
		<script type="text/javascript" src="js/google-map.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<%
if(session.getAttribute("user_id")==null)
{
	response.sendRedirect("login.jsp");
}

String user = (String) session.getAttribute("user_id");
%>
<sql:setDataSource
	var="ds"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/elearning_db"
	user="root" password="root"
/>
<sql:query var="listcourses" dataSource="${ds}">
SELECT `registered_course`.`student_id`, `course_details`.`course_id`, `course_details`.`course_name`, `course_details`.`image`,`professor_details`.`lname`
FROM `course_details`
    LEFT JOIN `registered_course` ON `registered_course`.`course_id` = `course_details`.`course_id` 
    LEFT JOIN `professor_details` ON `course_details`.`professor_id` = `professor_details`.`professor_id`
    where registered_course.student_id=<%=user%>
</sql:query>
		<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>
		<!-- /Header -->
	<!-- Hero-area -->
	<div class="hero-area section">

		<!-- Backgound Image -->
		<div class="bg-image bg-parallax" style="background-image: url(./img/mycourses.jpg)"></div>
		<!-- /Backgound Image -->

		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 text-center">
					<ul class="hero-area-tree">
					</ul>
					<h1 class="white-text">Courses</h1>

				</div>
			</div>
		</div>
			

	</div>
	<!-- /Hero-area -->

	<!-- Blog -->
	<div id="blog" class="section">

		<!-- container -->
		<div class="container">

			<!-- row -->
			<div class="row">
						<c:forEach var="courses" items="${listcourses.rows}">
						<!-- single blog -->
						<div class="col-md-6">
							<div class="single-blog">
								<div class="blog-img">
									<a href="<%=request.getContextPath()%>/eoverView?id=${courses.course_id}"> <img style="height: 200px; width: 400px" src="<c:out value="${courses.image}"></c:out>"/>
									</a>
								</div>
								<h4>
									<a href="<%=request.getContextPath()%>/eoverView?id=${courses.course_id}"><c:out value="${courses.course_name}"></c:out></a>
								</h4>
								<div class="blog-meta">
									<span class="blog-meta-author">By: <a href="#"><c:out value="${courses.lname}"></c:out></a></span>
									<div class="pull-right">

										
									</div>
								</div>
							</div>
						</div>
						<!-- /single blog -->
						</c:forEach>

					<!-- /row -->

					</div>
				</div>
			</div>
	<!-- jQuery Plugins -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

</body>
</html>
