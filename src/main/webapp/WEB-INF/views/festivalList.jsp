<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/fastivalList.css" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	outline: 0px solid;
}
</style>
</head>

<body>
	<%@ include file="header.jsp"%>


	<div style="display: flex; flex-wrap: wrap; position: relative;">

		<c:forEach var="item" items="${festivalList}">
			<div
				style="border: 5px solid #FBD9F9; background-color: #FFEAF7; margin: 20px; width: 320px; border-radius: 10%; overflow: hidden;">

				<a href="/festivalView?ftCode=${item.ftCode}"> <img alt=""
					src="${item.imgHref}" width="100%" height="160px">
				</a>

				<div class="">
					<div style="height: 100px">
						<div style="padding: 10px;">
							<a style="text-decoration: none; color: black"
								href="/festivalView?ftCode=${item.ftCode}">제목 :
								${item.fstvlNm}</a><br>
						</div>
						<div style="padding: 10px;">
							<a style="text-decoration: none; color: black;"
								href="/festivalView?ftCode=${item.ftCode}">내용 :
								${item.fstvlCo}</a><br>
						</div>
					</div>
					<div
						style="height: 50px; display: flex; justify-content: center; align-items: end;">
						개최기간 : ${item.fstvlStartDate} ~ ${item.fstvlEndDate}</div>

				</div>


			</div>
		</c:forEach>
	</div>


</body>

</html>