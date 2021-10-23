<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 리스트</title>
	</head>
	<body>
        <div>
            <a href="index.jsp">Home</a>
            <h2>회원리스트</h2>
            <table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>생년월일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${member.id}</td>
						<td>${member.name}</td>
						<td>${member.birthday}</td>
					</tr>
	   		    </tbody>
            </table>
        </div>
	</body>
</html>