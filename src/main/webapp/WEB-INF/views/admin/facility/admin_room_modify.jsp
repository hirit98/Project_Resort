<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			<div class="admin_room_modify-content">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;객실 현황 > 객실 수정 
				</h1>
				<div class="admin_room_modify_cont">
					<form method="post" action="admin_room_modify_ok">
						<input type="hidden" name="type" value="${dto.getRoom_type() }">
						<table>
							<tr>
								<th>객실 타입</th>
								<td>
									${fn:toUpperCase(dto.getRoom_type())}
								</td>
							</tr>
							<tr>
								<th>객실 면적</th>
								<td>
									<input type="text" name="area" value="${dto.getRoom_area() }"> ㎡
								</td>
							</tr>
							<tr>
								<th>객실 정원</th>
								<td>
									<input type="number" name="maximum" value="${dto.getRoom_maximum() }"> 명
								</td>
							</tr>
							<tr>
								<th>객실 가격</th>
								<td>
									<input type="text" name="price" value="${dto.getRoom_price() }"> 원
								</td>
							</tr>
							<tr>
								<th>총 객실수</th>
								<td>
									<input type="number" name="total" value="${dto.getRoom_total() }"> 개
								</td>
							</tr>
						</table>
						<div class="admin_content_btn_box">
							<input class="cancle_btn" type="button" value="돌아가기" onclick="location.href='admin_room_total_list'">&nbsp;&nbsp;&nbsp;
							<input class="modify_btn" type="submit" value="수정">
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>