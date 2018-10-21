package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vo.AttractionVO;
import model.vo.CourseVO;

public class Test implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HashMap<Integer, AttractionVO> map = new HashMap<Integer, AttractionVO>();
		map.put(1, new AttractionVO("�Ⱥ���(����)", "", "126.3753578467", "36.8042375084"));
		map.put(2, new AttractionVO("�ع̼�������(������)", "", "126.5376428206", "36.7125425452"));
		map.put(3, new AttractionVO("�ع��ⱳ", "", "126.5501331332", "36.7209917869"));
		CourseVO cvo = new CourseVO();
		cvo.setMap(map);
		request.getSession().setAttribute("cvo", cvo);
		
		return new ModelAndView("course.jsp");
	}

}
