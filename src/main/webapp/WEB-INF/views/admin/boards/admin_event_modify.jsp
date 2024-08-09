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
			<div class="admin_event_modify-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;이벤트 > 게시글 상세보기 > 게시글 수정하기
				</h1>
				<form method="post" action="admin_event_modify_ok" enctype="multipart/form-data">
					<input type="hidden" name="no" value="${dto.getEvent_board_no() }">
					<input type="hidden" name="page" value="${page }">
					
					<div class="admin_event_modify_cont">
						<h3>작성자</h3>
						<p>
							<input type="text" name="id" value="${dto.getEvent_board_writer_id() }" readonly>
						</p>
						<h3>제 목</h3>
						<p>
							<input type="text" name="title" value="${dto.getEvent_board_title() }">
						</p>
						<h3>내 용</h3>
						<textarea name="cont">${dto.getEvent_board_cont() }</textarea>
						<div class="admin_modify_file_before">
							<h3>기존 첨부파일</h3>
							<c:if test="${!empty dto.getEvent_board_file() }">
								<p><a href="upload_images/${dto.getEvent_board_file() }" target="_blank">${dto.getEvent_board_file() }</a></p>
							</c:if>
							<c:if test="${empty dto.getEvent_board_file() }">
								<p>첨부파일이 존재하지 않습니다.</p>
							</c:if>
						</div>
						<div class="admin_modify_file_after">
							<h3>수정 첨부파일</h3>
							<p style="height: 41px;">
								<input type="file" name="file"> 
							</p>
						</div>
					</div>
					<div class="admin_content_btn_box">
						<input type="button" class="modify_btn" value="취소" onclick="location.href='admin_event_content?no=${dto.getEvent_board_no() }&page=${page }'">&nbsp;&nbsp;&nbsp;
						<input type="submit" class="delete_btn" value="수정">
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>