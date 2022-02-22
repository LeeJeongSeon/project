<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
</style>
<script>
img_check=0;

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
	//드래그알때 기본효과를 막음
	//dragenter: 마우스가 대상 객체의 위로 처음 진입할 때,
	//dragover: 드래그하면서 마우스가 대상 객체의 위에 자리 잡고 있을 때
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();//기본 효과를 막음
	});
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();//기본 효과를 막음
		//첨부파일 배열(여러개를 동시에 선택해서 드래그 할 수도 있기 때문에 배열처리 )
		var files=event.originalEvent.dataTransfer.files;
		var file=files[0]; //첫번째 첨부파일
		//FormData()는 Ajax방식의 파일업로드의 핵심 객체로 form태그와 같은 역할을 함
		var formData=new FormData();
		formData.append("file", file);//폼에 file변수 추가
		
		//서버에 파일 업로드(백그라운드에서 실행)
		if(img_check==0){
		$.ajax({
			type: "post",
			url: "${path}/book/uploadAjax",
			data: formData,
			dataType: "text",
			processData: false,//파일전송시 자동으로 쿼리스트링형식으로 전송되지 않도록 막는 처리
			contentType: false, //multipart/form-data로 처리되는것과 같음
			success: function(data,status,req){
				console.log("data:"+data); //업로드된 파일 이름
				console.log("status:"+status);//성공,실패 여부
				console.log("req:"+req.status);//요청코드값
				
				var fileInfo=getFileInfo(data);
				//console.log(fileInfo);
				var html="<a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a><br>";
				html += "<input type='hidden' class='book_img' name='book_img' value='"+fileInfo.fullName+"'>";
				
				console.log("파일이름:"+data);
				console.log("파일이름:"+fileInfo.fullName)
				
				html+="<span data-src="+data+">[삭제]</span></div>";
				$(".uploadedList").append(html);
				img_check=1;
			}
		});
		}else{
			alert("이미 이미지가 업로드 되었습니다.");
		}
		
	});//end $(".fileDrop")
	
	//첨부파일 삭제 함수
	$(".uploadedList").on("click","span", function(event){//내부적으로 span태그가 클릭되면 삭제
		var that=$(this);//this는 현재 클릭한 태그, 즉 span태그
		$.ajax({
			url: "${path}/book/deleteFile",
			type: "post",
			data: {fileName: $(this).attr("data-src")},
			dataType: "text",
			success: function(result){
				if(result=="deleted"){
					that.parent("div").remove();//파일삭제되면 행전체<div>를 삭제 처리
					//that은 span태그를 의미하는데 그 부모인 div태그를 지운다는 뜻
					img_check=0;
				}
			}
		});
	});
	
	$("#btnSave").click(function(){
		var book_name=$("#book_name").val();
		var book_genre=$("#book_genre").val();
		var book_content=$("#book_content").val();
		var book_publisher=$("#book_publisher").val();
		var book_author=$("#book_author").val();

		if(book_name==""){
			alert("도서이름 입력하세요");
			$("#book_name").focus();
			return;
		}
		if(book_genre==""){
			alert("도서장르를 입력하세요");
			$("#book_genre").focus();
			return;
		}
		if(book_content==""){
			alert("도서내용을 입력하세요");
			$("#book_content").focus();
			return;
		}
		if(book_publisher==""){
			alert("도서출판사를 입력하세요");
			$("#book_publisher").focus();
			return;
		}
		if(book_author==""){
			alert("작가를 입력하세요");
			$("#book_author").focus();
			return;
		}
		
		document.form1.submit();
	});
	
});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>

<h2>도서추가 </h2>
<form method="post" name="form1" action="${path}/book/book_insert.do" enctype="multipart/form-data">
	<table style="width:100%; text-align: center;">
		<tr>
			<th>도서명</th>
			<td colspan="3"><input name="book_name" id="book_name"></td>
		</tr>
		<tr>
			<th>도서이미지</th>
			<td><input type="file" id="file" name="file"></td>
		</tr>
		<tr>
			<td colspan="4"><div class="fileDrop"></div></td>
		</tr>
		<tr>
			<td colspan="4"><div class="uploadedList"></div></td>
		</tr>
		<tr>
			<th>장르</th>
			<td colspan="3"><input name="book_genre" id="book_genre"></td>
		</tr>
		<tr>
			<th>설명</th>
			<td colspan="3"><input name="book_content" id="book_content"></td>
		</tr>
		<tr>
			<th>출판사</th>
			<td colspan="3"><input name="book_publisher" id="book_publisher"></td>
		</tr>
		<tr>
			<th>지은이</th>
			<td colspan="3"><input name="book_author" id="book_author"></td>
		</tr>
	</table>
	<button type="button" id="btnSave">확인</button>
</form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>