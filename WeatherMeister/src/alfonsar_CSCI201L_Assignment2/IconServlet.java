package alfonsar_CSCI201L_Assignment2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IconServlet
 */
@WebServlet("/IconServlet")
public class IconServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage="/selectiveCity.jsp";
		MyWeather myWeather= new MyWeather();
		myWeather.fileInput();
		boolean found=false;
		String city = request.getParameter("cityName");
		for(int i=0; i<myWeather.getCities().size();i++) {
			if(myWeather.getCities().get(i).city.equalsIgnoreCase(city)) {
				String cityName=myWeather.getCities().get(i).city;
				String stateName=myWeather.getCities().get(i).state;
				String countryName=myWeather.getCities().get(i).country;
				String latName=Double.toString(myWeather.getCities().get(i).dayLow);
				String lonName=Double.toString(myWeather.getCities().get(i).dayLow);
				String riseName=myWeather.getCities().get(i).rise;
				String setName=myWeather.getCities().get(i).set;
				String curName=Integer.toString(myWeather.getCities().get(i).c_temp);
				String temp_low=Integer.toString(myWeather.getCities().get(i).dayLow);
				String temp_high=Integer.toString(myWeather.getCities().get(i).dayHigh);
				String humName=	Integer.toString(myWeather.getCities().get(i).hum);
				String presName=Float.toString(myWeather.getCities().get(i).pressure);
				String visName=Float.toString(myWeather.getCities().get(i).visibility);
				String wsName=Float.toString(myWeather.getCities().get(i).windSpeed);
				String wdName=Integer.toString(myWeather.getCities().get(i).windDirection);
				
				request.setAttribute("cityName",cityName);
				request.setAttribute("stateName",stateName);
				request.setAttribute("countryName",countryName);
				request.setAttribute("latName",latName);
				request.setAttribute("lonName",lonName);
				request.setAttribute("riseName",riseName);
				request.setAttribute("setName",setName);
				request.setAttribute("curName",curName);
				request.setAttribute("temp_low",temp_low);
				request.setAttribute("temp_high", temp_high);
				request.setAttribute("humName",humName);
				request.setAttribute("presName",presName);
				request.setAttribute("visName",visName);
				request.setAttribute("wsName",wsName);
				request.setAttribute("wdName",wdName);
				found=true;
			}
		}
		if(!found) {
			request.setAttribute("cityError","Enter a valid city");
			nextPage="/allCity.jsp";
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request,response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
