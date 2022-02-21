<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
<script src="${path}/ckeditor/ckeditor.js"></script>
<style type="text/css">
.button{
	width:100px;
	height:40px;
}
input{
	margin-top:5px;
}
.fileDrop {
	width: 600px;
	height: 100px;
	border: 1px dotted gray;
	background-color: gray;
}
</style>
<script type="text/javascript">
function checkImageType(fileName){
	var pattern=/jpg|png|gif/i; //정규표현식(i는 대소문자 무시)
	return fileName.match(pattern);// 규칙에 맞으면 true가 리턴
}
function getOriginalName(fileName){
	if(checkImageType(fileName)){//이미지 파일이면 skip
		return;
	}
	var idx=fileName.indexOf("_")+1;//uuid를 제외한 파일이름만 뽑음
	return fileName.substr(idx);
}
function getImageLink(fileName){
	if(!checkImageType(fileName)){//이미지 파일이 아니면 skip
		return;
	}
	var front=fileName.substr(0,12);//(0~11번째까지 자르고)
	var end=fileName.substr(14);//14번째 문자열 앞의 s_제거
	return front+end;
}
function getFileInfo(fullName){
	var fileName, imgsrc, getLink, fileLink;
	if(checkImageType(fullName)){ //이미지 파일인 경우
		imgsrc="/project/book/displayFile?fileName="
			+fullName;
		fileLink=fullName.substr(14); //14 인덱스~끝
		var front=fullName.substr(0,12); //0~11
		var end=fullName.substr(14);
		getLink="/project/book/displayFile?fileName="+front+end;
	}else{ //이미지가 아닌 경우
		fileLink=fullName.substr(12);
		getLink="/project/book/displayFile?fileName="+fullName;
	}
	// uuid_filename (+1은 _ 다음의 filename을 뽑아냄)
	fileName=fileLink.substr(fileLink.indexOf("_")+1);
	//json 리턴
	return {fileName: fileName, imgsrc: imgsrc,
			getLink: getLink, fullName:fullName };
}
$(function(){ 

	//파일을 마우스로 드래그해서 업로드 영역에 올라갈때 파일이 열리는 기본효과를 막는 처리
	$(".fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	$(".fileDrop").on("drop", function(e){
		e.preventDefault();
		//첫번째 첨부파일
		var files=e.originalEvent.dataTransfer.files;
		var file=files[0];
		//폼 데이터에 첨부파일 추가
		var formData=new FormData();
		formData.append("file", file);
		$.ajax({
			url: "${path}/upload/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "post",
			success: function(data){
				//data: 업로드한 파일 정보와 Http 상태 코드
				var fileInfo=getFileInfo(data);
			 var html="<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
			 html += "<input type='hidden' class='file' value='"
			 +fileInfo.fullName+"'>";
			 $("#uploadedList").append(html);
			}
		});
	});
	
	$("#replaybtn").click(function(){
		var str="";
		//
		$("#uploadedList .file").each(function(i){
			str += "<input type='hidden' name='files["+i+"]'	value='"+$(this).val()+"'>";
		});
		$("#form1").append(str);
		
		document.form1.submit();
	})
});

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>답변쓰기</h2>
<form name="form1" method="post" action="${path}/HopeBook/insertReply.do">
<table style="border: 1px solid; width: 100%;">
 <tr>
  <td>관리자</td>
  <td><input name="hopeBook_userid" id="hopeBook_userid" value="${dto.hopeBook_userid}"> </td>
 </tr>
 <tr>
  <td>제목</td>
  <td><input name="hopeBook_title" id="hopeBook_title" value="Re: ${dto.hopeBook_title}" size="60"> </td>
 </tr>
 <tr>
    <td>신청도서 제목</td>
    <td><input id="hopeBook_bookname" name="hopeBook_bookname" class="input" value="${dto.hopeBook_bookname}"></td>
 </tr>
 <tr>
   <td>신청도서 저자</td>
   <td><input id="hopeBook_author" name="hopeBook_author" class="input" value="${dto.hopeBook_author}"></td>
  </tr>
 <tr>
 <tr>
  <td>본문</td>
  <td><textarea rows="5" cols="60" name="hopeBook_content" id="hopeBook_content">
  <br>${dto.hopeBook_content}<br> 
  ===게시물의 내용=== <br>
  ${dto.name}님 <br> 
  </textarea> 
   <script>
 CKEDITOR.replace("hopeBook_content",{
	 filebrowserUploadUrl: "${path}/imageUpload.do"
 });
 </script>
  </td>
 </tr>
<!--  <tr>
<td>첨부파일등록<div id="uploadedList"></div></td>
<td><div class="fileDrop"></div></td>
</tr> -->
 <tr>
  <td colspan="2" align="center">
	<input type="hidden" name="ref" id="ref" value="${dto.ref}">
   <input type="hidden" name="re_step" id="re_step" value="${dto.re_step}">
   <input type="hidden" name="re_level" id="re_level" value="${dto.re_level}">
   <input type="hidden" name="hopeBook_id" id="hopeBook_id" value="${dto.hopeBook_id}">
   <input type="button" value="답변달기" class="button" id="replaybtn">
 </tr>
</table>
<%@ include file="../include/footer.jsp" %>
</form>
</body>
</html>