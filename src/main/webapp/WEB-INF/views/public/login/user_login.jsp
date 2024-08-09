<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<div class="membership">
		<div class="contents">
			<div class="login">
				<div class="ll_area">
					<ul class="tab_login">
						<li class="active">로그인</li>
					</ul>
					<div id="tab_login" class="tab_login_content">
						<form name="loginform" id="loginform" method="post" action="user_login_ok">
							<div class="form">
								<dl>
									<dd>
										<input id="login_id" name="login_id" type="text" placeholder="아이디" autocomplete="off" />
									</dd>
								</dl>
								<dl>
									<dd>
										<input id="login_pw" name="login_pw" type="password" placeholder="비밀번호" autocomplete="off" />
									</dd>
								</dl>
							</div>
							<input type="submit" class="bt_b_block" value="로그인" />
						</form>
					</div>
				</div>
				<div class="r_area">
					<ul class="tab_login">
						<li class="active non">비회원 조회</li>
					</ul>
					<div id="tab_login" class="tab_login_content">
						<form name="loginform" id="loginform" method="post" action="non_login_reservation">
							<div class="form">
								<dl>
									<dd>
										<input id="login_id" name="res_no" type="text" placeholder="예약번호" autocomplete="off" />
									</dd>
								</dl>
								<dl>
									<dd>
										<input id="login_pw" name="res_phone" type="text" placeholder="전화번호('-'제외)" autocomplete="off" />
									</dd>
								</dl>
								<div class="b_check">
									<div class="r_btns" style="text-align: right;">
										<a href="user_signup">회원가입</a>
									</div>
								</div>
							</div>
							<input type="submit" class="bt_b_block" value="조회하기" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>

</html>