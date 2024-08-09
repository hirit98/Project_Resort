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
			<div class="admin_facility_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;부대시설 현황
				</h1> 
				<div class="count_box">
					<p>총 ${cnt }개</p>
					
				<div class="type_search_box">
					<div class="facility_type_link"><a href="admin_facility_insert" class="type_insert_link">▶부대시설 추가하기</a></div>
					<form method="get" action="admin_facility_search" class="facility_info_form">
						<span class="form_title">부대시설 타입&nbsp;&nbsp;|</span> &nbsp;&nbsp;
						<select name="facility_type">
							<option>전체</option>
							<option>음식점</option>
							<option>주류점</option>
							<option>편의시설</option>
							<option>기타</option>
						</select>
						<br>
						<div>
							<input type="submit" class="submit_btn" value="조회">
						</div>
					</form>
				</div>
				</div>
				<div class="facility_list_box">
					<table>
					<thead>
						<tr>
							<th>고유 번호</th>
							<th>시설 타입</th>
							<th>시설 이름</th>
							<th>오픈 시간</th>
							<th>마감 시간</th>
							<th>시설 관리</th>
						</tr>
					</thead>
						<c:if test="${!empty list }">
						<c:if test="${!is_Search }">
							<c:forEach items="${list }" var="dto">
								<tbody>
									<tr class="table-row">
										<td>${dto.getFacility_id() }</td>
										<td>${dto.getFacility_type() }</td>
										<td>${dto.getFacility_name() }</td>
										<td>${dto.getFacility_start_time() }</td>
										<td>${dto.getFacility_end_time() }</td>
										<td>
											<button class="insert_btn" onclick="location.href='admin_facility_content?no=${dto.getFacility_id()}&page=${page }'">수정</button>
											<button class="insert_btn" onclick="location.href='admin_facility_delete'">삭제</button>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
						<c:if test="${is_Search }">
								<c:forEach items="${list }" var="dto">
									<tbody>
										<tr class="table-row" >
											<td>${dto.getFacility_id() }</td>
											<td>${dto.getFacility_type() }</td>
											<td>${dto.getFacility_name()}</td>
											<td>${dto.getFacility_start_time() }</td>
											<td>${dto.getFacility_end_time() }</td>
											<td>
												<button class="insert_btn" 
											onclick="location.href='admin_facility_search_content?no=${dto.getFacility_id() }&page=${page }&facility_type=${facility_type }'">수정</button>
												<button class="insert_btn" onclick="location.href='admin_facility_delete'">삭제</button>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
						</c:if>
						<c:if test="${empty list }">
							<tbody>
								<tr class="table-row">
									<td colspan="6">
										<h3>등록된 부대시설이 없습니다.</h3>
									</td>
								</tr>
							</tbody>
						</c:if>
					</table>
				</div>
				
				<section>
						<c:if test="${!is_Search }">
							<div class="admin_pagination">
								<c:if test="${page != 1 }">
									<button type="button" class="first-btn"
										onclick="location.href='admin_facility_list?page=1'">First</button>
									<button type="button" class="prev-btn"
										onclick="location.href='admin_facility_list?page=${page - 1 }'">Previous</button>
								</c:if>
								<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
									<div class="page-numbers">
										<c:if test="${page == i }">
											<button type="button" class="active-btn"
												onclick="location.href='admin_facility_list?page=${i }'">${i }</button>
										</c:if>
										<c:if test="${page != i }">
											<button type="button" class="page-btn"
												onclick="location.href='admin_facility_list?page=${i }'">${i }</button>
										</c:if>
									</div>
								</c:forEach>
								<c:if test="${endBlock < allPage }">
									<c:if test="${startBlock == page }">
										<button type="button" class="next-btn"
											onclick="location.href='admin_facility_list?page=${page + 3 }'">Next</button>
									</c:if>
									<c:if test="${startBlock + 1 == page }">
										<button type="button" class="next-btn"
											onclick="location.href='admin_facility_list?page=${page + 2 }'">Next</button>
									</c:if>
									<c:if test="${endBlock == page }">
										<button type="button" class="next-btn"
											onclick="location.href='admin_facility_list?page=${page + 1 }'">Next</button>
									</c:if>
									<button type="button" class="end-btn"
										onclick="location.href='admin_facility_list?page=${allPage }'">End</button>
								</c:if>
							</div>
						</c:if>
						<c:if test="${is_Search }">
							<div class="admin_pagination">
								<c:if test="${page != 1 }">
									<button type="button" class="first-btn"
										onclick="location.href='admin_facility_search?page=1&field=${field }&keyword=${keyword }'">First</button>
									<button type="button" class="prev-btn"
										onclick="location.href='admin_facility_search?page=${page - 1 }&field=${field }&keyword=${keyword }'">Previous</button>
								</c:if>
								<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
									<div class="page-numbers">
										<c:if test="${page == i }">
											<button type="button" class="active-btn"
												onclick="location.href='admin_facility_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
										</c:if>
										<c:if test="${page != i }">
											<button type="button" class="page-btn"
												onclick="location.href='admin_facility_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
										</c:if>
									</div>
								</c:forEach>
								<c:if test="${endBlock < allPage }">
									<c:if test="${startBlock == page }">
										<button type="button" class="next-btn"
											onclick="location.href='admin_facility_search?page=${page + 3 }&field=${field }&keyword=${keyword }'">Next</button>
									</c:if>
									<c:if test="${startBlock + 1 == page }">
										<button type="button" class="next-btn"
											onclick="location.href='admin_facility_search?page=${page + 2 }&field=${field }&keyword=${keyword }'">Next</button>
									</c:if>
									<c:if test="${endBlock == page }">
										<button type="button" class="next-btn"
											onclick="location.href='admin_facility_search?page=${page + 1 }&field=${field }&keyword=${keyword }'">Next</button>
									</c:if>
									<button type="button" class="end-btn"
										onclick="location.href='admin_facility_search?page=${allPage }&field=${field }&keyword=${keyword }'">End</button>
								</c:if>
							</div>
						</c:if>
				</section>
			</div>
		</div>
	</main>
</body>
</html>