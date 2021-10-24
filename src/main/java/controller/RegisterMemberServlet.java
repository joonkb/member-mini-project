package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterMemberServlet
 */
@WebServlet("/RegisterMemberServlet")
public class RegisterMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    String id = request.getParameter("id");
	    String password = request.getParameter("password");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String address = request.getParameter("address");
	    String birthday = request.getParameter("birthday");
	    String questionNo = request.getParameter("questionNo");
	    String answer = request.getParameter("answer");
	    
	    
	}

}
