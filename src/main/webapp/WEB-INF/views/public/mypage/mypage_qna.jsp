<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<h3>1:1 문의하기</h3>
			<div class="qna_board">
				<form method="post" action="mypage_qna_ok" enctype="multipart/form-data">
					<table>
						<thead>
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="id" value="${dto.getUser_id() }" readonly>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<input type="text" name="title" placeholder="여기에 내용을 입력하세요.">
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>문의 유형</th>
								<td>
									<select name="type">
									  <option value="서비스">서비스</option>
									  <option value="칭찬하기">칭찬하기</option>
									  <option value="건의사항">건의사항</option>
									  <option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea name="cont" placeholder="여기에 내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<input type="file" name="file">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="문의하기">&nbsp;&nbsp;&nbsp;
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