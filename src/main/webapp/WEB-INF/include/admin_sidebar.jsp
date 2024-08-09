<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/common/style.css" />
</head>
<body>
	<aside class="side-bar">
		<section class="side-bar__icon-box">
			<section class="side-bar__icon-1">
				<div class="side-bar_logo" onclick="location.href='main'">
					<img src="img/admin/몬트리오 로고.png" />
				</div>
				<div></div>
				<div></div>
			</section>
		</section>
		<ul>
			<li><a href="admin_reservation_list"> <span><i><img class="icon-1"
							src="img/admin/예약.png" /></i></span> <span>예약관리</span>
			</a></li>
			<li><a href="admin_user_list"> <span><i><img class="icon-2"
							src="img/admin/유저.png" /></i></span> <span>고객관리</span>
			</a>
				<ul>
					<li><a href="admin_user_list">고객명단</a></li>
					<li><a href="admin_qna_list">문의함</a></li>
				</ul></li>
			<li><a href="#"> <span><i><img class="icon-3"
							src="img/admin/시설.png" /></i></span> <span>시설관리</span>
			</a>
				<ul>
					<li><a href="admin_room_total_list">객실현황</a></li>
					<li><a href="admin_facility_list">부대시설</a></li>
					<li><a href="admin_activity_list">액티비티</a></li>
				</ul></li>
			<li><a href="admin_notice_list"> <span><i><img class="icon-3"
							src="img/admin/게시판.png" /></i></span> <span>게시판</span>
			</a>
				<ul>
					<li><a href="admin_notice_list">공지사항</a></li>
					<li><a href="admin_event_list">이벤트</a></li>
					<li><a href="admin_review_list">리뷰</a></li>
				</ul></li>
			<li><a href="admin_statistics"> <span><i><img class="icon-4"
							src="img/admin/통계.png" /></i></span> <span>통계</span>
			</a></li>
		</ul>
	</aside>