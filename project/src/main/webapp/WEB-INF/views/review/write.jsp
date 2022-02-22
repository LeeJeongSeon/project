<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 페이지</title>
<%@ include file="../include/header.jsp" %>


<!-- 파일 첨부 기능 추가 -->
<script src="${path}/include/common.js"></script>

<script src="${path}/ckeditor/ckeditor.js"></script>

<script>
$(function(){
	$("#btnSave").click(function(){
		var str="";
   		//uploadedList 영역에 클래스이름이 file인 히든타입의태그를 각각 반복
		$("#uploadedList .file").each(function(i){
			console.log(i);
			//hidden 태그 구성-
			str += "<input type='hidden' name='files["+i+"]'	value='"
	+ $(this).val()+"'>";
		});
		//폼에 hidden 태그들을 붙임
		$("#form1").append(str);
		document.form1.submit();
	});
	
	
  	//파일을 마우스로 드래그하여 업로드 영역에 올라갈때 파일이 열리는 기본 효과 막음
	$(".fileDrop").on("dragenter dragover",function(e){
		e.preventDefault();
	});
  
  	//마우스로 파일을 드롭할 때 파일이 열리는 기본 효과 막음
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
});
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
<h2>글쓰기</h2>


<form id="form1" name="form1" method="post" action="${path}/review/insert.do">
	
	<div>제목 <input name="review_title" id="review_title" size="80" placeholder="제목을 입력하세요"> </div>
	
	<hr>
	
	<div style="width:1260px;">
		내용 <textarea id="review_content" name="review_content" rows="3" cols="80" placeholder="내용을 입력하세요"></textarea>
	
	<script>
	// ckeditor 적용
	CKEDITOR.replace("review_content",{
	filebrowserUploadUrl: "${path}/imageUpload.do",
	height: "300px"
	});// ImageUploadController.java 에서 처리
	</script>
	
	</div>
	
	<hr>
	
	<!-- <div> 첨부파일을 등록하세요
		<div class="fileDrop"></div>
		<div id="uploadedList"></div>
	</div> -->
	
	<div style="width:1260px; text-align:center;">
		<button type="button" id="btnSave">완료</button>
	</div>
	
</form>


<%@ include file="../include/footer.jsp" %>

</body>
</html>


		
