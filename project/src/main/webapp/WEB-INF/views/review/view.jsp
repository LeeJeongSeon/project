<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
<%@ include file="../include/header.jsp" %>

<script src="${path}/include/common.js"></script>
<!-- ckeditor의 라이브러리 -->
<script src="${path}/ckeditor/ckeditor.js"></script>
<script>
$(function(){ //자동으로 실행되는 코드
	//댓글 목록 출력
	//listReply();
	listReply2();
	
	//댓글 쓰기
	$("#btnReply").click(function(){
		var review_replytext=$("#review_replytext").val(); //댓글 내용
		var review_bno="${dto.review_bno}"; //게시물 번호
		var param={ "review_replytext": review_replytext, "review_bno": review_bno};
		//var param="review_replytext="+review_replytext+"&review_bno="+review_bno;
		$.ajax({
			type: "post",
			url: "${path}/review_reply/insert.do",
			data: param,
			success: function(){
				alert("댓글이 등록되었습니다.");
				//listReply();
				listReply2(); //댓글 목록 출력
			}
		});
	});
	
	

	
	
	$(".fileDrop").on("dragenter dragover",function(e){
		//기본 효과 막음
		e.preventDefault();
	});
	$(".fileDrop").on("drop",function(e){
		e.preventDefault();
		//첫번째 첨부파일
		var files=e.originalEvent.dataTransfer.files;
		var file=files[0];
		//폼 데이터에 첨부파일 추가
		var formData=new FormData();
		formData.append("file",file);
		$.ajax({
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){
				//console.log(data);
				//data : 업로드한 파일 정보와 Http 상태 코드
				var fileInfo=getFileInfo(data);
				//console.log(fileInfo);
				var html="<a href='"+fileInfo.getLink+"'>"+
					fileInfo.fileName+"</a><br>";
				html += "<input type='hidden' class='file' value='"
					+fileInfo.fullName+"'>";
				$("#uploadedList").append(html);
			}
		});
	});
	
	

	//목록 버튼
	$("#btnList").click(function(){
		location.href="${path}/review/list.do";
	});
	//수정 버튼
	$("#btnUpdate").click(function(){
		//첨부파일 이름들을 폼에 추가
		var str="";
		$("#uploadedList .file").each(function(i){
			//#id이름(공백).클래스이름 : id가 uploadeList인 태그의 자식태그 중에서 class가 file인 태그들
			str+=
				"<input type='hidden' name='files["+i+"]' value='"
				+$(this).val()+"'>";
		});
		$("#form1").append(str);
		document.form1.action="${path}/review/update.do";
		document.form1.submit();
	});
	//삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="${path}/review/delete.do";
			document.form1.submit();
		}
	});
	
	
	
	
	listAttach();
	
	
	
	
	
	//첨부파일 삭제
	//id가 uploadedList인 태그의 class가 file_del인 태그 클릭
	$("#uploadedList").on("click",".file_del",function(e){
		var that=$(this); //클릭한 태그
		//data: {fileName: $(this).attr("data-src") },		
		$.ajax({
			type: "post",
			url: "${path}/upload/deleteFile",
			data: "fileName="+	$(this).attr("data-src"),		
			dataType: "text",
			success: function(result){
				if(result=="deleted"){
					//화면에서 태그 제거
					that.parent("div").remove();
				}
			}
		});
	});
	$("#btnSave").click(function(){
		var str="";
		// uploadedList 내부의 .file 태그 각각 반복
		$("#uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성
			str += 
			"<input type='hidden' name='files["+i+"]'	value='"
			+ $(this).val()+"'>";
		});
		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		document.form1.submit();
	});
	
});
//댓글 목록 출력 함수
function listReply(){
	$.ajax({
		type: "get",
		url: "${path}/review_reply/list.do?review_bno=${dto.review_bno}",
		success: function(result){
			//result : responseText 응답텍스트(html)
			$("#listReply").html(result);
		}
	});
}
//타임스탬프값(숫자형)을 문자열 형식으로 변환
function changeDate(date){
	date = new Date(parseInt(date));
	year=date.getFullYear();
	month=date.getMonth();
	day=date.getDate();
	hour=date.getHours();
	minute=date.getMinutes();
	second=date.getSeconds();
	strDate = 
		year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return strDate;
}


