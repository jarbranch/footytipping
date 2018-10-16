<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">

<head>
	
	<title>Ladder</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
	
	<link type="text/css"
				rel="stylesheet"
				href="${pageContext.request.contextPath}/resources/css/tip-selection.css" />

</head>

<body>

	<div>
		<div id="loginbox" style="margin-top: 50px;"
			class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">	
			<div class="logo">
				<p style="font-family: 'Titillium Web', sans-serif; font-size: 20px; ">
				Footy<img src="${pageContext.request.contextPath}/resources/static/images/afl.png" />Tipping
				</p>
			</div>	
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title" style="font-family: 'Titillium Web', sans-serif;">Ladder</div>
				</div>
				
				<div style="padding-top: 30px" class="panel-body">

					<table>
				
						<tr>
							<th>Name</th>
							<th>Round 1</th>
							<th>Total</th>
						</tr>
	
						<c:forEach var="tempUser" items="${ladder}" varStatus="row">
						
							<tr>
								<td style="text-align: left;"><img style="height: 25px; width: 25px; margin: 10px;" src="${pageContext.request.contextPath}/resources/static/images/${tempUser.name}.png" 
											onerror="this.src = '${pageContext.request.contextPath}/resources/static/images/defaultuser.png';"> ${tempUser.name} </td>
								<td> (${tempUser.score}) </td>
								<td> ${tempUser.score} </td>
								
							</tr>
							
							
						</c:forEach>
					
					</table>

				</div>
				
				

			</div>
			
			<div class="ladderButton">
				<a class="btn btn-success" href="${pageContext.request.contextPath}/tipping/main" onclick="${pageContext.request.contextPath}/tipping/main">Back </a>
			</div>

		</div>

	</div>

</body>
</html>