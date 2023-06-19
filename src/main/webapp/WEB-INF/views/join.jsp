<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>join 페이지</h1><br><br>

	<form action="" method="POST">
		아이디 <input type='text' name="login_id"/><br>
		비밀번호 <input type='password' name="login_pw"/><br>
		이름 <input type='text' name="name"/><br>
		이메일 <input type='text' name="email"/><br>
		전화번호 <input type='text' name="phone_number"/><br>
		<button type="submit">등록하기</button>
	</form>
</body>
</html>