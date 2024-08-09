<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<link rel="stylesheet" href="css/common/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<div class="reservationOk">
		<div class="res_contents">
			<h2>비회원 예약조회</h2>
			<table>
				<tbody>
					<tr>
						<th>예약 번호</th>
						<td>${dto.getRes_no() }</td>
					</tr>
					<tr>
						<th>예약 날짜</th>
						<td>${dto.getRes_in_date() } ~ ${dto.getRes_out_date() }</td>
					</tr>
					<tr>
						<th>방 타입</th>
						<td>${dto.getRes_room_type() }</td>
					</tr>
					<tr>
						<th>예약 인원</th>
						<td>${dto.getRes_peoples() } 인</td>
					</tr>
					<tr>
						<th>예약 완료 날짜</th>
						<td>${dto.getRes_regdate().substring(0, 16) }</td>
					</tr>
				</tbody>
			</table>
			<input type="button" onclick="location.href='main'" value="확인" />&nbsp;&nbsp;
			<input type="button" onclick="location.href='user_login'" value="로그인" />
		</div>
	</div>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>