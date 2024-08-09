<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<link rel="stylesheet" href="css/common/style.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />

	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_reservation_content-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;예약 리스트 > 예약 수정하기
				</h1>
				<div class="admin_reservation_cont">
					<form method="post" action="admin_reservation_modify_ok">
						<input type="hidden" name="no" value="${dto.getRes_no() }">
						<input type="hidden" name="page" value="${page }">
						<table>
							<tr>
								<th>예약번호</th>
								<td>
									${dto.getRes_no() }
								</td>
							</tr>
							<tr>
								<th>예약자 ID</th>
								<td>
									<input type="text" name="id" value="${dto.getRes_user_id() }">
								</td>
							</tr>
							<tr>
								<th>룸 타입</th>
								<td>
									<input type="text" name="room_type" value="${dto.getRes_room_type() }">
								</td>
							</tr>
							<tr>
								<th>객실번호</th>
								<td>
									<input type="text" name="room_no" value="${dto.getRes_room_no() }">
								</td>
							</tr>
							<tr>
								<th>체크인</th>
								<td>
									<input type="date" name="checkIn" value="${dto.getRes_in_date() }">
								</td>
							</tr>
							<tr>
								<th>체크아웃</th>
								<td>
									<input type="date" name="checkOut" value="${dto.getRes_out_date() }">
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<input type="text" name="phone" value="${dto.getRes_user_phone() }">
								</td>
							</tr>
							<tr>
								<th>투숙인원</th>
								<td>
									<input type="number" name="peoples" value="${dto.getRes_peoples() }">
								</td>
							</tr>
							<tr>
								<th>예약현황</th>
								<td>
									<select name="modify_status">
										<c:forEach items="${statusList }" var="status">
											<c:if test="${status eq dto.getRes_status() }">
												<option selected>${status }</option>
											</c:if>
											<c:if test="${status ne dto.getRes_status() }">
												<option>${status }</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>예약시각</th>
								<td>
									${dto.getRes_regdate() }
								</td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<c:if test="${empty field }">
								<input class="cancle_btn" type="button" value="취소" onclick="location.href='admin_reservation_list?page=${page }'">
							</c:if>
							<c:if test="${!empty field }">
								<input class="cancle_btn" type="button" value="취소" onclick="location.href='admin_reservation_search?page=${page }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">
							</c:if>
							<input class="modify_btn" type="submit" value="수정">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>

</body>
</html>