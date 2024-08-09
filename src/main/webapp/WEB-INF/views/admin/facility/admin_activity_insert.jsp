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
			<div class="admin_activity_insert-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;액티비티
					현황 > 액티비티 추가
				</h1>
				<div class="admin_activity_insert_cont">
					<form method="post" action="admin_activity_insert_ok">
						<table>
							<tr>
								<th>시설 타입</th>
								<td>
								<select name="type">
									<option>선택안함</option>
									<c:forEach items="${typeList}" var="type">
										<option>${type}</option>
									</c:forEach>
								</select>
								<br> <br> OR<br> <br> 
								<input type="text" name="input_type" placeholder="새로운 타입을 등록할때 입력."></td>
							</tr>
							<tr>
								<th>시설 이름</th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<th>오픈 시간</th>
								<td><input type="time" name="open"></td>
							</tr>
							<tr>
								<th>마감 시간</th>
								<td><input type="time" name="close"></td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<input class="cancle_btn" type="button" value="취소"
								onclick="location.href='admin_activity_list'"> <input
								class="modify_btn" type="submit" value="등록">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>