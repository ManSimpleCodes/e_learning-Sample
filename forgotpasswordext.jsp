<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>update password</title>

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
		<style>
		select
		{
			height: 40px;
		    width: 100%;
		    border: 1px solid #EBEBEB;
			border-radius:4px;
			background: transparent;
		    padding-left: 15px;
			padding-right: 15px;
			-webkit-transition:0.2s border-color;
			transition:0.2s border-color;
			margin-bottom: 20px;
		}
		</style>
		    	<style type="text/css">
#passwordStrength
{
        height:15px;
        display:block;
        float:left;
}
.strength0
{
        width:250px;
        background:#cccccc;
}
.strength1
{
        width:40px;
        background:#ff0000;
}
.strength2
{
        width:75px;
        background:#ff5f5f;
}
.strength3
{
        width:150px;
        background:#56e500;
}
.strength4
{
        background:#399800;
        width:200px;
}

</style>
<script TYPE="text/javascript">
function passwordStrength(password)
{
        var desc = new Array();
        desc[0] = "Very Weak";
        desc[1] = "Weak";
        desc[2] = "Better";
        desc[3] = "Good";
        desc[4] = "Strong";
        var score   = 0;

        //if password bigger than 10 give 1 point

        if (password.length > 10) score++;

        //if password has both lower and uppercase characters give 1 point

        if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/) ) ) score++;

        //if password has at least one number give 1 point

        if (password.match(/d+/)) score++;

        //if password has at least one special caracther give 1 point

        if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;

         document.getElementById("passwordDescription").innerHTML = desc[score];
         document.getElementById("passwordStrength").className = "strength" + score;
}
</script>
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
	  <!-- Header -->
			<jsp:include page="header.jsp"></jsp:include>
		<!-- /Header -->

		<nav class="navbar">
		
		    <ul class="nav navbar-nav navbar-left">
		    <li class="active"><a href="index.jsp">Home</a></li>
		</ul></nav>
		<!-- Contact -->
		<div id="contact" class="section">

			<!-- container -->
			<div class="container" style="margin-left: 385px">

				<!-- row -->
				<center><div class="row">

					<!-- contact form -->
					<center><div class="col-md-6">
						<div class="contact-form">
							<center><h4>Update Password</h4></center>
							<form name='forgotpasswordext' id='forgotpasswordext' action='<%=request.getContextPath()%>/ForgotPasswordServlet' method="post">
								<input class="input" type="text" name="email" placeholder="Email">
								<div id="passwordDescription"></div>
								<div id="passwordStrength" class="strength0"></div>							
								<input class="input" type="password" name="password" placeholder="new Password" id="password" onkeyup="passwordStrength(this.value)">
								
								<input class="input" type="password" name="conpassword" placeholder="Confirm new Password">
							
								<a href="courses.jsp"><button class="main-button icon-button pull-center">Submit</button></a><br><br>
							</form>
							${message}
							<script language="JavaScript" type="text/javascript">
		var regvalidator = new Validator("updateform");
		
		regvalidator.addValidation("password","req","Please enter your new Password");
		regvalidator.addValidation("conpassword","req","Please enter your new Confirm Password");
		function DoPasswordValidation()	{
		  var regcheck = document.forms["updateform"];
		  if(regcheck.password.value != regcheck.conpassword.value)	{
		    sfm_show_error_msg('Password and confirm password does not match!,please re-enter again',regcheck.password);
		    regcheck.password.value="";
		    regcheck.conpassword.value="";
		    return false;
		  }
		  else 
		    return true;
		}
		regvalidator.setAddnlValidationFunction(DoPasswordValidation);
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