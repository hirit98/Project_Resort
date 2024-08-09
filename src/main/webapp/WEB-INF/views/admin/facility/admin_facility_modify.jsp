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
			<div class="admin_facility_modify-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;부대시설 현황 > 부대시설 수정 
				</h1>
				<div class="admin_facility_modify_cont">
					<form method="post" action="">
						<input type="hidden" name="no" value="${dto.getFacility_id() }">
						<input type="hidden" name="page" value="${page }">
						<table>
							<tr>
								<th>고유 번호</th>
								<td><input type="text" name="id" value="${dto.getFacility_id() }"readonly></td>

							</tr>
							<tr>
								<th>시설 타입</th>
								<td>
									<select name="type" >
									<option>${dto.getFacility_type() }</option>
										<c:forEach items="${dto1}" var="type">
       								 		<c:if test="${type.facility_type != dto.facility_type}">
           							 			<option>${type.facility_type}</option>
        									</c:if>
    									</c:forEach>
									<option>:::선택:::</option>
									</select>
									<br><br>OR<br><br>
									<input type="text" name="input_type" placeholder="새로운 타입을 등록할때 입력.">
								</td>
							</tr>
							<tr>
								<th>시설 이름</th>
								<td>
									<input type="text" name="name" value="${dto.getFacility_name() }">
								</td>
							</tr>
							<tr>
								<th>오픈 시간</th>
								<td>
									<input type="time" name="open" value="${dto.getFacility_start_time() }">
								</td>
							</tr>
							<tr>
								<th>마감 시간</th>
								<td>
									<input type="time" name="close" value="${dto.getFacility_end_time() }">
								</td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<input class="cancle_btn" type="button" value="돌아가기" onclick="location.href='admin_facility_list'">
							<input class="modify_btn" type="submit" value="수정" onclick="location.href='admin_facility_modify_ok'">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>