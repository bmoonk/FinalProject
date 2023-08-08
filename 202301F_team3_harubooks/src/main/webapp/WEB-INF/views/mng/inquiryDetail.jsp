<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="content-wrapper" style="padding : 10px;">
	<div class="row" style=" padding : 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">문의 상세</h4>
					<div class="table-responsive pt-3">
						<table class="table table-bordered" style="font-size : 0.875rem;">
							<thead>
								<tr>
									<th class="table-primary" style="width:10%;">유형</th>
									<td id="ccg_i002"></td>
									<th class="table-primary" style="width:10%;">작성자</th>
									<td id="ae_id"></td>
									<th class="table-primary" style="width:10%;">작성일</th>
									<td id="inquiry_ymd"></td>
									<th class="table-primary" style="width:10%;">답변여부</th>
									<td id="ccg_i001"></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th class="table-primary" style="width:10%;">제목</th>
									<td colspan="7" id="inquiry_title"></td>
								</tr>
								<tr>
									<th class="table-primary" style="width:10%;">내용</th>
									<td colspan="7" style="height : 250px;" id="inquiry_content"></td>
								</tr>
								<tr>
									<th class="table-primary" style="width:10%;">첨부파일</th>
									<td colspan="7" id="fileDisp">첨부된 파일이 없습니다.</td>
								</tr>
							</tbody>
							<tfoot id="iTfoot">
							</tfoot>
						</table>
					</div>
					<div class="row" style="float: right; padding-right : 20px; margin-top : 20px; ">
						<a href="/mng/inquiry"><button type="button" class="btn btn-outline-primary" id="noticeBtn">목록</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
const url = document.location.href;
const urlArr = url.split("/");
const inq_no = urlArr[urlArr.length-1];

let ae_id = document.querySelector("#ae_id");
let inquiry_ymd = document.querySelector("#inquiry_ymd");
let ccg_i001 = document.querySelector("#ccg_i001");
let ccg_i002 = document.querySelector("#ccg_i002");
let inquiry_title = document.querySelector("#inquiry_title");
let inquiry_content = document.querySelector("#inquiry_content");
let fileDisp = document.querySelector("#fileDisp");

let iTfoot = document.querySelector("#iTfoot");

$(function(){
	// 문의 상세, 댓글리스트 조회
	fInquiryOne(inq_no);
	
});

function fInquiryOne(inq_no){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/mng/board/inquiry/" + inq_no, true);
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			let inqOne = JSON.parse(xhr.responseText);
			console.log(inqOne);
			ae_id.innerText = inqOne.ae_id;
			inquiry_ymd.innerText = inqOne.inquiry_ymd;
			ccg_i001.innerText = inqOne.ccg_i001;
			ccg_i002.innerText = inqOne.ccg_i002;
			inquiry_title.innerText = inqOne.inquiry_title;
			inquiry_content.innerText = inqOne.inquiry_content;
			// 첨부파일 위치
			if(inqOne.ua_no != "0"){
				fFileList(inqOne.ua_no);
			} 
			// 답글 
			let replyHtml = "";
			if(inqOne.inquiry_reply == "0"){
				replyHtml += `<tr><td colspan='8' style="text-align : center;">작성된 답글이 없습니다.</td></tr>`;
				replyHtml +=	`<tr>`;
				replyHtml +=	`	<th class="table-primary">답글</th>`;
				replyHtml +=	`	<td colspan="6">`;
				replyHtml +=	`		<textarea id="inq_rep" rows="5" cols="100"></textarea>`;
				replyHtml +=	`	</td>`;
				replyHtml +=	`	<td style="width: 5%;">`;
				replyHtml +=	`		<button type="button" class="btn btn-primary" id="repBtn">답글등록</button>`;
				replyHtml +=	`	</td>`;
				replyHtml +=	`</tr>`;
			} else {
				replyHtml += `<tr>`;
				replyHtml += 	`<th class ="table-primary">관리자</th>`;
				replyHtml += 	`<td colspan="7">\${inqOne.inquiry_reply}</td></tr>`;
			}	
			iTfoot.innerHTML = replyHtml;
		}
	}
	xhr.send();
}

function fFileList(ua_no){
	let xhr = new XMLHttpRequest();
	xhr.open("get", "/mng/board/notice/fileList/" + ua_no, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			fileDisp.innerHTML = "";
			let fileList = JSON.parse(xhr.responseText);
			for(let i=0; i<fileList.length; i++){
				let aTag = document.createElement("a");
				let imgTag = document.createElement("img");
				imgTag.setAttribute("alt", ua_no+"_"+i);
				imgTag.setAttribute("src", "/upload/images/" + fileList[i].ua_stre_nm);
				imgTag.setAttribute("style", "width:150px; height:150px; border-radius:0");
				aTag.href = "/upload/images/" + fileList[i].ua_stre_nm;	
				aTag.download = fileList[i].ua_nm;
				aTag.appendChild(imgTag);
				$("#fileDisp").append(aTag);
			}
		}
	}
	xhr.send();
}

$(document).on("click", "#repBtn", function(){ // on 이벤트로 변경
	inquiry_no = inq_no;
	inquiry_reply = $("#inq_rep").val();
	// 답글 작성 안했을 때
	if(inquiry_reply == null || inquiry_reply ==''){
		Swal.fire({
			title : '답글을 작성하세요.', 
			icon : 'error',
			confirmButtonText: '확인'
		});
		return false;
	}
	
	let data = {
		inquiry_no : inquiry_no, 
		inquiry_reply : inquiry_reply
	}

	let xhr = new XMLHttpRequest();
	xhr.open("post", "/mng/board/inquiry/rep", true);
	xhr.setRequestHeader("Content-Type","application/json; charset=UTF-8");
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
			let rslt = xhr.responseText;
			if(rslt == "success"){
				Swal.fire({
					title : '답글 작성 완료!', 
					icon : 'success',
					confirmButtonText: '확인',
					confirmButtonColor: '#3085d6',
				}).then(function (result) {
					if (result.isConfirmed) {
						// 확인 버튼을 클릭한 경우
						fInquiryOne(inq_no);
					} 
				});
			} else {
				Swal.fire({
					title : '답글 작성 실패!', 
					icon : 'error',
					confirmButtonText: '확인',
					confirmButtonColor: '#3085d6',
				}).then(function (result) {
					if (result.isConfirmed) {
						// 확인 버튼을 클릭한 경우
						history.back;
					} 
				});
			}
		}
	}
	xhr.send(JSON.stringify(data));

});


</script>