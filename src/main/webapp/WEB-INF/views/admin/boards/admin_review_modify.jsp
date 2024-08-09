<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<link rel="stylesheet" href="css/common/style.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />

	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_review_modify-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;공지사항
					> 게시글 상세보기 > 게시글 수정하기
				</h1>
				<form method="post" action="admin_review_modify_ok"
					enctype="multipart/form-data">
					<input type="hidden" name="no" value="${dto.getReview_board_no() }">
					<input type="hidden" name="page" value="${page }">

					<div class="admin_review_modify_cont">
						<h3>작성자</h3>
						<p>
							<input type="text" name="id"
								value="${dto.getReview_board_writer_id() }" readonly>
						</p>
						<h3>내 용</h3>
						<textarea name="cont">${dto.getReview_board_cont() }</textarea>
						<div class="admin_modify_file_before">
							<h3>기존 첨부파일</h3>
							<p>
								<a href="upload_images/${dto.getReview_board_file() }"
									target="_blank">${dto.getReview_board_file() }</a>
							</p>
						</div>
						<div class="admin_modify_file_after">
							<h3>수정 첨부파일</h3>
							<p style="height: 41px;">
								<input type="file" name="file">
							</p>
						</div>
					</div>
					<div class="admin_content_btn_box">
						<input type="button" class="modify_btn" value="취소"
							onclick="location.href='admin_review_content?no=${dto.getReview_board_no() }&page=${page }'">&nbsp;&nbsp;&nbsp;
						<input type="submit" class="delete_btn" value="수정">
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
</html>