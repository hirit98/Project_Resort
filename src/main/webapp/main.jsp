<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<!-- 페이지 41개  -->
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<!-- 예약 사이드바 -->
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />

	<div id="container">
		<!-- Main Swiper -->
		<div class="swiper mySwiper" id="Swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="./img/main/main-background1.png" alt="몬트리오 배경1"
						style="height: 100%;">
				</div>
				<div class="swiper-slide">
					<img src="./img/main/main-background2.jpg" alt="몬트리오 배경2">
				</div>
				<div class="swiper-slide">
					<img src="./img/main/main-background3.jpg" alt="몬트리오 배경3">
				</div>
				<div class="swiper-slide">
					<img src="./img/main/main-background4.jpg" alt="몬트리오 배경4">
				</div>
			</div>
		</div>
		<!-- Main Swiper 끝 -->

		<!-- 섹션 시작 -->
		<!-- section1 -->
		<section id="section1">
			<!-- 스타일 -->
			<div class="room myRoom">
				<div class="room-wrapper">
					<div class="room-slide">
						<a href="section1_2_room1"> <span class="img"> <img
								src="./img/section1/로얄 스위트.jpg" alt="로얄스위트 고품격 객실">
						</span> <span class="text-area"> <strong class="title">&nbsp;&nbsp;로얄
									스위트</strong><br>
							<br> <em class="desc">&nbsp;&nbsp;최상의 편안함과 고급스러움이 결합된
									객실로<br>&nbsp;&nbsp;특별한 손님들을 위해 특별히 디자인되었습니다.<br>&nbsp;&nbsp;개별적인
									서비스와 환상적인 전망을 경험할 수 있습니다.
							</em>
						</span>
						</a>
					</div>
					<div class="room-slide">
						<a href="section1_2_room2"> <span class="img"> <img
								src="./img/section1/패밀리.jpg" alt="패밀리 고품격 객실">
						</span> <span class="text-area"> <strong class="title">&nbsp;&nbsp;패밀리</strong><br>
							<br> <em class="desc">&nbsp;&nbsp;가족이 함께 휴가를 즐길 수 있는 넓고
									편안한 공간으로<br>&nbsp;&nbsp;따로 마련된 침실과 거실이 있어 가족들의 휴식과 즐거움을 위한<br>&nbsp;&nbsp;최적의
									선택입니다.
							</em>
						</span>
						</a>
					</div>
					<div class="room-slide">
						<a href="section1_2_room3"> <span class="img"> <img
								src="./img/section1/스위트.jpg" alt="스위트 고품격 객실">
						</span> <span class="text-area"> <strong class="title">&nbsp;&nbsp;스위트</strong><br>
							<br> <em class="desc">&nbsp;&nbsp;특별한 순간을 위한 고급스러운 공간으로<br>&nbsp;&nbsp;넓은
									공간과 편안한 소파, 프라이빗한 발코니가 마련되어 있어<br>&nbsp;&nbsp;특별한 경험을
									선사합니다.
							</em>
						</span>
						</a>
					</div>
					<div class="room-slide">
						<a href="section1_2_room4"> <span class="img"> <img
								src="./img/section1/더블.jpg" alt="더블 고품격 객실">
						</span> <span class="text-area"> <strong class="title">&nbsp;&nbsp;더
									블</strong><br>
							<br> <em class="desc">&nbsp;&nbsp;더블 침대가 마련된 객실로, 커플이나
									친구와 함께 머물기에 이상적입니다.<br>&nbsp;&nbsp;고급스러운 인테리어와 편안한 분위기가
									휴가를 더욱 특별하게 만들어줍니다.
							</em>
						</span>
						</a>
					</div>
					<div class="room-slide">
						<a href="section1_2_room5"> <span class="img"> <img
								src="./img/section1/싱글.jpg" alt="싱글 고품격 객실">
						</span> <span class="text-area"> <strong class="title">&nbsp;&nbsp;싱
									글</strong><br>
							<br> <em class="desc">&nbsp;&nbsp;혼자 여행하는 분들을 위한 편안하고
									아늑한 공간으로<br>&nbsp;&nbsp;편리한 시설과 휴식을 취할 수 있는 환경을 제공합니다.<br>&nbsp;&nbsp;
							</em>
						</span>
						</a>
					</div>
				</div>
			</div>
		</section>
		<!-- section1 -->

		<!-- section2 -->
		<section id="section2">
			<div id="Activity">
				<div class="swimming">
					<div class="img1">
						<a href="activity1"><img src="./img/main activity/실외 수영장.jpg"
							alt="몬트리오 실외 수영장" style="width: 1160px; height: 773px;"></a> <a
							href="activity1"><img src="./img/main activity/실내 수영장.jpg"
							alt="몬트리오 실내 수영장"
							style="display: none; width: 1160px; height: 773px;"></a> <a
							href="activity1"><img src="./img/main activity/어트랙션.jpg"
							alt="몬트리오 어트랙션"
							style="display: none; width: 1160px; height: 773px;"></a> <a
							href="activity1"><img src="./img/main activity/스파.jpg"
							alt="몬트리오 스파"
							style="display: none; width: 1160px; height: 773px;"></a>
						<!-- 추가 이미지들은 위와 같이 계속 추가 -->
					</div>
					<div class="info">
						<div class="slide_info">
							<p class="tit">실외 수영장</p>
							<p class="txt">
								호텔의 멋진 정원을 바라보며 햇살을 받으며 수영하는 경험은<br>최상의 휴가를 위한 완벽한 선택입니다.<br>풀사이드
								라운지 고요함 속, 일상을 잊을 수 있습니다.
							</p>
							<a href="activity1">VIEW MORE</a>
						</div>
						<div class="slide_info" style="display: none;">
							<p class="tit">실내 수영장</p>
							<p class="txt">
								고요한 조명 아래, 우아한 디자인의 실내수영장은 편안함과 화려함이<br>어우러진 공간입니다. 취향에 맞는
								음악을 들으며 물 속에서<br>휴식을 취하거나 운동을 즐길 수 있습니다.
							</p>
							<a href="activity1">VIEW MORE</a>
						</div>
						<div class="slide_info" style="display: none;">
							<p class="tit">어트랙션</p>
							<p class="txt">
								호텔 내 어트랙션은 럭셔리한 휴가를 완벽하게 즐길 수 있는 곳입니다.<br>실외 수영장, 풀사이드 바,
								플로팅 라운지, 야외 스파로 이루어진 공간에서<br>햇살 아래 휴식을 취하며 특별한 체험과 추억을
								만들어보세요.
							</p>
							<a href="activity1">VIEW MORE</a>
						</div>
						<div class="slide_info" style="display: none;">
							<p class="tit">스파</p>
							<p class="txt">
								조용함 속에서 펼쳐지는 스파는 마음과 몸을 치유하는 성지입니다.<br>향기로운 캔들 라이트 아래 전문적인
								마사지 테라피스트가 여러분을<br>맞이하여 최상의 휴식을 제공합니다.
							</p>
							<a href="activity1">VIEW MORE</a>
						</div>
					</div>
					<div class="bt_arrow">
						<a href="#" id="prevBtn"><img src="./img/main_next.png"
							alt="왼쪽"></a> <a href="#" id="nextBtn"><img
							src="./img/main_prev.png" alt="오른쪽"></a>
					</div>
				</div>
			</div>
		</section>
		<!-- section2 -->

		<!-- section3 -->
		<section id="sectionEx">
			<div>
				<h2>부대시설-FACILITY</h2>
				<a href="amenities">read more </a>
				<!--부대시설 전체 페이지로 아이콘 들어가야됨-->
			</div>
		</section>

		<!-- section3 -->
		<section id="section3">
			<div class="swiper3 mySwiper3">
				<div class="swiper3-wrapper">
					<div class="swiper3-slide">
						<img src="./img/section3/section3-background1.jpg" alt="헬스장">
					</div>
					<div class="swiper3-slide">
						<img src="./img/section3/section3-background2.jpg" alt="와인바">
					</div>
					<div class="swiper3-slide">
						<img src="./img/section3/section3-background3.jpg" width="1280"
							alt="카페">
					</div>
					<div class="swiper3-slide">
						<img src="./img/section3/section3-background4.jpg" alt="레스토랑">
					</div>
				</div>
				<div class="swiper3-button-next"></div>
				<div class="swiper3-button-prev"></div>
			</div>
		</section>
		<!-- section3 -->

		<!-- section4 -->
		<section id="section4">
			<div class="left">
				<h2>공지사항</h2>
				<table class="main_notice">
					<thead>
						<tr>
							<th>No.</th>
							<th>제 목</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			<div class="right">
				<h2>오시는 길</h2>
				<div>
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d1597.0664911002755!2d127.10835321965085!3d36.81533316907731!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1zc2Jz7JWE7Lm0642w66-47Lu07ZOo7YSw7JWE7Yq47ZWZ7JuQIOyynOyViOygkA!5e0!3m2!1sko!2skr!4v1716255290712!5m2!1sko!2skr"
						width="850" height="550" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
			<!-- 지도 -->
		</section>
		<!-- section4 -->

		<!-- section5 오시는길 -->
		<!-- 섹션 끝 -->
	</div>

	<!-- 관리자 모드 -->
	<!-- 스크롤바 -->
	<div id="fp-nav" class="fp-right fp-show-active">
		<ul>
			<li><a href="#Swiper" class="active"> <span
					class="fp-sr-only">메인</span> <span></span>
			</a>
				<div class="fp-tooltip fp-right">메인</div></li>
			<li><a href="#section1" class=""> <span class="fp-sr-only">객실</span>
					<span></span>
			</a>
				<div class="fp-tooltip fp-right">객실</div></li>
			<li><a href="#section2" class=""> <span class="fp-sr-only">액티비티</span>
					<span></span>
			</a>
				<div class="fp-tooltip fp-right">액티비티</div></li>
			<li><a href="#section3"> <span class="fp-sr-only">부대시설</span>
					<span></span>
			</a>
				<div class="fp-tooltip fp-right">부대시설</div></li>
			<li><a href="#section4"> <span class="fp-sr-only">공지사항</span>
					<span></span>
			</a>
				<div class="fp-tooltip fp-right">공지사항</div></li>
			<li><a href="#footer"> <span class="fp-sr-only">footer</span>
					<span></span>
			</a></li>
		</ul>
	</div>
	<!-- 스크롤바 -->
	<!-- 푸터 끝 -->
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script src="js/print_main_notice.js"></script>
	<script>
		var room = new room(".myRoom", {
			initialSlide : 2,
			slidesPerView : 4,
			centeredSlides : true,
			spaceBetween : 5,
			grabCursor : true,
			pagination : {
				el : ".room-pagination",
				clickable : true,
			},
			breakpoints : {
				500 : {
					slidesPerView : 1,
				},
				750 : {
					slidesPerView : 2,
					spaceBetween : 5,
				},
				1024 : {
					slidesPerView : 3,
					spaceBetween : 5,
				},
				1200 : {
					slidesPerView : 4,
					spaceBetween : 5,
				}
			},
		});
		//section1
		var swiper = new Swiper(".mySwiper", {
			cssMode : true,
			mousewheel : true,
			keyboard : true,
			loop : true,
			autoplay : {
				delay : 3000, // 자동으로 슬라이드 변경되는 간격 (밀리초)
				disableOnInteraction : false, // 사용자 상호 작용 후에도 자동 재생 유지
			},
		});
		var swiper3 = new swiper3(".mySwiper3", {
			navigation : {
				nextEl : ".swiper3-button-next",
				prevEl : ".swiper3-button-prev",
			},
			touch : true,
			keyboard : true,
			loop : true,
			speed : 800
		});
		// section2 액티비티
		$(document)
				.ready(
						function() {
							var currentSlide = 0;
							var totalSlides = $(".img1 img").length;
							var interval = setInterval(nextSlide, 3000); // 3초마다 자동으로 다음 슬라이드로 전환

							// 다음 슬라이드로 이동하는 함수
							function nextSlide() {
								currentSlide = (currentSlide + 1) % totalSlides;
								updateSlide();
							}

							// 이전 슬라이드로 이동하는 함수
							function prevSlide() {
								currentSlide = (currentSlide - 1 + totalSlides)
										% totalSlides;
								updateSlide();
							}

							// 현재 슬라이드를 업데이트하는 함수
							function updateSlide() {
								$(".img1 img").hide();
								$(".img1 img").eq(currentSlide).show();

								// 텍스트도 함께 변경
								$(".info .slide_info").hide();
								$(".info .slide_info").eq(currentSlide).show();
							}

							// 다음 버튼 클릭 이벤트
							$("#nextBtn").click(function(e) {
								e.preventDefault();
								clearInterval(interval); // 클릭하면 자동으로 넘어가는 기능 일시정지
								nextSlide();
								interval = setInterval(nextSlide, 5000); // 5초마다 자동으로 다음 슬라이드로 전환
							});

							// 이전 버튼 클릭 이벤트
							$("#prevBtn").click(function(e) {
								e.preventDefault();
								clearInterval(interval); // 클릭하면 자동으로 넘어가는 기능 일시정지
								prevSlide();
								interval = setInterval(nextSlide, 5000); // 5초마다 자동으로 다음 슬라이드로 전환
							});

							// 오시는 길 자동 스크롤
							const url = new URL(window.location);
							const urlPath = url.pathname;
							if (urlPath.includes('directions')) {
								const scrollTop = document
										.querySelector("#section4").offsetTop;
								const headerTop = document
										.querySelector("#header").offsetHeight;

								window.scrollTo({
									top : scrollTop - headerTop,
									behavior : 'smooth'
								});
							}
						});
	</script>
</body>
</html>