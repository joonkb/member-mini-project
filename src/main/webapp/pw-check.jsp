<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>본인확인</title>
</head>
<body>
<div class="container">
    <% MemberVO vo = (MemberVO) session.getAttribute("mvo"); %>
    <script type="text/javascript">
        if (<%=vo %> == null) {
            alert("로그인을 먼저 해주세요!");
            self.close();
        }
    </script>
    <form action="PwCheckServlet" method="post">
        <div class="form-group">
	        <label for="pwd">현재 비밀번호:</label> 
	        <input type="password" class="form-control" value="" name="now_pwd" required="required">
        </div><br>
        <button class="btn btn-primary">입력</button>
    </form>
</div>
</body>
</html>