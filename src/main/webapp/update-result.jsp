<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/i18n/defaults-*.min.js"></script>
    <title>회원정보 수정 결과</title>
</head>
<body>
    <div class = "container">
        <a href="index.jsp">Home</a><hr>
        <%
        MemberVO vo = (MemberVO)session.getAttribute("mvo");
        String[] question = {"나의 보물1호는?", "어린 시절 가장 좋아했던 장소는?", "가장 좋아하는 영화는?"};
        if (vo == null) {
        %>
        <script type="text/javascript">
            alert("해당 회원 정보가 없습니다. 다시 로그인해주시길 바랍니다.");
        </script>
        <%
            response.sendRedirect("index.jsp");
        } else {
        %>
        <h2>회원정보 수정 결과</h2><br><hr><br>
        <%-- css --%>
            <%=vo.getId() %>            
            <%=vo.getName() %>
            <%=vo.getEmail() %>
            <%=vo.getAddress() %>
            <%=vo.getBirthday() %>
            <%=vo.getRegdate() %>
            <%=question[vo.getQuestionNo()] %>
            <%=vo.getAnswer() %>
        <%} %>
    </div>
</body>
</html>