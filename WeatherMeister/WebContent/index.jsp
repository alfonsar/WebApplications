<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="alfonsar_CSCI201L_Assignment2.MyWeather"%>
<!DOCTYPE html>

<html>
	
	<head>
		<meta charset="UTF-8">
		<title>Index</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			function start(){
				window.location.replace("weatherServlet")
		
			}
		</script>
	</head>
	<body onload="start()">
	</body>
</html>