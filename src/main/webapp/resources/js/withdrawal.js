$(function(){
	$("#withdrawal-btn").click(function(){
		
		let form = $("form")[0];
		let formData = new FormData(form);
		
		$.ajax({
			cache: false,
			url: "/withdrawal", //요청 할 URL
			processData: false,
			contentType: false,
			type: "POST",
			async: false,
			data: formData, //넘길 파라미터
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