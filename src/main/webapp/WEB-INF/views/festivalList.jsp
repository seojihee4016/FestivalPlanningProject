<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<title>지역 축제 api</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="${path}/css/fastivalList.css" />
</head>
<body>

	<div class="main">
		<section class="container">
			<div class="textAll" id="infoinventions">
				<div class="card-grid">
					<c:forEach var="item" items="${festivalList}">
						<ul class="Card">
							<li>
								<div class="flip-card">
									<input type="checkbox" id="btnControl-${item.ftCode}"
										class="btnControl" /> <label class="flip-card-inner"
										for="btnControl-${item.ftCode}">
										<div class="flip-card-front">
											<h5 style="text-decoration: none; color: black;">
												${item.fstvlNm}</h5>
											<h6 style="text-decoration: none; color: black;">
												${item.fstvlCo}</h6>
											<div
												style="height: 50px; display: flex; justify-content: center; align-items: end;">
												${item.fstvlStartDate} ~ ${item.fstvlEndDate}</div>

											<!-- <a href="/festivalView?ftCode=${item.ftCode}"><img id ="pinata" src="images/pinata.png"></a> -->
										</div>

										<div class="flip-card-back">
											<div class="image-container">
												<img alt="" src="${item.imgHref}">
											</div>
										</div>
									</label>
								</div>
							</li>
						</ul>
					</c:forEach>
				</div>
			</div>
		</section>
	</div>


	<script type="text/javascript" src="js/festivalList.js"></script>
	<%@ include file="footer.jsp"%>

</body>
</html>