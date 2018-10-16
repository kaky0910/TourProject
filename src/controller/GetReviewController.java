package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TourDao;
import model.vo.ReviewVO;

public class GetReviewController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
		ReviewVO rvo = TourDao.getInstance().checkReview(reviewNum);
		request.setAttribute("rvo", rvo);
		request.setAttribute("reviewNum", reviewNum);
		
		String updateContent = TourDao.getInstance().getChangeContent(rvo.getContent());
		request.setAttribute("updateContent", updateContent);
		
		ArrayList<String> ilist = TourDao.getInstance().getImages(reviewNum);
		int imgcount = ilist.size();
		request.setAttribute("imgcount", imgcount);
		request.setAttribute("ilist", ilist); /* ilist�� write.jsp�� ĳ������ �߰����ּ���~! ��...*/ 
		
		ArrayList<String> tlist = TourDao.getInstance().getTags(reviewNum);
		request.setAttribute("tlist", tlist);
		
		
		
		return new ModelAndView("updateReview.jsp");
	}
}