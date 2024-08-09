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
			<div class="admin_activity_modify-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;액티비티
					현황 > 액티비티 수정
				</h1>
				<div class="admin_activity_modify_cont">
					<form method="post" action="admin_activity_modify_ok">
						<input type="hidden" name="id" value="${dto.getActivity_id() }">
						<input type="hidden" name="page" value="${page }">
						<table>
							<tr>
								<th>고유 번호</th>
								<td>${dto.getActivity_id() }</td>
							</tr>
							<tr>
								<th>시설 타입</th>
								<td class="insert_type">
									<select name="type">
										<option>선택안함</option>
										<c:forEach items="${typeList}" var="type">
											<c:if test="${type == dto.getActivity_type() }">
												<option selected>${type}</option>
											</c:if>
											<c:if test="${type != dto.getActivity_type() }">
												<option>${type}</option>
											</c:if>
										</c:forEach>
									</select>
									<br><br>OR<br><br>
									<input type="text" name="input_type" class="new_type"
										placeholder="새로운 타입을 등록할때 입력.">
								</td>
							</tr>
							<tr>
								<th>시설 이름</th>
								<td><input type="text" name="name"
									value="${dto.getActivity_name() }"></td>
							</tr>
							<tr>
								<th>오픈 시간</th>
								<td><input type="time" name="open"
									value="${dto.getActivity_start_time() }"></td>
							</tr>
							<tr>
								<th>마감 시간</th>
								<td><input type="time" name="close"
									value="${dto.getActivity_end_time() }"></td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<input class="cancle_btn" type="button" value="돌아가기"
								onclick="location.href='admin_activity_list'"> <input
								class="modify_btn" type="submit" value="수정">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>