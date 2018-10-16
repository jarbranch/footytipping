<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

<head>
	
	<title>Enter Tips</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
	
	<script type="text/javascript">
		$(document).ready(function() {
	        $('#roundsBox').on('change', function() {
	            this.form.submit();
	        });
	    });
	</script>

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
					<div class="panel-title" style="font-family: 'Titillium Web', sans-serif;">Enter Tips</div>
					<form:form action="getRound" modelAttribute="selectedRound" method="GET">
						<form:select id="roundsBox" path="id">	
							<form:options items="${roundMap}" />
						</form:select>
					</form:form>
				</div>
				
				<div style="padding-top: 30px" class="panel-body">

					<!-- Tips form -->
					<div>
					<form:form action="saveTips" modelAttribute="selectedRound" method="POST" id="tipsform" class="form-horizontal">
						
					    <!-- Place for messages: error, alert etc ... -->
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

						
						<form:hidden path="id" />
						
						<c:forEach var="tempGame" items="${selectedRound.games}" varStatus="row">
							<div class="tips">
							<img src="${pageContext.request.contextPath}/resources/static/images/${tempGame.homeTeam.teamName}.png" />
								
								<form:radiobuttons path="games[${row.index}].tipSelection[0].tipSelected" 
												items="${tempGame.gameOptions}" disabled="${tempGame.disabled}" name="${tempGame.id}" element="radio" />
								
								<img src="${pageContext.request.contextPath}/resources/static/images/${tempGame.awayTeam.teamName}.png" />	
							
								<h5 style="display: table-row;text-align: center;">
									<fmt:formatDate pattern="E, d MMM yyyy, h:m a" value = "${tempGame.startTime}" /> 
								</h5>
							    <h5 style="display: table-row;text-align: center;">${tempGame.ground.groundName}</h5>
									
								<br>
								<form:hidden path="games[${row.index}].id" />
								<form:hidden path="games[${row.index}].tipSelection[0].id" />				
							</div>
						</c:forEach>
						<div>

						</div>
					</form:form>
					</div>
						

				</div>
					<div style="float: right">
						<a class="btn btn-primary" href="javascript:;" onclick="document.getElementById('tipsform').submit();">Save Tips </a>
					</div>
					<div style="float: left">
						<a class="btn btn-success" href="${pageContext.request.contextPath}/tipping/main" onclick="${pageContext.request.contextPath}/tipping/main">Back </a>
					</div>
			</div>

		</div>

	</div>

</body>
</html>