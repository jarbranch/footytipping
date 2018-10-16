<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<title>JB Footy Tipping</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">

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


<style>
body,h1,h2,h3,h4,h5,h6 {font-family: 'Titillium Web', sans-serif;}
</style>
<body class="mainDiv w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      
    </a>
    
    <div style="text-align: center;">
		<p style="font-family: 'Titillium Web', sans-serif; font-size: 18px; margin: 0px; margin-bottom: 20px; ">
			Footy<img src="${pageContext.request.contextPath}/resources/static/images/afl.png" />Tipping
		</p>
				
	</div>
    <img src="${pageContext.request.contextPath}/resources/static/images/${user.name}.png" 
    	onerror="this.src = '${pageContext.request.contextPath}/resources/static/images/defaultuser.png';" style="width:50px; height: 50px;" class="w3-round"><br>
    <h4><b>${user.name}</b></h4>
    <p class="w3-text-grey">${user.userName}</p>
  </div>
  <div class="w3-bar-block">
  
  <form:form action="${pageContext.request.contextPath}/logout"  method="POST" id="logoutform"></form:form>
    <a href="${pageContext.request.contextPath}/tipping/list" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fas fa-edit fa-fw w3-margin-right"></i>Enter Tips</a> 
    <a href="${pageContext.request.contextPath}/tipping/ladder" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fas fa-bars fa-fw w3-margin-right"></i>View Ladder</a> 
    <a href="javascript:;" onclick="document.getElementById('logoutform').submit();" class="w3-bar-item w3-button w3-padding"><i class="fas fa-sign-out-alt fa-fw w3-margin-right"></i>Log Out</a>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="${pageContext.request.contextPath}/resources/static/images/${user.name}.png" 
    	onerror="this.src = '${pageContext.request.contextPath}/resources/static/images/defaultuser.png';" style="height: 50px; width:50px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    <h3><b>Current Round: ${selectedRound.roundName}</b></h3>
    <h4>
    	<fmt:formatDate pattern="EEEE, d MMMM" value = "${selectedRound.startDate}" /> - 
    	<fmt:formatDate pattern="EEEE, d MMMM yyyy" value = "${selectedRound.endDate}" />
    </h4>
    <div class="w3-section w3-bottombar w3-padding-16">

    </div>
    </div>
  </header>
  
  <!-- First Photo Grid-->
  <div>
		<div id="loginbox"	class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">	
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
							<a class="btn btn-primary" href="javascript:;" onclick="document.getElementById('tipsform').submit();">Save Tips </a>
						</div>
					
					</form:form>
					</div>
						

				</div>

		</div>

	</div>
</div>

<!-- End page content -->
</div>

<script>
// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>