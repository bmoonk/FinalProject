<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper" style="padding: 10px;">
	<div class="row" style="padding: 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">도서 상세 정보</h4>
					<form action="" style="margin-top : -40px; margin-left : 15px;">
						<div class="row" style="padding-left : 30px; margin-top : 20px; margin-right : -7px; margin-bottom: 5px; float:right;">
							<input type="file" name="imgFile" id="imgFile" style="display:none" accept=".jpg,.png">
							<button type="button" class="btn btn-outline-primary btn-sm" id="imgPutBtn" style="border: 1px solid lightgray;">표지 수정</button>&nbsp;
							<button type="button" class="btn btn-outline-danger btn-sm" id="imgDelBtn" style="border: 1px solid lightgray;">표지 삭제</button>&nbsp;&nbsp;
						</div>
						<div class="table-responsive" style="overflow : hidden; width : 1100px; margin-left : -11px;">
							<table class="table" style="border : 1px solid #CED4DA;">
								<tbody>
									<tr>
										<th class="table-primary" style="width:10%; text-align : center;">ISBN</th>
										<td style="width:40%;"><input type="text" name="book_isbn" id="book_isbn" value="" style="width:100%;"></td>
										<th class="table-primary" style="width:10%; text-align : center;">유형</th>
										<td style="width:25%;"><input type="radio" class="ccg_b001" name="ccg_b001" id="ccg_b001_1" value="종이책"> 종이책&nbsp;&nbsp;&nbsp;<input type="radio" class="ccg_b001" name="ccg_b001" id="ccg_b001_2" value="E북"> E북</td>
										<td rowspan="4" style="width:15%; padding: 0px;">
											<img src="" name="book_cover" id="book_cover" style="width:108%; height:100%; border-radius: 0%; margin-top : -2px; margin-left : -13px;"><br>
										</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">도서번호</th>
										<td><input type="text" name="book_no" id="book_no" value="" style="width:100%;" readonly></td>
										<th class="table-primary" style="text-align : center;">분류</th>
										<td><input type="radio" class="ccg_b002" name="ccg_b002" id="ccg_b002_1" value="국내도서"> 국내도서&nbsp;&nbsp;&nbsp;<input type="radio" class="ccg_b002" name="ccg_b002" id="ccg_b002_2" value="해외도서"> 해외도서&nbsp;&nbsp;&nbsp;<input type="radio" class="ccg_b002" name="ccg_b002" id="ccg_b002_3" value="인터넷도서"> 인터넷도서</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">도서명</th>
										<td><input type="text" name="book_title" id="book_title" value="" style="width:100%;" readonly="readonly"></td>
										<th class="table-primary" style="text-align : center;">종류</th>
										<td>
											<select name="ccg_b003" id="ccg_b003" style="width:95%;">
												<option value="건강/스포츠">건강/스포츠</option>
												<option value="경제/경영">경제/경영</option>
												<option value="과학">과학</option>
												<option value="소설">소설</option>
												<option value="시/에세이">시/에세이</option>
												<option value="아동/청소년">아동/청소년</option>
												<option value="여행">여행</option>
												<option value="예술/건축">예술/건축</option>
												<option value="외국어">외국어</option>
												<option value="요리">요리</option>
												<option value="인문">인문</option>
												<option value="정치/사회">정치/사회</option>
												<option value="컴퓨터/IT">컴퓨터/IT</option>
											</select>
										</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">저자</th>
										<td><input type="text" name="book_author" id="book_author" value="" readonly="readonly" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">번역자</th>
										<td><input type="text" name="book_talt" id="book_talt" value="" style="width:95%;" readonly="readonly" ></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">출판사</th>
										<td><input type="text" name="pub_nm" id="pub_nm" value="" style="width:100%;" readonly="readonly"></td>
										<th class="table-primary" style="text-align : center;">페이지 수</th>
										<td colspan="2"><input type="text" name="book_page_cnt" id="book_page_cnt" value="" readonly="readonly" style="width:100%;"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">출간일</th>
										<td><input type="text" name="book_spmt_ymd" id="book_spmt_ymd" value="" style="width:100%;" readonly="readonly"></td>
										<th class="table-primary" style="text-align : center;">마일리지</th>
										<td colspan="2"><input type="number" name="book_mileage" id="book_mileage" value="" style="width:100%;" readonly="readonly"></td>
										
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">가격</th>
										<td><input type="number" name="book_amt" id="book_amt" value="" style="width:100%;" min="0"></td>
										<th class="table-primary" style="text-align : center;">할인율</th>
										<td colspan="2"><input type="number" name="book_discount" id="book_discount" value="" style="width:100%;" min="0"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">판매가격</th>
										<td><input type="text" name="book_ntsl_amt" id="book_ntsl_amt" value="" style="width:100%;" readonly="readonly"></td>
										<th class="table-primary" style="text-align : center;">마진율</th>
										<td colspan="2"><input type="number" name="book_margin" id="book_margin" value="" style="width:100%;" min="0"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">내용</th>
										<td colspan="5"><textarea rows="5" cols="125" name="book_content" id="book_content"></textarea></td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="padding-left : 30px; margin-top : 15px; margin-right : -20px; float:right;">
								<button type="button" class="btn btn-primary" id="putBtn" onclick="booksUpdate()">수정</button>&nbsp;&nbsp;
								<button type="button" class="btn btn-danger" id="delBtn" onclick="booksDelete()">삭제</button>&nbsp;&nbsp;
								<a href="/mng/books"><button type="button" class="btn btn-outline-primary" id="listBtn">목록</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var book_cover = document.querySelector("#book_cover");  // 도서 표지
