// 동의 모두선택 / 해제
const agreeChkAll = document.querySelector('input[name=agree_all]');
agreeChkAll.addEventListener('change', (e) => {
	let agreeChk = document.querySelectorAll('input[name=agree]');
	for (let i = 0; i < agreeChk.length; i++) {
		agreeChk[i].checked = e.target.checked;
	}
});


// 필수 약관 동의 페이지 이동
$(document).ready(function() {	
		$("#submitBtn").click(function(){
		if($("#agreement1").is(":checked") && $("#agreement2").is(":checked")){
				location.href ="join"
			} else {
				if(!$("#agreement1").is(":checked"))
				{
					alert("이용약관을 동의하셔야 합니다.");
					$('#agreement1').focus();
					return;
				}
				if(!$("#agreement2").is(":checked"))
				{
					alert("개인정보처리에 동의하셔야 합니다.");
					$('#agreement2').focus();
					return;
				}
			}
		});
	});