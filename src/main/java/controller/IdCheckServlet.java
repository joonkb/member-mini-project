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
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/IdCheckServlet")
public class IdCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String path = null;
        try {
            boolean result = MemberDAO.getInstance().idCheck(id);
            if(result) {
                path = "idcheck-fail.jsp";
            } else { 
                path = "idcheck-ok.jsp";
            }
            request.getRequestDispatcher(path).forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}







