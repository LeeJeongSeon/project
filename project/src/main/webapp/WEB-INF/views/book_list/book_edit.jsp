<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../include/event.css">
<script src="${path}/include/common.js"></script>
<style>
input{
	width:500px;
	height:50px;
}
textarea{
	width:500px;
}
.fileDrop {
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}
</style>
<script type="text/javascript">
img_check=0;

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
			url: "${path}/uploadBook/uploadAjax",
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
				var html="<div><a href='"+fileInfo.getLink+"'>"+fileInfo.fileName+"</a>";
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
			url: "${path}/uploadBook/deleteFile",
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
	
	console.log("체크박스값:"+$("#book_ck").val());
	if($("#book_ck").val()==-1){
		$("#book_check").prop("checked", true);
	}
});
//도서 삭제
function book_delete() {
	if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/book/book_delete.do";;
		document.form1.submit();
	} 
	
}

//도서 수정
function book_update(){
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
	
	document.form1.action="${path}/book/book_update.do";
	document.form1.submit();
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>도서 수정페이지</h2>
<form name="form1" method="post" enctype="multipart/form-data">
<table style="text-align: center;">
 <tr>
  <td colspan="2"><input type="file" id="file" name="file" width="300px" height="300px"></td>
 </tr>
 <tr>
  <td colspan="2">${dto.book_img}</td>
 </tr>
 <tr>
  <td colspan="2"><div class="fileDrop"></div></td>
  </tr>
  <tr>
  <td colspan="2"><div class="uploadedList"></div></td>
    <tr>
     <td width="width:30%;">제목</td>
     <td><input name="book_name" id="book_name" value="${dto.book_name}"></td>
    </tr>
    <tr>
     <td>장르</td>
     <td><input name="book_genre" id="book_genre" value="${dto.book_genre}"></td>
    </tr>
    <tr>
     <td>저자</td>
     <td><input name="book_author" id="book_author" value="${dto.book_author}"></td>
    </tr>
     <tr>
     <td>출판사</td>
     <td><input name="book_publisher" id="book_publisher" value="${dto.book_publisher}"> </td>
    </tr>
    <tr>
     <td>내용</td>
     <td><textarea cols="300" name="book_content" id="book_content" >${dto.book_content}</textarea> </td>
    <tr>
     <td>대출가능여부</td>
     <td>
     <input type="checkbox" name="book_check" id="book_check" value="-1" style="width:20px;">분실시 체크
<%--      
	<c:choose>
     <c:when test="${dto.book_check==0}">
      대출가능
     </c:when>
     <c:otherwise>
      대출불가능 
     </c:otherwise>
     </c:choose> --%>
    </tr>
    <tr>
	<td><input type="hidden" id="book_ck" value="${dto.book_check}"></td>
    <td><input type="hidden" name="book_id" id="book_id" value="${dto.book_id}"></td>
    </tr>
    <tr>
    <td><input type="button" value="수정" onclick="book_update()"></td>
	<td><input type="button" value="삭제" onclick="book_delete()"></td>
    </tr>
</table>
</form>
</body>
</html>