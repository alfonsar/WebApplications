package alfonsar_CSCI201L_Assignment2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/weatherServlet")
public class weatherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage="";
		MyWeather weather= new MyWeather();
		if(!flags.read) {
			weather.fileInput();
			flags.read=true;
		}
		if(flags.homePage) {
			nextPage="/homepage.jsp";
			flags.second=true;
			
		} else {
			nextPage="/ErrorPage.jsp";
		}

		
		RequestDispatcher dispatch =getServletContext().getRequestDispatcher(nextPage);
		dispatch.forward(request,response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
