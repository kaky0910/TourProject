package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.TourDao;
import model.vo.CourseVO;

public class DetailCourseController implements Controller{

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
      int courseNum = Integer.parseInt(request.getParameter("courseNum"));
      String courseName = request.getParameter("courseName");
      
      CourseVO cvo = TourDao.getInstance().getCoursesByNum(courseNum,courseName);
      
      request.setAttribute("cvo", cvo);
      
      return new ModelAndView("detailCourse.jsp");
   }

}