package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/FindIdServlet")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String path = null;
		String id = MemberDAO.getInstance().findId(name, email);
		// 등록된 이메일과 이름이 존재한 경우 (회원)
		if(id != null) {
			request.setAttribute("memberId", id);
			path = "findid-ok.jsp";
		}
		// 존재하지 않는 회원인 경우
		else {
			path="findid-false.jsp";
		}
		response.sendRedirect(path);
	}
}