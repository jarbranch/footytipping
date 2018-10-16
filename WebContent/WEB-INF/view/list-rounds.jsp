<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>List Rounds</title>
</head>

<body>

<form:form action="getRound" modelAttribute="currentRound" method="GET">
	<form:select path="id">	
		
		<form:options items="${roundMap}" />

	</form:select>
	<br>
	<input type="submit" value="Get Round" />
	
</form:form>
<br>

<form:form action="${pageContext.request.contextPath}/logout" method="POST">
	<input type="submit" value="Logout" />
</form:form>
		


</body>



</html>