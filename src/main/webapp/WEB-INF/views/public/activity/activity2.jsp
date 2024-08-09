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
	    <div id="activity_container2">
        <!--액티비티 서브공통-->
        <div class="activity_title2">
			  <!--local navigation bar-->
        </div>
            <div class="activity_info2" >
                <h2 style="font-size: 50px;"> 액티비티 이용 및 요금 안내</h2>
                <div class="fee_information-menu2">
                    <div class="title_tab2">
                        <div class="title_tab-horizontal">
                            <div class="tab-wrapper2">
                                <div style="border-right: 1px solid #f2f2f2;"><a href="#n" data-target="FEE"><span style="color: #000; font-size: 14px;">이용안내</span></a></div>
                                <div><a href="#n" data-target="RENTAL"><span style="color: #000; font-size: 14px;">렌탈요금</span></a></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="FEE" class="content FEE">
                    <div>
                        <ul class="info2-1">
                            <h3>입장안내</h3>
                            <br>
                            <li><p>티켓발권 및 입장안내</p></li>
                            <br>
                            <li><p>1. 오션어드벤처 및 사우나</p></li>
                            <li><p>락커 이용 : 락커수가 한정되어 있어 성수기 시즌 및 주말에 입장제한이 있을 수 있으니 이 점 양해 부탁드립니다.</p></li>
                            <li><p>코인 충전 : 코인충전은 선택사항이며, 결제 수단은 현금과 신용, 체크카드, 대명상품권으로 가능합니다.(Gift카드, 대명상품권 외 타사 상품권, 문화누리카드, 앱카드는 결제 불가)</p></li>
                            <li><p>오션어드벤처 내 모든 부대시설 및 식음업장 이용 시 신용, 체크카드, 삼성페이, LG페이로 바로 결제 가능합니다. (신용, 체크카드 및 휴대폰 소지자에한함)</p></li>
                            <li><p>입장 기준 : 대인 : 중학생 이상 / 소인 : 36개월 ~ 초등학생 / 영유아 : 36개월 미만</p></li>
                            <li><p>소인, 영유아 확인을 위하여 등본, 건강보험증 등의 증명서를 반드시 지참하여 주시기 바랍니다.</p></li>
                            <li><p>타월 이용 : 개인위생 및 락커 내부 환경 개선을 위하여 타월 유료화를 하고 있으니 오션어드벤처를 방문해주시는 고객님께서는 이점 양지하시어, 개인 타월을 지참해 주시기 바랍니다. (미 지참 시, 현장 대여 1장당 1,000원 발생)</p></li>
                            <li><p>할인 적용 : 중복 할인은 적용되지 않으며, 적용 가능한 할인율 중 최고의 할인율이 적용됩니다.</p></li>
                            <li><p>모든 할인권/모바일 바코드 소지자/이용권/입장 교환권은 매표소에서 티켓으로 구매 및 교환 후 입장 가능합니다.</p></li>
                            <li><p>실내, 실외 오션어드벤처 이용 시 수영모(또는 야구모자, 머리카락을 완전히 덮을 수 있는 것) 착용을 권장합니다. (썬캡, 수건 착용 불가능)</p></li>
                            <li><p>오션어드벤처 놀이기구 및 풀장 이용 시 안경 및 선글라스, 스노쿨링(숨대롱), 오리발 사용을 금지합니다. [분실 및 파손 시 배상불가, 스노쿨링(숨대롱)잠영 방지]</p></li>
                            <li><p>고객님들의 안전을 위해 안전검사 및 사용환경에 따라 규격화된 구명조끼를 사용하고 있습니다. 스포츠용 구명복 외 튜브 재질의 구명조끼는 이용에 제한됩니다.</p></li>
                            <li><p>(구명조끼 필수 착용 시설물 : 실내 레이지리버, 실외 토네이도풀, 실외 와일드 익스트림 리버)</p></li>
                            <li><p>다중 시설로서의 특성과 수질 유지, 화재 예방 및 쾌적한 환경 조성을 위하여 오션어드벤처 내 음식물과 박스, 버너, 돗자리 등 장비의 반입 및 사용은 금지됩니다.</p></li>
                            <li><p>반입금지 품목으로 인하여 부득이하게 입장 시 위험물품 및 음식물 검사를 실시하오니 이 점 양해 부탁드립니다.</p></li>
                            <li><p>반입 가능 : 플라스틱 병, 캔에 든 물 또는 음료, 유아를 위한 이유식, 환자를 위한 특별식, 껍질을 제거한 씨 없는 과일(단, 플라스틱 밀폐용기에 보관한 경우), 주류(성인 1명 당 맥주 355ml 2캔 허용)</p></li>
                            <li><p>반입 불가능 : 유리병, 돗자리, 유모차,캐리어, 카트, 바퀴달린 아이스박스, 과도, 주류(유리병에 든 소주, 와인 등), 빵, 김밥, 과자류 등 모든 음식물</p></li>
                            <li><p>반입이 금지된 음식물 또는 물품은 별도 보관소에 보관하며, 퇴장 시 찾아가실 수 있습니다.</p></li>
                            <li><p>사우나, 샤워실, 탈의실은 만 4세 이상의 남녀는 함께 입장할 수 없습니다.( 단, 상황에 따라 연령과 관계없이 남녀 동반입장이 제한될 수 있습니다.)</p></li>
                            <li><p>만 4세 미만일 경우라도 생년월일을 확인 할 수 있는 증빙서류를 지참하지 않은 경우에는 혼탕이 불가능합니다.</p></li>
                            <li><p>(현행 공중위생관리법 시행규칙에 따라 만 4세 이상의 남녀는 혼욕할 수 없도록 규정.)</p></li>
                        </ul>
                    </div>
                    <div>
                        <ul class="info2-2">
                            <h3>수영복 관련 주의사항</h3>
                            <li><p>오션어드벤처 이용 시 수영복 재질의 옷을 반드시 착용하셔야 합니다. (웨이크바지, 래쉬가드 등 수상스포츠 전문 웨어 착용 가능)</p></li>
                            <li><p>일반복(반팔, 반바지) 착용으로 풀장 이용은 가능하나 단, 바디슬라이드 이용시 시설물 이용이 제한됩니다.</p></li>
                            <li><p>수영복은 판매점에서 구매 가능합니다.(대여 불가)</p></li>
                            <li><p>주의! 시설 이용도중 개인물품(수영모자, 수경, 안경, 썬글라스 등) 분실의 우려가 있으니 관리를 철저히 해주시기 바랍니다. 분실 시 당사에서는 책임을 지지 않습니다.</p></li>
                            <li><p>타인에게 혐오감을 줄 만큼 과도한 문신이 있으신 분들은 이용에 제한될 수 있습니다.</p></li>
                            <li><p>문신을 가릴 수 있는 수영복을 착용하고 이용하시기 바랍니다. (단, 착용하시는 수영복 종류에 따라 슬라이드 이용에 제한될 수 있습니다.)</p></li>
                            <li><p>하이힐, 구두 등 안전사고를 유발할 수 있는 것은 착용을 금지합니다.</p></li>
                            <li><p>야외 온천탕 이용 시 복장은 풀에 입장하시는 것과 동일하게 적용되며, 탕 내에서는 구명조끼, 튜브 사용, 음식물 섭취를 금지하고 있습니다.</p></li>
                            <br>
                        </ul>
                    </div>
                    <div>
                        <ul class="info2-3">
                            <h3>참고사항</h3>
                            <li><p>우천 시에도 정상 영업을 합니다. (단, 낙뢰 시 일부 시설의 이용이 제한될 수 있습니다.)</p></li>
                            <li><p>오션어드벤처 내부에는 위생 문제 및 수용복 손상 방지를 위해 탈수기가 비치되어 있지 않습니다.</p></li>
                            <li><p>실내를 제외한 실외 시설은 온수 시설이 아니므로 이용 중 가까운 야외 온천탕을 이용하여 체온 유지를 하시기 바랍니다.</p></li>
                            <li><p>오션어드벤처 이용 문의 (컨텍센터) : 1588-4888</p></li>
                            <br><br>
                            <li><p>오션어드벤처 즐기기!</p></li>
                            <li><img src="./img/section2/activity2-1.png" width="1000px"></li>
                        </ul>
                    </div>
                    <div class="activity_fee2">
                        <h3>액티비티 입장요금</h3><br>
                            <table width="80%"  cellspacing="0" cellpadding="0">
                                    <colgroup>
                                        <col width="*">
                                        <col width="12%">
                                        <col width="16%">
                                        <col width="16%">
                                        <col width="">
                                        <col width="">
                                        <col width="">
                                        <col width="">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th colspan="2" rowspan="3" scope="col">구분</th>
                                            <th colspan="2" class="ocean " scope="colgroup">미들시즌</th>
                                            <th colspan="2" class="ocean " scope="colgroup">하이시즌1</th>
                                            <th colspan="2" class="ocean last" scope="colgroup">하이시즌2</th>
                                            </tr>
                                        <tr>
                                            <th colspan="2" scope="colgroup">04/27 ~ 06/21</th>
                                            <th colspan="2" scope="colgroup">06/22 ~ 07/05</th>
                                            <th colspan="2" scope="colgroup" class="last">007/06 ~ 07/26</th>
                                        </tr>
                                        <tr>
                                            <th scope="colgroup">주중</th>
                                            <th scope="colgroup">주말</th>
                                            <th scope="colgroup">주중</th>
                                            <th scope="colgroup">주말</th>
                                            <th scope="colgroup">주중</th>
                                            <th scope="colgroup" class="last">주말</th>
                                            </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th rowspan="2" scope="row">실내락커</th>
                                            <th scope="row">대인</th>
                                            <td>55,000원</td>
                                            <td>60,000원</td>
                                            <td>65,000원</td>
                                            <td>70,000원</td>
                                            <td>74,000원</td>
                                            <td class="last">79,000원</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">소인</th>
                                            <td>45,000원</td>
                                            <td>50,000원</td>
                                            <td>55,000원</td>
                                            <td>60,000원</td>
                                            <td>64,000원</td>
                                            <td class="last">69,000원</td>
                                        </tr>
                                        <tr>
                                            <th rowspan="2" scope="row">야외락커</th>
                                            <th scope="row">대인</th>
                                            <td>50,000원</td>
                                            <td>55,000원</td>
                                            <td>60,000원</td>
                                            <td>65,000원</td>
                                            <td>69,000원</td>
                                            <td class="last">74,000원</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">소인</th>
                                            <td>40,000원</td>
                                            <td>45,000원</td>
                                            <td>50,000원</td>
                                            <td>55,000원</td>
                                            <td>59,000원</td>
                                            <td class="last">64,000원</td>
                                        </tr>
                                    </tbody>
                                </table><br>
                                <ul class="listContent2">
                                    <li class="oceanColor">찜질방 미들시즌 이용객의 경우 찜질복 대여료 8,000원, 결제 후 이용가능</li>
                                    <li class="oceanColor">소인기준 : 36개월 ~ 초등학생/ 보호자 동반입장 必 나이확인이 가능한 신분 증빙 서류를 꼭 지참하셔야 합니다.</li>
                                    <li class="oceanColor">내장객 증감에 따른 야외락커 미 운영 될수 있습니다.</li>
                                </ul>
                    </div>
                </div>
                <div id="RENTAL" class="content RENTAL" style="display: none;">
                    <div>
                        <ul class="info2-1">
                            <h3 style="font-size: 18px">렌탈 이용안내</h3> 
                            <li><p>고객 여러분의 편리하고 즐거운 이용을 위하여 오션어드벤처에서는 다양한 품목을 렌탈해 드리고 있습니다.</li></p>
                            <li><p>오션어드벤처에서는 반드시 수영복 및 수영모를 착용하셔야 합니다</li></p>
                            <li><p>렌탈 품목 안내</li></p>
                            <li><p>구명조끼</li></p>
                            <li><p>썬베드</li></p>
                            <li><p>패밀리 썬베드</li></p>
                            <li><p>카바나</li></p>
                            <li><p>원형베드</li></p>
                            <li><p>워터글램핑</li></p>
                        </ul>
                    </div>
                    <div>
                        <ul class="info2-3">
                             <h3 style="font-size: 18px">렌탈요금 안내<span class="pl20">2024.04.27 ~ 2024.06.21</span></h3><br>
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="center">
                                     <colgroup>
                                        <col width="*">
                                        <col width="*">
                                        <col width="25%">
                                        <col width="25%">
                                    </colgroup>
                                        <tbody>
                                            <tr>
                                                <th scope="row">품목</th>
                                                <th scope="row">구분</th>
                                                <th scope="row">주중</th>
                                                <th scope="row" class="last">주말(공휴일)</th>
                                            </tr>
                                            <tr>
                                                <td>구명조끼</td>
                                                <td>대여료</td>
                                                <td colspan="2" class="last">7,000원</td>
                                            </tr>
                                            <tr>
                                                <td>어린이튜브</td>
                                                <td>대여료</td>
                                                <td colspan="2" class="last">3,000원</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">물품보관함</td>
                                                <td>대여료</td>
                                                <td colspan="2" class="last">3,000원</td>
                                            </tr>
                                            <tr>
                                                <td>보증금</td>
                                                <td colspan="2" class="last">5,000원</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">비치타올</td>
                                                <td>대여료</td>
                                                <td colspan="2" class="last">5,000원</td>
                                            </tr>
                                            <tr>
                                                <td>보증금</td>
                                                <td colspan="2" class="last">5,000원</td>
                                            </tr>
                                            <tr>
                                                <td>썬베드</td>
                                                <td>대여료</td>
                                                <td colspan="2" class="last">25,000원</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">패밀리썬베드</td>
                                                <td>대여료</td>
                                                <td>50,000원</td>
                                                <td class="last">70,000원</td>
                                            </tr>
                                            <tr>
                                                <td>오후권</td>
                                                <td>30,000원</td>
                                                <td class="last">40,000원</td>
                                            </tr>
                                            <tr>
                                                <td>원형베드</td>
                                                <td>대여료</td>
            
                                                <td>60,000원</td>
                                                <td class="last">80,000원</td>
                                            </tr>
                                            <tr>
                                                <td>프리미엄베드</td>
                                                <td>대여료</td>
            
                                                <td>65,000원</td>
                                                <td class="last">100,000원</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="3">카바나</td>
                                                <td>대여료</td>
            
                                                <td>70,000원</td>
                                                <td class="last">120,000원</td>
                                            </tr>
                                            <tr>
                                                <td>오후권</td>
            
                                                <td colspan="2" class="last">60,000원</td>
                                            </tr>
                                            <tr>
                                                <td>보증금</td>
                                                <td colspan="2" class="last">10,000원</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="3">워터글램핑</td>
                                                <td>대여료</td>
            
                                                <td>50,000원</td>
                                                <td class="last">80,000원</td>
                                            </tr>
                                            <tr>
                                                <td>오후권</td>
            
                                                <td colspan="2" class="last">60,000원</td>
                                            </tr>
                                            <tr>
                                                <td>보증금</td>
                                                <td colspan="2" class="last">10,000원</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                <ul class="list-style01">
                                    <li>야외카바나, 워터글램핑의 경우 실외존 운영시에만 운영됩니다.</li>
                                    <li>보증금이 포함된 대여물품은 대여소에 반납 시 반환 받을 수 있습니다.</li>
                                </ul>
                        </ul>
                    </div>
                    <div>
                        <ul class="info2-2">
                            <h3 style="font-size: 18px">실내 렌탈샵</h3><br>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="center">
                                    <colgroup>
                                        <col width="20%">
                                        <col width="">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row">위치</th>
                                            <td align="left" class="last">오션어드벤처 內 남자사우나 입구 좌측편</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">운영기간</th>
                                            <td align="left" class="last">시즌별 상이 (렌탈 요금 안내 참고)</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">대여품목</th>
                                            <td align="left" class="last">구명조끼 / 썬베드 / 패밀리썬베드 / 카바나 / 원형베드 / 워터글램핑 / 비치타월<br>* 수영물품 대여 불가(수영복, 수모, 수경 등)
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                        </ul>
                    </div><br>
                    <div>
                        <ul class="info2-4">
                            <h3 style="font-size: 18px">이용안내</h3>
                               <li><p>모든 렌탈 품목은 당일 선착순 현장 대여이며, 예약은 되지 않습니다.(입장객이 많을 경우 조기 마감될 수 있습니다.)</p></li> 
                               <li><p>보증금은 대여품 반납 시 환불해 드리며, 반드시 지정된 장소에서 반환하여 주시기 바랍니다.</p></li>                            
                               <li><p>코인 충전은 선택사항이며, 결제 수단은 현금과 신용, 체크카드, 대명상품권으로 가능합니다.(Gift카드, 대명상품권 외 타사 상품권, 문화누리카드, 앱카드는 결제 불가)</p></li>
                               <li><p>오션어드벤처 내 모든 부대시설 및 식음업장 이용 시 신용, 체크카드, 삼성페이, LG페이로 바로 결제 가능합니다. (신용, 체크카드 및 휴대폰 소지자에한함)</p></li> 
                               <li><p>수영용품은 판매점에서 구매 가능합니다.(대여 불가)</p></li>
                               <li><p>모든 렌탈 품목은 당일 선착순 현장 대여이며 예약은 되지 않습니다.</p></li>  
                            </ul>
                    </div>
                </div>
            </div>
    </div>
	</section>
	<jsp:include page="/WEB-INF/include/main_footer.jsp" />
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const tabs = document.querySelectorAll('.tab-wrapper2 div');
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