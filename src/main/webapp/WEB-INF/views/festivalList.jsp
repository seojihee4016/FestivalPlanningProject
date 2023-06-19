<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navBar.jsp" %>



	<c:forEach var="item" items="${festivalList}">
	<p>
	<a href="">${item.fstvlName}, ${item.fstvlStartDate}, ${item.fstvlEndDate}, ${item.phoneNumber}, ${item.fstvlCo}</a>
	</p>
		
	</c:forEach>
	
	
</body>
</html>