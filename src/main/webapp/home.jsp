<%@page import="java.util.ArrayList"%>
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
	    function popup(){
	    	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	    	var popupY= (document.body.offsetHeight / 2) - (300 / 2);
	    	window.open('pw-check.jsp', 'mypopup', 'status=no, height=400, width=450, left='+ popupX + ', top='+ popupY);
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
                    absolute / position 설정하기;
                --%>
	                <%=vo.getId() %> 님 안녕하세요
                    <form action="LogoutServlet" method="post" id="logoutForm"></form>  
                    <a href="#" class="btn btn-danger" onclick="logout()">로그아웃</a>
	            <% } %>
    		    </div>
	            <div class="card-body">
		            <%
				    // 전달받은 ArrayList에는 MemberVO 타입에 한정되기에 SuppressWarnings 사용
				    @SuppressWarnings("unchecked")
				    ArrayList<MemberVO> memberList = (ArrayList<MemberVO>)request.getAttribute("memberList");
				    String currentUserId = null;// 현재 회원 아이디
				    if (session.getAttribute("mvo") != null) {// 로그인 상태
				    MemberVO userInfo = (MemberVO)session.getAttribute("mvo");
				    currentUserId = userInfo.getId();
				    }
				    %>
			        <table class="table table-hover">
			            <thead>
			                <tr>
			                    <th>아이디</th>
			                    <th>이름</th>
			                    <th>이메일</th>
			                    <th>주소</th>
			                    <th>생년월일</th>
			                    <th>가입일</th>
			                </tr>
			            </thead>
			            <tbody>
			                <%for(int i = 0; i < memberList.size(); i++){ %>
			                <tr>
			                    <%String memberId = memberList.get(i).getId();%>
			                    <%-- equals()에서 '=='로 수정 --%>
			                    <%if (currentUserId == memberId) {%>
			                        <td><a href="update-form.jsp"><%=currentUserId%></a></td>
			                    <%} else {%>
			                        <td><%=memberId %></td>
			                    <%} %>
			                    <td><%=memberList.get(i).getName() %></td>
			                    <td><%=memberList.get(i).getEmail() %></td>
			                    <td><%=memberList.get(i).getAddress() %></td>
			                    <td><%=memberList.get(i).getBirthday() %></td>
			                    <td><%=memberList.get(i).getRegdate() %></td>
			                </tr>
			                <%} %>
			            </tbody>
			        </table>
	            </div>
		    <div class="card-footer align-center">
			    <a href="member-register.jsp" class="btn btn-success">회원가입</a>
			    <a href='#' class='btn btn-info' onclick="popup()">
			    회원정보수정
			    </a>
		    </div>    
	    </div>
    </div>
</body>
</html>