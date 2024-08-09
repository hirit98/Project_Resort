<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<!-- 제이쿼리 링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="js/login_check.js"></script>
<link rel="stylesheet" href="css/common/style.css">
</head>
<body>
<header>
	<nav>
		<!--상단 리스트-->
		<div id="header">
			<div class="logo">
				<h1>
					<a href="main"><img src="./img/logo.jpg" alt="MONTRIO" width="200" height="90" /></a>
				</h1>
				<!-- 대표 로고로 바꿔도됨<img src="./img/logo.jpg" alt="MONTRIO"width="200" height="100"> -->
			</div>
			<!--menu-->
			<div id="menu" class="menu">
				<!--tm-->
				<ul id="tm">
					<li id="login_btn"><a href="user_login">로그인</a></li>
					<li id="signup_btn"><a href="user_signup">회원가입</a></li>
					<li id="user_name"></li>
					<li id="logout_btn"><a href="">로그아웃</a></li>
					<li><a href="room_reservation">객실예약</a></li>
					<li>
						<a href="site_map">사이트맵</a>
						<!-- 한번에 웹 사이트 전체 메뉴를 한 눈에 보시고 선택할 수 있습니다. -->
					</li>
				</ul>
				<!--tm-->
				<!--gnb-->
				<ul id="gnb">
					<li class="">
						<a href="aboutus">리조트 안내</a> <a href="#n" class="bt_open">서브메뉴열기</a>
						<div class="sub">
							<ul>
								<li><a href="aboutus">리조트 소개</a></li>
								<li><a href="main_directions">오시는 길</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="room_info">객실</a> <a href="#n" class="bt_open">서브메뉴열기</a>
						<div class="sub">
							<ul>
								<li><a href="room_reservation">객실 예약</a></li>
								<li><a href="room_info">객실 소개</a></li>
								<li><a href="room_price">요금 안내</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="activity1">액티비티</a> <a href="#n" class="bt_open">서브메뉴열기</a>
						<div class="sub">
							<ul>
								<li><a href="activity1">액티비티 안내</a></li>
								<li><a href="activity2">요금 안내</a></li>
								<li><a href="activity3">액티비티 부대시설</a></li>
								<li><a href="activity4">액티비티 식음시설</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="amenities">부대시설</a><a href="#n" class="bt_open">서브메뉴열기</a>
						<div class="sub">
							<ul>
								<li><a href="amenities_restaurant">레스토랑</a></li>
								<li><a href="amenities_bar">주류점</a></li>
								<li><a href="amenities_cafe">카 페</a></li>
								<li><a href="amenities_fitness">휘트니스</a></li>
							</ul>
						</div>
					</li>
					<li>
						<a href="board_notice">ABOUT</a> <a href="#n" class="bt_open">서브메뉴열기</a>
						<div class="sub">
							<ul>
								<li><a href="board_faq">FAQ</a></li>
								<li><a href="board_event">이벤트</a></li>
								<li><a href="board_notice">공지사항</a></li>
							</ul>
						</div>
					</li>
				</ul>
				<!--//gnb-->
			</div>
			<!--//menu-->
			<a href="#n" id="bt_menu" class="">
				<i></i>
				<i></i>
				<i></i>
				<i></i>메뉴열기
			</a>
			<div class="header_gap"></div>
			<!--//header-->
		</div>
	</nav>
	<!--상단 리스트-->
</header>
<!--헤더 끝-->
