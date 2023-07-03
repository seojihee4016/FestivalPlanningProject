<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BulletinBoard</title>
<style>
/*게시판*/
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
}

#root {
	width: 600px;
	margin: 0 auto;
}

header {
	text-align: center;
	padding: 20px 0;
}

h1 {
	font-size: 24px;
	color: #333;
}

hr {
	border: none;
	border-top: 1px solid #ccc;
	margin-bottom: 20px;
}

#container {
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

label {
	font-weight: bold;
}

input[type="text"], textarea {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button[type="submit"], button[type="button"] {
	display: inline-block;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	background-color: #333;
	color: #fff;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
}

button[type="submit"]:hover, button[type="button"]:hover {
	background-color: #222;
}

button[type="submit"]:focus, button[type="button"]:focus {
	outline: none;
}
</style>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>nav bar</nav>
		<hr />

		<section id="container">
			<form role="form" method="post" action="BulletinBoard"
				onsubmit="return validateForm()">
				<table>
					<tbody>

						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="title" value="" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label> <textarea id="content"
									name="content"></textarea></td>
						</tr>
						<tr>
							<td><label for="writer">작성자</label><input
								type="text" id="writer" name="writer" value="<c:out value="${writer}" />" readonly/></td>
						</tr>
						<tr>
							<td><button type="submit">작성</button></td>
						</tr>

					</tbody>
				</table>
			</form>
		</section>
		<hr />
	</div>

	<script>
	function validateForm() {


		if (title.value.trim() === '') {
			alert('제목을 입력해주세요.');
			return false;
		}
		if (content.value.trim() === '') {
			alert('내용을 입력해주세요.');
			return false;
		}
		
		return true;
	}
	</script>
</body>
</html>
