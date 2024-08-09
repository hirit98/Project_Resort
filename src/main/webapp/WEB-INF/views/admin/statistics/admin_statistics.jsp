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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<body>
	<jsp:include page="/WEB-INF/include/admin_sidebar.jsp" />
	<main class="admin_container">
		<div class="admin_main_container">
			<div class="admin_user_list-content statistics">
				<h1>
					<img src="img/admin/home.png" onclick="location.href='admin_main'">&nbsp;통
					계
				</h1>
				<div class="chart-container">
					<canvas id="myPieChart"></canvas>
					<canvas id="memberChart"></canvas>
				</div>
				<canvas id="barChart"></canvas>
			</div>
		</div>
	</main>
	<script>
		// 동그라미 원 차트 데이터 (객실 타입별 통계)

		var typeList = ${roomTypeArrayList};
		var countRoomType = ${countRoomType};

		var roomTypeData = {
			labels : typeList,
			datasets : [ {
				label : '객실 타입별 통계',
				data : countRoomType,
				backgroundColor : [ 'rgb(67,134,243)', // 로얄스위트 (보라)
				'rgb(208,112,89)', // 패밀리 (금)
				'rgb(250,188,5)', // 스위트 (갈색)
				'rgb(52,168,83)', // 더블 (코랄)
				'rgb(255,108,2)' // 싱글 (틸)
				],
				borderColor : [ 'rgb(67,134,243)', 'rgb(208,112,89)',
						'rgb(250,188,5)', 'rgb(52,168,83)', 'rgb(255,108,2)' ],
				borderWidth : 1
			} ]
		};

		// 서버에서 받은 회원 등급별 통계 데이터
		var memGradeList = ${memGradeList};
        var memberCountList = ${memberCountList}; 
        
        // 회원 등급별 차트 데이터
      var memberData = {
          labels: memGradeList,
          datasets: [{
              label: '회원 등급별 통계',
              data: memberCountList,
              backgroundColor: [
                  'rgb(185,115,94)',
                  'rgb(192, 192, 192)',  
                  'rgb(250, 188, 5)', 
                  'rgb(255,255,190)'  
              ],
              borderColor: [
                  'rgb(185,115,94)',
                  'rgb(192, 192, 192)',
                  'rgb(250, 188, 5)',
                  'rgb(255,255,190)'
              ],
              borderWidth: 1
          }]
      };

        var monthList = ${monthList };
        var priceList = ${priceList };
        
		// 막대 그래프 데이터
		var barChartData = {
			labels : monthList,
			datasets : [ {
				label : '월별 매출 액',
				backgroundColor : 'rgb(54, 162, 235)',
				borderColor : 'rgb(54, 162, 235)',
				borderWidth : 1,
				data : priceList
			} ]
		};

		// 차트 옵션
		var options = {
			responsive : true,
			plugins : {
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : '객실 타입별 통계'
				}
			}
		};
		// 동그라미 원 차트 생성
		var ctx1 = document.getElementById('myPieChart').getContext('2d');
		var myPieChart = new Chart(ctx1, {
			type : 'pie',
			data : roomTypeData,
			options : options
		});
		// 회원 등급별 차트 생성
		var ctx2 = document.getElementById('memberChart').getContext('2d');
		var memberChart = new Chart(ctx2, {
			type : 'pie',
			data : memberData,
			options : {
				responsive : true,
				plugins : {
					legend : {
						position : 'top',
					},
					title : {
						display : true,
						text : '회원 등급별 통계'
					}
				}
			}
		});
		// 막대 그래프 생성
		var ctx3 = document.getElementById('barChart').getContext('2d');
		var barChart = new Chart(ctx3, {
			type : 'bar',
			data : barChartData,
			options : {
				responsive : true,
				plugins : {
					legend : {
						position : 'top',
					},
					title : {
						display : true,
						text : '월별 매출'
					}
				}
			}
		});
	</script>
</body>
</html>