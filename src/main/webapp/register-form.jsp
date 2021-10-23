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
		<script type="text/javascript">
            String[] inquiry = {"나의 보물1호는?", "어린 시절 가장 좋아했던 장소는?", "가장 좋아하는 영화는?"};
        </script>
	</head>                            
	<body>
         
		<div class="container">
			<h2>회원가입</h2><br><hr><br>
			<form action="RegisterMemberServlet" method="post">
                <input type="hidden" id="flag" value="">
				<div class="form-group">
					<label for="id">아이디:</label> 
					<input type="text" class="form-control" id="id" placeholder="아이디" name="id" required="required">
				</div>
				<button type="button" onclick="">중복확인</button><br><br>
				<div class="form-group">
					<label for="pwd">비밀번호:</label> 
					<input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="pswd" required="required">
				</div>
				<div class="form-group">
                    <label for="confirmPwd">비밀번호확인:</label> 
                    <input type="password" class="form-control" id="confirmPwd" placeholder="비밀번호확인" name="confirmPswd" required="required">
                </div>
                <div class="form-group">
                    <label for="name">이름:</label> 
                    <input type="text" class="form-control" id="name" placeholder="이름" name="name" required="required">
                </div>
                <div class="form-group">
                    <label for="email">이메일:</label> 
                    <input type="text" class="form-control" id="email" placeholder="이메일주소" name="email" required="required">
                </div>
                <div class="form-group">
                    <label for="address">주소:</label> 
                    <input type="text" class="form-control" id="address" placeholder="주소" name="address" required="required">
                </div>
                <div class="form-group">
                    <label for="birthday">생년월일:</label> 
                    <input type="date" class="form-control" id="birthday" placeholder="생년월일" name="birthday" required="required">
                </div>
                <div class="form-group">
                    <label for="question">보안 질문에 답하세요:</label> 
                    <input type="text" class="form-control" id="birthday" placeholder="생년월일" name="birthday" required="required">
                </div>
              
				<div class="form-group form-check">
					<label class="form-check-label"> 
					<input class="form-check-input" type="checkbox" name="remember">
						Remember me
					</label>
				</div>
				<button type="submit" class="btn btn-primary">가입하기</button>
			</form>
		</div>
		<%--
	            private String id; 
			    private String email;
			    private String password;
			    private String name;
			    private String address;
			    private String birthday;
			    private String regdate;
			    private int questionNo;
			    private String answer;
			    
			    
			<form action="RegisterMemberServlet" method="post">
	            <input type="hidden" id="flag" value="">
	            <input type="text" name="id" id="id" placeholder="아이디" required="required">
	            <button type="button" onclick="">중복확인</button>
	            <input type="password" name="password" id="pass" placeholder="비밀번호" required="required"><br><br>
	            <input type="password" name="confirmPassword" id="confirmPass" placeholder="비밀번호확인" required="required"><br><br>
	            <input type="text" name="name" placeholder="이름" required="required"><br><br>
	            <input type="text" name="email" placeholder="이메일" required="required"><br><br>
	            <input type="text" name="address" placeholder="주소" required="required"><br><br>
	            <input type="date" name="birthday" placeholder="생년월일" required="required"><br><br>
	        </form>
	    --%>
	</body>
</html>