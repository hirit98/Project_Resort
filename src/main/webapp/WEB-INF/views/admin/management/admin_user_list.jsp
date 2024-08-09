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
			<div class="admin_user_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;고객
					명단
				</h1>
				<div class="search_box">
					<p>총 ${cnt}명</p>
					<div class="search_form">
						<form method="get" action="admin_user_search">
							<select name="field" class="sch_1">
								<option>전체</option>
								<option>이름</option>
								<option>연락처</option>
								<option>이메일</option>
								<option>등급</option>
							</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요."
								class="sch"> <input type="submit" value="검색"
								class="sch_ok">
							<c:if test="${!empty param.keyword}">
								<input type="button" value="목록" class="sch_ok"
									onclick="location.href='admin_user_list'">
							</c:if>
						</form>
					</div>
				</div>

				<div class="user_list_table">
					<table class="user_list_table-table">
						<thead>
							<tr>
								<th>No.</th>
								<th>성 함</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>예약등록</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<c:if test="${!empty list}">
							<c:if test="${!is_Search }">
								<tbody>
									<c:forEach items="${list}" var="dto">
										<tr class="table-row">
											<td>${dto.getUser_no() }</td>
											<td>${dto.getUser_name() }</td>
											<td>${dto.getUser_phone() }</td>
											<td>${dto.getUser_email() }</td>
											<td>
												<button class="res_insert_btn"
													onclick="location.href='admin_reservation_insert?no=${dto.getUser_no() }'">등록</button>
											</td>
											<td>
												<button class="res_insert_btn"
													onclick="location.href='admin_user_content?no=${dto.getUser_no() }&page=${page}'">상세보기</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
							<c:if test="${is_Search }">
								<tbody>
									<c:forEach items="${list }" var="dto">
										<tr class="table-row">
											<td>${dto.getUser_no() }</td>
											<td>${dto.getUser_name() }</td>
											<td>${dto.getUser_phone() }</td>
											<td>${dto.getUser_email() }</td>
											<td>
												<button class="res_insert_btn"
													onclick="location.href='admin_reservation_insert?no=${dto.getUser_no() }'">등록</button>
											</td>
											<td>
												<button class="res_insert_btn"
													onclick="location.href='admin_user_search_content?no=${dto.getUser_no() }&page=${page }&field=${field }&keyword=${keyword }'">상세보기</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</c:if>
						<c:if test="${empty list }">
							<tbody>
								<tr class="table-row">
									<td colspan="6">회원명단이 존재하지 않습니다.</td>
								</tr>
							</tbody>
						</c:if>
					</table>
				</div>
				<section>
					<c:if test="${!empty list}">
						<c:if test="${!is_Search }">
							<div class="admin_pagination">
								<c:if test="${page != 1}">
									<button type="button" class="first-btn"
										onclick="location.href='admin_user_list?page=1'">First</button>
									<button type="button" class="prev-btn"
										onclick="location.href='admin_user_list?page=${page - 1}'">Previous</button>
								</c:if>
								<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
									<div class="page-numbers">
										<c:if test="${page == i}">
											<button type="button" class="active-btn"
												onclick="location.href='admin_user_list?page=${i}'">${i}</button>
										</c:if>
										<c:if test="${page != i}">
											<button type="button" class="page-btn"
												onclick="location.href='admin_user_list?page=${i}'">${i}</button>
										</c:if>
									</div>
								</c:forEach>
								<c:if test="${endBlock < allPage}">
									<button type="button" class="next-btn"
										onclick="location.href='admin_user_list?page=${page + 1}'">Next</button>
									<button type="button" class="end-btn"
										onclick="location.href='admin_user_list?page=${allPage}'">End</button>
								</c:if>
							</div>
						</c:if>
						<c:if test="${is_Search }">
							<div class="admin_pagination">
								<c:if test="${page != 1}">
									<button type="button" class="first-btn"
										onclick="location.href='admin_user_search?page=1&field=${field}&keyword=${keyword }'">First</button>
									<button type="button" class="prev-btn"
										onclick="location.href='admin_user_search?page=${page - 1}&field=${field}&keyword=${keyword }'">Previous</button>
								</c:if>
								<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
									<div class="page-numbers">
										<c:if test="${page == i}">
											<button type="button" class="active-btn"
												onclick="location.href='admin_user_search?page=${i}&field=${field}&keyword=${keyword }'">${i}</button>
										</c:if>
										<c:if test="${page != i}">
											<button type="button" class="page-btn"
												onclick="location.href='admin_user_search?page=${i}&field=${field}&keyword=${keyword }'">${i}</button>
										</c:if>
									</div>
								</c:forEach>
								<c:if test="${endBlock < allPage}">
									<button type="button" class="next-btn"
										onclick="location.href='admin_user_search?page=${page + 1}&field=${field}&keyword=${keyword }'">Next</button>
									<button type="button" class="end-btn"
										onclick="location.href='admin_user_search?page=${allPage}&field=${field}&keyword=${keyword }'">End</button>
								</c:if>
							</div>
						</c:if>
					</c:if>
				</section>
			</div>
		</div>
	</main>
</body>
</html>