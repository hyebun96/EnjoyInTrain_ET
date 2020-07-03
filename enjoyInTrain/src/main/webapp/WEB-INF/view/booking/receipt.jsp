<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/receipt.css" type="text/css">

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
 
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(function() {
	$("#showStatement").click(function() {
		$("form[name=showStatementForm]").each(function () {
			this.reset();
		});
		
		$("#statement_dialog").dialog({
			modal: true,
			height: 800,
			width: 700,
			title: '여행상품예약 명세서',
			clos : function (event, ui) {
			}
		})
		
	});
});

function requestPay(){
    var IMP = window.IMP; // 생략가능
    IMP.init('imp72612764'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    
    //결제 정보
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '프로모션예약',
        amount : "${dto.pmPrice+dto.prAddPrice}",
        buyer_email : '${dto.crewEmail}',
        buyer_name : '${dto.crewName}',
        buyer_tel : '${dto.crewTel}',
        buyer_addr : '경기도 광명시',
        buyer_postcode : '123-456'
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/booking/paymentSuccess", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                    imp_uid : rsp.imp_uid
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;
                    
                    alert(msg);
                } else {
                 
                }
            });
            //성공시 이동할 페이지
            location.href='<%=cp%>/booking/paymentSuccess?prSeq=${dto.prSeq}';
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            location.href="<%=cp%>/booking/receipt?prSeq=${dto.prSeq}";
            alert(msg);
        }
    });
}; 

