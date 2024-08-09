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
<link rel="stylesheet"
	href="css/admin/facility/admin_activity_content.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />

	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_activity-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;액티비티
					현황> 게시글 상세보기
				</h1>
				<div class="admin_activity_cont">
					<table>
						<tr>
							<th>고유 번호</th>
							<td>${dto.getActivity_id() }</td>
						</tr>
						<tr>
							<th>시설 타입</th>
							<td>${dto.getActivity_type() }</td>
						</tr>
						<tr>
							<th>시설 이름</th>
							<td>${dto.getActivity_name() }</td>
						</tr>
						<tr>
							<th>오픈 시간</th>
							<td>${dto.getActivity_start_time() }</td>
						</tr>
						<tr>
							<th>마감 시간</th>
							<td>${dto.getActivity_end_time() }</td>
						</tr>
					</table>
				</div>
				<div class="admin_activity_btn_box">
					<c:if test="${empty field }">
						<input type="button" class="delete_btn" value="목록"
							onclick="location.href='admin_activity_list?page=${page }'">&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${!empty field }">
						<input type="button" class="delete_btn" value="목록"
							onclick="location.href='admin_activity_search?page=${page }&field=${field }&keyword=${keyword }'">&nbsp;&nbsp;&nbsp;
					</c:if>
					<input type="button" class="modify_btn" value="수정"
						onclick="location.href='admin_activity_modify?no=${dto.getActivity_id() }&page=${page }'">&nbsp;&nbsp;&nbsp;
					<input type="button" class="delete_btn" value="삭제"
						onclick="if(confirm('해당 게시글을 삭제하시겠습니까?')) {
						location.href='admin_activity_delete?no=${dto.getActivity_id() }&page=${page }'} else { return; }">
				</div>
			</div>
		</div>
	</main>

</body>
</html>