<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원정보 수정 결과</title>
    </head>
    <body>
        <div class = "container">
            <a href="index.jsp">Home</a><hr>
            <%
            MemberVO vo = (MemberVO)session.getAttribute("mvo"); // 이름 확인 필요
            String[] question = {"나의 보물1호는?", "어린 시절 가장 좋아했던 장소는?", "가장 좋아하는 영화는?"};
            if (vo == null) {
                
                response.sendRedirect("");
            } else {
            %>
            <h2>회원정보 수정 결과</h2><br><hr><br>
            <%-- 테이블? --%>
                <%=vo.getId() %>            
                <%=vo.getName() %>
                <%=vo.getEmail() %>
                <%=vo.getAddress() %>
                <%=vo.getBirthday() %>
                <%=vo.getRegdate() %>
                <%=vo.getQuestionNo() %>
                <%=vo.getAnswer() %>
            <%} %>
        </div>
    </body>
</html>