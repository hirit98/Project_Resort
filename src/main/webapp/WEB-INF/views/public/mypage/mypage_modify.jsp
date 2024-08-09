<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />
	<jsp:include page="/WEB-INF/include/mypage_sidebar.jsp" />
	</div>
	<div class="m_contents">
		<div class="modify">
			<h3>${dto.getUser_name() }님 개인정보 수정</h3>
			<div class="modify_board">
				<form method="post" action="mypage_modify_ok">
					<table>
						<thead>
							<tr>
								<th>성 명</th>
								<td>
									<input type="text" name="user_name"value="${dto.getUser_name() }" readonly>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="user_id" id="user_id" value="${dto.getUser_id() }" readonly>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
								<input type="password" id="pwd" placeholder="영문 대, 소문자/숫자/특수문자 조합으로 8-12자리로 가능합니다." name="user_pwd" autocomplete="off" required>
	                            <p class="no_pass">
	                                <span class="pwd_error"></span>
	                            </p>
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" placeholder="비밀번호를 한번 더 입력해 주세요." id="pwd_doublecheck" autocomplete="off" required>
	                            <p class="no_pass">
	                                <span class="doublecheck_error"></span>
	                            </p>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<input id="phone1" type="text" maxlength="3" oninput="changePhone1()" name="phone1" autocomplete="off" placeholder="010" required>
									<span class="phone_icon">-</span>
									<input id="phone2" type="text" maxlength="4" oninput="changePhone2()" name="phone2" autocomplete="off" placeholder="1234" required>
									<span class="phone_icon">-</span>
									<input id="phone3" type="text" maxlength="4" oninput="changePhone3()" name="phone3" autocomplete="off" placeholder="5678" required>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
								<input type="text" placeholder="사용할 이메일을 입력해 주세요." maxlength="30" name="user_email" id="user_email" autocomplete="off" required>
								<input type="button" value="확인" class="email_check">
	                            <p class="no_pass">
	                                <span class="email_error"></span>
	                            </p>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;
									<input type="button" value="취소" onclick="mypage_main">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	</div>
	</div>
	</section>
	<script src="js/signup.js"></script>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>