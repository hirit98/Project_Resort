<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="admin_room_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;객실 현황 >> "객실 타입" 리스트
				</h1> 
				<div class="admin_room_list_box">
					<table>
						<thead>
							<tr>
								<th>객실No.</th>
								<th>객실 타입</th>
								<th>예약 상태</th>
								<th>예약 정보</th>
							</tr>
						</thead>
						<c:if test="${!empty list }">
							<tbody>
								<c:forEach items="${list }" var="dto">
									<tr>
										<td>${dto.getRoom_no() }</td>
										<td>${fn:toUpperCase(dto.getRoom_type())}</td>
										<c:if test="${roomsList.contains(dto.getRoom_no()) }">
											<td style="color: green;">예약가능</td>
										</c:if>
										<td>
											<button class="list_btn" onclick="location.href='admin_reservation_day?no=${dto.getRoom_no() }'">예약하기</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
				</div>
				<section>
					<div class="admin_pagination">
						<c:if test="${page != 1 }">
							<button type="button" class="first-btn"
								onclick="location.href='admin_room_list?page=1&type=${type }'">First</button>
							<button type="button" class="prev-btn"
								onclick="location.href='admin_room_list?page=${page - 1 }&type=${type }'">Previous</button>
						</c:if>
						<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							<div class="page-numbers">
								<c:if test="${page == i }">
									<button type="button" class="active-btn"
										onclick="location.href='admin_room_list?page=${i }&type=${type }'">${i }</button>
								</c:if>
								<c:if test="${page != i }">
									<button type="button" class="page-btn"
										onclick="location.href='admin_room_list?page=${i }&type=${type }'">${i }</button>
								</c:if>
							</div>
						</c:forEach>
						<c:if test="${endBlock < allPage }">
							<c:if test="${startBlock == page }">
								<button type="button" class="next-btn"
									onclick="location.href='admin_room_list?page=${page + 3 }&type=${type }'">Next</button>
							</c:if>
							<c:if test="${startBlock + 1 == page }">
								<button type="button" class="next-btn"
									onclick="location.href='admin_room_list?page=${page + 2 }&type=${type }'">Next</button>
							</c:if>
							<c:if test="${endBlock == page }">
								<button type="button" class="next-btn"
									onclick="location.href='admin_room_list?page=${page + 1 }&type=${type }'">Next</button>
							</c:if>
							<button type="button" class="end-btn"
								onclick="location.href='admin_room_list?page=${allPage }&type=${type }'">End</button>
						</c:if>
					</div>
				</section>
			</div>
		</div>
	</main>

</body>
</html>