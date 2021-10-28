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
 * Servlet implementation class RegisterMemberServlet
 */
@WebServlet("/RegisterMemberServlet")
public class RegisterMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");
	    String id = request.getParameter("id");
	    String password = request.getParameter("pswd");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String address = request.getParameter("address");
	    String birthday = request.getParameter("birthday");
	    int questionNo = Integer.parseInt(request.getParameter("questionNo"));
	    String answer = request.getParameter("answer");
	    
	    MemberVO vo = new MemberVO(id, email, password, name, address, birthday, null, questionNo, answer);
	    try {
            MemberDAO.getInstance().register(vo);
            //if 추가해야함
            MemberVO mvo = MemberDAO.getInstance().login(id, password);
            HttpSession session = request.getSession();
            session.setAttribute("mvo", mvo);
            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
	    
	}

}
