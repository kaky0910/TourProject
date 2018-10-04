package controller;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TourDao;
import model.vo.AttractionVO;
import model.vo.ReviewVO;

public class GetAttractionController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String city=request.getParameter("city");
		System.out.println(city);
		String sname=request.getParameter("spotName");
//		String location= request.getParameter("location");
//		String tag=request.getParameter("tag");
		//System.out.println("1111");
		/*ArrayList<ReviewVO> blist = new ArrayList<ReviewVO>();*/
//		blist = TourDao.getInstance().getBestReviewByTag(location,tag);
		ArrayList<AttractionVO> avo= TourDao.getInstance().getAttraction(city);
		System.out.println(avo);
//		request.setAttribute("blist", blist);
		request.setAttribute("avo", avo);
		System.out.println("11");
		return new ModelAndView("attraction2.jsp");
	}

}
