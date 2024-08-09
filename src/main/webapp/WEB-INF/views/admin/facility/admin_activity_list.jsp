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
			<div class="admin_activity_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;액티비티
					현황
				</h1>
				<div class="count_box">
					<p>총 ${cnt }개</p>

					<div class="type_search_box">
						<div class="activity_type_link">
							<a href="admin_activity_insert" class="type_insert_link">▶액티비티
								추가하기</a>
						</div>
						<form method="get" action="admin_activity_search"
							class="activity_info_form">
							<span class="form_title">액티비티 타입&nbsp;&nbsp;|</span> &nbsp;&nbsp;
							<select name="type">
								<option>전체</option>
								<c:if test="${!is_Search }">
									<c:forEach items="${typeList }" var="list">
										<option>${list }</option>
									</c:forEach>
								</c:if>
								<c:if test="${is_Search }">
									<c:forEach items="${typeList }" var="list">
										<c:if test="${type == list }">
											<option selected>${list }</option>
										</c:if>
										<c:if test="${type != list }">
											<option>${list }</option>
										</c:if>
									</c:forEach>
								</c:if>
							</select> <br> <input type="submit" class="submit_btn" value="조회">
						</form>
					</div>
				</div>
				<div class="activity_list_box">
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
								<tbody>
									<c:forEach items="${list }" var="dto">
										<tr class="table-row">
											<td>${dto.getActivity_id() }</td>
											<td>${dto.getActivity_type() }</td>
											<td>${dto.getActivity_name()}</td>
											<td>${dto.getActivity_start_time() }</td>
											<td>${dto.getActivity_end_time() }</td>
											<td>
												<button class="insert_btn"
													onclick="location.href='admin_activity_modify?id=${dto.getActivity_id() }&page=${page }'">수정</button>
												<button class="insert_btn"
													onclick="location.href='admin_activity_delete?id=${dto.getActivity_id() }&page=${page }'">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
							<c:if test="${is_Search }">
								<c:forEach items="${list }" var="dto">
									<tbody>
										<tr class="table-row">
											<td>${dto.getActivity_id() }</td>
											<td>${dto.getActivity_type() }</td>
											<td>${dto.getActivity_name()}</td>
											<td>${dto.getActivity_start_time() }</td>
											<td>${dto.getActivity_end_time() }</td>
											<td>
												<button class="insert_btn"
													onclick="location.href='admin_activity_modify?id=${dto.getActivity_id() }&page=${page }&type=${type }'">수정</button>
												<button class="insert_btn"
													onclick="location.href='admin_activity_delete?id=${dto.getActivity_id() }&page=${page }'">삭제</button>
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
										<h3>등록된 액티비티가 없습니다.</h3>
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
									onclick="location.href='admin_activity_list?page=1'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_activity_list?page=${page - 1 }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_activity_list?page=${i }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_activity_list?page=${i }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_activity_list?page=${page + 3 }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_activity_list?page=${page + 2 }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_activity_list?page=${page + 1 }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_activity_list?page=${allPage }'">End</button>
							</c:if>
						</div>
					</c:if>
					<c:if test="${is_Search }">
						<div class="admin_pagination">
							<c:if test="${page != 1 }">
								<button type="button" class="first-btn"
									onclick="location.href='admin_activity_search?page=1&type=${type }'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_activity_search?page=${page - 1 }&type=${type }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_activity_search?page=${i }&type=${type }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_activity_search?page=${i }&type=${type }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_activity_search?page=${page + 3 }&type=${type }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_activity_search?page=${page + 2 }&type=${type }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_activity_search?page=${page + 1 }&type=${type }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_activity_search?page=${allPage }&type=${type }'">End</button>
							</c:if>
						</div>
					</c:if>
				</section>
			</div>
		</div>
	</main>
</body>
</html>