var putBtn = document.querySelector("#putBtn");			 // 도서 정보 수정 버튼
var delBtn = document.querySelector("#delBtn");			 // 도서 정보 삭제 버튼
var imgPutBtn = document.querySelector("#imgPutBtn");	 // 도서 표지 수정 버튼
var imgDelBtn = document.querySelector("#imgDelBtn");	 // 도서 표지 삭제 버튼
var imgFile = document.querySelector("#imgFile");		 // 이미지 파일
var fileName;

// 도서 상세 정보
window.onload = function(){
	const url = document.location.href;
	const urlArr = url.split("/");
	const no = urlArr[urlArr.length-1];
	
	$.ajax({
		type : "get",
		url : "/mng/books/booksInfo/"+no,
		data : "",
		contentType : "application/json; charset=utf-8",
		success : function(result){
			console.log("result : " + result);
			console.log(JSON.stringify(result));
			$("#book_no").val(result.book_no);
			$("#book_title").val(result.book_title);
			$("#book_content").val(result.book_content);
			$("#book_cover").attr("src",result.book_cover);
			$("#book_spmt_ymd").val(result.book_spmt_ymd);
			$("#book_author").val(result.book_author);
			$("#pub_nm").val(result.pub_nm);
			$("#book_talt").val(result.book_talt);
			$("#book_margin").val(result.book_margin);
			$("#book_mileage").val(result.book_mileage);
			$('input:radio[name="ccg_b001"][value="'+ result.ccg_b001 +'"]').attr('checked', 'checked');
			$('input:radio[name="ccg_b002"][value="'+ result.ccg_b002 +'"]').attr('checked', 'checked');
			$("#ccg_b003").val(result.ccg_b003);
			$("#book_page_cnt").val(result.book_page_cnt);
			$("#book_amt").val(result.book_amt);
			$("#book_discount").val(result.book_discount);
			$("#book_ntsl_amt").val(result.book_ntsl_amt);
			$("#book_isbn").val(result.book_isbn);
		}
	});
}

// 도서 표지 수정
imgPutBtn.addEventListener("click", function(){
	imgFile.click();
});

// 프로필 이미지 선택
imgFile.addEventListener("change", function() {
	fileName = event.target.files[0];
	
	if(isImageFile(fileName)){
		var reader = new FileReader();
		reader.onload = function(e) {
			book_cover.src = e.target.result;
		}
		reader.readAsDataURL(fileName);
		console.log(imgFile);
		console.log(fileName);
		console.log(book_cover.src);
		console.log(book_cover);
		console.log(book_cover.src);
	} else {	// 이미지 파일을 선택하지 않음
		alert("이미지 파일을 선택해주세요!");
	}
});

