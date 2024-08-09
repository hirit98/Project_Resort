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
			<div class="admin_notice_insert-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;공지사항 > 게시글 상세보기
				</h1>
				<div class="admin_notice_insert_cont">
					<form method="post" action="admin_notice_insert_ok" enctype="multipart/form-data">
						<h3>작성자</h3>
						<p>
							<input type="text" name="id" value="${dto.getAdmin_id() }">
						</p>
						<h3>제 목</h3>
						<p>
							<input type="text" name="title">
						</p>
						<h3>내 용</h3>
						<textarea name="cont"></textarea>
						<h3>첨부파일</h3>
						<p>
							<input type="file" name="file">
						</p>
						<div class="admin_content_btn_box">
							<input type="button" class="cancle_btn" value="취소" onclick="location.href='admin_notice_list'">&nbsp;&nbsp;&nbsp;
							<input type="submit" class="insert_btn" value="등록" onclick="location.href='admin_notice_insert_ok'">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>