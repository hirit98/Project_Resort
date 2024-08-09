<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<section>
	<div class="main_price">
	<div class="price_cont">
		<h4>객실요금</h4>
		<table class="price_table">
			<thead>
				<tr>
					<th class="first">객실명</th>
					<th>기준 인원</th>
					<th>객실 면적</th>
					<th>금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="first">
						<span>로얄스위트</span>
					</td>
					<td>
						기준
						<span>4</span>
						/ 최대
						<span>4</span>
					</td>
					<td>
						<span>180m²(54.45평)</span>
					</td>
					<td>
						<span>1,330,000원</span>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">
						<span>패밀리</span>
					</td>
					<td>
						기준
						<span>3</span>
						/ 최대
						<span>3</span>
					</td>
					<td>
						<span>57.5㎡(17.39평)</span>
					</td>
					<td>
						<span>334,500원</span>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">
						<span>스위트</span>
					</td>
					<td>
						기준
						<span>4</span>
						/ 최대
						<span>4</span>
					</td>
					<td>
						<span>57.5m²(17.39평)</span>
					</td>
					<td>
						<span>910,000원</span>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">
						<span>더 블</span>
					</td>
					<td>
						기준
						<span>2</span>
						/ 최대
						<span>2</span>
					</td>
					<td>
						<span>40.5m²(12.25평)</span>
					</td>
					<td>
						<span>289,500원</span>
					</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">
						<span>싱 글</span>
					</td>
					<td>
						기준
						<span>1</span>
						/ 최대
						<span>1</span>
					</td>
					<td>
						<span>28.5m²(8.62평)</span>
					</td>
					<td>
						<span>180,000원</span>
					</td>
				</tr>
			</tbody>
		</table>
		<h4>환불규정</h4>
		<table class="price_table">
			<thead>
				<tr>
					<th class="first">이용일 기준</th>
					<th>취소 수수료</th>
					<th>환불 금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="first">이용 당일</td>
					<td>100%</td>
					<td>0%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 1일전</td>
					<td>100%</td>
					<td>0%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 2일전</td>
					<td>100%</td>
					<td>0%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 3일전</td>
					<td>90%</td>
					<td>10%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 4일전</td>
					<td>80%</td>
					<td>20%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 5일전</td>
					<td>70%</td>
					<td>30%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 6일전</td>
					<td>60%</td>
					<td>40%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 7일전</td>
					<td>50%</td>
					<td>50%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 8일전</td>
					<td>40%</td>
					<td>60%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 9일전</td>
					<td>30%</td>
					<td>70%</td>
				</tr>
			</tbody>
			<tbody>
				<tr>
					<td class="first">이용 10일전 (예약완료 고객 포함)</td>
					<td>20%</td>
					<td>80%</td>
				</tr>
			</tbody>
		</table>
		<ul>
			<li>환불 적용은 이용요금 100% 입금시에만 적용됩니다.</li>
		</ul>
		<h4>객실 유의사항</h4>
		<ul>
			<li>객실내에서는 금연입니다.</li>
			<li>생수, 화장지, 실외슬리퍼는 제공되지 않습니다. 미리 준비해 주시기 바랍니다.</li>
			<li>객실내에서 생선의 손질 및 생선구이, 삼겹살의 조리가 불가합니다. 생선손질과 조리, 삼겹살 조리의 경우 바베큐 시설에서만 조리가 가능합니다.</li>
			<li>객실내에서는 지나친 고성방가나 음주가무를 자제해 주시기 바랍니다.</li>
			<li>퇴실시 기물파손이 있을 경우 전액 변상하셔야 합니다.</li>
			<li>펜션 비품 이용시 분실에 유의하시기 바라며 분실시 반드시 펜션지기에 알려주시기 바랍니다.</li>
			<li>퇴실시 객실 정리 부탁드리며, 음식물 및 쓰레기는 지정된 장소에 분리 배출하여 주시기 바랍니다.</li>
			<li>모기향, 양초, 부탄가스 등 화기사용을 자제해 주시기 바랍니다.</li>
			<li>어린이 안전사고 발생시 보호자에게 책임이 있습니다. 유아를 포함한 개인 안전관리에 신경써 주시기 바랍니다.</li>
			<li>개인 부주의로 인한 안전사고 및 귀중품(현금포함)분실, 파손에 대해 펜션은 책임을 지지 않습니다.</li>
			<li>미성년자는 보호자 없이는 입실이 불가능 합니다.</li>
		</ul>
	</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>