package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String path = null;
		
		try {
			MemberVO vo = MemberDAO.getInstance().login(id, password);
			if(vo != null) {
				HttpSession session = request.getSession();
				session.setAttribute("mvo", vo);
				path = "index.jsp";
			}
			else {
				// 추후에 index.jsp 에서 로그인 실패 alert() 띄우기
				path = "login-fail.jsp";
			}
			response.sendRedirect(path);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}