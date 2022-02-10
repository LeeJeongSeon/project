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



<style>
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>

</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>글쓰기</h2>


<form id="form1" name="form1" method="post" action="${path}/review/insert.do">
	
	<div>제목 <input name="review_title" id="review_title" size="80" placeholder="제목을 입력하세요"> </div>
	
	<div style="width:800px;">
		내용 <textarea id="review_content" name="review_content" rows="3" cols="80" placeholder="내용을 입력하세요"></textarea>
	
	<script>
	// ckeditor 적용
	CKEDITOR.replace("content",{
		filebrowserUploadUrl: "${path}/imageUpload.do"
	});// ImageUploadController.java 에서 처리
	</script>
	
	</div>
	
	<div> 첨부파일을 등록하세요
		<div class="fileDrop"></div>
		<div id="uploadedList"></div>
	</div>
	
	<div style="width:700px; text-align:center;">
		<button type="button" id="btnSave">확인</button>
	</div>
	
</form>


</body>
</html>


		