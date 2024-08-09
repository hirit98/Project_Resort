<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<link rel="stylesheet" href="css/common/style.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />

	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_event_content-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;이벤트 > 게시글 상세보기
				</h1>
				<div class="admin_event_cont">
					<h3>작성자</h3>
					<p>${dto.getEvent_board_writer_id() }</p>
					<h3>제 목</h3>
					<p>${dto.getEvent_board_title() }</p>
					<h3>내 용</h3>
					<textarea readonly>${dto.getEvent_board_cont() }</textarea>
					<h3>첨부파일</h3>
					<c:if test="${!empty dtp.getEvent_board_file() }">
						<p>
							<a href="upload_images/${dto.getEvent_board_file() }"
								target="_blank">${dto.getEvent_board_file() }</a>
						</p>
					</c:if>
					<c:if test="${empty dtp.getEvent_board_file() }">
						<p>
							첨부파일이 존재하지 않습니다.
						</p>
					</c:if>
				</div>
				<div class="admin_content_btn_box">
					<c:if test="${empty field }">
						<input type="button" class="delete_btn" value="목록"
							onclick="location.href='admin_event_list?page=${page }'">&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${!empty field }">
						<input type="button" class="delete_btn" value="목록"
							onclick="location.href='admin_event_search?page=${page }&field=${field }&keyword=${keyword }'">&nbsp;&nbsp;&nbsp;
					</c:if>
					<input type="button" class="modify_btn" value="수정"
						onclick="location.href='admin_event_modify?no=${dto.getEvent_board_no() }&page=${page }'">&nbsp;&nbsp;&nbsp;
					<input type="button" class="delete_btn" value="삭제"
						onclick="if(confirm('해당 게시글을 삭제하시겠습니까?')) {
						location.href='admin_event_delete?no=${dto.getEvent_board_no() }&page=${page }'} else { return; }">
				</div>
			</div>
		</div>
	</main>
</body>
</html>