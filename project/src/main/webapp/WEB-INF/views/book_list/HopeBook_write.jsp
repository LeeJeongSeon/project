<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="${path}/ckeditor/ckeditor.js"></script> 
<script src="${path}/include/common.js"></script>
<link rel="stylesheet" href="../include/event.css">
<style type="text/css">
button{
	width:100px;
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

<script>
book_check=0;
img_check=0;

function hopeBook_check(){
	var param="hopeBook_bookname="+$("#hopeBook_bookname").val()
	 +"&hopeBook_author="+$("#hopeBook_author").val();
	
	$.ajax({
		url: "${path}/HopeBook/hopeBook_check.do",
		type: "post",
		data: param,
		async: false, 
		success: function(check){
			if(check==1){
				alert("이미 있는 도서이기때문에 신청이 불가능합니다");
			}else{
				book_check=1;
			}
		}
	});
}

$(function(){
	console.log("이미지 카운트:"+img_check);
	
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
				html += "<input type='hidden' class='filename' name='filename' value='"+fileInfo.fullName+"'>";
				
				console.log("파일이름:"+data);
				console.log("파일이름:"+fileInfo.fullName)
				
				html+="<span data-src="+data+">[삭제]</span></div>";
				console.log("html:"+html);
				$(".uploadedList").append(html);
				img_check=1;	
				console.log("이미지 카운트:"+img_check);
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
					console.log("이미지 카운트:"+img_check);
				}
			}
		});
	});
	
	$("#btn").click(function(){		
		if($("#hopeBook_title").val()=="") {
			alert("게시물 제목을 입력해주세요.");
			$("#hopeBook_title").focus();	
		}
		if($("#hopeBook_bookname").val()=="") {
			alert("책 이름을 입력해주세요.");
			$("#hopeBook_bookname").focus();
			
		}
		if($("#hopeBook_author").val()=="") {
			alert("책 저자를 입력해주세요.");
			$("#hopeBook_author").focus();
			
		}
		/* if($("#hopeBook_content").val()=="") {
			alert("신청사유를 입력해주세요.");
			$("#hopeBook_content").focus();
		} */
		
		
		hopeBook_check();

		console.log("임시:"+book_check);
		if(book_check==1){
			document.form1.submit();
		}
		
		
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
<form id="form1" name="form1" method="post" action="${path}/HopeBook/insert.do">
<table>
<tr>
<td>제목</td>
<td><input name="hopeBook_title" id="hopeBook_title" size="80" placeholder="게시물 제목"></td>
</tr>
<tr>
<td>도서신청 제목</td>
<td><input name="hopeBook_bookname" id="hopeBook_bookname"></td>
</tr>
<tr>
<td>도서신청 저자</td>
<td><input name="hopeBook_author" id="hopeBook_author"></td>
</tr>
<tr>
<td>도서신청 사유</td>
<td><textarea rows="5" cols="60"  name="hopeBook_content" id="hopeBook_content"></textarea>
 <script>
 CKEDITOR.replace("hopeBook_content",{
	 filebrowserUploadUrl: "${path}/imageUpload.do"
 });
 </script>
</td>
</tr>
<tr>
<td>첨부파일등록</td>
<td><div class="fileDrop"></div></td>
</tr>
<tr>
<td colspan="2"><div class="uploadedList"></div></td>
</tr>
</table>
	<div style="width:700px; text-align:center;">
	<input type="hidden" name="hopeBook_userid" id="hopeBook_userid" value="${sessionScope.userid}"> 
	<button type="button" id="btn">글쓰기</button>
	</div>
</form>
</body>
<%@ include file="../include/footer.jsp" %>
</html>