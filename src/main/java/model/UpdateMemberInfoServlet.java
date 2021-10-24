package model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateMemberInfoServlet")
public class UpdateMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession(false);
	    if(session==null || session.getAttribute("mvo")==null) { //비로그인 상태
	        response.sendRedirect("index.jsp");
	    }
	    request.setCharacterEncoding("utf-8");
	    MemberVO vo = new MemberVO();
	    vo.setEmail(request.getParameter("email"));
	    vo.setPassword(request.getParameter("password"));
	    vo.setName(request.getParameter("name"));
	    vo.setAddress(request.getParameter("address"));
	    vo.setBirthday(request.getParameter("birthday"));
	    vo.setQuestionNo(Integer.parseInt(request.getParameter("question_no")));
	    vo.setAnswer(request.getParameter("answer"));
	    MemberDAO.getInstance().updateMemberInfo(vo);
	}
}
