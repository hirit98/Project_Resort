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
	<!-- 헤더 -->
	<jsp:include page="/WEB-INF/include/main_header.jsp" />
	<jsp:include page="/WEB-INF/include/reservation_sidebar.jsp" />
    <div class="container">
        <section id="restaurant">
          <!-- sub_title -->
          <div class="sub_title">
            <!-- sub_title_bg 배경사진 -->
            <div class="sub_title_bg">
              <!-- 레스토랑 이름 -->
              <h3>La Flamande</h3>
              <h5 class="title_kr">라 플라만데</h5>
            </div>
            <!-- // sub_title_bg -->
            <table class="restaurant">
              <tbody>
                <tr>
                  <th>운영시간</th>
                  <td colspan="2">
                    <div class="flex">
                      <div>
                        <p>
                          <b>조식</b> 07:30 ~ 10:30 (09:30까지 입장하여 주시기
                          바랍니다)
                        </p>
                        <p>
                          <b>중식</b> 11:30 ~ 15:00
                        </p>
                        <p>
                          <b>석식</b> 17:30 ~ 21:00 (20:30까지 입장하여 주시기
                          바랍니다)
                        </p>
                      </div>
                      <div>
                        <p><b>Break Time</b> 15:00 ~ 17:30</p>
                        <p>Take-Out 메뉴는 20:30까지 주문 가능</p>
                        <p>
                          ※상기 영업시간은 영업장 사정에 따라 변경 될 수 있습니다.
                        </p>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>종류</th>
                  <td colspan="2">
                    <p>조식뷔페, 브런치, 단품요리, 한정식, 디너뷔페</p>
                  </td>
                </tr>
                <tr>
                  <th>레스토랑 위치</th>
                  <td colspan="2">
                    <p>1층 로비 (중앙 E/V 근처)</p>
                  </td>
                </tr>
                <tr>
                  <th>문의처</th>
                  <td colspan="2">
                    <p>041-900-9988 (<b>내선 8112</b>)</p>
                  </td>
                </tr>
                <tr>
                  <th>이용안내</th>
                  <td class="info1">
                    <h4>투숙객 이용 금액</h4>
                    <div>
                      <p><b>조식</b></p>
                      <div>
                        <p><b>유아 (36개월 ~ 초등학생 미만)</b> 16,000￦</p>
                        <p><b>어린이 (중학생 이하)</b> 18,000￦</p>
                        <p><b>성인 (고등학생 이상)</b> 21,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>중식</b></p>
                      <div>
                        <p><b>유아 (36개월 ~ 초등학생 미만)</b> 23,000￦</p>
                        <p><b>어린이 (중학생 이하)</b> 25,000￦</p>
                        <p><b>성인 (고등학생 이상)</b> 28,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>석식</b></p>
                      <div>
                        <p><b>유아 (36개월 ~ 초등학생 미만)</b> 58,000￦</p>
                        <p><b>어린이 (중학생 이하)</b> 59,000￦</p>
                        <p><b>성인 (고등학생 이상)</b> 68,000￦</p>
                      </div>
                    </div>
                  </td>
                  <td class="info1">
                    <h4>일반인 이용 금액</h4>
                    <div>
                      <p><b>조식</b></p>
                      <div>
                        <p><b>유아 (36개월 ~ 초등학생 미만)</b> 39,000￦</p>
                        <p><b>어린이 (중학생 이하)</b> 43,000￦</p>
                        <p><b>성인 (고등학생 이상)</b> 48,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>중식</b></p>
                      <div>
                        <p><b>유아 (36개월 ~ 초등학생 미만)</b> 58,000￦</p>
                        <p><b>어린이 (중학생 이하)</b> 62,000￦</p>
                        <p><b>성인 (고등학생 이상)</b> 65,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>석식</b></p>
                      <div>
                        <p><b>유아 (36개월 ~ 초등학생 미만)</b> 93,000￦</p>
                        <p><b>어린이 (중학생 이하)</b> 110,000￦</p>
                        <p><b>성인 (고등학생 이상)</b> 180,000￦</p>
                      </div>
                    </div>
                  </td>
                </tr>
  
              </tbody>
            </table>     
          </div>
          <!-- //sub_title -->
        </section>
        <section id="bar">
          <div class="bar_title">
            <div class="bar_title_bg">
              <!-- 백그라운드 이미지 -->
              <!-- Bar 이름 -->
              <h3>Velvet Veil Bar</h3>
              <h5 class="bar_kr">벨벳 베일 바</h5>
            </div>
            <table class="Bar">
              <tbody>
                <tr>
                  <th>운영시간</th>
                  <td colspan="2">
                    <div class="bar_time">
                      <div>
                        <p>
                          <b>일요일 ~ 목요일</b> 17:30 ~ 00:30 (Last order 12am)
                        </p>
                        <p>
                          <b>금요일 ~ 토요일</b> 17:30 ~ 01:30 (Last order 1am)
                        </p>
                        <p>
                          <b>연휴기간</b> 17:00 ~ 02:30 (Last order 2am)
                        </p>
                      </div>
                      <div>
                        <p><b>Velvet Veil은 오후 7시 이후 만 12세 이하 어린이의 출입을 제한 합니다.</b></p> 
                        <p>* Velvet Veil restricts entry to children under the age of 12 after 7 PM.</p>
                        <p><b>23:30 이후 주문은 오직 투숙객 한에서만 주문이 가능합니다.</b></p>
                        <p>* Order after 23:30 would be limited for people who stay our hotel.</p>
                      </div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <th>BAR 위치</th>
                  <td colspan="2">
                    <p>WEST TOWER 1F</p>
                  </td>
                </tr>
                <tr>
                  <th>문의처</th>
                  <td colspan="2">
                    <p>041-900-9980 (<b>내선 8110</b>)</p>
                  </td>
                </tr>
                <tr>
                  <th>칵테일 종류</th>
                  <td class="info2">
                    <h4>투숙객 이용 금액</h4>
                    <div>
                      <p><b>진</b></p>
                      <div>
                        <p><b>마티니</b>28,000￦</p>
                        <p><b>카지노</b>45,000￦</p>
                        <p><b>블루문</b>50,000￦</p>
                        <p><b>베스퍼</b>53,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>보드카</b></p>
                      <div>
                        <p><b>보드카 티니</b> 28,000￦</p>
                        <p><b>블랙 러시안</b> 28,000￦</p>
                        <p><b>블랙 마티니</b> 42,000￦</p>
                        <p><b>블랙 러시안</b> 47,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>위스키</b></p>
                      <div>
                        <p><b>티퍼러리</b> 59,000￦</p>
                        <p><b>탄산와리</b> 66,000￦</p>
                        <p><b>페니실린</b> 75,000￦</p>
                        <p><b>에그노그</b> 79,000￦</p>
                      </div>
                    </div>
                  </td>
                  <td class="info2">
                    <h4>일반인 이용 금액</h4>
                    <div>
                      <p><b>진</b></p>
                      <div>
                        <p><b>마티니</b>49,000￦</p>
                        <p><b>카지노</b>66,000￦</p>
                        <p><b>블루문</b>71,000￦</p>
                        <p><b>베스퍼</b>74,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>보드카</b></p>
                      <div>
                        <p><b>보드카 티니</b> 28,000￦</p>
                        <p><b>블랙 러시안</b> 28,000￦</p>
                        <p><b>블랙 마티니</b> 42,000￦</p>
                        <p><b>블랙 러시안</b> 47,000￦</p>
                      </div>
                    </div>
                    <div>
                      <p><b>위스키</b></p>
                      <div>
                        <p><b>티퍼러리</b> 59,000￦</p>
                        <p><b>탄산와리</b> 66,000￦</p>
                        <p><b>페니실린</b> 75,000￦</p>
                        <p><b>에그노그</b> 79,000￦</p>
                      </div>
                    </div>
                  </td>
              </tbody>
            </table>
          </div>
        </section>
        <section id="cafe">
          <div class="cafe_title">
            <div class="cafe_title_bg">
              <!-- 백그라운드 이미지 -->
              <!-- Bar 이름 -->
              <h3>Château Blanc Lounge</h3>
              <h5 class="cafe_kr">샤토 블랑 라운지</h5>
            </div>
            <table class="Cafe">
              <tbody>
                <tr>
                  <th>운영시간</th>
                  <td>
                    <p>
                      <b>일요일 ~ 목요일</b> 08:00 ~ 18:00 (Last order 17pm)
                    </p>
                    <p>
                      <b>금요일 ~ 토요일</b> 08:00 ~ 19:00 (Last order 18pm)
                    </p>
                    <p>
                      <b>연휴기간</b> 08:00 ~ 19:00 (Last order 18pm)
                    </p>
                  </td>
                </tr>
                <tr>
                  <th>CAFE 위치</th>
                  <td>
                    <p>EAST TOWER 1F</p>
                  </td>
                </tr>
                <tr>
                  <th>문의처</th>
                  <td>
                    <p>041-900-9973 (<b>내선 8107</b>)</p>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
        <section id="fitness">
          <div class="fitness_title">
            <div class="fitness_title_bg">
              <!-- 백그라운드 이미지 -->
              <!-- fitness 이름 -->
              <h3>Opulence Fitness</h3>
              <h5 class="fitness_kr">오풀런스 피티니스</h5>
            </div>
            <table class="Fitness">
              <tbody>
                <tr>
                  <th>운영시간</th>
                  <td>
                    <p>
                      <b>일요일 ~ 목요일</b> 05:30 ~ 22:30
                    </p>
                    <p>
                      <b>금요일 ~ 토요일</b> 05:00 ~ 23:30
                    </p>
                    <p>
                      <b>연휴기간</b> 08:00 ~ 19:00
                    </p>
                  </td>
                </tr>
                <tr>
                  <th>헬스장 위치</th>
                  <td>
                    <p>EAST TOWER 7F</p>
                  </td>
                </tr>
                <tr>
                  <th>문의처</th>
                  <td>
                    <p>041-900-9720 (<b>내선 8007</b>)</p>
                  </td>
                </tr>
                <tr>
                  <th>정기휴일</th>
                  <td>
                    <p>매월 세번째 수요일</p>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </section>
      </div>
      <!-- 부대시설 -->
        <!-- 스크롤바 -->
        <div id="fp-nav" class="fp-right fp-show-active">
          <ul>
              <li>
                  <a href="#restaurant" class="active">
                      <span class="fp-sr-only">레스토랑</span>
                      <span></span></a>
                  <div class="fp-tooltip fp-right">레스토랑</div>
              </li>
              <li>
                  <a href="#bar" class="">
                      <span class="fp-sr-only">주류점</span>
                      <span></span></a>
                  <div class="fp-tooltip fp-right">주류점</div>
              </li>
              <li>
                  <a href="#cafe" class="">
                      <span class="fp-sr-only">카 페</span>
                      <span></span></a>
                  <div class="fp-tooltip fp-right">카 페</div>
              </li>
              <li>
                  <a href="#fitness">
                      <span class="fp-sr-only">휘트니스</span>
                      <span></span></a>
                  <div class="fp-tooltip fp-right">휘트니스</div>
              </li>
              <li>
                  <a href="#footer">
                      <span class="fp-sr-only">footer</span>
                      <span></span></a>
              </li>
          </ul>
      </div>
    	<!-- 스크롤바 -->
		<!-- 푸터 끝 -->
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
	
	<script type="text/javascript">
		$(function() {
			const url = new URL(window.location);
			const urlPath = url.pathname;
			if (urlPath.includes('restaurant')) {
				const scrollTop = document.querySelector("#restaurant").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
				
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
			if (urlPath.includes('bar')) {
				const scrollTop = document.querySelector("#bar").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
				
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
			if (urlPath.includes('cafe')) {
				const scrollTop = document.querySelector("#cafe").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
	
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
			if (urlPath.includes('fitness')) {
				const scrollTop = document.querySelector("#fitness").offsetTop;
				const headerTop = document.querySelector("#header").offsetHeight;
	
				window.scrollTo({
					top : scrollTop - headerTop,
					behavior : 'smooth'
				});
			}
		});
	</script>
</body>
</html>