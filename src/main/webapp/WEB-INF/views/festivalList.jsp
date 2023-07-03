<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:set var="path" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link rel="stylesheet" href="${path}/css/fastivalList.css" />
		</head>

		<body>
			<%@ include file="header.jsp" %>

				<div>
					<div class="fastivalSearchBox">
						<form action="">
							<input type="text">
							<button>검색</button>
						</form>
					</div>

					<ul>
						<c:forEach var="item" items="${festivalList}">
							<li>
								<div class="festivalListBox-header">
									<a href="/festivalView?ftCode=${item.ftCode}">${item.fstvlNm}</a>
								</div>
								<div class="festivalListBox-meddel">
									<a href="/festivalView?ftCode=${item.ftCode}">${item.fstvlCo}</a>
								</div>
								<div class="festivalListBox-footer">
									${item.fstvlStartDate}, ${item.fstvlEndDate}, ${item.phoneNumber}</a>
								</div>
								<hr>
							</li>
						</c:forEach>
					</ul>
				</div>

		</body>

		</html>