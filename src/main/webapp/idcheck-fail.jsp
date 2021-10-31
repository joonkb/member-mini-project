<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="css/bootstrap-w3c.jsp"></jsp:include>
		<jsp:include page="css/bootstrap-selection.jsp"></jsp:include>
		<link rel="stylesheet" href="css/styles.css">
		<title>아이디 사용불가</title>
		<script type="text/javascript">
		    opener.document.getElementById("flag").value = "";
		    function closePopup() {
		    	opener.document.getElementById("id").value = "";
		        opener.document.getElementById("id").focus();
		        self.close();
		    }
		</script>
	</head>
	<body>
	    <%=request.getParameter("id") %> 아이디 중복되어 사용불가합니다 <br><br>
	    <button type="button" class="btn btn-info" onclick="closePopup()">확인</button>
	</body>
</html>