function listReply2(){
	$.ajax({
		type: "get",
		contentType: "application/json",
		
		url: "${path}/review_reply/list_json.do?review_bno=${dto.review_bno}",
						
		success: function(result){
			//view를 만들지 않는 대신에 자바스크립트로 table등을 만들어야 한다.
			console.log(result);
			var output="<table>";
			for(var i in result){
				var repl=result[i].review_replytext;
				// /정규식/(규칙) => 정규표현식
				// 규칙 g: global 전역검색, i: 대소문자 무시
				// ex) /java/gi => JAVA 또는 java를 모두 찾음
				repl = repl.replace(/  /gi,"&nbsp;&nbsp;");//공백처리
				repl = repl.replace(/</gi,"&lt;"); //태그문자 처리
				repl = repl.replace(/>/gi,"&gt;");
				repl = repl.replace(/\n/gi,"<br>"); //줄바꿈 처리
				
				output += "<tr><td>"+result[i].review_replyer;
				date = changeDate(result[i].review_regdate);
				output += "("+date+")";
				output += "<br>"+repl+"</td></tr>";
			}
			output+="</table>";
			$("#listReply").html(output);
		}
	});
}



//첨부파일 리스트를 출력하는 함수
function listAttach(){
	$.ajax({
		type: "post",
		url: "${path}/review/getAttach/${dto.review_bno}",
		success: function(list){
			// Controller에서 List<String>타입으로 넘어온 값을 처리하기 위해 json으로 처리
			// list : json
			//console.log(list);
			$(list).each(function(){
				var fileInfo=getFileInfo(this);
				//console.log(fileInfo);
				var html="<div><a href='"+fileInfo.getLink+"'>"
					+fileInfo.fileName+"</a>&nbsp;&nbsp;";
				<c:if test="${sessionScope.userid == dto.review_writer}">	
					html+="<a href='#' class='file_del' data-src='"
						+this+"'>[삭제]</a></div>";
				</c:if>
				$("#uploadedList").append(html);
			});
		}
	});
}

</script>
<style type="text/css">
@charset "UTF-8";

body {
	color: #444; 
	width: 1260px;
	margin-left: 5px;
}


@media screen and (min-width: 1270px) {
	body {
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
	}
}

fieldset {
	margin: 10px 20px 10px 20px;
	border: 2px solid #666;
	padding-right: 40px; 
	vertical-align: middle;
}

table {
	background-color: #fff;
	width: 100%;
	border-top: 1px solid #aaa;
	border-bottom: 1px solid #aaa;
	text-align: center;
}

th, td {
	padding: 1px 2px;
}

.tb1_col1 {
	width: 280px;
}

.tb1_col2 {
	width: 260px;
}

.tb1_col3 {
	width: 258px;
}

.tb1_col4 {
	width: 86px;
}

.tb1_col5 {
	width: 86px;
}

.tb1_col6 {
	width: 176px;
}

.tb1_col7 {
	width: 60px;
}

.tb2 td {
	padding: 10px;
}

#table {
	background-color: #fff2e6;
	border-radius: 30px;
	padding: 2% 2% 3% 2%;
	margin-top: 30px;
	margin-bottom: 30px;
}

select {
	margin-left: 30px;
	width: 60px;
	height: 25px;
}

</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시물 보기</h2>

 <form id="form1" name="form1" method="post" action="${path}/review/insert.do">
	<div>제목 <input name="review_title" id="review_title" size="80" value="${dto.review_title}" placeholder="제목을 입력하세요"></div>
	<div>조회수 : ${dto.review_viewcnt}	</div>
	
	<hr>
	
	<div id="main_text" style="width:1260px;" align="center">
	 <textarea id="review_content" name="review_content" rows="3" cols="80" placeholder="내용을 입력하세요">${dto.review_content}</textarea>
	<script>
	// ckeditor 적용
	CKEDITOR.replace("review_content",{
	filebrowserUploadUrl: "${path}/imageUpload.do",
	height: "300px"
	});
	</script>
	</div>
	
	<!-- <div> 
		첨부파일을 등록하세요
		<div class="fileDrop"></div>
		<div id="uploadedList"></div>
	</div> -->
	
	<hr>
	<div style="width:1260px; text-align:center;" align="center">
	<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->	
		<input type="hidden" name="review_bno" value="${dto.review_bno}">
		<!-- 본인만 수정,삭제 버튼 표시 -->
		<c:if test="${sessionScope.userid == dto.review_writer}">
			<button type="button" id="btnUpdate">수정</button>
			<button type="button" id="btnDelete">삭제</button>
		</c:if>
		
		<button type="button" id="btnList">목록</button>
	</div>
	<hr>
</form>




<!-- 댓글 작성 -->
<div style="width:1260px; text-align:center;" align="center">
	 <c:if test="${sessionScope.userid != null }">
	 	<textarea rows="5" cols="80" id="review_replytext" placeholder="댓글을 작성하세요"></textarea>
	 	<br>
	 	<button type="button" id="btnReply">댓글쓰기</button>
	 </c:if>
</div>


<!-- 댓글 목록 -->
<div id="listReply"></div>

<%@ include file="../include/footer.jsp" %>

</body>
</html>


