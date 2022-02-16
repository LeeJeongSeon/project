<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<style type="text/css">
        div span{
            display: table-cell;
            vertical-align: middle;
            text-align: center;           
        }
       
        #logo{
            position: absolute;
            top: 20px;
            left: 30px;
        }
        nav{
            position: absolute;
            bottom: 20px;
            left: 220px;
            font-size: 16px;
        }
        nav #bigMenu{
            display: inline-block;
            margin-left: 30px;
        }
        nav li a{color: black; font-size:14px; font-weight: 900; }
        nav li a:link{text-decoration: none;}
        nav li a:hover{
           transition: .4s;
           color: rgb(238, 119, 0);
           
        }
        nav li #memberintro:hover{ background-color: rgb(238, 119, 0); color: rgb(255, 255, 255); font-weight: 900;}
        .secondMenu{
            
            background: rgba(255, 255, 255, 0.692);
            width: 23%;
            
            /* display:none;  평상시에는 서브메뉴가 안보이게 하기 */
            padding: 0;
            margin: 0;
            border-top: 1.5px solid orange;
            
            margin-top: 2.5%;
            text-align: center;
            position: absolute;
            opacity: 0;
            visibility: hidden;
        }
        .secondMenu li{  display: block;}
        .secondMenu li a{ text-decoration: none;text-align: center;}
        nav li:hover .secondMenu{
            /* display: block; */
            opacity: 1;
            visibility: visible;
            z-index: 2;
            }
        nav ul li #allMenu:hover li .secondMenu{ opacity: 1; visibility: visible;}

        #HeaderSecondMenu a{
            background-color: null;
            opacity: 1.0; 
            color:white;
            border: 1px solid white;    
            width: 200px; 
        }
/* 큰 웹화면 삼선 스타일 */
        #topMenu {   
                height: 0px; 
                width: 60%;    
                position: relative;
                top: 95px;
              
        }
       
        #topMenu ul #mList {                      
                list-style: none;           
                color: black;    
                font-weight: 900;          
                background-color: rgba(255, 255, 255, 0.692);  
                float: left;               
                line-height: 30px;         
                vertical-align: middle;    
                text-align: center; 
                border-top: 1.5px solid orange;
                position: absolute;
                z-index: 2;
               

        }
        #topMenu .menuLink {                               
                text-decoration:none;                      
                color: rgb(85, 85, 85);  
                                        
                display: block;                           
                width: 150px;                              
                font-size: 12px;                           
                font-weight: bold;                         
                font-family: "Trebuchet MS", Dotum, Arial; 
                
        }
        #topMenu .menuLink:hover {            
            transition: .4s;
           color: rgb(238, 119, 0);
        }
        #sList{
            list-style: none;           
                float: left;               
                line-height: 30px;         
                vertical-align: middle;    
                text-align: center;   
                z-index: 2;
                
        }
        #sListUl{
            display: flex; flex-direction: column; padding-left: 0;
            border-right: 1px solid rgba(226, 226, 226, 0.767);
            z-index: 2;
            
        }
        #hoo:hover{
            background-color: black;
            
        }
        #allmenuList{
            margin-left: 5%;
            display: none;
        }

        
