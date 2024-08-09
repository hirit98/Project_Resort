<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div class="admin_reservation_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;예약
					리스트 <span class="tool-tip">※ 신규 등록은 '고객 명단' 메뉴에서 조회후 진행할 수
						있습니다.</span>
					<button onclick="location.href='admin_payment_update'">update</button>
				</h1>
				<div class="reservation_search_box">
					<form method="get" action="admin_reservation_search" class="reservation_form">
						<span class="form_title">ㆍ예약기간&nbsp;&nbsp;|</span> &nbsp;&nbsp; 
						<input class="input-date" type="date" name="start">
						&nbsp;&nbsp;~&nbsp;&nbsp; 
						<input class="input-date" type="date" name="end"><br> 
						<span class="form_title">ㆍ검색항목&nbsp;&nbsp;|</span>&nbsp;&nbsp;&nbsp; 
						<select name="field" class="input-field">
							<option>전체</option>
							<option>예약번호</option>
							<option>예약자</option>
							<option>연락처</option>
						</select>&nbsp;&nbsp;&nbsp;
						<input class="input-keyword" type="text" name="keyword" placeholder="검색어를 입력하세요."><br> 
						<span class="form_title">ㆍ예약상태&nbsp;&nbsp;|</span> &nbsp;&nbsp; 
						<input class="input-radio" type="radio" name="status" id="radio-all" value="전체" checked> 
						<label for="radio-all">전체</label>&nbsp;&nbsp; 
						<input class="input-radio" type="radio" name="status" id="radio-standby" value="대기">
						<label for="radio-standby">대기</label>&nbsp;&nbsp;
						<input class="input-radio" type="radio" name="status" id="radio-complete" value="체크인">
						<label for="radio-complete">체크인</label>&nbsp;&nbsp;
						<input class="input-radio" type="radio" name="status" id="radio-cancle" value="체크아웃">
						<label for="radio-cancle">체크아웃</label>
						<div>
							<input type="submit" class="submit_btn" value="검색">
						</div>
					</form>
				</div>
				<div class="reservation_list_box">
					<table>
						<thead>
							<tr>
								<th>예약번호</th>
								<th>ID</th>
								<th>연락처</th>
								<th>체크인</th>
								<th>체크아웃</th>
								<th>예약날짜</th>
								<th>예약상태</th>
								<th>관리</th>
							</tr>
						</thead>
						<c:if test="${!empty list }">
							<c:if test="${!is_Search }">
								<tbody>
									<c:forEach items="${list }" var="dto">
										<tr class="table-row">
											<td>${dto.getRes_no() }</td>
											<td>${dto.getRes_user_id() }</td>
											<td>${dto.getRes_user_phone() }</td>
											<td>${dto.getRes_in_date() }</td>
											<td>${dto.getRes_out_date() }</td>
											<td>${dto.getRes_regdate().substring(0, 16) }</td>
											<c:if test="${dto.getRes_status() eq '대기' }">
												<td>${dto.getRes_status() }</td>
											</c:if>
											<c:if test="${dto.getRes_status() eq '체크인' }">
												<td style="color: #00d300;">${dto.getRes_status() }</td>
											</c:if>
											<c:if test="${dto.getRes_status() eq '체크아웃' }">
												<td style="color: red;">${dto.getRes_status() }</td>
											</c:if>
											<td>
												<button onclick="location.href='admin_reservation_content?no=${dto.getRes_no() }&page=${page }'">수정</button>
												<button onclick="if(confirm('해당 객실정보를 삭제하시겠습니까?')) {
													location.href='admin_reservation_delete?no=${dto.getRes_no() }'} else { return; }">취소</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
							<c:if test="${is_Search }">
								<tbody>
									<c:forEach items="${list }" var="dto">
										<tr class="table-row">
											<td>${dto.getRes_no() }</td>
											<td>${dto.getRes_user_id() }</td>
											<td>${dto.getRes_user_phone() }</td>
											<td>${dto.getRes_in_date() }</td>
											<td>${dto.getRes_out_date() }</td>
											<td>${dto.getRes_regdate().substring(0, 16) }</td>
											<c:if test="${dto.getRes_status() eq '대기' }">
												<td>${dto.getRes_status() }</td>
											</c:if>
											<c:if test="${dto.getRes_status() eq '체크인' }">
												<td style="color: #00d300;">${dto.getRes_status() }</td>
											</c:if>
											<c:if test="${dto.getRes_status() eq '체크아웃' }">
												<td style="color: red;">${dto.getRes_status() }</td>
											</c:if>
											<td>
												<button onclick="location.href='admin_reservation_search_content?no=${dto.getRes_no() }&page=${page }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">수정</button>
												<button onclick="">취소</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</c:if>
						<c:if test="${empty list }">
							<tbody>
								<tr>
									<td colspan="8">예약정보가 존재하지 않습니다.</td>
								</tr>
							</tbody>
						</c:if>
					</table>
				</div>
				<!-- 페이징 -->
				<section>
					<c:if test="${!is_Search }">
						<div class="admin_pagination">
							<c:if test="${page != 1 }">
								<button type="button" class="first-btn"
									onclick="location.href='admin_reservation_list?page=1'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_reservation_list?page=${page - 1 }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_reservation_list?page=${i }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_reservation_list?page=${i }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_reservation_list?page=${page + 3 }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_reservation_list?page=${page + 2 }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_reservation_list?page=${page + 1 }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_reservation_list?page=${allPage }'">End</button>
							</c:if>
						</div>
					</c:if>
					<c:if test="${is_Search }">
						<div class="admin_pagination">
							<c:if test="${page != 1 }">
								<button type="button" class="first-btn"
									onclick="location.href='admin_reservation_search?page=1&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_reservation_search?page=${page - 1 }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_reservation_search?page=${i }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_reservation_search?page=${i }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_reservation_search?page=${page + 3 }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_reservation_search?page=${page + 2 }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_reservation_search?page=${page + 1 }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_reservation_search?page=${allPage }&field=${field }&keyword=${keyword }&start=${start }&end=${end }&status=${status }'">End</button>
							</c:if>
						</div>
					</c:if>
				</section>
			</div>
		</div>
	</main>
</body>
</html>