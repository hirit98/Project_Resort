<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function() {
		$('#secessionForm').on('submit', function(event) {
			if (!confirm('정말 탈퇴하시겠습니까?')) {
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />
	<jsp:include page="/WEB-INF/include/mypage_sidebar.jsp" />
	</div>
	<div class="m_contents">
		<div class="main">
			<h3>탈퇴하기</h3>
			<form id="secessionForm" method="post"
				action="mypage_secession_check">
				<div class="m_board f_cl pwd_board">
					<h4>비밀번호 확인</h4>
					<div class="t_guide">탈퇴를 원하시면 위 입력란에 회원 가입 시 설정한 비밀번호를 입력하신 후
						확인 버튼을 클릭해주세요.</div>
					<input type="password" name="user_pwd" id="login_pw"
						placeholder="비밀번호를 입력해 주세요." maxlength="12" required />
					<div class="b_btns">
						<button type="submit" class="pwd_check">확인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>