.body h3 {color:#232323; background:url('../imgs/stit_bullet.gif') 2px 10px no-repeat; padding-left:40px; padding-top:11px; padding-bottom:20px;}
.body h3 span {font-size:13px; color:#565656; padding-left:12px;}
.board-list{margin-top: 10px; margin-bottom: 20px;}
</style>
<script>
      
        $(document).ready(function(){
             $("#MallMenu").click(function(){
                if($("#hiddenList").css('display') !== 'none'){ //  if($("#hiddenList").is(":visible")){
                    $("#hiddenList").slideUp();  
                }else{
                    $("#hiddenList").slideDown();               
                }
                // $("#hiddenList").toggle(1000);  
            });

            $(".adidas").click(function(){
            if($("#allmenuList").css('display') !== 'none'){ //  if($("#hiddenList").is(":visible")){
                $("#allmenuList").slideUp();  
            }else{
                $("#allmenuList").slideDown();               
            }       
            });

        });

   </script>
</head> 
<!-- main menu -->
<nav id="topMenu" style="z-index: 2;" >
<!-- 햄버거바 메뉴영역 -->
        <ul id="allmenuList" style="z-index: 2;">
                <li id="mList" style="right:600px;">
                    <ul id="sListUl" >
                        <li id="sList" style="z-index: 2;"><a class="menuLink" href="${path}/book/list.do">도서목록</a></li>
                        <li id="sList"><a class="menuLink" href="${path}/book/popularity_list.do">도서목록 인기순</a></li>
                        <li id="sList"><a class="menuLink" href="${path}/book/book_recommend.do">도서추천</a></li>
                        <li id="sList"><a class="menuLink" href="${path}/HopeBook/list.do">희망도서 신청</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                    </ul>
                </li>
                <li id="mList" style="right:449px;">
                    <ul id="sListUl" >
                        <li id="sList"><a class="menuLink" href="${path}/event/list.do">목록</a></li>
                        <li id="sList"><a class="menuLink" href="${path}/event/write.do">신청</a></li>
                        <li id="sList"><a class="menuLink" href="#">행사 참여</a></li>
                        <li id="sList"><a class="menuLink" href="${path}/event/listAdmin.do">관리</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                    </ul>
                </li>
                <li id="mList" style="right:298px;">리뷰 게시판으로 이동
                    <ul id="sListUl" >
                        <li id="sList"><a class="menuLink" href="${path}/review/list.do">리뷰 게시판으로 이동</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        
                    </ul>
                </li>
                <li id="mList" style="right:147px;">쿠우쿠우창업
                    <ul id="sListUl" >
                        <li id="sList"><a class="menuLink" href="../soonhyeon/openstep.html">개설절차</a></li>
                        <li id="sList"><a class="menuLink" href="../soonhyeon/consultation.html">가맹상담신청</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                    </ul>
                </li>
                <li id="mList" style="right:-4px;">회원
                    <ul id="sListUl" style="border-right: 1px solid rgba(196, 194, 194, 0.767);">
                        <li id="sList"><a class="menuLink" href="${path}/member/login.do">로그인</a></li>
                        <li id="sList"><a class="menuLink" href="#">이벤트</a></li>
                        <li id="sList" style="z-index: 3;"><a class="menuLink" href="#">고객불편사항</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                    </ul>
                </li>
                <li id="mList" style="right:-4px;">회원
                    <ul id="sListUl" style="border-right: 1px solid rgba(196, 194, 194, 0.767);">
                        <li id="sList"><a class="menuLink" href="${path}/member/login.do">로그인</a></li>
                        <li id="sList"><a class="menuLink" href="#">이벤트</a></li>
                        <li id="sList" style="z-index: 3;"><a class="menuLink" href="#">고객불편사항</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                        <li id="sList"><a class="menuLink" href="">&nbsp;</a></li>
                    </ul>
                </li>
        </ul>
    </nav>
    
<!-- main menu영역-->
    <div  style="position: relative; width: 100%; height: 95px;"> 
        <div id="logo">
            <img id="logoimg" src="http://www.qooqoo.co.kr/eyoom/theme/company_e1/image/site_logo.png">
        </div>
        <nav id="menuBar" style=" width: 79%; margin-right: auto; margin-left: auto;"> <!--메뉴 리스트-->
            <ul style="margin-left: 5%;">
                <li id="bigMenu"><a href="${path}" style=" padding-bottom: 45px;">HOME</a></li>
                <li id="bigMenu"><a href="${path}/book/list.do" style=" padding-bottom: 45px;">도서목록</a>
                    <ul class="secondMenu">
                        <li style="margin-bottom: 10px;"><a href="${path}/book/list.do" style=" padding-right: 40px;">도서목록</a></li>
                        <li style="margin-bottom: 10px;"><a href="${path}/book/popularity_list.do" style=" padding-right: 40px;">도서목록 인기순</a></li>
                        <li style="margin-bottom: 10px;"><a href="${path}/book/book_recommend.do" style=" padding-right: 40px;">도서추천</a></li>
                        <li style="margin-bottom: 10px;"><a href="${path}/HopeBook/list.do" style=" padding-right: 40px;">희망도서신청</a></li>
                        <!-- <li><a href="">사회공헌활동</a></li> -->
                    </ul>
                </li>

                <li id="bigMenu"><a style="padding-bottom: 45px;">행사</a>
                    <ul class="secondMenu">
                        <li style="margin-bottom: 10px;"><a href="${path}/event/list.do" style=" padding-right: 40px;">목록</a></li>
                        <li style="margin-bottom: 10px;"><a href="${path}/event/write.do" style=" padding-right: 40px;">신청</a></li>
                        <li style="margin-bottom: 10px;"><a href="#" style=" padding-right: 40px;">행사 참여</a></li>
                        <li style="margin-bottom: 10px;"><a href="${path}/event/listAdmin.do" style=" padding-right: 40px;">관리</a></li>
                    </ul>
                </li>

                <li id="bigMenu"><a href="${path}/review/list.do" style=" padding-bottom: 45px;">리뷰</a>
                    <ul class="secondMenu">
                        <li style="margin-bottom: 10px;"><a href="${path}/review/list.do" style=" padding-right: 40px;">리뷰</a></li>
                    </ul>
                </li>
                <li id="bigMenu"><a href="../soonhyeon/openstep.html" style=" padding-bottom: 45px;">쿠우쿠우창업</a>
                    <ul class="secondMenu">
                        <li style="margin-bottom: 10px;"><a href="../soonhyeon/openstep.html" style=" padding-right: 40px;">개설절차</a></li>
                        <li style="margin-bottom: 10px;"><a href="../soonhyeon/consultation.html" style=" padding-right: 40px;">가맹상담신청</a></li>
                    </ul>
                </li>
                <li id="bigMenu"><a href="${path}/member/login.do" style=" padding-bottom: 45px;">member</a>
                    <ul class="secondMenu">
                        <li style="margin-bottom: 10px;"><a href="${path}/member/login.do""  style=" padding-right: 40px;">로그인</a></li>
                        <li style="margin-bottom: 10px;"><a href="../soonhyeon/eventnotice.html"  style=" padding-right: 40px;">member</a></li>
                        <li style="margin-bottom: 10px;"><a href="../chanwoo/customerComplaints.html"  style=" padding-right: 40px;">member</a></li>
                    </ul>
                </li>

                <li id="bigMenu" class="adidas"><a style="padding-bottom: 45px;"><img src="http://www.qooqoo.co.kr/eyoom/theme/company_e1/image/allmenu.png" style="cursor: pointer;" alt="삼선"></a>
                   
                </li>

                <li id="bigMenu"><a href="https://www.facebook.com/freshqooqoo/" target="_sub"><img src="http://www.qooqoo.co.kr/eyoom/theme/company_e1/image/top_ico_facebook.png" alt="f"></a></li>
                <li id="bigMenu"><a href="https://www.instagram.com/freshqooqoo/" target="_sub"><img src="http://www.qooqoo.co.kr/eyoom/theme/company_e1/image/top_ico_insta.png" alt="카메라"></a></li>
                <li id="bigMenu" style="color:rgb(255, 171, 88);"><div id="memberintro" onclick="location.href='../chanwoo/teamMemberIntro.html'" style="border: 1px solid rgb(255, 171, 88); font-size: 15px; display: inline; padding: 5px;font-weight: 900; cursor: pointer;">팀원 소개</div></li>
            </ul>
        </nav>
    </div>

    <ul id="hiddenList" class="example01" style="display: none; list-style:none;  padding-left:0px;">
        <li>
            <button class="btn btn-secondary" onclick="location.href='../index.html'" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 100%; background-color: white; color: rgb(91, 91, 91); font-weight: 600;">
              HOME
            </button>
        </li>
   
    </ul>

<div style="text-align: center;"> 
<a href="${path}">Home</a> |
<a href="${path}/book/list.do">책목록</a> | 
<a href="${path}/book/popularity_list.do">책목록(인기순)</a> | 
<c:if test="${sessionScope.userid eq 'admin'}">
 <a href="${path}/book/book_write.do">도서 추가</a> |
</c:if>
<a href="${path}/HopeBook/list.do">희망도서신청</a> |
<a href="${path}/book/book_recommend.do">도서추천</a> |
<a href="${path}/event/list.do">행사</a> | 
<a href="${path}/review/list.do">리뷰 게시판으로 이동</a> |

<c:if test="${adminCk == 1 }">                            
<a href="${path}/member/list.do">회원 리스트</a> | 
                          
</c:if> 
                           
<a href="${path}/notice_qna/list.do?category=notice">공지사항</a> |
<a href="${path}/notice_qna/list.do?category=qna">묻고답하기</a> |
<div style="text-align: right;">
  <c:choose>
   <c:when test="${sessionScope.userid == null}">
    <!-- 로그인 하지 않은 상태 -->
    <a href="${path}/member/write.do">회원가입</a> |
    <a href="${path}/member/login.do">로그인</a> |
   </c:when>
   <c:otherwise>
    <!-- 로그인한 상태 -->
    ${sessionScope.name}님이 로그인중입니다.
    <a href="${path}/member/view.do?userid=${sessionScope.userid}">회원정보</a> |
    <a href="${path}/member/logout.do">로그아웃</a>
   </c:otherwise>
  </c:choose>
 </div>
</div>
