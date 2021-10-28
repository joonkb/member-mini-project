<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
	    .align-center {
		   text-align: center;
		}
	</style>
	<script type="text/javascript">
	    function logout(){
	        document.getElementById("logoutForm").submit();
	    }
	</script>
</head>
<body>
    <% MemberVO vo = (MemberVO) session.getAttribute("mvo"); %>
	<div class="container pt-5">
	    <h3>홈페이지</h3>
	    <div class="card">
		    <div class="card-header">
		        <%-- 비로그인 상태인 경우 로그인 폼 제공 --%>
		        <% if(vo == null) { %>
                <form class="form-inline" action="LoginServlet" method="post">
	                <label for="id" class="mb-2 mr-sm-2">아이디:</label>
	                <input type="text" class="form-control mb-2 mr-sm-2" id="id" placeholder="아이디" name="id">
	                <label for="password" class="mb-2 mr-sm-2">비밀번호:</label>
	                <input type="password" class="form-control mb-2 mr-sm-2" id="password" placeholder="비밀번호" name="password">
	                <button type="submit" class="btn btn-info">로그인</button>&nbsp;
		            <a href="findid.jsp" class="btn btn-info">아이디찾기</a>&nbsp;
		            <a href="findid.jsp" class="btn btn-info">비밀번호찾기</a>
	            </form>
	            <% } else { %>
                <%-- 
                    로그인 했을경우 로그아웃 버튼 제공
                    추후에 버튼 위치 조정할 예정
                --%>
	                <%=vo.getId() %> 님 안녕하세요
                    <form action="LogoutServlet" method="post" id="logoutForm"></form>  
                    <a href="#" class="btn btn-danger" onclick="logout()">로그아웃</a>
	            <% } %>
    		    </div>
	            <div class="card-body">
		        <br>
		        <br>
		        <br>
		        <br>
                <br>
                <br>
		        <br>
		        <br>
		        <br>
		        <br>
	        </div>
		    <div class="card-footer align-center">
			    <a href="member-register.jsp" class="btn btn-success">회원가입</a>
	            <a href="AllMemberListServlet" class="btn btn-info">회원조회</a>
			    <a href='#' class='btn btn-info' onclick="window.open('pw-check.jsp','mypopup','width=650,height=450,top=350,left=400'); return false;">
			    회원정보수정
			    </a>
		    </div>    
	    </div>
    </div>
</body>
</html>