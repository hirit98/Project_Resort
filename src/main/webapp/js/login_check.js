$(document).ready(function() {

    $.ajax({
        type: "POST",
        url: "check_login_status",
        success: function(response) {
            if (response.loggedIn == 1) {
            
                // 유저 로그인 상태일 경우
                $('#login_btn').hide(); // 로그인 버튼 숨기기
                $('#signup_btn').hide(); // 로그인 버튼 숨기기
                $('#admin_login_btn').hide(); // 관리자 로그인 버튼 숨기기
                $('#user_name').html('<a href="mypage_main">' + response.username + '</a> 님');
                $('#logout_btn').show();
                $('#user_name').show();
                
                // 사용자 번호도 함께 받아오기
                var userno = response.userno;
            } else if(response.loggedIn == 0){
            
            	// 관리자 로그인 상태일 경우
				$('#login_btn').hide(); // 로그인 버튼 숨기기
                $('#signup_btn').hide(); // 로그인 버튼 숨기기
                $('#admin_login_btn').hide(); // 관리자 로그인 버튼 숨기기
                $('#user_name').html('<a href="admin_main">' + response.adminname + '</a> 님');
                $('#logout_btn').show();
                $('#user_name').show();

                // 사용자 번호도 함께 받아오기
                var adminno = response.adminno;
                
                $('#res_btn').attr('type', 'button');
            	$('#res_btn').click(function() {
            		alert("관리자로 로그인했습니다!!");
            	})
            	
            	/*$('#car_sell_btn').removeAttr("onclick");
            	$('#car_sell_btn').click(function() {
            		alert("관리자로 로그인했습니다!!");
	            })
	            $('.lnb-item #login_first').removeAttr("href");
	            $('.lnb-item #login_first').mouseover(function() {
            		$('.lnb-item #login_first').css("cursor", "pointer");
            	})
            	$('.lnb-item #login_first').click(function() {
            		alert("관리자로 로그인했습니다!!");
            	})*/
            } else {
            	
				$('#login_btn').show();
                $('#signup_btn').show();
                $('#admin_btn').show();
                $('#logout_btn').hide();
                $('#user_name').hide();

            	/*$('#my_page').removeAttr("onclick");
            	$('#my_page').click(function() {
            		alert("로그인 후 이용하실 수 있습니다.");
            		location.href='user_login';
            	})
            	$('#car_sell_btn').removeAttr("onclick");
            	$('#car_sell_btn').click(function() {
            		alert("로그인 후 이용하실 수 있습니다.");
            		location.href='user_login';
	            })
	            $('.lnb-item #login_first').removeAttr("href");
	            $('.lnb-item #login_first').mouseover(function() {
            		$('.lnb-item #login_first').css("cursor", "pointer");
            	})
            	$('.lnb-item #login_first').click(function() {
            		alert("로그인 후 이용하실 수 있습니다.");
            		location.href='user_login';
            	})*/
            	
            	
            	return false;
            }
        }
    });
    
    
})

// 로그아웃 버튼 클릭 시
$(document).on('click', '#logout_btn', function(e) {
    e.preventDefault(); // 기본 동작 중단

    $.ajax({
        type: "GET",
        url: "logout", // 로그아웃 요청을 보낼 URL
        success: function(response) {
        	alert('로그아웃 했습니다.');
        	location.href='main';
        }
	});
});