<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>비밀번호 찾기</title>
<style>
    .container { padding-top: 200px; display: grid; place-content: center; }
    .form-group { width: 300px;}
    .align-center {
       text-align: center;
    }
</style>
<title>아이디 찾기</title>
</head>
<body>
    <%
        String password = (String) request.getAttribute("password");
    %>
    <%-- 추후에 div태그 border 표시와 문자 굵기 표시하기. --%>
    <div class="container">
        <div class="card-body">
        <div class="align-center">
           <p> 회원님의 비밀번호 &nbsp; <%=password %> &nbsp; 입니다.</p>
           <a href="index.jsp" class="btn btn-danger">취소</a>
        </div>
    </div>
</body>
</html>