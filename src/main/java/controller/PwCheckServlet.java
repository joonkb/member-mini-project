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
 * Servlet implementation class PwCheckServlet
 */
@WebServlet("/PwCheckServlet")
public class PwCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String pw = request.getParameter("now_pwd");
	    String path = null;
	    try {
            boolean result = MemberDAO.getInstance().pwCheck(pw);
            if (result) {
                path = "pw-check-ok.jsp";
            } else {
                path = "pw-check-fail.jsp";
            }
            response.sendRedirect(path);
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
