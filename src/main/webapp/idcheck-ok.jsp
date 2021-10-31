<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="css/bootstrap-w3c.jsp"></jsp:include>
		<jsp:include page="css/bootstrap-selection.jsp"></jsp:include>
		<link rel="stylesheet" href="css/styles.css">
		<title>아이디 사용가능</title>
		<script type="text/javascript">
		    opener.document.getElementById("flag").value = "<%=request.getParameter("id") %>";
		    function closePopup() {
		    	opener.document.getElementById("pwd").focus();
		    	self.close();
		    }
		</script>
	</head>
	<body onunload="closePopup()">
	    <div class="container">
		    <%=request.getParameter("id") %> 아이디 사용가능합니다<br><br>
		    <button type="button" class="btn btn-info" onclick="closePopup()">확인</button>
	    </div>
	</body>
</html>
