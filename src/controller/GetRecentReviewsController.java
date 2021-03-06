package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TourDao;
import model.vo.ReviewVO;
import service.ListVO;
import service.ReviewService;

public class GetRecentReviewsController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNo = request.getParameter("pageNo");
		boolean flag = false;
		ListVO rlist = ReviewService.getInstance().getRecentReviews(pageNo);
		request.setAttribute("rlist", rlist);
		request.setAttribute("count", Integer.parseInt(pageNo)+1);
		if(rlist.getPb().getTotalPage()==Integer.parseInt(pageNo)*10 || rlist.getList().size()%10>0)
	    	  flag=true;
		request.setAttribute("flag", flag);
		return new ModelAndView("tabResultIndex.jsp");
	}

}