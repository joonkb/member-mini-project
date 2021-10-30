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
    <style type="text/css">
        .container { padding-top: 100px; padding-bottom: 100px; display: grid; place-content: center; }
        .form-group { width: 300px;}
        .update-home { text-align: center; }
    </style>
    <title>회원정보 수정 결과</title>
</head>
<body>
    <div class = "container">
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
        <div class="card">
            <div class="card-header">
		        <h2>회원정보 수정 결과</h2>
            </div>
            <div class="card-body">
                <div class="row">
	                <div>
                        <table class="table table-hover table-bordered" align="center">
	                        <thead align="center">
	                            <tr>
	                                <th>아이디</th>
	                                <th><%=vo.getId()%></th>
	                            </tr>
	                            <tr>
    	                            <th>이름</th>
    	                            <th><%=vo.getName() %></th>
	                            </tr>
	                            <tr>
                                    <th>이메일</th>
                                    <th><%=vo.getEmail() %></th>
	                            </tr>
	                            <tr>
                                    <th>주소</th>
                                    <th><%=vo.getAddress() %></th>
	                            </tr>
	                            <tr>
                                    <th>생년월일</th>
                                    <th><%=vo.getBirthday() %></th>
	                            </tr>
	                            <tr>
                                    <th>가입일</th>
                                    <th><%=vo.getRegdate() %></th>
	                            </tr>
	                            <tr>
                                    <th>질문</th>
                                    <th><%=question[vo.getQuestionNo()] %></th>
	                            </tr>
	                            <tr>
                                    <th>답</th>
                                    <th><%=vo.getAnswer() %></th>
                                </tr>
	                        </thead>
                        </table>
			        </div>
	            </div>
	            <%} %>
            </div>
            <div class="card-footer update-home">
                <button type="button" onclick="location.href='index.jsp'" class="btn btn-info">Home</button>
            </div>
        </div>
    </div>
</body>
</html>