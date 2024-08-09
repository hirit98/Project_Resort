<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h3>1:1 문의함</h3>
				<div class="qna_search">
					<form method="post" action="mypage_qna_search">
						<select name="field" class="sch_1">
							<option>전체</option>
							<option>제목</option>
							<option>내용</option>
						</select>
						<input type="text" name="keyword" id="user_id" placeholder="검색사항을 입력하세요." autocomplete="off">
						<input type="submit" value="검색하기">
						<input type="button" value="문의하기" onclick="location.href='mypage_qna'">				
					</form>
				</div>		
			<div class="qna_board">
				<table class="qna_table">
					<thead>
						<tr>
							<th>제목</th>
							<th>문의유형</th>
							<th>작성일자</th>
							<th>처리상태</th>		
						</tr>					
					</thead>
					<c:if test="${!empty list }">
					    <c:if test="${!is_Search }">
					        <c:forEach items="${list }" var="dto">
					            <tbody>
					                <tr class="table-row" onclick="location.href='mypage_qna_content?no=${dto.getQna_board_no() }&page=${page }'">
					                    <td>${dto.getQna_board_title() }</td>
					                    <td>${dto.getQna_board_type() }</td>
					                    <c:if test="${empty dto.getQna_board_update() }">
					                        <td>${dto.getQna_board_date().substring(0,16) }</td>
					                    </c:if>
					                    <c:if test="${!empty dto.getQna_board_update() }">
					                        <td>${dto.getQna_board_update().substring(0,16) }</td>
					                    </c:if>
					                    <c:if test="${!dto.isQna_board_status() }">
					                    	<td>답변중</td>
					                    </c:if>
					                    <c:if test="${dto.isQna_board_status() }">
					                    	<td>답변완료</td>
					                    </c:if>
					                </tr>
					            </tbody>
					        </c:forEach>
					    </c:if>
					    <c:if test="${is_Search }">
					        <c:forEach items="${list }" var="dto">
					            <tbody>
					                <tr class="table-row" onclick="location.href='mypage_qna_search_content?no=${dto.getQna_board_no() }&page=${page }&field=${field }&keyword=${keyword }'">
				                    <td>${dto.getQna_board_title() }</td>
					                    <td>${dto.getQna_board_type() }</td>
					                    <c:if test="${empty dto.getQna_board_update() }">
					                        <td>${dto.getQna_board_date().substring(0,16) }</td>
					                    </c:if>
					                    <c:if test="${!empty dto.getQna_board_update() }">
					                        <td>${dto.getQna_board_update().substring(0,16) }</td>
					                    </c:if>
					                    <c:if test="${!dto.isQna_board_status() }">
					                    	<td>답변중</td>
					                    </c:if>
					                    <c:if test="${dto.isQna_board_status() }">
					                    	<td>답변완료</td>
					                    </c:if>
					                </tr>
					            </tbody>
					        </c:forEach>
					    </c:if>
					</c:if>
					<c:if test="${empty list }">
					    <tbody>
					        <tr class="table-row">
					            <td colspan="5">
					                <h3>등록된 문의가 없습니다.</h3>
					            </td>
					        </tr>
					    </tbody>
					</c:if>
				</table>

			</div>
		</div>
	</div>
	</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>