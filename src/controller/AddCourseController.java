package controller;

import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddCourseController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("11");
		String spotName = request.getParameter("spotName");
		String location = request.getParameter("location");
		System.out.println(spotName+"   "+location);
		PrintWriter pw = response.getWriter();
		pw.print("{'spotName':'"+spotName+"'}");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("spotName", spotName);
		
		return new ModelAndView("searchResult.jsp");
	}

}
