<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="admin_review_content-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;고객
					리뷰 > 게시글 상세보기
				</h1>
				<div class="admin_review_cont">
					<h3>작성자</h3>
					<p>${dto.getReview_board_writer_id() }</p>
					<h3>내 용</h3>
					<textarea readonly>${dto.getReview_board_cont() }</textarea>
					<h3>첨부파일</h3>
					<c:if test="${!empty dto.getReview_board_file() }">
						<p>
							<a href="upload_images/${dto.getReview_board_file() }"
								target="_blank">${dto.getReview_board_file() }</a>
						</p>
					</c:if>
					<c:if test="${empty dto.getReview_board_file() }">
						<p>첨부파일이 없습니다.</p>
					</c:if>
					<h3>별점</h3>
					<p>${dto.getReview_board_point() }</p>
				</div>
				<div class="admin_content_btn_box">
					<c:if test="${empty field }">
						<input type="button" class="modify_btn" value="목록"
							onclick="location.href='admin_review_list?page=${page }'">&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${!empty field }">
						<input type="button" class="delete_btn" value="목록"
							onclick="location.href='admin_review_search?page=${page }&field=${field }&keyword=${keyword }'">&nbsp;&nbsp;&nbsp;
					</c:if>
					<input type="button" class="delete_btn" value="삭제"
						onclick="if(confirm('해당 게시글을 삭제하시겠습니까?')) {
						location.href='admin_review_delete?no=${dto.getReview_board_no() }&page=${page }'} else { return; }">
				</div>
			</div>
		</div>
	</main>
</body>
</html>