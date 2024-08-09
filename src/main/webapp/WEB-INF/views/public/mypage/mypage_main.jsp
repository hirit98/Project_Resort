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
</head>
<body>
		<jsp:include page="/WEB-INF/include/main_header.jsp" />
		<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />
		<jsp:include page="/WEB-INF/include/mypage_sidebar.jsp" />
		</div>
		<div class="m_contents">
			<div class="main">
				<!-- 바꾸면 됨 -->
				<h3>안녕하세요. ${dto.getUser_name() } 님</h3>
				<div class="mm_board w_box f_cl">
					<dl>
						<dt>성명</dt>
						<dd>${dto.getUser_name() }</dd>
					</dl>
					<dl>
						<dt>가입일자</dt>
						<dd>${dto.getUser_regdate().substring(0,10) }</dd>
					</dl>
					<dl>
						<dt>등급</dt>
						<dd>${dto.getUser_grade() }</dd>
					</dl>
					<a href="mypage_modify" class="bt_bk bt_info_modify">개인정보 수정</a>
				</div>
				<!-- 바꾸면 됨 -->
			</div>
		</div>
		</div>
		</div>
		</section>
		<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>