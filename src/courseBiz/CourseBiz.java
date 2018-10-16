package courseBiz;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.vo.AttractionVO;
import model.vo.CourseVO;
import model.vo.MemberVO;

public class CourseBiz {
   int count = 0;
   
   public ArrayList<CourseVO> getCourseList(HttpServletRequest request) {
      /*
       * 세션에 바인딩된 member의 courseList 리스트 정보를 다 받아온다.
       */
      HttpSession session = request.getSession();
      MemberVO member = (MemberVO)session.getAttribute("member");
      ArrayList<CourseVO> course = member.getCourses();
   
      return course;
   }

   public void removeAllCourse(HttpServletRequest request, int courseNum) {
      /*
       * 세션에 바인딩된 ArrayList를 받아와서
       * 이 중에 courseNum과 일치하는 상품을 삭제하는 로직을 작성 
       */
      ArrayList<CourseVO> cartList = (ArrayList<CourseVO>)request.getSession().getAttribute("courseList");
      
      for(int i = 0; i < cartList.size(); i++) {
         if(courseNum == cartList.get(i).getCourseNum())
            cartList.remove(cartList.get(i));
      }
   }
   
   public void removeOneCourse(HttpServletRequest request, int attrNum) {
      CourseVO course = new CourseVO();
      HashMap<Integer, AttractionVO> map = course.getMap();
      
      if(!map.isEmpty()) {
         for(int i = 0; i < map.size(); i++) {
            if(map.get(attrNum) != null) {
               map.remove(attrNum);
            }
         }
      }
      
   }
   
   public HashMap<Integer, AttractionVO> addCourse(HttpServletRequest request, AttractionVO attr) {
      // searchResult 우측에 필요한 로직
      CourseVO course = new CourseVO();
      HashMap<Integer, AttractionVO> map = new HashMap<Integer, AttractionVO>();
      map.put(count + 1, attr);
      course.setMap(map);
      
      return map;
   }
   
   public void makeCourse(HttpServletRequest request,String name) {
      CourseVO vo = new CourseVO(name);
      HttpSession session = request.getSession();
      MemberVO member = (MemberVO)session.getAttribute("member");
      member.getCourses().add(vo);
   }
   
   public void addCourse(HttpServletRequest request, CourseVO course) {
      
   }
}