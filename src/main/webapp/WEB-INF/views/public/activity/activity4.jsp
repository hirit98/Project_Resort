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
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp"/>
	<section>
	    <div id="activity_container">
        <!--액티비티 서브공통-->
        <div class="activity_title4">
        </div>
        <div class="foodcourt_container4">
            <div class="foodcourt_info4" >
                <h2>푸드코트</h2>
                <li>FOOD COURT</li> 
                <ul>
                    <li><p><b>푸드코트 소개</b></p></li>
                    <li><p>푸드코트. 스낵, 패스트푸드 등 가볍게 즐길 수 있는 푸드코트를 즐겨보세요. </p></li>
                    <li><p>식사류, 스낵류, 음료 등 다양한 메뉴가 준비되어 있습니다.</p></li>
                    <li><p>상황에 따라 운영 시간이 변동될 수 있으니 방문 전 문의 부탁드립니다.</p></li>
                 </ul>
            </div>
            <div class="guide4">
                <div class="food_guide1">
                    <img src="./img/section2/activity4-1.jpg" alt="음식점이미지1" width="500px" height="400px">
                    <ul>
                        <li><p><b>퓨전음식</b></p></li>
                        <li><p>물놀이 후 즐기는 퓨전음식집</p></li> 
                        <li><p><b>운영시간</b>	09:00~21:00</p></li>
                        <li><p><b>위치</b>	야외 푸드코트 a구역</p></li>
                        <li><p><b>문의처</b> 1588 - 4888</p></li>
                    </ul>
                </div>
                <div class="food_guide4">
                    <img src="./img/section2/activity4-2.jpg" alt="음식점이미지2" width="500px" height="400px">
                    <ul>
                        <li><p><b>치킨</b></p></li>
                        <li><p>맛있는 치킨집</p></li>  
                        <li><p><b>운영시간</b>	09:00~21:00</p></li>
                        <li><p><b>위치</b>	야외 푸드코트 b구역</p></li>
                        <li><p><b>문의처</b> 1588 - 4888</p></li>
                    </ul>
                </div>  
                <div class="food_guide4">
                    <img src="./img/section2/activity4-3.jpg" alt="음식점이미지3" width="500px" height="400px">
                    <ul>
                        <li><p><b>스낵바</b></p></li>
                        <li><p>간편하게 즐기는 스낵바</p></li>  
                        <li><p><b>운영시간</b>	09:00~21:00</p></li>
                        <li><p><b>위치</b> 야외 푸드코트 c구역</p></li>
                        <li><p><b>문의처</b> 1588 - 4888</p></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>