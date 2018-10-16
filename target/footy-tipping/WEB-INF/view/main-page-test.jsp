<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<title>JB Footy TIpping</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
<link type="text/css"
				rel="stylesheet"
				href="${pageContext.request.contextPath}/resources/css/main.css" />
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: 'Titillium Web', sans-serif;}
</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

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
<div  style="margin-left:300px">

  <!-- Header -->
  <header id="portfolio">
    <a href="#"><img src="${pageContext.request.contextPath}/resources/static/images/${user.name}.png" 
    	onerror="this.src = '${pageContext.request.contextPath}/resources/static/images/defaultuser.png';" style="height: 50px; width:50px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>    
    <div class="w3-container">
    
    <h1><b>Current Round</b></h1>
  </header>
  
  </div>

  <div class="w3-container w3-padding-large" style="margin-bottom:32px">
    
    <!-- Pricing Tables -->
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third w3-margin-bottom">

      </div>
      
      <div class="w3-third w3-margin-bottom">

      </div>
      
      <div class="w3-third">

      </div>
    </div>
  </div>
 

  <!-- Footer -->
  <footer class="mainFooter">

  </footer>

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