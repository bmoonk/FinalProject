<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/assets/css/myPage.css">
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<body>
	<div id="container">
		<div id="sidebar">
			<div>
				<p style="font-weight: bold;font-size: 24px;">마이페이지</p>
			</div>
			<div id="myInfo">
				<div class="info" style="display: flex;flex-direction: column;">
					<div style="display: flex;margin: 0 auto; flex-direction: column;">
						<p style="font-size: 18px;color: white;margin: 5px;font-weight: bold;">${userInfo.user_nm }님</p>
						<div style="background-color: #3cb454;height: 24px;border-radius: 15px;"><p style="margin-bottom: 0px;color: white;text-align: center;font-weight: bold;">${userInfo.rank_name }</p></div>
					</div>
					<div id="info-1" style="display: flex;flex-direction: column;width: 90%;margin: 0 auto;margin-top: 20px;">
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">보유 마일리지</p><p style="font-size: 15px;color: white;font-weight: bold;">${userInfo.mbr_mileage }P</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">찜 목록</p><p style="font-size: 15px;color: white;font-weight: bold;">${wishCnt }개</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">장바구니</p><p style="font-size: 15px;color: white;font-weight: bold;">${cartCnt }개</p>
						</div>
					</div>
				</div>
			</div>
			<div id="category">
				<div class="categoryInfo">
					<p>쇼핑내역</p>
					<a href="/harubooks/myPage/orderList?status=order">주문/배송목록</a>
					<a href="/harubooks/myPage/orderList?status=complete" >구매확정목록</a>
					<a href="/harubooks/myPage/orderList?status=refund">환불내역</a>
					<a href="/wish/list" >찜 목록</a>
					<a href="/harubooks/myCart">장바구니 목록</a>
				</div>
				<div class="categoryInfo">
					<p>문의 내역</p>
					<a href="/inquiry/list" >1:1문의</a>
				</div>
				<div class="categoryInfo">
					<p>나의 정보</p>
					<a href="/mypage/agree" >내 정보 수정</a>
				</div>
			</div>
		</div>
		<div id="content">
			<div>
				<p style="font-size: 18px;font-weight: bold;">환불내역</p>
			</div>
			<div id="contentInfo">
				<div class="deliveryInfo" style="width: 24%;">
					<div>
						<p class="di-1">주문내역</p>
					</div>
					<div>
						<p class="di-2"><a href="/harubooks/myPage/orderList?status=order" style="color: #767676;">주문/배송안내</a></p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${preparedDelivery }</p>
					</div>
					<div>
						<p class="di-2">배송 준비중</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${DeliveringCnt }</p>
					</div>
					<div>
						<p class="di-2">배송중</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${finishDelivery }</p>
					</div>
					<div>
						<p class="di-2">배송완료</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%; border: none;">
					<div>
						<p class="di-1">${refundCnt }</p>
					</div>
					<div>
						<p class="di-2"><a href="/harubooks/myPage/orderList?status=refund">환불</a></p>
					</div>
				</div>
			</div>
			<div id="prodInfo" style="border: 1px solid #f7f7f7;background-color: #f7f7f7;height: 180px;border-radius: 10px;display: flex;align-items: center;">
				<div style="width: 90%;margin: 0 auto;">
					<p style="font-weight: bold;">환불 유의사항</p>
					<span>구매 확정일이 지난 이후에는 환불이 불가능합니다.</span><br>
					<span>환불 신청후 관리자 승인 이후에 환불이 진행됩니다</span><br>
					<span>환불처리는 은행에 따라 달라질 수 도있으며 보통 2~5일 정도 소요됩니다 (공휴일 주말 제외).</span><br>
					<span>e-Book구매 시 환불이 불가능합니다.</span><br>
				</div>
			</div>
			<div id="prodInfo">
				<div>
					<p style="font-size: 18px; font-weight: bold;">환불 신청/완료 목록</p>
				</div>
				<div id="completeDelivery">
					<div style="border-bottom:1px solid #d5d5d5; display: flex; flex-direction: column;">
						<p style="font-size: 16px; font-weight: bold; margin-right: 100px;"class="semi-title">배송상품</p>
					</div>
					<div id="printCompleteDelivery" style="display: flex;flex-direction: column;"></div>
				</div>
				<div id="printPaging" style="display: flex; align-items: center;margin-top: 20px;"></div>
			</div>
			
		</div>
	</div>
	<!--모달창 만들기-->
	<div id="modalWrap"style="display: none;">
		<div id="modalBody" >
			<div style="width: 100%;">
				<span id="closeBtn">&times;</span>
			</div>
			<div style=" width: 90%;margin: 0 auto;margin-top: 0px;">
				<form method="post" action="/harubooks/myPage/refundRegister?${_csrf.parameterName }=${_csrf.token}" enctype="multipart/form-data" id="refundForm">
					<div style='display: flex; flex-direction: column;'>
						<div style="display: flex;font-size: 24px;color: #5055b1;font-weight: bold;">
							<p>환불내역</p><p id="refundStatus" style="color: #3cb454;font-weight: bold;font-size: 14px;margin-bottom: 0px;"></p>
						</div>
						<div>
							<p class="modalText">주문번호</p>
							<div style="display: flex;flex-direction: column;">
								<input class="modalInput" type="text" id="refundOrderNo" value="" name="order_no" readonly>	
								<input class="modalInput" type="text" id="rr_ymd" value="" name="order_no" readonly style="border: none; margin-top: 20px;color: #5055b1;font-weight: bold;">	
							</div>
						</div>
						<div>
							<p class="modalText">사용자 아이디</p>
							<input class="modalInput" type="text" id="userId" value="<sec:authentication property='name'/>" name="ae_id" readonly>	
						</div>
						<div>
							<p class="modalText">책번호</p>
							<input class="modalInput" type="text" id="refundBookNo" value="" name="book_no" readonly>	
						</div>
						<div>
							<p class="modalText">환불계좌</p>
							<div>
								<input  class="modalInput" type="text" name="rr_bank" id="rr_bank" style="border-radius: 10px; font-size: 14px;color: #767676;" value="" readonly>
								<input class="modalInput" id="rr_actno" type="text" name="rr_actno" placeholder="계좌번호를 입력해주세요" style="font-size: 12px; border-radius: 10px;" value="" readonly>
							</div>
						</div>						
						<div>
							<p class="modalText">환불내용</p>
							<div style="width: 100%;height: 200px; border: 1px solid #d5d5d5;" id="rr_content">
								
							</div>	
						</div>
						<div>
							<p class="modalText">첨부이미지</p>
							<img src="" alt="" width="80px" height="80px" id="fileImg">
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	
	//  환불 대기/완료 리스트 출력하기
	let printCompleteDelivery = document.querySelector('#printCompleteDelivery');
	let printPaging = document.querySelector('#printPaging');
	let existCnt = 0;
	let page =1;
	
	function ajaxPaging(page){
		let xhr2 = new XMLHttpRequest();
		xhr2.open("get","/harubooks/myPage/refundList?page="+page,true);
		xhr2.onload = function(){
			if(xhr2.status == 200){
				var data2 = JSON.parse(xhr2.responseText);
				let code = "";
				if(data2.resultList == '' || data2.resultList == null){
					code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
					code += "<div class='bookInfo' style='width: 100%;font-size: 16px;font-weight: bold;'><p style='text-align: center;'>배송된 상품이 존재하지 않습니다</p></div>";
					code += "</div>";
				}else{
						for (let i = 0; i < data2.resultList.length; i++) {
							if(data2.resultList[i].ccg_b001 != "E북"){
								code += "<div style='width: 95%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
								code += "<div class='bookInfo' style='width: 30%;font-size: 14px;font-weight: bold;display:flex; flex-direction:column;'><p>[주문번호]</p><p style='color:#5055b1;'>" + data2.resultList[i].order_no + "</p></div>";
								code += "<div class='bookInfo' style='width: 90px;height: 90%;'><img style='width: 100%; height: 90%' alt='' src='" + data2.resultList[i].book_cover + "'></div>";
								code += "<div class='bookInfo' style='width: 55%;font-size: 14px;font-weight: bold;'><p>[" + data2.resultList[i].ccg_b001 + "] " + data2.resultList[i].book_title + "</p></div>";
								code += "<div class='bookInfo' style='width: 15%; font-size: 14px;'><p>" + data2.resultList[i].pl_cnt + "개</p></div>";
								code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;display:flex; flex-direction:column;'><p>[환불금액]</p><p>" + parseInt(data2.resultList[i].book_ntsl_amt * data2.resultList[i].pl_cnt).toLocaleString() + "원</p></div>";
								if(data2.resultList[i].pl_refund_yn == '환불대기'){
									code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;display:flex; flex-direction:column;'><p>[환불상태]</p><p style='font-size:14px;font-weight:bold;color:#3cb454;'>환불대기</p></div>";							
									code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><button class='refundCheckBtn' style='background:white;color:black;border-radius:10px;border:1px solid #5055b1;font-weight:bold;height:40px;color:#5055b1;'>환불내역</button></div>";
								}else{
									code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;display:flex; flex-direction:column;'><p>[환불상태]</p><p style='font-size:14px;font-weight:bold;color:#5055b1;'>환불완료</p></div>";							
									code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><button class='refundCheckBtn' style='background:white;color:black;border-radius:10px;border:1px solid #5055b1;font-weight:bold;height:40px;color:#5055b1;'>환불내역</button></div>";
								}	
								existCnt++;
							}
							code += "</div>";
							code2 = data2.pagingVO.pagingHtml;
						}
						if(existCnt == 0){
							code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
							code += "<div class='bookInfo' style='width: 100%;font-size: 16px;font-weight: bold;'><p style='text-align: center;'>환불 신청/완료 내역이 존재 하지않습니다.</p></div>";
							code += "</div>";
						}
				}
				printCompleteDelivery.innerHTML = code;
				printPaging.innerHTML = code2;
				// 환불내역버튼 클릭시 이벤트
				let refundCheckBtn = document.querySelectorAll(".refundCheckBtn");
				for(let j = 0; j < refundCheckBtn.length; j++){
					refundCheckBtn[j].addEventListener('click',function(){
						
						const modal = document.getElementById('modalWrap');
						const closeBtn = document.getElementById('closeBtn');
						let refundOrderNo = document.querySelector("#refundOrderNo");
						let refundBookNo = document.querySelector("#refundBookNo");
						let userId = document.querySelector("#userId");
						let xhr3 = new XMLHttpRequest();
						
						// 환불내역 버튼을 클릭했을때, 주문번호 아래에 있는 input type hidden요소의 값을 미리 셋팅하고 아래에서 가용할수있는 
						// 가용점을 부여
						refundOrderNo.value = data2.resultList[j].order_no;
						refundBookNo.value = data2.resultList[j].book_no;	
	
						xhr3.open("post","/harubooks/myPage/refundOne",true);
						xhr3.setRequestHeader("Content-Type","application/json;charset=utf-8");
						xhr3.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						let data = {
							"refundOrderNo" : refundOrderNo.value,
							"refundBookNo" : refundBookNo.value
						}
						xhr3.onreadystatechange = function(){
							if(xhr3.readyState == 4 && xhr3.status == 200){
								let res = JSON.parse(xhr3.responseText);
	
								document.querySelector('#refundStatus').innerText = "[상태]환불"+res.ccg_i001;
								document.querySelector('#rr_actno').value = res.rr_actno;
								document.querySelector('#rr_bank').value = res.rr_bank;
								document.querySelector('#rr_content').innerHTML = res.rr_content;
								document.querySelector('#rr_ymd').value = "[환불신청일]"+res.rr_ymd;
								document.querySelector('#fileImg').src = "/upload/images/"+res.fileName;
							}
						}
						xhr3.send(JSON.stringify(data));
	
						modal.style.display = 'block';	
							
						closeBtn.onclick = function() {
	  					modal.style.display = 'none';
						}
						window.onclick = function(event) {
	  						if (event.target == modal) {
	    						modal.style.display = "none";
	  						}
						}
	
					})
				}
				
				
			}
		}
		xhr2.send();
	}
	
	ajaxPaging(page);
	// 페이지 클릭시 이벤트
	printPaging.addEventListener('click',function(event){
		event.preventDefault();
		var pageNo = event.target.getAttribute("data-page");
		page = pageNo;
		ajaxPaging(page);
	})
	
</script>
