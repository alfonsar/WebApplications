<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String cityName = (String)request.getAttribute("cityName");
	String temp_low = (String)request.getAttribute("temp_low");
	String temp_high = (String)request.getAttribute("temp_high");
	String cityError=(String)request.getAttribute("cityError");
	if(cityError == null || cityError.trim().length()==0){
		cityError="";
	}
%>
<html>
	<script>
	function disappear(x)
	{
		x.value="";
	}
	</script>
	<head>
		<meta charset="UTF-8">
		<title>Weather Info</title>
		<link rel="stylesheet" type="text/css" href="all.css" />
	</head>
	<div class="background-image"></div>
	<div class="vig"></div>
		<STYLE>A {text-decoration: none;} </STYLE>
	<body>
		<a href="homepage.jsp"> <div id="topWord"> <h1 style="font-family: Savoye LET;"> WeatherMeister </h1> </div></a>
		<form name="input" method="GET" action="DataServlet">
		<input type="text" name="city" value="Los Angeles, CA" onfocus="disappear(this)"  class="mytext"/><font color="red"><%=cityError %><br />
				<div id=glass>
				<input type="image" src="downloads/magnifying_glass.jpeg" width="30" height="30" alt="Submit Form"/>	
				</div>
		</form>
		<p>Results</p>
		<table>
			<tr>
				<th><strong>City Name</strong></th>
				<th><strong>Temp. Low</strong></th>
				<th><strong>Temp. High</strong></th>
			</tr>
			<tr>
			 <td><a href="IconServlet?cityName=<%=cityName%>"><%=cityName %></a></td>
			    <td><%=temp_low %></td>
			    <td><%=temp_high %></td>
 			 </tr>
 			 <tr>
			    
 			 </tr>
		</table>
 			 <div class="choices">
	 			<label><input id="c" type="radio" name="kind" value="City">City </label>
	           	<label><input id="l" type="radio" name="kind" value="Lat">Location (Lat/Long) <br /></label>
	        </div>
		</div>
	</body>
</html>