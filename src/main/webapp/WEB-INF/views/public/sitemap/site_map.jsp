<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	
	<main class="site_map-main">
		<section class="site_map-container">
			<div class="top-title">
				<p class="sub-title">SITEMAP</p>
				<h2 class="h2">사이트맵</h2>
				<p>몬트리오 웹 사이트의 모드 메뉴를 한번에 보고 이동할 수 있습니다.</p>
			</div>
			<hr class="line">
			<div class="site_map-content">
				<ul class="sitemap_list">
					<li>
						<dl>
							<dt>리조트안내</dt>
							<dd>
								<a href="aboutus">리조트 소개</a>
							</dd>
							<dd>
								<a href="main_directions">오시는 길</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>객실</dt>
							<dd>
								<a href="room_reservation">객실 예약</a>
							</dd>
							<dd>
								<a href="room_info">객실 소개</a>
							</dd>
							<dd>
								<a href="room_price">요금 안내</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>액티비티</dt>
							<dd>
								<a href="activity1">액티비티 안내</a>
							</dd>
							<dd>
								<a href="activity2">요금 안내</a>
							</dd>
							<dd>
								<a href="activity3">액티비티 부대시설</a>
							</dd>
							<dd>
								<a href="activity4">액티비티 식음시설</a>
							</dd>
						</dl>
					</li>
				</ul>
				<ul class="sitemap_list">
					<li>
						<dl>
							<dt>부대시설</dt>
							<dd>
								<a href="amenities_restaurant">레스토랑</a>
							</dd>
							<dd>
								<a href="amenities_bar">주류점</a>
							</dd>
							<dd>
								<a href="amenities_cafe">카 페</a>
							</dd>
							<dd>
								<a href="amenities_fitness">휘트니스</a>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>ABOUT</dt>
							<dd>
								<a href="board_faq">FAQ</a>
							</dd>
							<dd>
								<a href="board_event">이벤트</a>
							</dd>
							<dd>
								<a href="board_notice">공지사항</a>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</section>
	</main>

	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>