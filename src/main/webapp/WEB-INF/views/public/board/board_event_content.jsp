<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="img/mainicon-32x32.png">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<div id="event_container">
		<section>
			<div class="event_bg">
				<div class="event_top">
					<h1>이벤트</h1>
				</div>
			</div>
		</section>
		<div class="event_bottom event_content">
			<table>
				<thead>
					<tr>
						<th style="border-right: 1px solid #d9d9d9;">제목</th>
						<th colspan="5">${dto.getEvent_board_title() }</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="border-right: 1px solid #d9d9d9;">작성자</td>
						<td>${dto.getEvent_board_writer_id() }</td>
						<td style="border-right: 1px solid #d9d9d9;">등록일</td>
						<td>${dto.getEvent_board_date() }</td>
						<td style="border-right: 1px solid #d9d9d9;">조회수</td>
						<td>${dto.getEvent_board_hit() }</td>
					</tr>
					<tr class="text-content">
						<td colspan="6"><textarea readonly>${dto.getEvent_board_cont() }</textarea>
						</td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #d9d9d9;">첨부파일</td>
						<c:if test="${!empty dto.getEvent_board_file() }">
							<td colspan="5"><a
								href="upload_images/${dto.getEvent_board_file() }">${dto.getEvent_board_file() }</a>
							</td>
						</c:if>
						<c:if test="${empty dto.getEvent_board_file() }">
							<td colspan="5">
								<p>첨부파일이 없습니다.</p>
							</td>
						</c:if>
					</tr>
				</tbody>
			</table>
			<input type="button" value="목록" class="list_content"
				onclick="location.href='board_event?page=${page }'">
		</div>
	</div>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>