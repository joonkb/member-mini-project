<%@page import="model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보수정</title>
		<script type="text/javascript">
		    function checkPw(){
		        let newp = document.getElementById("new_pw");
		        let confp = document.getElementById("conf_pw");
		        let flag = true;
		        if(new_pw.value != conf_pw.value){
		            flag = false;
		            alert("비밀번호가 일치하지 않습니다!")
		            new_pw.focus();
		        }
	            return flag;
		    }
		</script>
	</head>
	<body>
	    <%
	    // 테스트용 데이터
	    MemberVO testvo = new MemberVO(); 
	    testvo.setId("test3");
	    testvo.setEmail("test@email.com");
	    testvo.setPassword("a");
	    testvo.setName("테스트삼");
	    testvo.setAddress("오리");
	    testvo.setBirthday("3333-03-03");
	    testvo.setQuestionNo(3);
	    testvo.setAnswer("삼");
	    testvo.setRegdate("2021-10-24");
	    session.setAttribute("mvo", testvo);
	    %>
        <div class = "container">
            <a href="index.jsp">Home</a><hr>
            <%
            MemberVO vo = (MemberVO)session.getAttribute("mvo"); // 이름 확인 필요
            String[] question = {"나의 보물1호는?", "어린 시절 가장 좋아했던 장소는?", "가장 좋아하는 영화는?"};
            if (vo != null) {
            %>
            <h2>회원정보수정</h2><br><hr><br>
            <form action="UpdateMemberInfoServlet" method="post" onsubmit="return checkPw()">
                <div class="form-group">
                    <label for="id">아이디:</label> 
                    <input type="text" class="form-control" id="id" placeholder="<%=vo.getId() %>" name="id" readonly="readonly" style="width: 30%">
                </div>
                <div class="form-group">
                    <label for="pwd">비밀번호:</label> 
                    <input type="password" class="form-control" id="new_pw" value="" name="new_pwd" required="required">
                </div>
                <div class="form-group">
                    <label for="confirmPwd">비밀번호확인:</label> 
                    <input type="password" class="form-control" id="conf_pw" value="" name="conf_pwd" required="required">
                </div>
                <div class="form-group">
                    <label for="name">이름:</label> 
                    <input type="text" class="form-control" id="name" value="<%=vo.getName() %>" name="name" required="required">
                </div>
                <div class="form-group">
                    <label for="email">이메일:</label> 
                    <input type="text" class="form-control" id="email" value="<%=vo.getEmail() %>" name="email" required="required">
                </div>
                <div class="form-group">
                    <label for="address">주소:</label> 
                    <input type="text" class="form-control" id="address" value="<%=vo.getAddress() %>" name="address" required="required">
                </div>
                <div class="form-group">
                    <label for="birthday">생년월일:</label> 
                    <input type="date" class="form-control" id="birthday" value="<%=vo.getBirthday() %>" name="birthday" required="required" max="2100-12-31">
                </div>
                <div class="form-group">
                    <label for="regdate">가입일:</label> 
                    <input type="date" class="form-control" id="regdate" value="<%=vo.getRegdate() %>" name="regdate" readonly="readonly">
                </div>
                <div class="row-fluid">
                    <label for="question">보안 질문에 답하세요:</label><br>
                    <select class="selectpicker" name="questionNo" required="required" data-width="auto">
                        <option value="">선택하세요</option>
                        <% for(int i = 0; i < question.length; i++)  { %>
                            <option value="<%=i%>"><%=question[i] %></option>
                        <% } %>
                    </select>
                </div><br>
                <div class="form-group">
                    <input type="text" class="form-control" id="answer" value="<%=vo.getAnswer() %>" name="answer" required="required">
                </div>
                <button class="btn btn-primary">수정하기</button><br><br>
            </form>
            <%} %>
        </div>
	</body>
</html>