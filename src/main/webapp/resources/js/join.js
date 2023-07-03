//회원가입 아이디 중복체크
$(function() {

	$("#idCheck").click(function() {

		const input_id = $("#login_Id").val(); // 입력 아이디 가져오기

		$.ajax({
			url: "/idcheck", //요청 할 URL
			type: "POST",
			async: false,
			data: {
				loginId: input_id
			}, //넘길 파라미터
			dataType: "json",
			success: function(data) {
				console.log(data);
				if (data == true) {
					alert("사용가능 아이디");
				} else {
					alert("사용 불가능한 아이디");
				}
			},
			error: function() {
				console.log("접속 중 오류가 발생했습니다."); //에러시 실행 할 내용
			}
		});

	});
});

