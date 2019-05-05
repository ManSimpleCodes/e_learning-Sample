<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Log In</title>

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
if(session.getAttribute("user_id")!=null)
{
	response.sendRedirect("courses.jsp");
}
if((session.getAttribute("prof_id")!=null))
{
	response.sendRedirect("../professor/index.jsp");
}
%>
		<!-- Header -->
			<header id="header">
			<div class="container">

				<div class="navbar-header">
					<!-- Logo -->
					<div class="navbar-brand">
						<a class="logo" href="index.html">
							<img src="./img/site-logo.png" alt="logo">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Mobile toggle -->
					<button class="navbar-toggle">
						<span></span>
					</button>
					<!-- /Mobile toggle -->
				</div>

				<!-- Navigation -->
				<nav class="navbar">
		
		    <ul class="nav navbar-nav navbar-right">
		    <li class="active"><a href="index.jsp">Home</a></li>
		        
		
		    </ul>
		</nav>	
				<!-- /Navigation -->
			</div>
		</header>
		<!-- /Header -->

		<!-- Contact -->
		<div id="contact" class="section">

			<!-- container -->
			<div class="container" style="margin-left: 385px">

				<!-- row -->
				<center><div class="row">

					<!-- contact form -->
					<center><div class="col-md-6">
						<div class="contact-form">
							<center><h4>Login</h4></center>
							<form action="<%=request.getContextPath()%>/LogServlet" method="post" name='loginform' id='loginform'>
								<input class="input" type="text" name="username" placeholder="Email Id">
								<input class="input" type="password" name="password" placeholder="Password">
									<tr>
  					<th>Select Your Role:</th>
  				</tr>
				<tr>
  					
 			 		<td><input type='radio' name='radio' value='student'/></td><th>Student</th>
				</tr>
				<tr>
  					
  					<td><input type='radio' name='radio' value='professor'/></td><th>Professor</th>
				</tr>
<br><br>
								<button type="submit" class="main-button icon-button pull-center">Submit</button><br><br>
								
							</form>
									<script language="JavaScript" type="text/javascript">
		var regvalidator = new Validator("loginform");
		regvalidator.addValidation("username","email","Please enter valid email_id");
		regvalidator.addValidation("password","req","Please enter your Password");
		regvalidator.addValidation("radio","selone","Please select an option for role");
		</script>
							<a href="<%=request.getContextPath() %>/user/forgotPassword.jsp"><button class="main-button icon-button pull-left">Forgot Password</button></a>
								<a href="<%=request.getContextPath() %>/user/registration.jsp"><button class="main-button icon-button pull-right">Sign Up</button></a>
				
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