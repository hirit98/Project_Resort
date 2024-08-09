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
			<div class="admin_account_modify-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;관리자
					설정 > 관리자 수정
				</h1>
				<div class="admin_account_modify_cont">
					<form method="post" action="admin_account_modify_ok">
						<input type="hidden" name="no" value="${dto.getAdmin_no() }">
						<table>
							<tr>
								<th>관리자 이름</th>
								<td>
									<input type="text" name="name" value="${dto.getAdmin_name() }">
								</td>
							</tr>
							<tr>
								<th>ID</th>
								<td>
									<input type="text" name="id" value="${dto.getAdmin_id() }" readonly>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td>
									<input type="password" name="pwd" value="${dto.getAdmin_pwd() }">
								</td>
							</tr>
							<tr>
								<th>직책</th>
								<td>
									<select name="job">
										<c:forEach items="${jobList }" var="job">
											<option>${job }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<input type="text" name="phone" value="${dto.getAdmin_phone() }">
								</td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<input class="cancle_btn" type="button" value="취소" onclick="location.href='admin_account_list'"> 
							<input class="modify_btn" type="submit" value="등록">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>