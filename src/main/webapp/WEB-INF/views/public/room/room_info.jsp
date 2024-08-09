<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />
	<!-- 로얄스위트 -->
	<section id="section1_2_room1">
		<div class="title">
			<h1 class="main_title_room1" id="main_title_room1">로얄스위트</h1>
		</div>
		<div class="main_area">
			<div class="room_view">
				<div class="room-view2">
					<div class="slick-slide">
						<div>
							<div class="list">
								<div class="img">
									<img src="./img/room/로얄스위트 방소개.jpg" alt="로얄스위트 방소개">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail-area">
					<div class="desc-wrap">
						<div class="desc-box">
							<h2 class="tit">
								<span>로얄스위트-</span> <span class="room-name">Royal Suite</span>
							</h2>
							<p class="txt">호화로운 인테리어와 최상의 서비스로 고객님을 맞이합니다.</br>
											특급의 휴식과 여유를 경험하세요.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="room-infomation">
				<h2 class="blind">객실 개요</h2>
				<div class="tb-responsive view-type">
					<table class="rwd-table">
						<caption>객실 개요</caption>
						<colgroup>
							<col style="width: 15%">
							<col style="width: 35%">
							<col style="width: 15%">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">체크인</th>
								<td>
									<div class="td-txt">15:00</div>
								</td>
								<th scope="col">체크아웃</th>
								<td>
									<div class="td-txt">11:00</div>
								</td>
							</tr>
							<tr>
								<th scope="col">기준 인원</th>
								<td>
									<div class="td-txt">4명</div>
								</td>
								<th scope="col">최대 인원</th>
								<td>
									<div class="td-txt">4명</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 구성</th>
								<td>
									<div class="td-txt">원룸(더블)+욕실</div>
								</td>
								<th scope="col">객실 면적</th>
								<td>
									<div class="td-txt">180.0㎡</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 수</th>
								<td>
									<div class="td-txt">15실</div>
								</td>
								<th scope="col">전망</th>
								<td>
									<div class="td-txt">
										천안해수욕장 오션 뷰<br>천안항 오션 뷰
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="content w-max">
			<div class="title-sub-area">
				<h2 class="sub-title">제공 서비스</h2>
			</div>
			<div class="amenity-list">
				<ul class="grid-area gap-4">
					<li class="colum col-3"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">침실/거실</strong>
							<p>침대, 책상, 쇼파, 책상 의자, TV</p>
						</div></li>
					<li class="colum col-3"><span class="list-02"></span>
						<div class="desc">
							<strong class="tit">욕실</strong>
							<p>샴푸, 컨디셔너, 샤워젤, 비누, 빗, 면봉, 화장솜, 욕실컵, 바디스펀지, 바디로션, 비데,
								헤어드라이기, 페이스타올, 바스타올, 바스로브, 발매트, 욕조</p>
						</div></li>
					<li class="colum col-3"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">주방</strong>
							<p>아이스바스켓, 티스푼, 냉장고, 커피포트, 종이컵, 얼음 집게</p>
						</div></li>
					<li class="colum col-3"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">추가 제공 물품</strong>
							<p>작설차, 생수 2병/1일, 초고속 무선인터넷(Wi-Fi), 라운더리백, 메모지, 연필, 편지지,
								편지봉투, 금고, 소화기, 슬리퍼, 구둣주걱, 커피</p>
						</div></li>
				</ul>
			</div>
			<hr>
			<div class="title-sub-area">
				<h2 class="sub-title">이용 안내</h2>
			</div>
			<div class="use-guide-list-type02">
				<div class="text-box">
					<ul class="text-list">
						<li>객실은 모두 금연입니다.</li>
						<li>최대정원 이상 입실 불가합니다.</li>
						<li>조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.</li>
						<li>호텔형은 취사가 불가합니다.</li>
						<li>상기 객실 사진은 연출된 부분으로 쿠션 등은 제공되지 않습니다.</li>
					</ul>
					<a href="board_faq" class="btn btn-grey btn-md"> <span>객실 자주 찾는
							질문 보기</span>
					</a>
				</div>
			</div>
			<div class="faci-list col4">
				<ul class="grid-area-table">
					<li class="colum"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">흡연구역</strong>
							<p>지상1층 우측 통로 끝</p>
						</div></li>
					<li class="colum"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">얼음정수기</strong>
							<p>승강기 16호 앞, 콘도동 61호 앞 / 58호 옆</p>
						</div></li>
					<li class="colum"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">전자레인지</strong>
							<p>각 승강기 옆</p>
						</div></li>
					<li class="colum"><span class="list-05"></span>
						<div class="desc">
							<strong class="tit">전기차 충전소</strong>
							<p>지하 3층 주차장</p>
						</div></li>
				</ul>
			</div>
		</div>
	</section>
	<!-- 패밀리-30 -->
	<section id="section1_2_room2">
		<div class="title">
			<h1 class="main_title_room2" id="main_title_room2">패밀리</h1>
		</div>
		<div class="main_area">
			<div class="room_view">
				<div class="room-view2">
					<div class="slick-slide">
						<div>
							<div class="list">
								<div class="img">
									<img src="./img/room/패밀리 방소개.jpg" alt="패밀리 방소개">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail-area">
					<div class="desc-wrap">
						<div class="desc-box">
							<h2 class="tit">
								<span>패밀리-</span> <span class="room-name">Family</span>
							</h2>
							<p class="txt">넓은 공간과 편의시설로 가족끼리 특별한 추억을 만들어보세요. </br>
							편안함과 즐거움이 함께합니다.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="room-infomation">
				<h2 class="blind">객실 개요</h2>
				<div class="tb-responsive view-type">
					<table class="rwd-table">
						<caption>객실 개요</caption>
						<colgroup>
							<col style="width: 15%">
							<col style="width: 35%">
							<col style="width: 15%">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">체크인</th>
								<td>
									<div class="td-txt">15:00</div>
								</td>
								<th scope="col">체크아웃</th>
								<td>
									<div class="td-txt">11:00</div>
								</td>
							</tr>
							<tr>
								<th scope="col">기준 인원</th>
								<td>
									<div class="td-txt">4명</div>
								</td>
								<th scope="col">최대 인원</th>
								<td>
									<div class="td-txt">4명</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 구성</th>
								<td>
									<div class="td-txt">원룸(더블)+욕실</div>
								</td>
								<th scope="col">객실 면적</th>
								<td>
									<div class="td-txt">57.5㎡</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 수</th>
								<td>
									<div class="td-txt">30실</div>
								</td>
								<th scope="col">전망</th>
								<td>
									<div class="td-txt">
										천안해수욕장 오션 뷰<br>천안항 오션 뷰
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="content w-max">
			<div class="title-sub-area">
				<h2 class="sub-title">제공 서비스</h2>
			</div>
			<div class="amenity-list">
				<ul class="grid-area gap-4 col-sm-push">
					<li class="colum col-3"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">침실/거실</strong>
							<p>침대, 책상, 쇼파, 책상 의자, TV</p>
						</div></li>
					<li class="colum col-3"><span class="list-02"></span>
						<div class="desc">
							<strong class="tit">욕실</strong>
							<p>샴푸, 컨디셔너, 샤워젤, 비누, 빗, 면봉, 화장솜, 욕실컵, 바디스펀지, 바디로션, 비데,
								헤어드라이기, 페이스타올, 바스타올, 바스로브, 발매트, 욕조</p>
						</div></li>
					<li class="colum col-3"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">주방</strong>
							<p>아이스바스켓, 티스푼, 냉장고, 커피포트, 종이컵, 얼음 집게</p>
						</div></li>
					<li class="colum col-3"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">추가 제공 물품</strong>
							<p>작설차, 생수 2병/1일, 초고속 무선인터넷(Wi-Fi), 라운더리백, 메모지, 연필, 편지지,
								편지봉투, 금고, 소화기, 슬리퍼, 구둣주걱, 커피</p>
						</div></li>
				</ul>
			</div>
			<hr>
			<div class="title-sub-area">
				<h2 class="sub-title">이용 안내</h2>
			</div>
			<div class="use-guide-list-type02">
				<div class="text-box">
					<ul class="text-list">
						<li>객실은 모두 금연입니다.</li>
						<li>최대정원 이상 입실 불가합니다.</li>
						<li>조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.</li>
						<li>호텔형은 취사가 불가합니다.</li>
						<li>상기 객실 사진은 연출된 부분으로 쿠션 등은 제공되지 않습니다.</li>
					</ul>
					<a href="" class="btn btn-grey btn-md"> <span>객실 자주 찾는
							질문 보기</span>
					</a>
				</div>
			</div>
			<div class="faci-list col4">
				<ul class="grid-area-table">
					<li class="colum"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">흡연구역</strong>
							<p>지상1층 우측 통로 끝</p>
						</div></li>
					<li class="colum"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">얼음정수기</strong>
							<p>승강기 16호 앞, 콘도동 61호 앞 / 58호 옆</p>
						</div></li>
					<li class="colum"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">전자레인지</strong>
							<p>각 승강기 옆</p>
						</div></li>
					<li class="colum"><span class="list-05"></span>
						<div class="desc">
							<strong class="tit">전기차 충전소</strong>
							<p>지하 3층 주차장</p>
						</div></li>
				</ul>
			</div>
		</div>
	</section>
	<!-- 스위트-35 -->
	<section id="section1_2_room3">
		<div class="title">
			<h1 class="main_title_room3" id="main_title_room3">스위트</h1>
		</div>
		<div class="main_area">
			<div class="room_view">
				<div class="room-view2">
					<div class="slick-slide">
						<div>
							<div class="list">
								<div class="img">
									<img src="./img/room/스위트 방소개.jpg" alt="스위트 방소개">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail-area">
					<div class="desc-wrap">
						<div class="desc-box">
							<h2 class="tit">
								<span>스위트-</span> <span class="room-name">Suite</span>
							</h2>
							<p class="txt">친구나 가족과 함께 여행하는 분들을 위한 편안한 공간으로, 넓은 공간과 편의 시설이 갖추어져 있습니다. </br>
							함께 특별한 순간을 공유하세요.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="room-infomation">
				<h2 class="blind">객실 개요</h2>
				<div class="tb-responsive view-type">
					<table class="rwd-table">
						<caption>객실 개요</caption>
						<colgroup>
							<col style="width: 15%">
							<col style="width: 35%">
							<col style="width: 15%">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">체크인</th>
								<td>
									<div class="td-txt">15:00</div>
								</td>
								<th scope="col">체크아웃</th>
								<td>
									<div class="td-txt">11:00</div>
								</td>
							</tr>
							<tr>
								<th scope="col">기준 인원</th>
								<td>
									<div class="td-txt">4명</div>
								</td>
								<th scope="col">최대 인원</th>
								<td>
									<div class="td-txt">4명</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 구성</th>
								<td>
									<div class="td-txt">원룸(더블)+욕실</div>
								</td>
								<th scope="col">객실 면적</th>
								<td>
									<div class="td-txt">57.5㎡</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 수</th>
								<td>
									<div class="td-txt">35실</div>
								</td>
								<th scope="col">전망</th>
								<td>
									<div class="td-txt">
										천안해수욕장 오션 뷰<br>천안항 오션 뷰
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="content w-max">
			<div class="title-sub-area">
				<h2 class="sub-title">제공 서비스</h2>
			</div>
			<div class="amenity-list">
				<ul class="grid-area gap-4 col-sm-push">
					<li class="colum col-3"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">침실/거실</strong>
							<p>침대, 책상, 쇼파, 책상 의자, TV</p>
						</div></li>
					<li class="colum col-3"><span class="list-02"></span>
						<div class="desc">
							<strong class="tit">욕실</strong>
							<p>샴푸, 컨디셔너, 샤워젤, 비누, 빗, 면봉, 화장솜, 욕실컵, 바디스펀지, 바디로션, 비데,
								헤어드라이기, 페이스타올, 바스타올, 바스로브, 발매트, 욕조</p>
						</div></li>
					<li class="colum col-3"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">주방</strong>
							<p>아이스바스켓, 티스푼, 냉장고, 커피포트, 종이컵, 얼음 집게</p>
						</div></li>
					<li class="colum col-3"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">추가 제공 물품</strong>
							<p>작설차, 생수 2병/1일, 초고속 무선인터넷(Wi-Fi), 라운더리백, 메모지, 연필, 편지지,
								편지봉투, 금고, 소화기, 슬리퍼, 구둣주걱, 커피</p>
						</div></li>
				</ul>
			</div>
			<hr>
			<div class="title-sub-area">
				<h2 class="sub-title">이용 안내</h2>
			</div>
			<div class="use-guide-list-type02">
				<div class="text-box">
					<ul class="text-list">
						<li>객실은 모두 금연입니다.</li>
						<li>최대정원 이상 입실 불가합니다.</li>
						<li>조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.</li>
						<li>호텔형은 취사가 불가합니다.</li>
						<li>상기 객실 사진은 연출된 부분으로 쿠션 등은 제공되지 않습니다.</li>
					</ul>
					<a href="board_faq" class="btn btn-grey btn-md"> <span>객실 자주 찾는
							질문 보기</span>
					</a>
				</div>
			</div>
			<div class="faci-list col4">
				<ul class="grid-area-table">
					<li class="colum"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">흡연구역</strong>
							<p>지상1층 우측 통로 끝</p>
						</div></li>
					<li class="colum"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">얼음정수기</strong>
							<p>승강기 16호 앞, 콘도동 61호 앞 / 58호 옆</p>
						</div></li>
					<li class="colum"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">전자레인지</strong>
							<p>각 승강기 옆</p>
						</div></li>
					<li class="colum"><span class="list-05"></span>
						<div class="desc">
							<strong class="tit">전기차 충전소</strong>
							<p>지하 3층 주차장</p>
						</div></li>
				</ul>
			</div>
		</div>
	</section>
	<!-- 더블-50 -->
	<section id="section1_2_room4">
		<div class="title">
			<h1 class="main_title_room4" id="main_title_room4">더 블</h1>
		</div>
		<div class="main_area">
			<div class="room_view">
				<div class="room-view2">
					<div class="slick-slide">
						<div>
							<div class="list">
								<div class="img">
									<img src="./img/room/더블 방소개.jpg" alt="더블 방소개">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail-area">
					<div class="desc-wrap">
						<div class="desc-box">
							<h2 class="tit">
								<span>더 블-</span> <span class="room-name">Double</span>
							</h2>
							<p class="txt">현대적이고 세련된 디자인으로 편안한 휴식을 제공합니다.</br> 
							이국적인 분위기와 함께 여행의 피로를 풀어보세요.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="room-infomation">
				<h2 class="blind">객실 개요</h2>
				<div class="tb-responsive view-type">
					<table class="rwd-table">
						<caption>객실 개요</caption>
						<colgroup>
							<col style="width: 15%">
							<col style="width: 35%">
							<col style="width: 15%">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">체크인</th>
								<td>
									<div class="td-txt">15:00</div>
								</td>
								<th scope="col">체크아웃</th>
								<td>
									<div class="td-txt">11:00</div>
								</td>
							</tr>
							<tr>
								<th scope="col">기준 인원</th>
								<td>
									<div class="td-txt">2명</div>
								</td>
								<th scope="col">최대 인원</th>
								<td>
									<div class="td-txt">2명</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 구성</th>
								<td>
									<div class="td-txt">원룸(더블)+욕실</div>
								</td>
								<th scope="col">객실 면적</th>
								<td>
									<div class="td-txt">40.5㎡</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 수</th>
								<td>
									<div class="td-txt">50실</div>
								</td>
								<th scope="col">전망</th>
								<td>
									<div class="td-txt">
										천안해수욕장 오션 뷰<br>천안항 오션 뷰
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="content w-max">
			<div class="title-sub-area">
				<h2 class="sub-title">제공 서비스</h2>
			</div>
			<div class="amenity-list">
				<ul class="grid-area gap-4 col-sm-push">
					<li class="colum col-3"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">침실/거실</strong>
							<p>침대, 책상, 쇼파, 책상 의자, TV</p>
						</div></li>
					<li class="colum col-3"><span class="list-02"></span>
						<div class="desc">
							<strong class="tit">욕실</strong>
							<p>샴푸, 컨디셔너, 샤워젤, 비누, 빗, 면봉, 화장솜, 욕실컵, 바디스펀지, 바디로션, 비데,
								헤어드라이기, 페이스타올, 바스타올, 바스로브, 발매트, 욕조</p>
						</div></li>
					<li class="colum col-3"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">주방</strong>
							<p>아이스바스켓, 티스푼, 냉장고, 커피포트, 종이컵, 얼음 집게</p>
						</div></li>
					<li class="colum col-3"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">추가 제공 물품</strong>
							<p>작설차, 생수 2병/1일, 초고속 무선인터넷(Wi-Fi), 라운더리백, 메모지, 연필, 편지지,
								편지봉투, 금고, 소화기, 슬리퍼, 구둣주걱, 커피</p>
						</div></li>
				</ul>
			</div>
			<hr>
			<div class="title-sub-area">
				<h2 class="sub-title">이용 안내</h2>
			</div>
			<div class="use-guide-list-type02">
				<div class="text-box">
					<ul class="text-list">
						<li>객실은 모두 금연입니다.</li>
						<li>최대정원 이상 입실 불가합니다.</li>
						<li>조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.</li>
						<li>호텔형은 취사가 불가합니다.</li>
						<li>상기 객실 사진은 연출된 부분으로 쿠션 등은 제공되지 않습니다.</li>
					</ul>
					<a href="board_faq" class="btn btn-grey btn-md"> <span>객실 자주 찾는
							질문 보기</span>
					</a>
				</div>
			</div>
			<div class="faci-list col4">
				<ul class="grid-area-table">
					<li class="colum"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">흡연구역</strong>
							<p>지상1층 우측 통로 끝</p>
						</div></li>
					<li class="colum"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">얼음정수기</strong>
							<p>승강기 16호 앞, 콘도동 61호 앞 / 58호 옆</p>
						</div></li>
					<li class="colum"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">전자레인지</strong>
							<p>각 승강기 옆</p>
						</div></li>
					<li class="colum"><span class="list-05"></span>
						<div class="desc">
							<strong class="tit">전기차 충전소</strong>
							<p>지하 3층 주차장</p>
						</div></li>
				</ul>
			</div>
		</div>
	</section>
	<!-- 싱글 -->
	<section id="section1_2_room5">
		<div class="title">
			<h1 class="main_title_room5" id="main_title_room5">싱 글</h1>
		</div>
		<div class="main_area">
			<div class="room_view">
				<div class="room-view2">
					<div class="slick-slide">
						<div>
							<div class="list">
								<div class="img">
									<img src="./img/room/싱글 방소개.jpg" alt="싱글 방소개">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail-area">
					<div class="desc-wrap">
						<div class="desc-box">
							<h2 class="tit">
								<span>싱 글-</span> <span class="room-name">Single</span>
							</h2>
							<p class="txt">혼자 머무르더라도 편안하게 머무를 수 있는 아늑한 공간입니다.</br>
							조용하고 편리한 휴식을 경험하세요.</p>
						</div>
					</div>
				</div>
			</div>
			<div class="room-infomation">
				<h2 class="blind">객실 개요</h2>
				<div class="tb-responsive view-type">
					<table class="rwd-table">
						<caption>객실 개요</caption>
						<colgroup>
							<col style="width: 15%">
							<col style="width: 35%">
							<col style="width: 15%">
							<col style="width: auto;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">체크인</th>
								<td>
									<div class="td-txt">15:00</div>
								</td>
								<th scope="col">체크아웃</th>
								<td>
									<div class="td-txt">11:00</div>
								</td>
							</tr>
							<tr>
								<th scope="col">기준 인원</th>
								<td>
									<div class="td-txt">1명</div>
								</td>
								<th scope="col">최대 인원</th>
								<td>
									<div class="td-txt">1명</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 구성</th>
								<td>
									<div class="td-txt">원룸(더블)+욕실</div>
								</td>
								<th scope="col">객실 면적</th>
								<td>
									<div class="td-txt">28.5㎡</div>
								</td>
							</tr>
							<tr>
								<th scope="col">객실 수</th>
								<td>
									<div class="td-txt">100실</div>
								</td>
								<th scope="col">전망</th>
								<td>
									<div class="td-txt">
										천안해수욕장 오션 뷰<br>천안항 오션 뷰
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="content w-max">
			<div class="title-sub-area">
				<h2 class="sub-title">제공 서비스</h2>
			</div>
			<div class="amenity-list">
				<ul class="grid-area gap-4 col-sm-push">
					<li class="colum col-3"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">침실/거실</strong>
							<p>침대, 책상, 쇼파, 책상 의자, TV</p>
						</div></li>
					<li class="colum col-3"><span class="list-02"></span>
						<div class="desc">
							<strong class="tit">욕실</strong>
							<p>샴푸, 컨디셔너, 샤워젤, 비누, 빗, 면봉, 화장솜, 욕실컵, 바디스펀지, 바디로션, 비데,
								헤어드라이기, 페이스타올, 바스타올, 바스로브, 발매트, 욕조</p>
						</div></li>
					<li class="colum col-3"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">주방</strong>
							<p>아이스바스켓, 티스푼, 냉장고, 커피포트, 종이컵, 얼음 집게</p>
						</div></li>
					<li class="colum col-3"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">추가 제공 물품</strong>
							<p>작설차, 생수 2병/1일, 초고속 무선인터넷(Wi-Fi), 라운더리백, 메모지, 연필, 편지지,
								편지봉투, 금고, 소화기, 슬리퍼, 구둣주걱, 커피</p>
						</div></li>
				</ul>
			</div>
			<hr>
			<div class="title-sub-area">
				<h2 class="sub-title">이용 안내</h2>
			</div>
			<div class="use-guide-list-type02">
				<div class="text-box">
					<ul class="text-list">
						<li>객실은 모두 금연입니다.</li>
						<li>최대정원 이상 입실 불가합니다.</li>
						<li>조식 및 부대시설 이용은 현장에서 신청/결제 할 수 있습니다.</li>
						<li>호텔형은 취사가 불가합니다.</li>
						<li>상기 객실 사진은 연출된 부분으로 쿠션 등은 제공되지 않습니다.</li>
					</ul>
					<a href="board_faq" class="btn btn-grey btn-md"> <span>객실 자주 찾는
							질문 보기</span>
					</a>
				</div>
			</div>
			<div class="faci-list col4">
				<ul class="grid-area-table">
					<li class="colum"><span class="list-01"></span>
						<div class="desc">
							<strong class="tit">흡연구역</strong>
							<p>지상1층 우측 통로 끝</p>
						</div></li>
					<li class="colum"><span class="list-03"></span>
						<div class="desc">
							<strong class="tit">얼음정수기</strong>
							<p>승강기 16호 앞, 콘도동 61호 앞 / 58호 옆</p>
						</div></li>
					<li class="colum"><span class="list-04"></span>
						<div class="desc">
							<strong class="tit">전자레인지</strong>
							<p>각 승강기 옆</p>
						</div></li>
					<li class="colum"><span class="list-05"></span>
						<div class="desc">
							<strong class="tit">전기차 충전소</strong>
							<p>지하 3층 주차장</p>
						</div></li>
				</ul>
			</div>
		</div>
	</section>
    <!-- 스크롤바 -->
	<div id="fp-nav" class="fp-right fp-show-active">
	    <ul>
	        <li>
	            <a href="#main_title_room1">
	                <span class="fp-sr-only">로얄스위트</span>
	                <span></span></a>
	            <div class="fp-tooltip fp-right">로얄스위트</div>
	        </li>
	        <li>
	            <a href="#main_title_room2">
	                <span class="fp-sr-only">패밀리</span>
	                <span></span></a>
	            <div class="fp-tooltip fp-right">패밀리</div>
	        </li>
	        <li>
	            <a href="#main_title_room3">
	                <span class="fp-sr-only">스위트</span>
	                <span></span></a>
	            <div class="fp-tooltip fp-right">스위트</div>
	        </li>
	        <li>
	            <a href="#main_title_room4">
	                <span class="fp-sr-only">더블</span>
	                <span></span></a>
	            <div class="fp-tooltip fp-right">더블</div>
	        </li>
	        <li>
	            <a href="#main_title_room5">
	                <span class="fp-sr-only">싱글</span>
	                <span></span></a>
	            <div class="fp-tooltip fp-right">싱글</div>
	        </li>
	        <li>
	            <a href="#footer">
	                <span class="fp-sr-only">footer</span>
	                <span></span></a>
	        </li>
	    </ul>
	</div>
	<!-- 스크롤바 -->
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
	<script type="text/javascript">
	    $(document).ready(function() {
	        // #fp-nav 내부의 링크 클릭 시 스크롤 이벤트
	        $('#fp-nav a').click(function(e) {
	            e.preventDefault(); // 기본 이벤트 제거
	            var target = $(this).attr('href'); // 클릭한 링크의 href 속성값 가져오기
	            var headerHeight = $('#header').outerHeight(); // 헤더의 높이를 가져옴
	            var targetOffset = $(target).offset().top - headerHeight; // 헤더 높이만큼 빼서 스크롤 위치 조정
	            $('html, body').scrollTop(targetOffset); // 스크롤 애니메이션 적용하지 않음
	        });
	    });
		$(function() {
			const url = new URL(window.location);
			const urlPath = url.pathname;
			if (urlPath.includes('section1_2_room1')) {
				const scrollTop = document.querySelector("#section1_2_room1").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
	
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
			if (urlPath.includes('section1_2_room2')) {
				const scrollTop = document.querySelector("#section1_2_room2").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
				
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
			if (urlPath.includes('section1_2_room3')) {
				const scrollTop = document.querySelector("#section1_2_room3").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
				
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
			if (urlPath.includes('section1_2_room4')) {
				const scrollTop = document.querySelector("#section1_2_room4").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
	
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
			if (urlPath.includes('section1_2_room5')) {
				const scrollTop = document.querySelector("#section1_2_room5").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
	
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
		});
	</script>
</body>
</html>