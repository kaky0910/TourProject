package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TourDao;
import model.vo.ReviewVO;

public class CheckReviewController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		ReviewVO rvo=TourDao.getInstance().checkReview(reviewNum);
		
		request.setAttribute("rvo", rvo);
		
		
		return new ModelAndView("checkReview.jsp");
	}

}
