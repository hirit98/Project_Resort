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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/admin_reservate.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />

	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_reservation_insert-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp; 예약 등록
				</h1>
				<div class="admin_reservation_insert_cont">
					<form method="post" action="admin_reservation_day_ok">
						<table>
							<tr>
								<th>투숙 날짜</th>
								<td>
									<input type="date" name="start" id="checkIn" value="${dto.getRes_in_date() }" readonly>&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type="date" name="end" id="checkOut" value="${dto.getRes_out_date() }" readonly>
								</td>
							</tr>
							<tr>
								<th>객실 타입</th>
								<td>
									<input type="text" name="type" value="${dto.getRes_room_type() }" readonly>
								</td>
							</tr>
							<tr>
								<th>객실 No.</th>
								<td>
									<input type="text" name="room_no" value="${dto.getRes_room_no() }" readonly>
								</td>
							</tr>
							<tr>
								<th>예약자</th>
								<td>
									<input type="text" name="res_id" required>
								</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>
									<input type="text" name="phone" required>
								</td>
							</tr>
							<tr>
								<th>투숙 인원</th>
								<td>
									<input type="number" name="peoples" min="1" required>
								</td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<input class="cancle_btn" type="button" value="취소"
								onclick="location.href='admin_room_list?type=${dto.getRes_room_type() }'"> 
							<input class="modify_btn" type="submit" value="등록">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>