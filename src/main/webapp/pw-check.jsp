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
	<title>본인확인</title>
</head>
<body>
    <div class="container">
        <%
           MemberVO mvo = (MemberVO) session.getAttribute("mvo");
        if (mvo == null) {
        %>
        <script type="text/javascript">
            alert("로그인을 먼저 해주세요!");
            self.close();
        </script>
        <%} %>
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