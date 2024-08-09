<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />
	<jsp:include page="/WEB-INF/include/mypage_sidebar.jsp" />
	</div>
	<div class="m_contents">
		<div class="main">
			<!-- 예약 내역 -->
			<h3>예약 내역</h3>
			<div class="qna_search">
				<form method="get" action="mypage_reservation_search">
					<select name="field" class="sch_1">
						<option value="6월">6월</option>
						<option value="5월">5월</option>
						<option value="4월">4월</option>
						<option value="3월">3월</option>
						<option value="2월">2월</option>
						<option value="1월">1월</option>
					</select> <input type="submit" value="검색하기">
				</form>
			</div>

			<c:if test="${!empty list }">
				<c:if test="${!is_Search }">
					<c:forEach items="${list }" var="dto">
						<div class="re_board w_box f_cl">
							<div class="re_list">
								<div class="re_date">
									<p>${dto.getRes_regdate().substring(0, 10)}</p>
								</div>
								<div class="re_more">
									<div class="re_room">
										<c:choose>
											<c:when test="${dto.getRes_room_type() eq 'royal'}">
												<img src="./img/room/main room/로얄 스위트.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'family'}">
												<img src="./img/room/main room/패밀리.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'suite'}">
												<img src="./img/room/main room/스위트.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'double'}">
												<img src="./img/room/main room/더블.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'single'}">
												<img src="./img/room/main room/싱글.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:otherwise>
												<img src="./img/room/main room/기본.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="re_review">
										<p>예약 번호 ${dto.getRes_no()}</p>
										<p>방 타입 ${dto.getRes_room_type()}</p>
										<p>${dto.getRes_in_date() }(${dto.dayOfWeekIn}) ~
											${dto.getRes_out_date() } (${dto.dayOfWeekOut}) | ${dto.nights}박</p>
										<p>체크인 15:00 | 체크아웃 11:00</p>
										<p>기준 ${dto.getRes_peoples()} 명 / 최대
											${dto.getRes_peoples()} 명</p>
										<c:if test="${!dto.isRes_review_status() }">
											<input type="button" value="리 뷰"
												onclick="location.href='mypage_reservation_review?no=${dto.getRes_no() }&page=${page }'">
										</c:if>
										<c:if test="${dto.isRes_review_status() }">
											<input type="button" value="작성완료" disabled>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${is_Search }">
					<c:forEach items="${list }" var="dto">
						<div class="re_board w_box f_cl">
							<div class="re_list">
								<div class="re_date">
									<p>${dto.getRes_regdate().substring(0, 10)}</p>
								</div>
								<div class="re_more">
									<div class="re_room">
										<c:choose>
											<c:when test="${dto.getRes_room_type() eq 'royal'}">
												<img src="./img/room/main room/로얄 스위트.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'family'}">
												<img src="./img/room/main room/패밀리.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'suite'}">
												<img src="./img/room/main room/스위트.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'double'}">
												<img src="./img/room/main room/더블.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:when test="${dto.getRes_room_type() eq 'single'}">
												<img src="./img/room/main room/싱글.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:when>
											<c:otherwise>
												<img src="./img/room/main room/기본.jpg" alt="Room"
													style="height: 248px; width: 350px;">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="re_review">
										<p>예약 번호 ${dto.getRes_no()}</p>
										<p>방 타입 ${dto.getRes_room_type()}</p>
										<p>${dto.res_in_date}(${dto.dayOfWeekIn}) ~
											${dto.res_out_date} (${dto.dayOfWeekOut}) | ${dto.nights}박</p>
										<p>체크인 18:00 | 체크아웃 14:00</p>
										<p>기준 ${dto.getRes_peoples()} 명 / 최대
											${dto.getRes_peoples()} 명</p>
										<input type="button" value="리 뷰"
											onclick="location.href='mypage_reservation_review?no=${dto.getRes_no() }&page=${page }'">
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</c:if>
			<c:if test="${empty list}">
				<div class="m_board f_cl pwd_board">
					<h4>예약 내역이 없습니다.</h4>
				</div>
			</c:if>
			<div class="re_pagination">
				<c:if test="${!is_Search}">
					<div class="page-numbers">
						<c:if test="${page != 1}">
							<button type="button"
								onclick="location.href='mypage_reservation?page=1'">&lt;&lt;</button>
							<button type="button"
								onclick="location.href='mypage_reservation?page=${page - 1}'">&lt;</button>
						</c:if>
						<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
							<div class="page-numbers">
								<c:if test="${page == i}">
									<button type="button" class="active-btn"
										onclick="location.href='mypage_reservation?page=${i}'">${i}</button>
								</c:if>
								<c:if test="${page != i}">
									<button type="button" class="page-btn"
										onclick="location.href='mypage_reservation?page=${i}'">${i}</button>
								</c:if>
							</div>
						</c:forEach>
						<c:if test="${endBlock < allPage}">
							<button type="button"
								onclick="location.href='mypage_reservation?page=${page + 1}'">></button>
							<button type="button"
								onclick="location.href='mypage_reservation?page=${allPage}'">>></button>
						</c:if>
					</div>
				</c:if>
				<c:if test="${is_Search}">
					<div class="page-numbers">
						<c:if test="${page != 1}">
							<button type="button"
								onclick="location.href='mypage_reservation_search?page=1&field=${field}'">&lt;&lt;</button>
							<button type="button"
								onclick="location.href='mypage_reservation_search?page=${page - 1}&field=${field}'">&lt;</button>
						</c:if>
						<c:forEach begin="${startBlock}" end="${endBlock}" var="i">
							<div class="page-numbers">
								<c:if test="${page == i}">
									<button type="button" class="active-btn"
										onclick="location.href='mypage_reservation_search?page=${i}&field=${field}'">${i}</button>
								</c:if>
								<c:if test="${page != i}">
									<button type="button" class="page-btn"
										onclick="location.href='mypage_reservation_search?page=${i}&field=${field}'">${i}</button>
								</c:if>
							</div>
						</c:forEach>
						<c:if test="${endBlock < allPage}">
							<button type="button"
								onclick="location.href='mypage_reservation_search?page=${page + 1}&field=${field}'">></button>
							<button type="button"
								onclick="location.href='mypage_reservation_search?page=${allPage}&field=${field}'">>></button>
						</c:if>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	</div>
	</div>
	</section>
	<script src="js/signup.js"></script>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>