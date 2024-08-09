<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<link rel="stylesheet" href="css/common/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="js/section1_calendar.js"></script>
<script src="js/main.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<section id="section1_1">
		<section class="booking-form">
			<h2>예약하기</h2>
			<form method="post" action="insert_reservation">
				<label for="checkin">Check-in ~ Check-out : </label>
				<input type="text" name="datetimes" />
				<label for="room-type">Room Type:</label>
				<select id="room-type" name="room-type">
					<option>예약 날짜를 선택해주세요.</option>
				</select>
				<label for="guests">Number of Guests:</label> 
				<input type="number" id="guests" name="guests" min="1" max="4"> 
				<input type="hidden" class="hidden_start_date" value="" name="start_date">
				<input type="hidden" class="hidden_end_date" value="" name="end_date">
				<button type="submit" id="res_btn">RESERVATION</button>
			</form>
		</section>
		<section class="room-list">
			<div class="room room1">
				<img src="./img/room/main room/패밀리.jpg" alt="Room 1"
					style="height: 180px">
				<h3>패밀리</h3>
				<p>
					가족 여행에 안성맞춤, 넓고 아늑한 객실.<br>편리한 시설과 함께 즐거운 시간.
				</p>
			</div>
			<div class="room room2">
				<img src="./img/room/main room/스위트.jpg" alt="Room 2"
					style="height: 180px">
				<h3>스위트</h3>
				<p>
					편안함과 럭셔리를 동시에, 품격 있는 공간.<br>세련된 인테리어로 여유를 느껴보세요.
				</p>
			</div>
			<div class="room room3">
				<img src="./img/room/main room/로얄 스위트.jpg" alt="Room 3"
					style="height: 180px">
				<h3>로얄 스위트</h3>
				<p>
					최고급 시설과 서비스, 왕족 같은 경험.<br>프라이빗한 공간에서 특별한 시간을.
				</p>
			</div>
			<div class="room room4">
				<img src="./img/room/main room/더블.jpg" alt="Room 4"
					style="height: 180px">
				<h3>더 블</h3>
				<p>
					커플 여행에 딱 맞는 아늑한 공간.<br>로맨틱한 분위기를 즐기세요.
				</p>
			</div>
			<div class="room room5">
				<img src="./img/room/main room/싱글.jpg" alt="Room 5"
					style="height: 180px">
				<h3>싱 글</h3>
				<p>
					1인 여행자를 위한 편안하고 실용적인 객실.<br>혼자만의 시간을 위한 최적의 선택.
				</p>
			</div>
		</section>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
	<script>
		// 각 room div를 클릭했을 때 해당하는 option 값을 선택된 상태로 변경하는 함수
		function changeRoomType(roomClass) {
			// roomClass에 해당하는 room div를 찾음
			var room = document.querySelector('.room-list .' + roomClass);
			// room의 h3 요소에서 텍스트 가져오기
			var roomType = room.querySelector('h3').textContent;

			// select 요소 가져오기
			var selectElement = document.getElementById('room-type');

			// option 요소 반복해서 검색하여 선택 상태 변경
			for (var i = 0; i < selectElement.options.length; i++) {
				if (selectElement.options[i].text === roomType) {
					selectElement.selectedIndex = i;
					break;
				}
			}
		}
		// 각 room div에 클릭 이벤트 핸들러 추가
		document.querySelectorAll('.room').forEach(function(room) {
			room.addEventListener('click', function() {
				// 클릭된 room의 클래스명 가져오기
				var roomClass = room.classList[1]; // 두 번째 클래스명 사용 (첫 번째는 'room'이므로)
				// changeRoomType 함수 호출하여 해당 room에 해당하는 option 선택
				changeRoomType(roomClass);
			});
		});
	</script>
	<script>
		const url = new URL(window.location);
    	const urlPath = url.pathname;
    	if (urlPath.includes('pick')) {
			var checkIn = moment("<c:out value="${checkIn}"/>");
	    	var checkOut = moment("<c:out value="${checkOut}"/>");
    	}
	</script>
</body>
</html>