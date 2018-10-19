package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import courseBiz.CourseBiz;
import model.dao.TourDao;
import model.vo.AttractionVO;
import model.vo.CourseVO;
import model.vo.MemberVO;

@WebServlet("/JsonServlet")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public JsonServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String spotName = request.getParameter("spotName");
		String img = request.getParameter("img");
		String address = request.getParameter("address");
		CourseVO cvo = (CourseVO)request.getSession().getAttribute("cvo");
		JSONObject json = new JSONObject();
		PrintWriter out=response.getWriter();

		if(request.getSession().getAttribute("cvo")==null) cvo = new CourseVO();
		try {
			if(request.getParameter("flag").equals("add")) {
				//장바구니에 담는 로직
				CourseBiz.getInstance().addCourse(new AttractionVO(spotName, address, img), cvo);
				
				json.put("spotName", spotName);
				json.put("img", img);
			} else if(request.getParameter("flag").equals("cons")&&cvo.getMap()!=null) {
				//자바스크립트로 jsp에서 목록에서 삭제하고 장바구니에서 삭제 로직
				System.out.println("111111111111111"+cvo.getMap());
				CourseBiz.getInstance().removeOneCourse(spotName, cvo);
				System.out.println("222222222222222"+cvo.getMap());
				json.put("str", cvo.getAllCourse());
			}
		}catch (Exception e) {e.printStackTrace();}
		request.getSession().setAttribute("cvo", cvo);
		out.print(json);

	}
}
