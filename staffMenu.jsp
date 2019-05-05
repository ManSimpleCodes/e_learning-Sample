<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
</head>
<body>
<sql:setDataSource
	var="ds"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/elearning_db"
	user="root" password="gaurav"
/>
<%
if(session.getAttribute("prof_id")==null)
{
	response.sendRedirect(request.getContextPath()+"/user/login.jsp");
}
	HttpSession id = request.getSession();
%>
<sql:query var="listcourses" dataSource="${ds}">
SELECT *
FROM `professor_details`
    LEFT JOIN `course_details` ON `course_details`.`professor_id` = `professor_details`.`professor_id`
    WHERE `course_details`.`professor_id` = <%=id.getAttribute("prof_id") %>
    </sql:query>
<div id="sidebar" class="sidebar-fixed">
			<div id="sidebar-content">
				<div class="sidebar-search-results">
					<i class="icon-remove close"></i>
					<div class="title">Documents</div>
					<ul class="notifications">
						<li><a href="javascript:void(0);">
								<div class="col-left">
									<span class="label label-success"><i
										class="icon-file-text"></i></span>
								</div>
								
								<div class="col-right with-margin">
									<span class="message">My name is <strong>John
											Doe</strong> ...
									</span> <span class="time">briefing.docx</span>
								</div>
						</a></li>
					</ul>
					<div class="title">Persons</div>
					<ul class="notifications">
						<li><a href="javascript:void(0);">
								<div class="col-left">
									<span class="label label-danger"><i class="icon-female"></i></span>
								</div>
								<div class="col-right with-margin">
									<span class="message">Jane <strong>Doe</strong></span> <span
										class="time">21 years old</span>
								</div>
						</a></li>
					</ul>
				</div>
				<ul id="nav">
					<li class="current"><a href="index.jsp"> <i class="icon-dashboard"></i> Dashboard </a></li>
						<li class=""><a href="javascript:void(0);"> <i class="icon-edit"></i> Upload Videos </a>
							<ul class="sub-menu">
								<li class="current">
								<c:forEach var="courses" items="${listcourses.rows}">
								<a href="./uploadVlink.jsp?pid=${courses.course_id}"><i class="icon-angle-right"></i><c:out value="${courses.course_name}"></c:out></a>
								
								</c:forEach>
									<!--<a href="./uploadVlink.jsp"> <i class="icon-angle-right"></i> view </a></li>  -->
							</ul>
						</li>
						
						
						<li class=""><a href="javascript:void(0);"> <i class="icon-edit"></i> View Courses</a>
							<ul class="sub-menu">
								<li class="current">
									<c:forEach var="courses" items="${listcourses.rows}">
										<a href="./viewEnrolledStudents.jsp?id=${courses.course_id}"><i class="icon-angle-right"></i><c:out value="${courses.course_name}"></c:out></a>
										
									</c:forEach>
								</li>
							</ul>
						</li>
							
				</ul>
				<!-- <div class="sidebar-widget align-center">
					<div class="btn-group" data-toggle="buttons" id="theme-switcher">
						<label class="btn active"> <input type="radio"
							name="theme-switcher" data-theme="bright"><i
							class="icon-sun"></i> Bright
						</label> <label class="btn"> <input type="radio"
							name="theme-switcher" data-theme="dark"><i
							class="icon-moon"></i> Dark
						</label>
					</div>
				</div>-->
			</div>
			<div id="divider" class="resizeable"></div>
		</div>
</body>