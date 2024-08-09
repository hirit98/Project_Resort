function changePhone1() {
	let phone1 = document.getElementById("phone1").value
	if (phone1.length === 3) {
		document.getElementById("phone2").focus();
	}
}

function changePhone2() {
	let phone2 = document.getElementById("phone2").value
	if (phone2.length === 4) {
		document.getElementById("phone3").focus();
	}
}

function changePhone3() {
	let phone3 = document.getElementById("phone3").value
	if (phone3.length === 4) {
		document.getElementById("user_email").focus();
	}
}

/*비밀번호 유효성 검사 제이쿼리 코드*/
$(function() {
	$("#pwd").on('input', function() {
		$(".pwd_error").hide();

		var pwd = $(this).val();

		// 비밀번호 길이를 확인
        var lengthValid = (pwd.length >= 8 && pwd.length < 16);

        // 특수문자 포함 여부 확인
        var specialCharValid = /[!@#$%.*^&+=]/.test(pwd);

		if (!lengthValid) {
			let warningTxt = '<font style="color : red;">비밀번호는 8자리 이상 16자리 미만이어야 합니다.</font>';

			$(".pwd_error").text("");
			$(".pwd_error").show();
			$(".pwd_error").append(warningTxt);
			
			return false;
		} else if(!specialCharValid) {
			let warningTxt = '<font style="color : red;">특수문자를 하나 이상 포함해야 합니다.(!,@,#,$,%,.,*,^,&,+,=)</font>';

			$(".pwd_error").text("");
			$(".pwd_error").show();
			$(".pwd_error").append(warningTxt);
			
			return false;
		} else {
			let warningTxt = '<font style="color : green;">유효한 비밀번호입니다.</font>';

			$(".pwd_error").text("");
			$(".pwd_error").show();
			$(".pwd_error").append(warningTxt);
			
			return true;
		}
	})
})

/*비밀번호 더블체크 제이쿼리 코드*/
$(function() {
	$("#pwd_doublecheck").on('input', function() {
		$(".doublecheck_error").hide();

		let userPwd = $("#pwd").val();
		let checkPwd = $("#pwd_doublecheck").val();

		if ($.trim(userPwd) !== $.trim(checkPwd)) {

			let warningTxt = '<font style="color : red;">비밀번호가 일치하지 않습니다.</font>';

			$(".doublecheck_error").text("");
			$(".doublecheck_error").show();
			$(".doublecheck_error").append(warningTxt);

			return false;
		}
		if ($.trim(userPwd) == $.trim(checkPwd)) {

			let warningTxt = '<font style="color : green;">비밀번호 일치</font>';

			$(".doublecheck_error").text("");
			$(".doublecheck_error").show();
			$(".doublecheck_error").append(warningTxt);

			return true;
		}
	})
})

/*아이디 중복체크 제이쿼리 코드*/
$(function() {
	$(".id_check").click(function() {
		$(".id_error").hide();

		let userId = $.trim($("#user_id").val());

		// 아이디 입력 길이 체크하는 방법
		if (userId.length < 8 || userId.length > 16) {

			let warningTxt = '<font style="color : red;">아이디는 8자리 이상 16자리 미만이어야 합니다.</font>';

			$(".id_error").text("");
			$(".id_error").show();
			$(".id_error").append(warningTxt);

			return false;
		}

		$.ajax({
			type: "post",
			url: "signup_idcheck",
			data: { paramId: userId },	// 변수명 : 값
			dataType: "json",
			success: function(data) {
				if (data == -1) {
					let warningTxt = '<font style="color : red;">중복된 아이디입니다.</font>';

					$(".id_error").text("");
					$(".id_error").show();
					$(".id_error").append(warningTxt);
					
					return false;
				} else {
					let warningTxt = '<font style="color : green;">사용 가능한 아이디입니다.</font>';

					$(".id_error").text("");
					$(".id_error").show();
					$(".id_error").append(warningTxt);

					return true;
				}
			},
			error: function() {
				alert("데이터 통신 오류입니다.");
			}
		})
	})
})

/*이메일 중복체크 제이쿼리 코드*/
$(function() {
	$(".email_check").click(function() {
		$(".email_error").hide();

		let userEmail = $.trim($("#user_email").val());

		$.ajax({
			type: "post",
			url: "signup_emailCheck",
			data: { paramEmail: userEmail },	// 변수명 : 값
			dataType: "json",
			success: function(data) {
				if (data == -1) {
					let warningTxt = '<font style="color : red;">중복된 이메일입니다.</font>';

					$(".email_error").text("");
					$(".email_error").show();
					$(".email_error").append(warningTxt);

					return false;
				} else {
					let warningTxt = '<font style="color : green;">사용 가능한 이메일입니다.</font>';

					$(".email_error").text("");
					$(".email_error").show();
					$(".email_error").append(warningTxt);

					return true;
				}
			},
			error: function() {
				alert("데이터 통신 오류입니다.");
			}
		})
	})
})