<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/css/navBar.css"/>
</head>
<body>
	<div class="container">
        <div class="nav-item">
            <a href="/">
                <h1>main</h1>
            </a>
        </div>
        <div class="nav-item">
            <a href="">스텝모집</a>
        </div>
        <div class="nav-item">
            <a href="festivalList">지역축제</a>
        </div>
        <div class="nav-item">
            <a href="">축제견적(쇼핑몰형)</a>
        </div>
        <div class="nav-item">
            <a href="">축제견적(설문형)</a>
        </div>

    </div>
</body>
</html>