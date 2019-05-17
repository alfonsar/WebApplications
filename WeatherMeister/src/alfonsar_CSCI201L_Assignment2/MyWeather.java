package alfonsar_CSCI201L_Assignment2;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;

public class MyWeather {
	String city;
	String state;
	String country;
	double lat;
	double lon;
	String rise;
	String set;
	int c_temp;
	int dayLow;
	int dayHigh;
	int hum;
	float pressure;
	float visibility;
	float windSpeed;
	int windDirection;
	String reader;
	private ArrayList<String> conditions = new ArrayList<String>();
	private ArrayList<MyWeather> cities = new ArrayList<MyWeather>();

	MyWeather () {
		
	}
	public void parser(String parse)
	{
		//method that parses the string line input with | as the delimiter 
		StringTokenizer s1 = new StringTokenizer(parse, "|");
		//grab the # of parameters
		int count=s1.countTokens();
		//if parameters count is less than 10, there are not enough parameters 
		//so throw exception
		if(count<15) {
			flags.homePage=false;
		}
		//read in each parameter and assign it to appropriate variable
		while(s1.hasMoreTokens()) {
			city=s1.nextToken();
			try {
				state=s1.nextToken();
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				country=s1.nextToken();
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				reader=s1.nextToken();
				lat=Double.parseDouble(reader);
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				reader=s1.nextToken();
				lon=Double.parseDouble(reader);
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				rise=s1.nextToken();
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				set=s1.nextToken();
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				reader=s1.nextToken();
				c_temp=Integer.parseInt(reader);
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				reader=s1.nextToken();
				dayLow=Integer.parseInt(reader);
			} catch(NumberFormatException nfe)
			{
				flags.homePage=false;
			}
			try {
				reader=s1.nextToken();
				dayHigh=Integer.parseInt(reader);
			} catch(NumberFormatException nfe) {
				flags.homePage=false;

			}
			try {
				reader=s1.nextToken();
				hum=Integer.parseInt(reader);
			}   catch(NumberFormatException nfe) {
				flags.homePage=false;

			} 
			try {
				reader=s1.nextToken();
				pressure=Float.parseFloat(reader);
			}  catch(NumberFormatException nfe) {
				flags.homePage=false;

			} 
			try {
				reader=s1.nextToken();
				visibility=Float.parseFloat(reader);
			} catch (NumberFormatException nfe) {
				flags.homePage=false;

			}
			try {
				reader=s1.nextToken();
				windSpeed=Float.parseFloat(reader);
			} catch (NumberFormatException nfe) {
				flags.homePage=false;

			} 
			try {
				reader=s1.nextToken();
				windDirection=Integer.parseInt(reader);
			} catch (NumberFormatException nfe) {
				flags.homePage=false;
			}
			//since we do not know how many conditions there could be
			//we use a while loop until there are no more tokens 
			while(s1.hasMoreTokens())
			{
				conditions.add(s1.nextToken());
			}
			
		}
	}

	public void fileInput () {
	
	try {
		
		URL url = getClass().getResource("/../../weather.txt"); 
	

		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
		//an array list of city objects (i called mine weather)

		
		//store the whole line of data in line
	
		String line = br.readLine();
		//will keep reading in lines till it reaches end of file
		while(line!=null)
		{
			//create an object
			MyWeather adder = new MyWeather();
			//call parse on it 
			adder.parser(line);
			//push the weather object into arrayList
			getCities().add(adder);
			//read in next line
			line = br.readLine();
		}
		//close files and reader
		br.close();
		//now call choices which will ask the user what city
		//information they want
		
	}catch (FileNotFoundException fnfe) {
		flags.homePage=false;
	}  
	catch (IOException ioe) {
		flags.homePage=false;
	} catch(NullPointerException npe) {
		flags.homePage=false;
	} catch(NoSuchElementException nse) {
		flags.homePage=false;

	} 
	}
	public ArrayList<MyWeather> getCities() {
		return cities;
	}
	public void setCities(ArrayList<MyWeather> cities) {
		this.cities = cities;
	}
}
