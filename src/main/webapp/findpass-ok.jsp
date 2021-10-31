<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="css/bootstrap-w3c.jsp"></jsp:include>
    <link rel="stylesheet" href="css/styles.css">
	<title>비밀번호 찾기</title>
</head>
<body>
    <% String password = (String) request.getAttribute("password"); %>
    <%-- 추후에 div태그 border 표시와 문자 굵기 표시하기. --%>
    <div class="container">
        <div class="card-body">
	        <div class="align-center">
	           <p> 회원님의 비밀번호 &nbsp; <%=password %> &nbsp; 입니다.</p>
	           <a href="index.jsp" class="btn btn-danger">취소</a>
	        </div>
        </div>
    </div>
</body>
</html>