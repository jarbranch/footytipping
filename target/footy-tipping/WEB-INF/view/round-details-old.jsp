<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css"
				rel="stylesheet"
				href="${pageContext.request.contextPath}/resources/css/tip-selection.css" />
				
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
		integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">

</head>
<title>Round Information</title>


<body>
<div>
	<div>
		<span class="header"> 
			<h2>${selectedRound.roundName}</h2>
			<h3><fmt:formatDate pattern="EEEE, d MMMM" value="${selectedRound.startDate}" /> - <fmt:formatDate pattern="EEEE, d MMMM yyyy" value="${selectedRound.endDate}" /></h3>
			
		</span>
	</div>
	<div class="form-group">
		<div class="col-xs-15">
			<div>
				<c:if test="${saved != null}">		            
					<div class="alert alert-success col-xs-offset-1 col-xs-10">
						<p style="font-family: 'Titillium Web', sans-serif;">${saved}</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div>
	
		<form:form action="saveTips" modelAttribute="selectedRound" method="POST" id="tipsform">
		<form:hidden path="id" />
			<c:forEach var="tempGame" items="${selectedRound.games}" varStatus="row">
				<div class="tips">
					<img src="${pageContext.request.contextPath}/resources/static/images/${tempGame.homeTeam.teamName}.png" />
					<form:radiobuttons path="games[${row.index}].tipSelection[0].tipSelected" 
									items="${tempGame.gameOptions}" disabled="${tempGame.disabled}" name="${tempGame.id}" element="radio" />
					<img src="${pageContext.request.contextPath}/resources/static/images/${tempGame.awayTeam.teamName}.png" />	
	
					<h5><fmt:formatDate  pattern="E, d MMM yyyy, h:m a" value = "${tempGame.startTime}" /> </h5>
				    <h5>${tempGame.ground.groundName}</h5>
						
					<br>
					<form:hidden path="games[${row.index}].id" />
					<form:hidden path="games[${row.index}].tipSelection[0].id" />				
				</div>
			</c:forEach>
			<div class="set green">
				<a class="btn pri ico" href="javascript:;" onclick="document.getElementById('tipsform').submit();">Save Tips </a>
			</div>
		</form:form>
		
	</div>
</div>	
		


</body>



</html>