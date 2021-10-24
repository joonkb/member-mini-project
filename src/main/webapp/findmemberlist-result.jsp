<%@page import="model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 리스트</title>
	</head>
	<body>
	    <%
	    // 전달받은 ArrayList에는 MemberVO 타입에 한정되기에 SuppressWarnings 사용
        @SuppressWarnings("unchecked")
        ArrayList<MemberVO> memberList = (ArrayList<MemberVO>)request.getAttribute("memberList");
	    String currentUserId = null;// 현재 회원 아이디
	    // 세션 정보가 없어서 현재 주석 처리
        /* if(session.getAttribute("userInfo")!=null){// 로그인 상태
            MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");
            currentUserId = userInfo.getId();
        } */
        %>
        <div>
            <a href="index.jsp">Home</a>
            <h2>회원리스트</h2>
            <table>
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
				    <%for(int i=0; i<memberList.size() ;i++){ %>
					<tr>
					    <%String memberId = memberList.get(i).getId();%>
					    <!-- 세션 정보가 없어서 현재 주석 처리 --> 
					    <%-- <%if(currentUserId.equals(memberId)){%>
                        <td><a href="update-form.jsp"><%=currentUserId%></a></td>
                        <%}else{%> --%>
						<td><%=memberId %></td>
						<%-- <%} %> --%>
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
	</body>
</html>