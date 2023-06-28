<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BulletinBoard</title>
<style>
body {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

form {
	width: 400px;
}

form table {
	width: 100%;
}

form td {
	padding: 10px;
}

form label {
	display: block;
	margin-bottom: 5px;
}

form input[type="text"], form textarea {
	width: 100%;
	padding: 5px;
}

form button[type="submit"] {
	padding: 10px 20px;
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
			<form role="form" method="post" action="BulletinBoard">
				<table>
					<tbody>
						<tr>
							<td><label for="title">제목</label><input type="text"
								id="title" name="title" /></td>
						</tr>
						<tr>
							<td><label for="content">내용</label>
							<textarea id="content" name="content"></textarea></td>
						</tr>
						<tr>
							<td><label for="writer">작성자 - 세션 적용 전</label><input type="text"
								id="writer" name="writer" /></td>
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
</body>
</html>
