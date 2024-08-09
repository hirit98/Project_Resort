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
			<div class="admin_account_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;관리자
					설정
				</h1>
				<div class="admin_account_search_box">
					<div class="admin_account_insert">
						<a href="admin_account_insert" class="type_insert_link">▶관리자
							추가하기</a>
					</div>
					<form method="get" action="admin_account_search"
						class="account_list_form">
						<span class="form_title">검색 종류&nbsp;&nbsp;|</span> &nbsp;&nbsp; <select
							name="field">
							<option>전체</option>
							<option>이름</option>
							<option>연락처</option>
							<option>직책</option>
						</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요.">
						<br>
						<div>
							<input type="submit" class="submit_btn" value="조회">
						</div>
					</form>
				</div>
				<div class="admin_account_list_box">
					<table>
						<thead>
							<tr>
								<th>관리자No.</th>
								<th>이름</th>
								<th>연락처</th>
								<th>직책</th>
								<th colspan='2'>관리</th>
							</tr>
						</thead>
						<c:if test="${!empty list}">
							<tbody>
								<c:forEach items="${list}" var="dto">
									<tr class="table-row">
										<td>${dto.getAdmin_no() }</td>
										<td>${dto.getAdmin_name() }</td>
										<td>${dto.getAdmin_phone() }</td>
										<td>${dto.getAdmin_job() }</td>
										<td>
											<button class="insert_btn"
												onclick="location.href='admin_account_modify?no=${dto.getAdmin_no() }'">수정</button>
											<button class="insert_btn"
												onclick="location.href='admin_account_delete?no=${dto.getAdmin_no() }'">삭제</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
						<c:if test="${empty list}">
							<tbody>
								<tr class="table-row">
									<td colspan="5" align="center">
										<h3>전체 게시물 리스트가 없습니다.</h3>
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
									onclick="location.href='admin_account_list?page=1'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_account_list?page=${page - 1 }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_account_list?page=${i }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_account_list?page=${i }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_account_list?page=${page + 3 }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_account_list?page=${page + 2 }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_account_list?page=${page + 1 }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_account_list?page=${allPage }'">End</button>
							</c:if>
						</div>
					</c:if>
					<c:if test="${is_Search }">
						<div class="admin_pagination">
							<c:if test="${page != 1 }">
								<button type="button" class="first-btn"
									onclick="location.href='admin_account_search?page=1&field=${field }&keyword=${keyword }'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_account_search?page=${page - 1 }&field=${field }&keyword=${keyword }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_account_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_account_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_account_search?page=${page + 3 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_account_search?page=${page + 2 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_account_search?page=${page + 1 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_account_search?page=${allPage }&field=${field }&keyword=${keyword }'">End</button>
							</c:if>
						</div>
					</c:if>
				</section>
			</div>
		</div>
	</main>
</body>
</html>