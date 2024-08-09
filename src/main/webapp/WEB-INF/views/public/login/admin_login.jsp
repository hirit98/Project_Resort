<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<div class="admin_login">
		<div class="contents">
			<div class="login">
				<div class="ll_area">
					<ul class="tab_login">
						<li class="active">관리자 로그인</li>
					</ul>
					<div id="tab_login" class="tab_login_content">
						<form name="loginform" id="loginform" method="post"
							action="admin_login_ok">
							<div class="form">
								<dl>
									<dd>
										<input id="login_id" name="login_id" type="text"
											placeholder="아이디" autocomplete="off" />
									</dd>
								</dl>
								<dl>
									<dd>
										<input id="login_pw" name="login_pw" type="password"
											placeholder="비밀번호" autocomplete="off" />
									</dd>
								</dl>
							</div>
							<input type="submit" class="bt_b_block" value="로그인" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>