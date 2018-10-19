package courseBiz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.vo.AttractionVO;
import model.vo.CourseVO;
import model.vo.MemberVO;

public class CourseBiz {

	private static CourseBiz biz = new CourseBiz();

	private CourseBiz() {
	}

	public static CourseBiz getInstance() {
		return biz;
	}

	public ArrayList<CourseVO> getCourseList(HttpServletRequest request) {
		/*
		 * 세션에 바인딩된 member의 courseList 리스트 정보를 다 받아온다.
		 */
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		ArrayList<CourseVO> course = member.getCourses(); 

		return course;
	}

	public void removeAllCourse(HttpServletRequest request, int courseNum) {
		/*
		 * 세션에 바인딩된 ArrayList를 받아와서 이 중에 courseNum과 일치하는 상품을 삭제하는 로직을 작성
		 */
		ArrayList<CourseVO> cartList = (ArrayList<CourseVO>) request.getSession().getAttribute("courseList");

		for (int i = 0; i < cartList.size(); i++) {
			if (courseNum == cartList.get(i).getCourseNum())
				cartList.remove(cartList.get(i));
		}
	}

	public void removeOneCourse(String spotName, CourseVO cvo) {// ??????????????

		HashMap<Integer, AttractionVO> map = cvo.getMap();
		int x = 0;
		int y=0;
		if (!map.isEmpty()) {
			Iterator<Integer> iter = map.keySet().iterator();
			while (iter.hasNext()) {
				x = iter.next();
				if (map.get(x).getSpotName().equals(spotName)) {
					y = x;
					iter.remove();
				}
			}
			if(y>0) ddaengigi(map, y);
		}

	}

	private void ddaengigi(HashMap<Integer, AttractionVO> map, int x) {
		AttractionVO vo = null;
		if (map.keySet().contains(x+1)) {
			while (map.keySet().contains(x+1)) {
				vo = map.get(x+1);
				map.remove(x+1); // map 지우고..
				map.put(x, vo); // map에.. 지워진 자리..그니깐 1...에.. vo...put..
				x += 1;// x=x+1;..
			}
		}
	}

	public void addCourse(AttractionVO attr, CourseVO cvo) throws Exception {/// 바꿈
		// searchResult 우측에 필요한 로직
		HashMap<Integer, AttractionVO> map;
		if (cvo.getMap() != null) {
			map = cvo.getMap();
			Iterator<Integer> iter = map.keySet().iterator();
			boolean flag = false;
			while (iter.hasNext()) {
				if (map.get(iter.next()).getSpotName().equals(attr.getSpotName()))
					flag = true;
			}
			if (!flag)
				map.put(cvo.getMap().size() + 1, attr);
			else
				throw new Exception("중복불가");
		} else {
			map = new HashMap<Integer, AttractionVO>();
			map.put(1, attr);
		}
		cvo.setMap(map);
		// return map;
	}

	public void makeCourse(HttpServletRequest request, String name) {
		CourseVO vo = new CourseVO(name);
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("vo");
		member.getCourses().add(vo);
	}

	public void addCourse(HttpServletRequest request, CourseVO course) {

	}
}