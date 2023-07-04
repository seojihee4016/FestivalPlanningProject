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
         dataType: "json",
         data: formData, //넘길 파라미터
         success: function(data) {
            console.log(data);
            if (data === "true") {
               alert("이용해주셔서 감사합니다.");
            } else {
               alert("입력하신 비밀번호가 일치하지 않습니다.");
            }
         },
         error: function() {
            console.log("접속 중 오류가 발생했습니다."); //에러시 실행 할 내용
         }
      });
   });
});