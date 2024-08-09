<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MONTRIO</title>
<link rel="icon" type="image/png" sizes="32x32" href="img/mainicon-32x32.png">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<section id="faq_container">
		<section>
			<div class="bg">
				<div class="top">
					<h1>FAQ</h1>
				</div>
			</div>
		</section>
		<div class="inner">
			<article class="accordion">
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;체크인 및 체크아웃 시간은 언제인가요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        체크인 시간은 오후 3시부터이며, 체크아웃 시간은 오전 11시까지입니다. 체크아웃 연장은 사전에 문의해 주시기 바랍니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;리조트 내 수영장 이용 시간은 어떻게 되나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        수영장은 매일 오전 9시부터 오후 6시까지 운영됩니다. 날씨와 상황에 따라 운영 시간이 변경될 수 있으니 사전에 확인 부탁드립니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;리조트에서 반려동물 동반이 가능한가요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        죄송하지만 저희 리조트는 반려동물 동반이 불가능합니다. 반려동물을 위한 별도의 시설은 마련되어 있지 않습니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;무료 와이파이가 제공되나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        네, 모든 객실 및 공용 구역에서 무료 와이파이를 이용하실 수 있습니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;주차는 어떻게 하나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        리조트 내 무료 주차장이 마련되어 있습니다. 투숙객은 무료로 이용하실 수 있습니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;조식은 어떻게 제공되나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        조식은 매일 아침 7시부터 10시까지 레스토랑에서 뷔페 형식으로 제공됩니다. 투숙객은 별도의 요금 없이 이용하실 수 있습니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;룸 서비스가 제공되나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        네, 룸 서비스는 매일 오전 6시부터 밤 10시까지 제공됩니다. 메뉴는 객실 내 비치된 메뉴판을 참고하시기 바랍니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;리조트 내에서 액티비티를 예약할 수 있나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        네, 리조트 내에서 다양한 액티비티 프로그램을 운영하고 있으며, 프런트 데스크나 컨시어지 데스크에서 예약하실 수 있습니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;객실 내에 미니바가 있나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        네, 모든 객실에는 미니바가 구비되어 있습니다. 이용 요금은 체크아웃 시 청구됩니다.
				    </p>
				</div>
				
				<div class="question">
				    <i>Q</i>&nbsp;&nbsp;리조트 내 레스토랑 예약은 어떻게 하나요?
				</div>
				<div class="answer">
				    <i>A</i>&nbsp;&nbsp;
				    <p>
				        리조트 내 레스토랑 예약은 프런트 데스크나 컨시어지 데스크를 통해 예약하실 수 있습니다. 또한, 대표번호로 전화하셔서 예약 가능합니다.
				    </p>
				</div>
			</article>
		</div>
	</section>
	<!-- 푸터 끝 -->
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
	<script>
		$(".question").click(function() {
			$(this).next(".answer").stop().slideToggle(300);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).next(".answer").siblings(".answer").slideUp(300); // 1개씩 펼치기
		});
	</script>
</body>
</html>