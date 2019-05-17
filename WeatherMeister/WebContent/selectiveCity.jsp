<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String cityName = (String)request.getAttribute("cityName");
	String stateName = (String)request.getAttribute("stateName");
	String countryName = (String)request.getAttribute("countryName");
	String latName = (String)request.getAttribute("latName");
	String lonName = (String)request.getAttribute("lonName");
	String riseName = (String)request.getAttribute("riseName");
	String setName = (String)request.getAttribute("setName");
	String curName = (String)request.getAttribute("curName");
	String temp_low = (String)request.getAttribute("temp_low");
	String temp_high = (String)request.getAttribute("temp_high");
	String humName = (String)request.getAttribute("humName");
	String presName = (String)request.getAttribute("presName");
	String visName = (String)request.getAttribute("visName");
	String wsName = (String)request.getAttribute("wsName");
	String wdName = (String)request.getAttribute("wdName");

	String cityError=(String)request.getAttribute("cityError");
	if(cityError == null || cityError.trim().length()==0){
		cityError="";
	}

%>
<html>
	<script>
	window.onload = function(){
		document.getElementById("one").style.display="none";
		document.getElementById("two").style.display="none";
		document.getElementById("three").style.display="none";
		document.getElementById("four").style.display="none";
		document.getElementById("five").style.display="none";
		document.getElementById("six").style.display="none";
		document.getElementById("seven").style.display="none"; 
		document.getElementById("eight").style.display="none";
	}
	function disappear(x)
	{
		x.value="";
	}
	function visibility(pic,text)
	{
		document.getElementById(pic).style.display="none";
		document.getElementById(text).style.display="inline-block";
		
	}
	function hideText(text,pic)
	{
		document.getElementById(text).style.display="none";
		document.getElementById(pic).style.display="inline-block";
	}
	</script>
	<head>
		<meta charset="UTF-8">
		<title>Details Page</title>
		<link rel="stylesheet" type="text/css" href="selective.css" />
	</head>
	<div class="background-image"></div>
	<div class="vig"></div>
	<STYLE>a {text-decoration: none;} </STYLE>
	<body>
		<a href="homepage.jsp"> <div id="topWord"> <h1 style="font-family: Savoye LET;"> WeatherMeister </h1> </div></a>
		<form name="input" method="POST" action="CitySearchServlet">
		<input type="text" name="city" value="Los Angeles" onfocus="disappear(this)"  class="mytext"/><font color="red"><%=cityError %><br />
		<div class="glass"> <input type="image" src="downloads/magnifying_glass.jpeg" width="30" height="30" alt="Submit Form"/>	</div>
		</form>
		<p><%=weather.getCity()%></p>
	 	 <div class="choices">
 			<label><input id="c" type="radio" name="kind" value="City">City </label>
           	<label><input id="l" type="radio" name="kind" value="Lat">Location (Lat/Long) <br /></label>
        </div>
        <div id="locAppear" onclick="visibility('locAppear','one')"><img src="downloads/planet-earth.png"  height="150" width="150" class="loc"> <br />
        </div>
    	<div id="locT">Location</div>
    	<div id="snowAppear" onclick="visibility('snowAppear','two')"><img src="downloads/snowflake.png" height="150" width="150" class="snowflake"> <br />
    	</div>
    	<div id="snowflakeT">Temp Low</div>
    	<div id="sunAppear" onclick="visibility('sunAppear','three')"><img src="downloads/sun.png" height="150" width="150" class="sun"> <br />
    	</div>
    	<div id="sunT">Temp High</div>
    	<div id="windAppear" onclick="visibility('windAppear','four')">
    	<img src="downloads/wind.png" height="150" width="150" class="wind"> <br />
    	</div>
    	<div id="windT">Wind</div>
    	<div id="dropAppear" onclick="visibility('dropAppear','five')"><img src="downloads/drop.png" height="150" width="150" class="drop"> <br />
    	</div>
    	<div id="dropT">Humidity</div>
    	<div id="iconAppear" onclick="visibility('iconAppear','six')"> 
    	<img src="downloads/LocationIcon.png" height="150" width="150" class="icon"> <br />
    	</div>
    	<div id="iconT">Coordinates</div>
    	<div id="thermAppear" onclick="visibility('thermAppear','seven')"><img src="downloads/thermometer.png" height="150" width="150" class="therm"> <br />
    	</div>
    	<div id="thermT">Current Temp</div>
    	<div id="sunriseAppear" onclick="visibility('sunriseAppear','eight')"><img src="downloads/sunrise-icon.png" height="150" width="150" class="sunrise"> <br />
    	</div>
    	<div id="sunriseT">Sunrise/set</div>
    	<div id="one" onclick="hideText('one','locAppear')"><center><% out.println("<p>" + weather.getState() + ", " + weather.getCountry() + "</p>"); %></center></div>
    	<div id="two" onclick="hideText('two','snowAppear')"><% out.println("<p>" + weather.getDayLow() + " degrees Fahrenheit</p>"); %></div>
    	<div id="three" onclick="hideText('three','sunAppear')"><% out.println("<p>" + weather.getDayHigh() + " degrees Fahrenheit</p>"); %></div>
    	<div id="four" onclick="hideText('four','windAppear')"><% out.println("<p>" + weather.getWindspeed() + " miles/hour</p>"); %></div>
    	<div id="five" onclick="hideText('five','dropAppear')"><% out.println("<p>" + weather.getHumidity() + "%</p>"); %></div>
    	<div id="six" onclick="hideText('six','iconAppear')"><% out.println("<p>" + weather.getLatitude() + ", " + weather.getLongitude() + "</p>"); %></div>
    	<div id="seven" onclick="hideText('seven','thermAppear')"><% out.println("<p>" + weather.getCurrentTemperature() + " degrees Fahrenheit</p>"); %></div>
    	<div id="eight" onclick="hideText('eight','sunriseAppear')"><% out.println("<p>" + weather.getSunrise() + ", " + weather.getSunset() + "</p>"); %></div>
	   		
	    	
	</body>
</html>