</script>
	<!-- Banner -->
		<div id="banner">
			<div class="container">
			</div>
		</div>
	<!-- /Banner -->

	<!-- Main -->
		<div id="page">
				
			<!-- Main -->
			<div id="main" class="container">
				<div class="row">

					<div class="3u">
						<section class="sidebar">
							<header>
								<h2>Feugiat Tempus</h2>
							</header>
							<ul class="style1">
								<li><a href="#">Maecenas luctus lectus at sapien</a></li>
								<li><a href="#">Etiam rhoncus volutpat erat</a></li>
								<li><a href="#">Donec dictum metus in sapien</a></li>
								<li><a href="#">Nulla luctus eleifend purus</a></li>
								<li><a href="#">Maecenas luctus lectus at sapien</a></li>
							</ul>
						</section>
					</div>
				
					<div class="9u skel-cell-important">
					<form action="" name="reservationForm" >
						<div>
							<table class="receipt_header">
								<tr>
									<td class="receipt_state1">홈 > 기차 여행 패키지 > 예약하기 > 예약완료 ></td>
									<td class="receipt_logo"  rowspan="2"></td>
								</tr>
								<tr>
									<td class="receipt_title">예약완료</td>
								</tr>
								<tr>
									<td class="receipt_state2" colspan="2">①예약하기 ＞② 예약완료 ＞</td>
								</tr>
							</table>
						</div>
					
						<div>
							<table class="receipt_info">
								<tr><td class="receipt_info_title" colspan="6">■ 예약완료</td></tr>
								<tr>
									<td class="receipt_info_question">상품명</td>
									<td colspan="5" class="receipt_info_answer">${dto.pmTitle}</td>
								</tr>
								<tr>
									<td class="receipt_info_question">상품코드</td>
									<td class="receipt_info_answer">${dto.pmCode}</td>
									<td class="receipt_info_question">출발일자</td>
									<td class="receipt_info_answer">${dto.pmStartDate}</td>
									<td class="receipt_info_question">예약인원</td>
									<td class="receipt_info_answer">${dto.prPersonnel}</td>
								</tr>
							</table>
							
							<table class="receipt_report">
								<tr>
									<td class="receipt_report_num">순서</td>
									<td class="receipt_report_group">상품그룹</td>
									<td class="receipt_report_info" colspan="4">상품상세</td>
								</tr>
								<tr>
									<td class="receipt_report_num" rowspan="5">1</td>
									<td class="receipt_report_group" rowspan="5">가는열차</td>
									<td class="receipt_report_question">상품명</td>
									<td class="receipt_report_answer">${start.trainName} - ${dto.trainCode}</td>
									<td class="receipt_report_question">객실등급</td>
									<td class="receipt_report_answer">${dto.roomGrade}</td>
								</tr>
								<tr>
									<td class="receipt_report_question">이용기간</td>
									<td class="receipt_report_answer" colspan="3">${dto.pmStartDate}</td>

								</tr>

								<tr>
									<td class="receipt_report_question">출발역</td>
									<td class="receipt_report_answer">${dto.startStation}(${start.startTime})</td>
									<td class="receipt_report_question">도착역</td>
									<td class="receipt_report_answer">${dto.endStation}(${start.endTime})</td>
								</tr>
								<tr>
									<td class="receipt_report_question">이용인원</td>
									<td class="receipt_report_answer" colspan="3">
										성인 ${dto.adult}명 어린이  ${dto.child}명 경로  ${dto.oldMan}명
									</td>
								</tr>
								<tr>
									<td class="receipt_report_question">좌석선택</td>
									<td class="receipt_report_answer">E08</td>
								</tr>
								<tr>
									<td class="receipt_report_num" rowspan="3">2</td>
									<td class="receipt_report_group" rowspan="3"> ${dto.product}</td>
									<td class="receipt_report_question">상품명</td>
									<td class="receipt_report_answer" colspan="3">${dto.productContent}</td>
								</tr>
								<tr>
									<td class="receipt_report_question">이용기간</td>
									<td class="receipt_report_answer" colspan="3">${dto.pmStartDate}</td>
								</tr>
								<tr>
									<td class="receipt_report_question">이용인원</td>
									<td class="receipt_report_answer">${dto.prPersonnel}명</td>
									<td class="receipt_report_question">이용수량</td>
									<td class="receipt_report_answer">${dto.productUserCount}개 </td>
								</tr>
								<tr>
									<td class="receipt_report_num" rowspan="5">3</td>
									<td class="receipt_report_group" rowspan="5">오는열차</td>
									<td class="receipt_report_question">상품명</td>
									<td class="receipt_report_answer">${end.trainName} - ${dto.trainCode}</td>
									<td class="receipt_report_question">객실등급</td>
									<td class="receipt_report_answer">${dto.roomGrade1}</td>
								</tr>
								<tr>
									<td class="receipt_report_question">이용기간</td>
									<td class="receipt_report_answer" colspan="3">${dto.pmStartDate}</td>

								</tr>

								<tr>
									<td class="receipt_report_question">출발역</td>
									<td class="receipt_report_answer">${dto.endStation}(${end.startTime})</td>
									<td class="receipt_report_question">도착역</td>
									<td class="receipt_report_answer">${dto.startStation}(${end.endTime})</td>
								</tr>
								<tr>
									<td class="receipt_report_question">이용인원</td>
									<td class="receipt_report_answer" colspan="3">
										성인 ${dto.adult}명 어린이  ${dto.child}명 경로  ${dto.oldMan}명
									</td>
								</tr>
								<tr>
									<td class="receipt_report_question">좌석선택</td>
									<td class="receipt_report_answer" colspan="3">E08</td>
								</tr>
							</table>
						</div>
						<div><table class="receipt_cost"><tr><td>총 결제금액 : ${dto.pmPrice+dto.prAddPrice}원<td></tr></table></div>
						<div>
							<div class="traveler_title">■ 예약자 및 여행자 정보입력</div>
							<table class="travler_info">
								<tr>
									<td class="traveler_title_sub" colspan="4">▷ 예약자 정보</td>
								</tr>
								<tr>
									<td class="travler_info_question">예약자 이름</td>
									<td class="travler_info_name">${dto.crewName}</td>
									<td class="travler_info_question">이메일</td>
									<td class="travler_info_email">${dto.crewEmail}</td>
								</tr>
								<tr>
									<td class="travler_info_question">휴대전화</td>
									<td colspan="3" class="travler_info_tel">${dto.crewTel}</td>
								</tr>
							</table>
							<div>
								<table class="resetpayment">
									<tr>
										<td class="resetpayment_title" colspan="3"> ▷ 결제/취소 기한 </td>
									</tr>
									<tr>
										<td class="resetpayment_question">예약일일</td>
										<td class="resetpayment_answer">${dto.prReservationDate}</td>
										<td class="resetpayment_condition">2020-06-23 15:37 까지 결제하지 않으면 자동 취소됩니다.</td>
									</tr>
								</table>
								<div class="travler_button">
									<button type="button" id="showStatement">예약명세서</button>
									<button type="button" onclick="javascript:location.href='<%=cp%>/travel/main';">확인</button>
									<button type="button" onclick="requestPay()">결제하기</button>
								</div>
							</div>
						</div>	
					</form>
				</div>
					
				</div>
			</div>
			<!-- Main -->

		</div>
	<!-- /Main -->
	<div class="statement_dialog">
	<form action="showStatementForm">
		<table class="statement_table">
			<tr>
				<td class="statement_info_question" valign="top">To</td>
				<td class="statement_info_answer" valign="top">${dto.crewName} 고객님</td>
			</tr>
			<tr>
				<td class="statement_info_question" valign="top">From</td>
				<td class="statement_info_answer" valign="top">기차여행 홈페이지</td>
			</tr>
			<tr>
				<td class="statement_info_question" valign="top">콜센터 TEL</td>
				<td class="statement_info_answer" valign="top">0615254422</td>
			</tr>
			<tr>
				<td class="statement_info_question" valign="top">발행일자</td>
				<td class="statement_info_answer" valign="top">${dto.prReservationDate}</td>
			</tr>
			<tr>
				<td class="statement_info_question" valign="top">예약번호</td>
				<td class="statement_info_answer" valign="top">20200623803396</td>
			</tr>
			<tr>
				<td class="statement_info_question1" valign="top">상품평</td>
				<td class="statement_info_answer" valign="top">${dto.pmTitle}</td>
			</tr>
		</table>
		<table class="statement_report">
			<tr>
				<td class="statement_report_title">■ 예약내역</td>
			</tr>
			<tr>
				<td class="statement_report_date1">출발일자</td>
				<td class="statement_report_productName1">상품명</td>
				<td class="statement_report_productCount1">상품수량</td>
			</tr>
			<tr>
				<td rowspan="3" class="statement_report_date2">${dto.pmStartDate}</td>
				<td class="statement_report_productName2">${dto.startTrain}</td>
				<td class="statement_report_productCount2">${dto.prPersonnel}인</td>
			</tr>
			<tr>
				<td class="statement_report_productName2">${dto.product}</td>
				<td class="statement_report_productCount2">${dto.productUserCount}인</td>
			</tr>
			<tr>
				<td class="statement_report_productName2">${dto.endTrain}</td>
				<td class="statement_report_productCount2">${dto.prPersonnel}인</td>
			</tr>
			<tr>
				<td colspan="3" class="statement_report_cost1">총 결제금액</td>
			</tr>
			<tr>
				<td colspan="3" class="statement_report_cost2">${dto.pmPrice+dto.prAddPrice}원</td>
			</tr>
		</table>
		<table class="statement_notice">
			<tr>
				<td class="statement_notice_title">■ 예약내역</td>
			</tr>
			<tr>
				<td class="statement_notice_date1">결제기한</td>
				<td class="statement_notice_date2">2020-06-23 16:52(이후 자동 취소 됩니다.)</td>
			</tr>
		</table>
		<div>● 최소인원 미달, 천재지변 등에 의한 행사 취소 시에는 전액 환불됩니다.</div>
		<div>● 출발시간 내 미 도착 시 당일 취소로 간주합니다.</div>
	</form>
	</div>