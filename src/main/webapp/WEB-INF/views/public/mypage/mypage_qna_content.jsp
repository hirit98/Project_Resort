<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />
	<jsp:include page="/WEB-INF/include/mypage_sidebar.jsp" />
			</div>
				<div class="m_contents">
					<div class="qna">
						<h3>1:1 문의내역</h3>
						<div class="qna_board">
							<form method="post" action="mypage_qna_ok" enctype="multipart/form-data">
								<table>
									<thead>
										<tr>
											<th>제목</th>
											<td>
												<input type="text" name="title" value="${cont.getQna_board_title() }" readonly>
											</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>문의 유형</th>
											<td>
												<input type="text" name="title" value="${cont.getQna_board_type() }" readonly>
											</td>
										</tr>
										<tr>
											<th>내용</th>
											<td>
												<textarea name="cont" readonly style="height: 120px">${cont.getQna_board_cont() }</textarea>
											</td>
										</tr>
										<c:if test="${!empty cont.getQna_board_answer() }">
										<tr>
											<th>답변</th>
											<td>
												<textarea name="cont" readonly style="height: 120px">${cont.getQna_board_answer() }</textarea>
											</td>
										</tr>
										</c:if>
										<tr>
											<th>첨부파일</th>
											<td>
												<a href="upload_images/${cont.getQna_board_file() }" target="_blank">${cont.getQna_board_file() }</a>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center">
												<input type="button" value="돌아가기" onclick="location.href='mypage_qna_board'">
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>