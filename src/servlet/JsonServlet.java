package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import model.dao.TourDao;
/**
 * Servlet implementation class JsonServlet
 */
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

		if(request.getParameter("flag").equals("add")) {
			PrintWriter out=response.getWriter();
			//장바구니에 담는 로직
			JSONObject json = new JSONObject();
			
			json.put("spotName", spotName);
			json.put("img", img);
			
			out.print(json);
		} else if(request.getParameter("flag").equals("cons")) {
			//자바스크립트로 jsp에서 목록에서 삭제하고 장바구니에서 삭제 로직
		}
	}
}
