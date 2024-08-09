<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
    <div id="notice_container">
		<section>
            <div class="notice_bg">
	            <div class="notice_top">
	               	  <h1>공지사항</h1>
	            </div>
            </div>
        </section>
        <section>
            <div>
                <div class="notice_bottom">
                	<form method="get" action="board_notice_search">
	                    <div class="select">
	                        <select name="field">
	                            <option value="전체">전체</option>
	                            <option value="내용">내용</option>
	                            <option value="제목">제목</option>
	                        </select>
	                        <input type="text"  name="keyword" class="notice_search" placeholder="검색어를 입력하세요." autocomplete="off">
	                        <input type="submit" value="검색" class="notice_search_1">
	                    </div>
                    </form>
					<table>
						<thead>
							<tr>
								<th>No.</th>
								<th>제 목</th>
								<th>작성자</th>
								<th>작성일자</th>
							</tr>
						</thead>
						<c:if test="${!empty list }">
							<c:if test="${!is_Search }">
								<tbody>
									<c:forEach items="${list }" var="dto">
										<tr class="table-row"
											onclick="location.href='board_notice_content?no=${dto.getNotice_board_no() }&page=${page }'">
											<td>${dto.getNotice_board_no() }</td>
											<td>${dto.getNotice_board_title() }</td>
											<td>${dto.getNotice_board_writer_id() }</td>
											<c:if test="${empty dto.getNotice_board_update() }">
												<td>${dto.getNotice_board_date().substring(0,16) }</td>
											</c:if>
											<c:if test="${!empty dto.getNotice_board_update() }">
												<td>${dto.getNotice_board_update().substring(0,16) }</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
							<c:if test="${is_Search }">
								<tbody>
									<c:forEach items="${list }" var="dto">
										<tr class="table-row"
											onclick="location.href='board_notice_search_content?no=${dto.getNotice_board_no() }&page=${page }&field=${field }&keyword=${keyword }'">
											<td>${dto.getNotice_board_no() }</td>
											<td>${dto.getNotice_board_title() }</td>
											<td>${dto.getNotice_board_writer_id() }</td>
											<c:if test="${empty dto.getNotice_board_update() }">
												<td>${dto.getNotice_board_date().substring(0,16) }</td>
											</c:if>
											<c:if test="${!empty dto.getNotice_board_update() }">
												<td>${dto.getNotice_board_update().substring(0,16) }</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</c:if>
						<c:if test="${empty list }">
							<tbody>
								<tr class="table-row">
									<td colspan="4">
										<h3>등록된 공지사항이 없습니다.</h3>
									</td>
								</tr>
							</tbody>
						</c:if>
					</table>
                </div>
                <div class="pagination">
					<c:if test="${!is_Search }">
						<div class="page-numbers">
							<c:if test="${page != 1 }">
								<button type="button" onclick="location.href='board_notice?page=1'">&lt;&lt;</button>
								<button type="button" onclick="location.href='board_notice?page=${page - 1 }'">&lt;</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn"
											 onclick="location.href='board_notice?page=${i }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn"
											 onclick="location.href='board_notice?page=${i }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" onclick="location.href='board_notice?page=${page + 3 }'">></button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" onclick="location.href='board_notice?page=${page + 2 }'">></button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" onclick="location.href='board_notice?page=${page + 1 }'">></button>
								</c:if>
								<button type="button" onclick="location.href='board_notice?page=${allPage }'">>></button>
							</c:if>
						</div>
					</c:if>
					<c:if test="${is_Search }">
						<div class="page-numbers">
							<c:if test="${page != 1 }">
								<button type="button" onclick="location.href='board_notice_search?page=1&field=${field }&keyword=${keyword }'">First</button>
								<button type="button" onclick="location.href='board_notice_search?page=${page - 1 }&field=${field }&keyword=${keyword }'">Previous</button>
							</c:if>
							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<div class="page-numbers">
									<c:if test="${page == i }">
										<button type="button" class="active-btn" 
											onclick="location.href='board_notice_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
									</c:if>
									<c:if test="${page != i }">
										<button type="button" class="page-btn" 
											onclick="location.href='board_notice_search?page=${i }&field=${field }&keyword=${keyword }'">${i }</button>
									</c:if>
								</div>
							</c:forEach>
							<c:if test="${endBlock < allPage }">
								<c:if test="${startBlock == page }">
									<button type="button" onclick="location.href='board_notice_search?page=${page + 3 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<c:if test="${startBlock + 1 == page }">
									<button type="button" onclick="location.href='board_notice_search?page=${page + 2 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<c:if test="${endBlock == page }">
									<button type="button" onclick="location.href='board_notice_search?page=${page + 1 }&field=${field }&keyword=${keyword }'">Next</button>
								</c:if>
								<button type="button" onclick="location.href='board_notice_search?page=${allPage }&field=${field }&keyword=${keyword }'">End</button>
							</c:if>
						</div>
					</c:if>
                </div>
            </div>
        </section>
    </div>
	<!-- 푸터 끝 -->
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>