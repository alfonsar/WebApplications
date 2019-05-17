package alfonsar_CSCI201L_Assignment2;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage="/allCity.jsp";
		MyWeather myWeather= new MyWeather();
		myWeather.fileInput();
		String city = request.getParameter("city");
		boolean found=false;
		for(int i=0; i<myWeather.getCities().size();i++) {
			if(myWeather.getCities().get(i).city.equalsIgnoreCase(city)) {
				String cityName=myWeather.getCities().get(i).city;
				String temp_low=Integer.toString(myWeather.getCities().get(i).dayLow);
				String temp_high=Integer.toString(myWeather.getCities().get(i).dayHigh);
				
				request.setAttribute("cityName",cityName);
				request.setAttribute("temp_low",temp_low);
				request.setAttribute("temp_high", temp_high);
				found=true;
			}		
		}
		if(!found) {
			request.setAttribute("cityError","Enter a valid city");
			nextPage="/homepage.jsp";
		}
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request,response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
