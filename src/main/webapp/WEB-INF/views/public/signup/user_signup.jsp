<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<!-- 회원가입 -->
    <div class="mem_join">
        <div class="join">
            <h2>회원가입</h2>
            <form action="user_signup_ok" method="post">
                <table>
                    <tr>
                        <th>
                            <span style="color: red;">*</span>성 명
                        </th>
                        <td>
                            <input type="text" name="user_name" id="signup_name" placeholder="이름을 입력해주세요." autocomplete="off" required>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span style="color: red;">*</span>아이디
                        </th>
                        <td>
                            <input type="text" name="user_id" id="user_id" placeholder="영문/숫자 조합으로 8-12자리로 가능합니다." autocomplete="off" required>
                            <input type="button" value="중복확인" class="id_check">
                            <p class="no_pass">
                                <span class="id_error"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th><span style="color: red;">*</span>비밀번호</th>
                        <td>
                            <input type="password" id="pwd" placeholder="영문/숫자/특수문자 조합으로 8-12자리로 가능합니다." name="user_pwd" autocomplete="off" required>
                            <p class="no_pass">
                                <span class="pwd_error"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span style="color: red;">*</span>비밀번호 확인
                        </th>
                        <td>
                            <input type="password" placeholder="비밀번호를 한번 더 입력해 주세요." id="pwd_doublecheck" autocomplete="off" required>
                            <p class="no_pass">
                                <span class="doublecheck_error"></span>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span style="color: red;">*</span>연락처
                        </th>
                        <td>
                            <input id="phone1" type="text" maxlength="3" oninput="changePhone1()" name="phone1" autocomplete="off" placeholder="010" required>
                            <input id="phone2" type="text" maxlength="4" oninput="changePhone2()" name="phone2" autocomplete="off" placeholder="1234" required>
                            <input id="phone3" type="text" maxlength="4" oninput="changePhone3()" name="phone3" autocomplete="off" placeholder="5678" required>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <span style="color: red;">*</span>이메일
                        </th>
                        <td>
                            <input type="text" placeholder="사용할 이메일을 입력해 주세요." maxlength="30" name="user_email" id="user_email"autocomplete="off" required> 
                            <input type="button" value="중복확인" class="email_check">
                            <p class="no_pass">
                                <span class="email_error"></span>
                            </p>
                        </td>
                    </tr>
                </table>
                <div class="join_on">
                    <input type="reset" value="이전 페이지" onclick="main">&nbsp;&nbsp;
                    <input type="submit" value="회원 가입">
                </div>
            </form>
        </div>
    </div>
	<!-- 회원가입 -->
	<script src="js/signup.js"></script>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>