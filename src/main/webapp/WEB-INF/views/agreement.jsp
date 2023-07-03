<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<form action="" method="POST">
	<div class="accordion agreebox" id="accordionPanelsStayOpenExample">
		<div class="allcheck">
			<label for="agree_all"><input type="checkbox"
				name="agree_all" id="agree_all"> <span>전체동의</span></label>

			<p>Piñata 이용약관 동의, 개인정보 수집 및 이용 동의, 이벤트・혜택 정보 수신(선택) 동의를 포함합니다.</p>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="panelsStayOpen-headingOne">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true"
					aria-controls="panelsStayOpen-collapseOne">Piñata 이용약관 동의</button>
			</h2>
			<div id="panelsStayOpen-collapseOne"
				class="accordion-collapse collapse show"
				aria-labelledby="panelsStayOpen-headingOne">
				<div class="accordion-body">
					<strong>여러분을 환영합니다. Piñata 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서
						감사합니다.</strong> 본 약관은 다양한 Piñata 서비스의 이용과 관련하여 Piñata 서비스를 제공하는 Piñata
					주식회사(이하 ‘Piñata’)와 이를 이용하는 Piñata 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를
					설명하며, 아울러 여러분의 Piñata 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. Piñata
					서비스를 이용하시거나 Piñata 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나
					동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.<br> <br> <label
						for="agree"> <input type="checkbox" name="agree" value="1"
						id="agreement1" required> <span>Piñata 이용약관 동의<strong>(필수)</strong>
					</span>
					</label>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false"
					aria-controls="panelsStayOpen-collapseTwo">개인정보 수집 및 이용 동의</button>
			</h2>
			<div id="panelsStayOpen-collapseTwo"
				class="accordion-collapse collapse show"
				aria-labelledby="panelsStayOpen-headingTwo">
				<div class="accordion-body">
					<strong>개인정보보호법에 따라 Piñata에 회원가입 신청하시는 분께</strong> 수집하는 개인정보의 항목,
					개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내
					드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색,
					뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과
					같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의
					개인정보를 수집합니다.<br> <br> <label for="agree"> <input
						type="checkbox" name="agree" value="2" id="agreement2"> <span>개인정보
							수집 및 이용 동의<strong>(필수)</strong>
					</span>
					</label>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="panelsStayOpen-headingThree">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#panelsStayOpen-collapseThree"
					aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
					이벤트・혜택 정보 수신 동의</button>
			</h2>
			<div id="panelsStayOpen-collapseThree"
				class="accordion-collapse collapse show"
				aria-labelledby="panelsStayOpen-headingThree">
				<div class="accordion-body">
					<strong>Piñata에서 제공하는 이벤트/혜택 등</strong> 다양한 정보를 휴대전화(전화 또는 문자),
					이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 Piñata 가입 이후 추가 가입하여 이용하는
					서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고
					동의를 받습니다.<br> <br> <label for="agree"> <input
						type="checkbox" name="agree" value="3"> <span>이벤트・혜택
							정보 수신 동의<strong class="select_disable">(선택)</strong>
					</span>
					</label>
				</div>
			</div>
		</div>
		<br>
		<div class="nextbtnbox">
			<input type="button" class="btn nextbtn" value="다음" id="submitBtn">
		</div>
	</div>
</form>

<script type="text/javascript" src="js/agreement.js"></script>

<%@ include file="footer.jsp"%>