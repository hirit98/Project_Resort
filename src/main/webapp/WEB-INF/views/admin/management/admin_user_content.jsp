<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<link rel="stylesheet" href="css/common/style.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />
	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_user_content-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;고객
					명단 > 고객 정보
				</h1>
				<div class="admin_user_cont">
					<form method="post" action="admin_user_modify_ok">
						<input type="hidden" name="no" value="${dto.getUser_no() }">
						<input type="hidden" name="page" value="${page }">
						<table>
							<tr>
								<th>고객No.</th>
								<td>${dto.getUser_no() }</td>
							</tr>
							<tr>
								<th>고객명</th>
								<td><input type="text" name="name"
									value="${dto.getUser_name() }"></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id"
									value="${dto.getUser_id() }"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pwd"
									value="${dto.getUser_pwd() }"></td>
							</tr>
							<tr>
								<th>연락처</th>
								<td><input type="text" name="phone"
									value="${dto.getUser_phone() }"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" name="email"
									value="${dto.getUser_email() }"></td>
							</tr>
							<tr>
								<th>등급</th>
								<td><select name="grade">
										<option value="bronze"
											<c:if test="${dto.user_grade eq 'bronze'}">selected</c:if>>bronze</option>
										<option value="silver"
											<c:if test="${dto.user_grade eq 'silver'}">selected</c:if>>silver</option>
										<option value="gold"
											<c:if test="${dto.user_grade eq 'gold'}">selected</c:if>>gold</option>
										<option value="VIP"
											<c:if test="${dto.user_grade eq 'VIP'}">selected</c:if>>VIP</option>
								</select></td>
							</tr>
							<tr>
								<th>가입일</th>
								<td>${dto.getUser_regdate().substring(0,16) }</td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<c:if test="${empty field }">
								<input class="cancle_btn" type="button" value="취소" onclick="location.href='admin_user_list?page=${page }'"> 
							</c:if>
							<c:if test="${!empty field }">
								<input class="cancle_btn" type="button" value="취소" onclick="location.href='admin_user_search?page=${page }&field=${field }&keyword=${keyword }'"> 
							</c:if>
							<input class="modify_btn" type="submit" value="수정"> 
							<input class="modify_btn" type="button" value="삭제"
								onclick="if(confirm('회원을 정말 삭제하시겠습니까?')){location.href='admin_user_delete?no=${dto.getUser_no()}&page=${page}'}else{return;}">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>