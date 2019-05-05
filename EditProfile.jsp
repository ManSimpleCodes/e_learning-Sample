<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Edit Profile</title>
		
		<link
		href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
		<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="css/style.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
			<!-- jQuery Plugins -->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
		<script type="text/javascript" src="js/google-map.js"></script>
		<script type="text/javascript" src="js/main.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath() + "/js/gen_validatorv4.js"%>"
			type="text/javascript">
		</script>
    </head>
	<body>
	<%
if(session.getAttribute("user_id")==null)
{
	response.sendRedirect("login.jsp");
}
%>
	<!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>
		<!-- /Header -->

		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 text-center">
					<ul class="hero-area-tree">
						<li><a href="index.html">Home</a></li>
						<li>myCourses</li>
					</ul>
					<h1 class="white-text">My Courses</h1>

				</div>
			</div>
		</div>

	</div> 
	
		<!-- Contact -->
		<div id="contact" class="section">

			<!-- container -->
			<div class="container" style="margin-left: 385px">

				<!-- row -->
				<center><div class="row">

					<!-- contact form -->
					<center><div class="col-md-6">
						<div class="contact-form">
							<center><h4>Edit Profile</h4></center>
							<form action='../editProfile' method="post" name='editform' >
								<input class="input" type="text" name="fname" placeholder="First Name">
								<input class="input" type="text" name="lname" placeholder="Last Name">
							<!-- <input class="input" type="text" name="address" placeholder="Address"> -->	
								<input class="input" type="text" name="contact" placeholder="Contact Number">
								<a href="profile.jsp"><button class="main-button icon-button pull-center">Update</button></a><br><br>
							</form>
							<script language="JavaScript" type="text/javascript">
		var regvalidator = new Validator("editform");
		regvalidator.addValidation("fname","req","Please enter your first name");
		regvalidator.addValidation("fname","alpha","first name Alphabetic characters only");		
		regvalidator.addValidation("lname","req","Please enter your last name");
		regvalidator.addValidation("lname","alpha","last name Alphabetic characters only");
		regvalidator.addValidation("contact","req","Please enter your Contact number");
		</script>
						</div>
					</div></center>
					<!-- /contact form -->

				</div></center>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /Contact -->

		
	</body>
</html>