// 이미지 파일인지 체크(확장자를 이용해서)
function isImageFile(file) {
	var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
	return ($.inArray(ext, ["jpg","jpeg","gif","png"]) === -1) ? false : true;
}

// 도서 표지 삭제
imgDelBtn.addEventListener("click", function(){
	book_cover.src = "/upload/images/noImage.jpg";
});

// 도서 정보 수정
putBtn.onclick = function () {
	console.log(book_no.innerHTML);
	let formData = new FormData();
	console.log(book_no.value);
	console.log(book_cover.src);
	console.log($('input[name=ccg_b001]:checked').val());
	
	if(parseInt($("#book_amt").val()) < 0 || $("#book_amt").val() == ""){
		Swal.fire("가격 정보가 맞지 않습니다.");
		return false;
	}
	
	if(parseInt($("#book_margin").val()) < 0 || $("#book_margin").val() == ""){
		Swal.fire("마일리지 정보가 맞지 않습니다.");
		return false;
	}
	
	
	let numericRegex = /^[0-9]+$/;
	if (!numericRegex.test($("#book_discount").val())) {
        // 입력값이 숫자로만 이루어져 있지 않으면 경고 메시지를 표시하고 처리를 중단합니다.
        Swal.fire({
          title: '숫자로만 입력해주세요',
          text: '할인율는 숫자로만 입력가능합니다.',
          icon: 'error',
          confirmButton: '확인',
          showCloseButton: true
        });
        return false;
      }
	
	
	
	if(parseInt($("#book_discount").val()) < 0 || $("#book_discount").val() == ""){
		Swal.fire("할인률 정보가 맞지 않습니다.");
		return false;
	}
	
	
	formData.append("book_no",book_no.value);
	formData.append("book_title",book_title.value);
	formData.append("book_content",book_content.value);
	formData.append("book_spmt_ymd",book_spmt_ymd.value);
	formData.append("book_author",book_author.value);
	formData.append("pub_nm",pub_nm.value);
	formData.append("book_talt",book_talt.value);
	formData.append("book_margin",book_margin.value);
	formData.append("book_mileage",book_mileage.value);
	formData.append("ccg_b001",$('input[name=ccg_b001]:checked').val());
	formData.append("ccg_b002",$('input[name=ccg_b002]:checked').val());
	formData.append("ccg_b003",ccg_b003.value);
	formData.append("book_page_cnt",book_page_cnt.value);
	formData.append("book_amt",book_amt.value);
	formData.append("book_discount",book_discount.value);
	formData.append("book_ntsl_amt",book_ntsl_amt.value);
	formData.append("book_isbn",book_isbn.value);
	console.log(imgFile.files[0]);
	if(imgFile.files[0] != undefined){
		if(book_cover.src != "/upload/images/noImage.jpg"){
			formData.append("book_file", imgFile.files[0]);
		} else {
			formData.append("book_file", "/upload/images/noImage.jpg");
		}
	} else {
		formData.append("book_cover", book_cover.src);
	}
	
	console.log( book_no.innerHTML, book_title.value,book_title.value, imgFile.files[0])
	$.ajax({
		type : "put",
		url : "/mng/books",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : formData,
		dataType : "text",
		processData : false,
		contentType : false,
		success : function(result){
			if(result == "fail"){
				alert("수정 실패! 다시 시도해주세요.");
			} else {
				alert("수정되었습니다.");
				location.href="/mng/books";
			}
		}
	});
}

// 도서 정보 삭제
function booksDelete() {
	var no = $("#book_no").val();
	$.ajax({
		type : "delete",
		url : "/mng/books/booksDelete/"+no,
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : "",
		success : function(result){
			if(result == "fail"){
				alert("삭제 실패! 다시 시도해주세요.");
			} else {
				alert("삭제되었습니다.");
				location.href="/mng/books";
			}
		}
	});
}
</script>