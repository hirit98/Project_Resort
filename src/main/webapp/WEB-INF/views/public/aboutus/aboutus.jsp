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
        <div id="container">
            <div class="abouthotel">
                <div class="aboutus_title">
                    <h3>대한민국 리조트의 한 획을 긋는 국내 No.1 리조트</h3>
                    <h1>MONTRIO</h1>
                    <p>MONTRIO 럭셔리한 투숙을 경험해보십시오! 한국을 대표할 수 있는 셰프의 요리와 편안한 시간을 위한 스파 서비스<br>
                      짜릿한 즐거움을 위한 실내·외 수영장 및 어트랙션 시설 고객님의 안락한 휴식과 기대를 뛰어넘는 최상의 프라이빗 서비스를 약속 드립니다.</p>
                </div>
            </div>
            <div class="aboutroom">
                <div>
                    <p><img src="./img/aboutus/aboutus1.jpg" alt="리조트의 방 중 하나의 방"></p>
                </div>
                <div>
                    <p>스위스에서 직수입한 침구를 구비하였으며, <strong>전문가의 꼼꼼한 진단</strong>으로<br> 언제나 100%살균 작업을 진행하여<br>
                       고객 여러분들께 최상의 잠자리를 선물해 드리고 있습니다.
                    </p>
                </div>
            </div>
            <div class="aboutfood">
                <div>
                    <p>전문적인 셰프들이 뛰어난 기술과 열정으로 최고의 요리를 제공합니다.<br>
                        <strong>미슐랭 가이드에 걸맞는 퀄리티</strong>를 자랑하며, 고객들에게 차별화된 경험을 선사합니다. <br>풍부한 맛과 향을 담은 요리들은 고객들에게 잊지 못할 맛의 여행을 선사합니다.
                    </p>
                </div>
                <div>
                    <p><img src="./img/aboutus/aboutus2.png" alt="MONTRIO의 레스토랑"></p>
                </div>
            </div>
            <div class="aboutdrink">
                <div>
                    <p><img src="./img/aboutus/aboutus3.jpg" alt="MONTRIO의 호텔바"></p>
                </div>
                <div>
                    <p>
                        세계적인 건축가 렌조 피아노가 디자인 한 벨벳 베일 바는 대중적인 칵테일 외에<br>
                       세계 각지에 있는 칵테일을 경험하실 수 있으며, 개성있고 기품있는 칵테일의 재미를 맛 보실 수 있습니다.
                    </p>
                </div>
            </div>
            <div class="aboutactivity" >
                <div>
                    <p>국내 리조트 중 최대 규모의 워터파크 오션 어드벤쳐는 가족과 함께하는 추억을<br>
                        애인과 함께하는 즐거운 시간을 보내 실수 있도록 다양한 시설이 준비되어 있습니다.</p>
                </div>
                <div>
                    <p><img src="./img/aboutus/aboutus4.jpg" alt="MONTRIO의 워터파크"></p>
                </div>
            </div>
            <div class="end">
                <p>
                    MONTRIO 한국 안의 작은 유럽에 오신 여러분을 진심으로 환영하며<br>
                    즐거운 여행이 되실 수 있도록 저희 MONTRIO가 더욱 노력하겠습니다.
                </p>
            </div>
        </div>
    </section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
</body>
</html>