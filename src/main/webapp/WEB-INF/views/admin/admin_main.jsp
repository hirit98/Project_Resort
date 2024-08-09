<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<link rel="stylesheet" href="css/common/style.css">
</head>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />
	
	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_main_content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;관리자
					페이지
				</h1>

				<div class="grid-container">
					<div class="grid-item" onclick="location.href='admin_reservation_list'">
						<h2>예약 관리</h2>
						<p>
							리조트내 예약들을 관리합니다.<br> 예약 조회 및 취소, 예약 등록 등의 기능이 있습니다.
						</p>
					</div>
					<div class="grid-item" onclick="location.href='admin_user_list'">
						<h2>고객 관리</h2>
						<p>
							고객 정보를 관리합니다.<br> 고객 조회 및 수정, 고객 문의 처리 등의 기능이 있습니다.
						</p>
					</div>
					<div class="grid-item" onclick="location.href='admin_notice_list'">
						<h2>컨텐츠 관리</h2>
						<p>
							웹사이트에 표시되는 컨텐츠를 관리합니다.<br> 게시물들의 작성, 수정, 삭제, 컨텐츠 분류 등의
							기능이 있습니다.
						</p>
					</div>
					<div class="grid-item" onclick="location.href='admin_room_total_list'">
						<h2>시설 관리</h2>
						<p>
							웹사이트에 등록된 시설들을 관리합니다.<br> 객실, 부대시설, 액티비티의 추가, 수정, 삭제등 기능이
							있습니다.
						</p>
					</div>
					<div class="grid-item" onclick="location.href='admin_statistics'">
						<h2>통계 및 분석</h2>
						<p>
							수집한 데이터를 바탕으로 통계 정보를 제공하고 분석합니다.<br> 방문자 수, 이용자 행동 분석 등의 기능이
							있습니다.
						</p>
					</div>
					<div class="grid-item" onclick="location.href='admin_account_list'">
						<h2>설정 관리</h2>
						<p>
							관리자 페이지의 설정을 관리합니다.<br> 권한 및 접근 설정, 사이트 설정 등의 기능이 있습니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>