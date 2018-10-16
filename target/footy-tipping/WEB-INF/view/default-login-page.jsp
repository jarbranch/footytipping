<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<title>Login</title>
	
<style>
	.error {
		color: red;
	}
</style>
</head>

<body>

	<h3>Login to Footy Tipping</h3>
	<form:form action="${pageContext.request.contextPath}/authenticateUser" method="POST">
	
	<!-- Check for login error -->
	<c:if test="${param.error != null}">
		<i class="error">Incorrect username or password.</i>	
	</c:if>
	
		<p>
			User name: <input type="text" name="username" />
		</p>	
		
		<p>
			Password: <input type="password" name="password" />
		</p>
		
		<input type="submit" value="Login" />
	
	</form:form>


</body>


</html>