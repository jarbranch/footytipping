<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">

<head>
	
	<title>Login Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
	

</head>

<body>

	<div>
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">	
			<div style="text-align: center;">
				<p style="font-family: 'Titillium Web', sans-serif; font-size: 20px; ">
				Footy<img src="${pageContext.request.contextPath}/resources/static/images/afl.png" />Tipping
				</p>
			</div>	
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title" style="font-family: 'Titillium Web', sans-serif;">Sign In</div>
				</div>
				
				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST" class="form-horizontal">
						
					    <!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>
									
								<c:if test="${param.error != null}">		            
									<div class="alert alert-danger col-xs-offset-1 col-xs-10">
										<p style="font-family: 'Titillium Web', sans-serif;">Invalid username or password.</p>
									</div>
								</c:if>
									
								<c:if test="${param.logout != null}">			            
									<div class="alert alert-success col-xs-offset-1 col-xs-10">
										<p style="font-family: 'Titillium Web', sans-serif;">You have been logged out.</p>
									</div>
								</c:if>
																
								<c:if test="${registrationSuccess != null}">			            
									<div class="alert alert-success col-xs-offset-1 col-xs-10">
										<p style="font-family: 'Titillium Web', sans-serif;">${registrationSuccess}</p>
									</div>
								</c:if>

					            </div>
					        </div>
					    </div>

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 
							
							<input type="text" name="username" placeholder="username" class="form-control"
									style="font-family: 'Titillium Web', sans-serif;">
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 
							
							<input type="password" name="password" placeholder="password" class="form-control"
									style="font-family: 'Titillium Web', sans-serif;" >
						</div>

						<!-- Login/Submit Button -->
						<div style="text-align: center;" class="form-group">						
							<div class="col-sm-6 controls">
								<button type="submit" class="btn btn-primary" 
										style="font-family: 'Titillium Web', sans-serif;">Login
								</button>
							</div>
						</div>
					<p style="text-align: center; font-family: 'Titillium Web', sans-serif;">
						<a href=${pageContext.request.contextPath}/register/newUser>Don't have an account? Register here</a>
					</p>

					</form:form>

				</div>

			</div>

		</div>

	</div>

</body>
</html>