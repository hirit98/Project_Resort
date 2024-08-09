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
			<h3>리뷰하기</h3>
			<div class="re_board w_box f_cl">
				<div class="re_list">
					<div class="re_date">
						<p>예약 날짜 : ${res_dto.getRes_regdate().substring(0, 10)}</p>
					</div>

					<div class="re_more">
						<div class="re_room">
							<p>예약 날짜 : ${res_dto.getRes_regdate().substring(0, 10)}</p>
							<p>예약 번호 : ${res_dto.getRes_no()}</p>
							<p>방 타입 : ${res_dto.getRes_room_type()}</p>
							<p>${res_dto.res_in_date}(${res_dto.dayOfWeekIn}) ~
								${res_dto.res_out_date} (${res_dto.dayOfWeekOut}) |
								${res_dto.nights}박</p>
							<p>체크인 15:00 | 체크아웃 11:00</p>
							<p>기준 ${res_dto.getRes_peoples()} 명 / 최대
								${res_dto.getRes_peoples()} 명</p>
						</div>
						<div class="re_review">
							<div class="star_rating">
								<span class="star on" name="scope1" value="1.0"></span> <span
									class="star" name="scope2" value="2.0"></span> <span
									class="star" name="scope3" value="3.0"></span> <span
									class="star" name="scope4" value="4.0"></span> <span
									class="star" name="scope5" value="5.0"></span>
							</div>
							<form method="post" action="mypage_reservation_review_ok"
								enctype="multipart/form-data">
								<input type="hidden" id="review_point" name="point" value="">
								<input type="hidden" name="Res_no"
									value="${res_dto.getRes_no() }">
								<textarea class="star_box" name="cont"
									placeholder="리뷰 내용을 작성해주세요."></textarea>
								<input type="file" name="file"> <input type="submit"
									value="리 뷰">
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</section>
	<script src="js/signup.js"></script>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
	<script>
		$(document).ready(
				function() {
					$('.star_rating > .star').click(function() {
						$(this).parent().children('span').removeClass('on');
						$(this).addClass('on').prevAll('span').addClass('on');

						// 선택된 별점 값을 숨겨진 input 요소에 저장
						var point = $(this).attr('value');
						$('#review_point').val(point);
					});

					$('.star_rating > .star').hover(
							function() {
								$(this).addClass('hover').prevAll('span')
										.addClass('hover');
							},
							function() {
								$(this).removeClass('hover').prevAll('span')
										.removeClass('hover');
							});
				});
	</script>
</body>
</html>