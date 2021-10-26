<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <meta charset="UTF-8">
        <title>회원가입</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"></script>
        <!-- (Optional) Latest compiled and minified JavaScript translation files -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/i18n/defaults-*.min.js"></script>
        <script type="text/javascript">
            function checkForm() {
            	if(document.getElementById("pwd").value != document.getElementById("confirmPwd").value) {
            		alert("패스워드가 일치하지 않습니다!");
            		return false;
            	}
            	if(document.getElementById("flag").value != document.getElementById("id").value) {
            		alert("인증받은 아이디가 아닙니다 \n아이디 중복확인하세요");
            		return false;
            	}
            }
            
            function checkId() {
            	let memberId = document.getElementById("id");
            	if(memberId.value == "") {
            		alert("아이디를 입력하세요!");
            		memberId.focus();
            	}else {
            	    window.open("IdCheckServlet?id=" + memberId.value, "idcheckpopup", "width=250, height=150, top=150, left=400");
            	}
            }
            /* function formOk() {
            	if(checkId() != false) {
            		alert("회원가입이 완료되었습니다. \n로그인 화면으로 돌아갑니다.");
            		location.href = "index.jsp";
            	}
            	
            } */
            function passwordChanged() {
                var strength = document.getElementById('strength');
                var strongRegex = new RegExp("^(?=.{14,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
                var mediumRegex = new RegExp("^(?=.{10,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
                var enoughRegex = new RegExp("(?=.{8,}).*", "g");
                var pwd = document.getElementById("pwd");
                if (pwd.value.length == 0) {
                    strength.innerHTML = 'Type Password';
                } else if (false == enoughRegex.test(pwd.value)) {
                    strength.innerHTML = 'More Characters';
                } else if (strongRegex.test(pwd.value)) {
                    strength.innerHTML = '<span style="color:green">Strong!</span>';
                } else if (mediumRegex.test(pwd.value)) {
                    strength.innerHTML = '<span style="color:orange">Medium!</span>';
                } else {
                    strength.innerHTML = '<span style="color:red">Weak!</span>';
                }
            }
        </script>
        <style type="text/css">
            .container { padding-top: 100px; padding-bottom: 100px; display: grid; place-content: center; }
            .form-group { width: 300px;}
        </style>
    </head>                            
    <body>
        <%
        String[] question = {"나의 보물1호는?", "어린 시절 가장 좋아했던 장소는?", "가장 좋아하는 영화는?"};
        %>
        <div class="container">
        <div class="card">
            <div class="card-header">
            <h2>회원가입</h2>
            </div>
	            <div class="card-body">
	            <form action="RegisterMemberServlet" method="post" onsubmit="return checkForm()">
	                <input type="hidden" id="flag" value="">
	                <div class="form-group">
	                    <label for="id">아이디:</label> 
	                    <input type="text" class="form-control" id="id" placeholder="아이디" name="id" required="required">
	                    <%-- style="width: 30%" --%>
	                </div>
	                <button type="button" class="btn btn-primary" onclick="checkId()">중복확인</button><br><br>
	                <div class="form-group">
	                    <label for="pwd">비밀번호:</label> 
	                    <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pswd" 
	                           size="15" maxlength="100" onkeyup="return passwordChanged()" required="required">
	                    <span id="strength">Type Password</span>
	                </div>
	                
	                <!-- <input name="password" id="password" type="text" size="15" maxlength="100" onkeyup="return passwordChanged();" /> -->
	
	                <div class="form-group">
	                    <label for="confirmPwd">비밀번호확인:</label> 
	                    <input type="password" class="form-control" id="confirmPwd" placeholder="비밀번호확인" name="confirmPswd" required="required">
	                </div>
	                <div class="form-group">
	                    <label for="name">이름:</label> 
	                    <input type="text" class="form-control" placeholder="이름" name="name" required="required">
	                </div>
	                <div class="form-group">
	                    <label for="email">이메일:</label> 
	                    <input type="text" class="form-control" placeholder="이메일주소" name="email" required="required">
	                </div>
	                <div class="form-group">
	                    <label for="address">주소:</label> 
	                    <input type="text" class="form-control" placeholder="주소" name="address" required="required">
	                </div>
	                <div class="form-group">
	                    <label for="birthday">생년월일:</label> 
	                    <input type="date" class="form-control" placeholder="생년월일" name="birthday" required="required">
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
	                    <input type="text" class="form-control" id="answer" placeholder="답" name="answer" required="required">
	                </div>
             <div class="card-footer">
                <button type="submit" class="btn btn-success">가입하기</button><br><br>
            </form>
            </div>
            </div><!-- card body -->
        </div><!-- card class -->
        </div><!--container class-->
    </body>
</html>









