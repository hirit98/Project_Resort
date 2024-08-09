<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<section>
		<div id="activity_container">
			<!--액티비티 서브공통-->
			<div class="activity_title3">
				<!--local navigation bar-->
			</div>
			<div class="activity_info3">
				<h2 style="font-size: 50px;">액티비티 부대시설</h2>
				<div class="fee_information-menu3">
					<div class="title_tab3">
						<div class="title_tab-horizontal">
							<div class="tab-wrapper3">
								<div style="border-right: 1px solid #f2f2f2;">
									<a href="#n" data-target="AMENITIES"><span
										style="color: #000; font-size: 14px;">수영복 판매점</span></a>
								</div>
								<div>
									<a href="#n" data-target="SWIMSUIT"><span
										style="color: #000; font-size: 14px;">의무실</span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="AMENITIES" class="content AMENITIES">
					<div>
						<ul class="info3-1">
							<h3>액티비티 부대시설</h3>
							<li><p>수영복 판매점</p></li>
							<li><p>즐거운 물놀이를 위한 수영복과 수영모자를 미처 준비하지 못하셨다면, 수영복 판매점에서
									구입하실 수 있습니다.</p></li>
							<img src="./img/section2/activity3-1.jpg" alt="수영복 판매점 사진" style="width: 1000px;">
						</ul>
					</div>
					<div>
						<ul class="info3-2">
							<h3>시설안내</h3>
							<br>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>운영시간</th>
										<td>시즌별 운영시간 상이</td>
									</tr>
									<tr>
										<th>위&nbsp;치</th>
										<td>오션어드벤처 실내 게이트 內</td>
									</tr>
									<tr style="display: none;">
										<th>문의처</th>
										<td></td>
									</tr>
								</tbody>
							</table>
						</ul>
					</div>
				</div>
				<div id="SWIMSUIT" class="content SWIMSUIT" style="display: none;">
					<div>
						<ul class="info3-1">
							<h3>의무실</h3>
							<li><p>오션어드벤처 이용 도중 다쳤을 때 치료를 도와 드리거나 그 밖의 이용 불편 사항들을
									해소하고 안정을 취할 수 있도록 도와드립니다.</p></li>
							<img src="./img/section2/activity3-2.jpg" alt="의무실 사진"
								style="width: 1000px;">
						</ul>
					</div>
					<div>
						<ul class="info3-2">
							<h3>시설안내</h3>
							<br>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>운영시간</th>
										<td>오션어드벤처 운영시간과 동일</td>
									</tr>
									<tr>
										<th>위치</th>
										<td>실내 / 실외 오션어드벤처</td>
									</tr>
									<tr>
										<th>문의처</th>
										<td>실내 041-901-8070 / 실외 041-901-8071</td>
									</tr>
									<tr>
										<th>이용안내</th>
										<td>안정적인 오션어드벤처 이용을 위해 의무실 서비스를 운영 중입니다.</td>
									</tr>
								</tbody>
							</table>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        const tabs = document.querySelectorAll('.tab-wrapper3 div');
        const contents = document.querySelectorAll('.content');

        tabs.forEach(tab => {
            tab.addEventListener('click', function() {
                const target = this.querySelector('a').getAttribute('data-target');
                contents.forEach(content => {
                    if (content.id === target) {
                        content.style.display = 'block';
                    } else {
                        content.style.display = 'none';
                    }
                });
            });
        });
    });
    </script>
</body>
</html>