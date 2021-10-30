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

@WebServlet("/UpdateMemberInfoServlet")
public class UpdateMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false);
	    if(session==null || session.getAttribute("mvo")==null) { // 비로그인 상태
	        response.sendRedirect("index.jsp"); // 되돌림
	    }
	    request.setCharacterEncoding("utf-8");
	    try {
	        MemberVO vo = new MemberVO();
	        vo.setId(request.getParameter("id"));
	        vo.setPassword(request.getParameter("new_pwd"));
	        vo.setName(request.getParameter("name"));
	        vo.setEmail(request.getParameter("email"));
	        vo.setAddress(request.getParameter("address"));
	        vo.setBirthday(request.getParameter("birthday"));
	        vo.setRegdate(request.getParameter("regdate"));
	        vo.setQuestionNo(Integer.parseInt(request.getParameter("questionNo")));
	        vo.setAnswer(request.getParameter("answer"));
            MemberDAO.getInstance().updateMemberInfo(vo);
            session.setAttribute("mvo", vo);
            response.sendRedirect("update-result.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
