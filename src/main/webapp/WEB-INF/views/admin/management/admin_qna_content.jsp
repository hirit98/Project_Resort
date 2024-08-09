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
			<div class="admin_qna_content-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;문의함
					> 문의 상세보기
				</h1>
				<div class="admin_qna_content_box">
					<div class="admin_qna_cont">
						<table class="admin_qna_cont_table">
							<tr>
								<th>제목</th>
								<td>${dto.getQna_board_title() }</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${dto.getQna_board_writer_id() }</td>
							</tr>
							<tr>
								<th>문의유형</th>
								<td>${dto.getQna_board_type() }</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea readonly>${dto.getQna_board_cont() }</textarea>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><a href="upload_images/${dto.getQna_board_file() }"
									target="_blank">${dto.getQna_board_file() }</a></td>
							</tr>
						</table>
					</div>
					<div class="answer_box">
						<form method="post" action="admin_qna_answer">
							<input type="hidden" name="qna_no"
								value="${dto.getQna_board_no()}">
							<h3>답변</h3>
							<p>
								<textarea name="answer_cont">${dto.getQna_board_answer() }</textarea>
							</p>
							<div class="answer_btn_box">
								<input type="reset" value="다시작성">&nbsp;&nbsp;&nbsp; 
								<input type="submit" value="답변하기">
							</div>
						</form>
					</div>
				</div>
				<div class="admin_content_btn_box">
					<input type="button" class="modify_btn" value="돌아가기"
						onclick="location.href='admin_qna_list'">
				</div>
			</div>
		</div>
	</main>
</body>
</html>