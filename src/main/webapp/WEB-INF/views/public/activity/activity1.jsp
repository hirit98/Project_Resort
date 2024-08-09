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
        <div class="activity_title1">
        </div>
        <div class="activity_info1">
            <h2>액티비티안내</h2>
            <li>ACTIVITY INFORMATION</li> 
            <ul>
                <p style="font-size: 30px;">오션어드벤처 소개</p>
                <p>테마여행을 스토리로 한 환타지 세상 오션어드벤처!</p>
                <p>우리나라 중부지역권 최대의 테마워터파크를 자랑하는 몬트리오 천안. 건강과 힐링, 그리고 즐거움은 물론 일상의 피로와 스트레스들을 해소할 수 있는 다양한 시설들이 준비되어 있습니다.</p>
                <p>국내 최초 캐릭터 워터파크 오션어드벤처!</p>
                <p>오션어드벤처는 로마, 스페인, 베니스 등 유럽의 7개 나라 유명 건축물과 유적지를 배경으로 하여 워터파크 공간을 구성했습니다.</p>
                <p>스페인 타워(슬라이드 타워), 핀란드 산타마을(푸드코트), 밀려오는 파도와 함께하는 파도풀 무대, 이탈리아 베네치아(메인브릿지), 노르웨이 바이킹(MLPS), 그리스 산토리니 이아마을(아쿠아바), 이탈리아 로마 신전(노천탕)은 또 하나의 작은 유럽을 만난 듯한 즐거움을 안겨줍니다.</p>
                <p>또한, 물놀이 시설로는 국내 최초 거대한 해일을 타는 듯 짜릿한 스릴을 느낄 수 있는 쓰나미 슬라이드, 튜브 옥토퍼스 레이서를 도입했고,</p>
                <p>국내 최장 업힐 슬라이드 도입은 물론 튜브 뒤로 몰아치는 거대한 파도로 아쿠아 여행을 즐기는 급류 유수풀(와일드 익스트림리버)은 371m로 국내 최장 길이를 자랑하고 있습니다.</p>
            </ul>
        </div>
        <div class="activity_menu1">
            <div class="title_tab1">
                <div class="title_tab-horizontal">
                    <div class="tab-wrapper1">
                        <div><a href="#n" data-target="SPA"><span style="color: #000;">스파</span></a></div>
                        <div><a href="#n" data-target="WATERPARK"><span style="color: #000;">실내외 수영장</span></a></div>
                        <div><a href="#n" data-target="ATTRACTION"><span style="color: #000;">어트렉션</span></a></div>
                    </div>
                </div>
            </div>
            <div id="SPA" class="content SPA">
                <h3>ATTRACTION SPA</h3>
                <!-- 스파 -->
                <div class="information1-1">
                    <ul style="text-align: center;">
                        <li><p>아늑한 실내공간에 샤워실과 다양한 탕 및 다양한 편의시설로 구성되어 있으며, 시기별 이벤트탕을 운영합니다.</p></li>
                        <li><p>한약제, 쑥 등이 배치된 건,습식 도크도 운영합니다.</p></li>
                    </ul>
                    <div class="guide1">
                        <div class="spa_guide1">
                            <img src="./img/section2/activity1-1.jpg" alt="스파 이미지" width="500px" height="400px">
                            <ul>
                                <li><p><b>시설소개</b></p></li> 
                                <li><p> 열탕, 온탕, 노천탕, 냉탕, 족탕, 건/습식 도크</p></li>
                                <li><p><b>운영시간:</b> 10:00~18:00</p></li>
                                <li><p><b>위치:</b> 사우나</p></li>
                                <li><p><b>이용안내:</b></p></li>
                                <li><p>찜질방존 이용 고객님은 찜질복 및 찜질방 담요를 대여하시기 바랍니다.</p></li>
                                <li><p>타월은 유료로 운영되고 있습니다 (대여료 1매 1,500원).</p></li>
                                <li><p><b>문의처:</b> 1588-4888</p></li>
                            </ul>
                        </div>  
                    </div>
                </div>
            </div>
            <div id="WATERPARK" class="content WATERPARK" style="display: none;">
                <h3>ATTRACTION INDOOR POOL & WATERPARK</h3> 
                <!-- 실내외 수영장 -->
                <div class="infomation1-1">
                    <ul style="text-align: center;">
                        <li><p>사계절 즐길 수 있는 웰빙 워터 테마파크</p></li>
                        <li><p> 웰빙과 건강을 주제로 한 몬트리오 경주 오션플레이는 남녀노소 모두가 다 함께 즐기는 신개념의 워터 테마파크입니다.</p></li>
                        <li><p> 다양한 기능성 풀존과 테마 스파존 등으로 구성된 실내 아쿠아풀존과 아쿠아플레이존, 파도풀존 등을 갖춘 실외 오션플레이에서 짜릿한 즐거움을 만나보세요.</p></li>
                    </ul>
                    <div class="guide1">
                        <div class="indoor_guide1">
                            <img src="./img/section2/activity1-2.jpg" alt="실내수영장이미지" width="500px" height="400px">
                            <ul>
                                <li><p><b>시설소개</b></p></li>
                                <li><p>수중 테라피를 받을 수 있는 바데풀과 자쿠지까지 갖춘 인도어플에서 차별화된 휴식을 취해 보세요.</p></li>
                                <li><p><b>운영시간</b>	07:00~21:00</p></li>
                                <li><p><b>위치</b>	114동(ROUND)L층</p></li>
                                <li><p><b>이용안내</b></p></li>
                                <li><p>비치 타월, 구명조끼,암밴드,선베드 배치</p></li>
                                <li><p>타월은 유료로 운영되고 있습니다</p></li>
                                <li><p>(대여료 1매 1,500원)</p></li>
                                <li><p><b>문의처</b> 1588 - 4888</p></li>
                            </ul>
                        </div>  
                    </div>
                </div>
                <div class="infomation1-2">
                    <div class="guide1">
                            <div class="waterpark_guide1">
                                <img src="./img/section2/activity1-3.png" alt="야외수영장이미지" width="600px" height="400px">
                                <ul>
                                    <li><p><b style="font-size: 20px;">시설소개</b></p></li> 
                                    <li><p>우리나라 중부지역권 최대의 테마워터파크를 자랑하는 액티비티. </p></li>
                                    <li><p>국내 최장 업힐 슬라이드 도입은 물론 튜브 뒤로 몰아치는거대한 파도로 아쿠아 여행을 즐기는 급류 유수풀(와일드 익스트림리버)은 371m로 국내 최장 길이를 자랑하고 있습니다.</p></li>
                                    <li><p><b>운영시간:</b> 07:00~21:00</p></li>
                                    <li><p><b>위치:</b> 야외</p></li>
                                    <li><p><b>이용안내:</b></p></li>
                                    <li><p>구명조끼 착용 후 입장 하시기 바랍니다. (유료)</p></li>
                                    <li><p>타월은 유료로 운영되고 있습니다 (대여료 1매 1,500원).</p></li>
                                    <li><p><b>문의처:</b> 1588-4888</p></li>
                                </ul>
                            </div>  
                    </div>
                </div>
            </div>
            <!-- 어트렉션 -->
            <div id="ATTRACTION" class="content ATTRACTION" style="display: none;">
                <h3>ATTRACTION ATTRACTION</h3>
                <div class="information1">
                    <ul style="text-align: center;">
                        <li><p>액티비티는 로마, 스페인, 베니스 등 유럽의 7개 나라 유명 건축물과 유적지를 배경으로 하여 워터파크 공간을 구성했습니다.</p></li>
                        <li><p>스페인 타워(슬라이드 타워), 핀란드 산타마을(푸드코트), 밀려오는 파도와 함께하는 파도풀 무대, 이탈리아 베네치아(메인브릿지), 노르웨이 바이킹(MLPS), 그리스 산토리니 이아마을(아쿠아바), 이탈리아 로마 신전(노천탕)은 또 하나의 작은 유럽을 만난 듯한 즐거움을 안겨줍니다.</p></li>
                        <li><p>실외존은 스피드레이싱, 바디 볼 슬라이드, 더블 부메랑, 토네이도풀, 와일드익스트림리버, 바이킹타워, 키디풀 등 스릴감 넘치는 테마 물놀이 시설로 가득차 짜릿한 즐거움을 선사 할 것입니다.</p></li>
                    </ul>
                    <div class="guide1">
                        <div class="attraction_guide1">
                            <img src="./img/section2/activity1-4.jpg" alt="어트렉션 이미지" width="500px" height="400px">
                            <ul>
                                <li><p><b>바이킹타워</b></p></li> 
                                <li><p><b>운영시간:</b> 10:00~21:00</p></li>
                                <li><p><b>위치:</b> 야외 어트렉션구역</p></li>
                                <li><p><b>이용안내:</b></p></li>
                                <li><p>구명조끼 착용 후 입장 하시기 바랍니다. (유료)</p></li>
                                <li><p>타월은 유료로 운영되고 있습니다 (대여료 1매 1,500원).</p></li>
                                <li><p><b>문의처:</b> 1588-4888</p></li>
                            </ul>
                        </div>  
                        <div class="attraction_guide1-2">
                            <img src="./img/section2/activity1-5.jpg" alt="어트렉션 이미지" width="500px" height="400px">
                            <ul>
                                <li><p><b>키디풀</b></p></li> 
                                <li><p><b>운영시간:</b> 10:00~21:00</p></li>
                                <li><p><b>위치:</b> 야외 어트렉션구역</p></li>
                                <li><p><b>이용안내:</b></p></li>
                                <li><p>구명조끼 착용 후 입장 하시기 바랍니다. (유료)</p></li>
                                <li><p>타월은 유료로 운영되고 있습니다 (대여료 1매 1,500원).</p></li>
                                <li><p><b>문의처:</b> 1588-4888</p></li>
                            </ul>
                        </div>  
                        <div class="attraction_guide1-3">
                            <img src="./img/section2/activity1-6.png" alt="어트렉션 이미지" width="500px" height="400px">
                            <ul>
                                <li><p><b>바디 볼 슬라이드</b></p></li> 
                                <li><p><b>운영시간:</b> 10:00~21:00</p></li>
                                <li><p><b>위치:</b> 야외 어트렉션구역</p></li>
                                <li><p><b>이용안내:</b></p></li>
                                <li><p>구명조끼 착용 후 입장 하시기 바랍니다. (유료)</p></li>
                                <li><p>타월은 유료로 운영되고 있습니다 (대여료 1매 1,500원).</p></li>
                                <li><p><b>문의처:</b> 1588-4888</p></li>
                            </ul>
                        </div>  
                        <div class="attraction_guide1-4">
                            <img src="./img/section2/activity1-7.png" alt="어트렉션 이미지" width="500px" height="400px">
                            <ul>
                                <li><p><b>와일드익스트림리버</b></p></li> 
                                <li><p><b>운영시간:</b> 10:00~21:00</p></li>
                                <li><p><b>위치:</b> 야외 어트렉션구역</p></li>
                                <li><p><b>이용안내:</b></p></li>
                                <li><p>구명조끼 착용 후 입장 하시기 바랍니다. (유료)</p></li>
                                <li><p>타월은 유료로 운영되고 있습니다 (대여료 1매 1,500원).</p></li>
                                <li><p><b>문의처:</b> 1588-4888</p></li>
                            </ul>
                        </div>  
                        <div class="attraction_guide1-5">
                            <img src="./img/section2/activity1-8.jpg" alt="어트렉션 이미지" width="500px" height="400px">
                            <ul>
                                <li><p><b>스피드레이싱</b></p></li> 
                                <li><p><b>운영시간:</b> 10:00~21:00</p></li>
                                <li><p><b>위치:</b> 야외 어트렉션구역</p></li>
                                <li><p><b>이용안내:</b></p></li>
                                <li><p>구명조끼 착용 후 입장 하시기 바랍니다. (유료)</p></li>
                                <li><p>타월은 유료로 운영되고 있습니다 (대여료 1매 1,500원).</p></li>
                                <li><p><b>문의처:</b> 1588-4888</p></li>
                            </ul>
                        </div>  
                    </div>
                </div>
            </div>
        </div>
    </div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const tabs = document.querySelectorAll('.tab-wrapper1 div');
        const contents = document.querySelectorAll('.content');

        tabs.forEach(tab => {
            tab.addEventListener('click', function() {
                const target = this.querySelector('a').getAttribute('data-target');
                contents.forEach(content => {
                    if (content.id === target) {
                        content.style.display = 'block';
                    } else {
                        content.style.display = 'none';
                    }
                });
            });
        });
    });
    </script>
</body>
</html>