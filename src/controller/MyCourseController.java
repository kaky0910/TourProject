package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CListVO;
import service.ReviewService;

public class MyCourseController implements Controller{

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String id = request.getParameter("id");
      String pageNo = request.getParameter("pageNo");
      
      CListVO mcourse= ReviewService.getInstance().getCourses(id,pageNo);
      
      request.setAttribute("mcourse", mcourse);
      
      return new ModelAndView("myCourse.jsp");
   }

}