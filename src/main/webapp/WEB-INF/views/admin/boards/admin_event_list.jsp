<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div class="admin_user_list-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;이벤트
				</h1>
				<div class="search_box">
					<c:if test="${!is_Search }">
						<p>총 ${cnt }개</p>
					</c:if>
					<c:if test="${is_Search }">
						<p>검색된 이벤트 총 ${cnt }개</p>
					</c:if>
					<div class="search_form">
						<form method="get" action="admin_event_search">
							<select name="field" class="sch_1">
								<option>전체</option>
								<option>제목</option>
								<option>내용</option>
								<option>작성자</option>
							</select> 
							<input type="text" name="keyword" placeholder="검색어를 입력하세요." class="sch"> 
							<input type="submit" value="검색" class="sch_ok">
                            <c:if test="${!empty param.keyword}">
                                <input type="button" value="목록" class="sch_ok" onclick="location.href='admin_event_list'">
                            </c:if>
						</form>
					</div>
				</div>
				<div class="event_list_table">
					<table>
						<thead>
							<tr>
								<th style="width: 138px">No.</th>
								<th style="width: 438px">제 목</th>
								<th style="width: 239px">작성자</th>
								<th style="width: 423px">작성일자</th>
							</tr>
						</thead>
						<c:if test="${!empty list }">
							<c:if test="${!is_Search }">
								<c:forEach items="${list }" var="dto">
									<tbody>
										<tr class="table-row" onclick="location.href='admin_event_content?no=${dto.getEvent_board_no() }&page=${page }'">
											<td>${dto.getEvent_board_no() }</td>
											<td>${dto.getEvent_board_title() }</td>
											<td>${dto.getEvent_board_writer_id() }</td>
											<c:if test="${empty dto.getEvent_board_update() }">
												<td>${dto.getEvent_board_date().substring(0,16) }</td>
											</c:if>
											<c:if test="${!empty dto.getEvent_board_update() }">
												<td>${dto.getEvent_board_update().substring(0,16) }</td>
											</c:if>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
							<c:if test="${is_Search }">
								<c:forEach items="${list }" var="dto">
									<tbody>
										<tr class="table-row"
											onclick="location.href='admin_event_search_content?no=${dto.getEvent_board_no() }&page=${page }&field=${field }&keyword=${keyword }'">
											<td>${dto.getEvent_board_no() }</td>
											<td>${dto.getEvent_board_title() }</td>
											<td>${dto.getEvent_board_writer_id() }</td>
											<c:if test="${empty dto.getEvent_board_update() }">
												<td>${dto.getEvent_board_date().substring(0,16) }</td>
											</c:if>
											<c:if test="${!empty dto.getEvent_board_update() }">
												<td>${dto.getEvent_board_update().substring(0,16) }</td>
											</c:if>
										</tr>
									</tbody>
								</c:forEach>
							</c:if>
						</c:if>
						<c:if test="${empty list }">
							<tbody>
								<tr class="table-row" onclick="">
									<td colspan="4">
										<h3>등록된 이벤트가 없습니다.</h3>
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
									onclick="location.href='admin_event_list?page=1'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_event_list?page=${page - 1 }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_event_list?page=${i }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_event_list?page=${i }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_event_list?page=${page + 3 }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_event_list?page=${page + 2 }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_event_list?page=${page + 1 }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_event_list?page=${allPage }'">End</button>
							</c:if>
							<button type="button" class="insert-btn"
								onclick="location.href='admin_event_insert'">글 쓰기</button>
						</div>
					</c:if>
					<c:if test="${is_Search }">
						<div class="admin_pagination">
							<c:if test="${page != 1 }">
								<button type="button" class="first-btn"
									onclick="location.href='admin_event_search?page=1&field=${field }&keyword=${keyword }'">First</button>
								<button type="button" class="prev-btn"
									onclick="location.href='admin_event_search?page=${page - 1 }&field=${field }&keyword=${keyword }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											onclick="location.href='admin_event_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											onclick="location.href='admin_event_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_event_search?page=${page + 3 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_event_search?page=${page + 2 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" class="next-btn"
										onclick="location.href='admin_event_search?page=${page + 1 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<button type="button" class="end-btn"
									onclick="location.href='admin_event_search?page=${allPage }&field=${field }&keyword=${keyword }'">End</button>
							</c:if>
							<button type="button" class="insert-btn"
								onclick="location.href='admin_event_insert'">글 쓰기</button>
						</div>
					</c:if>
				</section>
			</div>
		</div>
	</main>
</body>
</html>