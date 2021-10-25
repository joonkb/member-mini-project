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
<title>Insert title here</title>
<style>
    .align-center {
       text-align: center;
    }
</style>
</head>
<body>
    <div class="container pt-4">
	    <div class="card-body">
		    <h3 class="card-title">아이디 찾기</h3>
		    <form class="was-validated" action="FindIdServlet" method="post">
                <div class="form-group">
                    <label for="name">이름:</label> 
                    <input type="text" class="form-control" id="name" placeholder="등록된 이름 입력" name="name" required="required" style="width:30%">
                </div>
                <div class="form-group">
                    <label for="email">이메일:</label> 
                    <input type="email" class="form-control" id="email" placeholder="등록된 이메일 입력"  name="email" required="required" style="width:30%">
                </div>
            </form>
	    </div>
	    <div class="card-footer align-center">
	       <button class="btn btn-info">찾기</button>
	       <a href="index.jsp" class="btn btn-danger">취소</a>
	    </div>
    </div>
</body>
</html>