package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;

/**
 * Servlet implementation class FindPasswordServlet
 */
@WebServlet("/FindPasswordServlet")
public class FindPasswordServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = null;
		String memberId = request.getParameter("memberId");
		String question_no = request.getParameter("questionNo");
		String answer  = request.getParameter("question");
		System.out.println(answer);
		try {
			String password = MemberDAO.getInstance().findPassword(memberId, question_no, answer);
			System.out.println("password: " + password);
			if(password != null) {
				request.setAttribute("password", password);
				path = "findpass-ok.jsp";
			}
			else path = "findpass-fail.jsp";
			request.getRequestDispatcher(path).forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
