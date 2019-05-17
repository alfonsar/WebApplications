<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String cityError=(String)request.getAttribute("cityError");
	if(cityError == null || cityError.trim().length()==0){
		cityError="";
	}
%>
<html>
	<script>
	function disappear(x){
		x.value="";
	}
	window.onload=function(){
		document.getElementById("latitude").style.display="none";
		document.getElementById("longitude").style.display="none";
	}
	function disappearL(){
		document.getElementsByClassName("mytext").style.display="inline-block";
		document.getElementById("latitude").style.display="none";
		document.getElementById("longitude").style.display="none";

	}
	function disappearT(){
		document.getElementById("latitude").style.display="inline-block";
		document.getElementById("longitude").style.display="inline-block";
		document.getElementsByClassName("mytext").style.display="none";
	}

	</script>
	
	<head>
		<meta charset="UTF-8">
		<title>WeatherMeister</title>
	    <link rel="stylesheet" type="text/css" href="homeDesign.css" />
	</head>
	<div class="background-image"></div>
	<div class="vig"></div>
	<STYLE>A {text-decoration: none;} </STYLE>
	
	<body>
		<a href="homepage.jsp"> <div id="topWord"> <h1 style="font-family: Savoye LET;"> WeatherMeister </h1> </div></a>
		<img src="downloads/logo.png" alt="logo" class="center">
		<form name="classform" method="GET" action="DataServlet">
			<input type="text" name="city" value="Los Angeles" onfocus="disappear(this)"  class="mytext"/><font color="red"><%=cityError %></font><br />
			
			<div id="flass">
				<input type="image" src="downloads/magnifying_glass.jpeg" width="30" height="30" alt="Submit Form"/>	
			</div>	
				<input type="text" name="latitude" value="Latitude"  id="latitude" onfocus="disappear(this)"/>
				<input type="text" name="longitude" value="Longitude" onfocus="disappear(this)" id="longitude"/>
				
			<div id="choices">
	 			<input id="c" type="radio" name="kind" value="City" onclick="disappearL()">City 
	           	<input id="l" type="radio" name="kind" value="Lat" onclick="disappearT()" >Location (Lat/Long.) <br />
	        </div>
	     </form>
	    <form name="AllCities" method="GET" action="displayAll.jsp">
	        <input type="button" name="Display" value="Display All" class="sub" />
		</form>
	          
	</body>
</html>