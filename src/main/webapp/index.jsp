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
<%
    MemberVO vo = (MemberVO) session.getAttribute("mvo");
%>
	<div class="container pt-5">
	   <h3>홈페이지</h3>
	   <div class="card">
		   <div class="card-header">
		       <%-- 비로그인 상태인 경우 로그인 폼 제공 --%>
		       <%
		       if(vo == null) {
		       %>
               <form class="form-inline" action="LoginServlet">
	               <label for="id" class="mb-2 mr-sm-2">아이디:</label>
	               <input type="text" class="form-control mb-2 mr-sm-2" id="id" placeholder="아이디" name="id">
	               <label for="password" class="mb-2 mr-sm-2">비밀번호:</label>
	               <input type="password" class="form-control mb-2 mr-sm-2" id="password" placeholder="비밀번호" name="password">
               <button type="submit" class="btn btn-info">로그인</button>
	           </form>
	           <%
		        } else {
		        %>
                  <%-- 로그인 했을경우 로그아웃 버튼 제공--%>
	                   ${sessionScope.vo.id} 님 안녕하세요
	                   <form action="LogoutServlet" method="post" id="logoutForm"></form>  
	                   <a href="#" class="btn btn-danger" onclick="logout()">로그아웃</a>
	           <%
		        }
	           %>
		   </div>
	       <div class="card-body">
		       <br>
		       <br>
		           Content-body
	           <select class="selectpicker" data-size="5">
	           <optgroup label="Picnic" disabled>
			       <option>Mustard</option>
			       <option>Ketchup</option>
			       <option>Relish</option>
		       </optgroup>
		       <optgroup label="Camping">
			      <option>Tent</option>
			      <option>Flashlight</option>
			      <option>Toilet Paper</option>
		      </optgroup>
               </select>
		       <br>
		       <br>
		       <br>
	       </div>
		   <div class="card-footer align-center">
			   <a href="member-register.jsp" class="btn btn-success">회원가입</a>
	           <a href="AllMemberListController.do" class="btn btn-info">회원조회</a>
		   </div>    
		   </div>
	</div>
			<%-- 로그인폼 --%>
			<%-- 회원가입폼 --%>
			<%-- 로그인 상태: 로그아웃 링크, 주소로 회원검색 링크 제공--%>
			<%-- 회원 리스트 조회 --%>
			<a href="FindMemberListServlet">회원 리스트 보기</a>
			<%-- 로그아웃 --%>
			<%-- 아이디, 비밀번호 찾기 버튼 --%>
			<%-- 회원정보수정 --%>
</body>
</html>