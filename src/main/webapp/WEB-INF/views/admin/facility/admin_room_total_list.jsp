<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="admin_room_total_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;객실
					현황
				</h1>
				<div class="room_type_search_box">
					<div class="room_total_link">
						<a href="admin_room_total_list" class="list_back_link">▶리스트로
							돌아가기</a>
					</div>
					<form method="get" action="admin_room_info_search"
						class="room_info_form">
						<span class="form_title">객실타입&nbsp;&nbsp;|</span> &nbsp;&nbsp; 
						<select name="room_type">
							<c:if test="${!empty type_list }">
								<option>전체</option>
								<c:if test="${!is_Search }">
									<c:forEach items="${type_list }" var="room_type">
										<option>${fn:toUpperCase(room_type)}</option>
									</c:forEach>
								</c:if>
								<c:if test="${is_Search }">
									<c:forEach items="${type_list }" var="room_type">
										<c:if test="${fn:toUpperCase(room_type) == type }">
											<option selected>${fn:toUpperCase(room_type)}</option>
										</c:if>
										<c:if test="${fn:toUpperCase(room_type) != type }">
											<option>${fn:toUpperCase(room_type)}</option>
										</c:if>
									</c:forEach>
								</c:if>
							</c:if>
							<c:if test="${empty type_list }">
								<option>::::::</option>
							</c:if>
						</select> <br>
						<div>
							<input type="submit" class="submit_btn" value="조회">
						</div>
					</form>
				</div>
				<div class="room_total_list_box">
					<table>
						<thead>
							<tr>
								<th>객실 타입</th>
								<th>객실 면적</th>
								<th>객실 정원</th>
								<th>객실 가격(1박)</th>
								<th>총 객실수</th>
								<th>예약가능한 객실수</th>
								<th>객실 관리</th>
							</tr>
						</thead>
						<c:if test="${!empty list }">
							<tbody>
								<c:forEach items="${list }" var="dto">
									<tr class="list-row">
										<td>${fn:toUpperCase(dto.getRoom_type())}</td>
										<td>
											<fmt:formatNumber>${dto.getRoom_area() }</fmt:formatNumber>㎡
										</td>
										<td>
											<fmt:formatNumber>${dto.getRoom_maximum() }</fmt:formatNumber>명
										</td>
										<td>
											<fmt:formatNumber>${dto.getRoom_price() }</fmt:formatNumber>원
										</td>
										<td>
											<a href="admin_room_list?type=${dto.getRoom_type() }">${dto.getRoom_total() }</a>
										</td>
										<td>${dto.getRoom_available() }</td>
										<td>
											<button class="insert_btn"
												onclick="location.href='admin_room_modify?type=${dto.getRoom_type() }'">수정</button>
											<button class="insert_btn"
												onclick="if(confirm('해당 객실정보를 삭제하시겠습니까?')) {
													location.href='admin_room_info_delete?type=${dto.getRoom_type() }'} else { return; }">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
						<c:if test="${empty list }">
							<tbody>
								<tr>
									<td colspan="7">등록된 객실이 존재하지 않습니다.</td>
								</tr>
							</tbody>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</main>
</body>
</html>