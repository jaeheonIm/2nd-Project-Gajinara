<%@page import="com.gaji.member.dao.MemberDAO"%>
<%@page import="com.gaji.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <link href="${pageContext.request.contextPath}/css/MemberCSS/findPwd.css" rel="stylesheet" type="text/css">
<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script>
$(function(){
	
	//아이디 유효성검사
    $("#id").on("input",function(){
         var regex = /^[a-z][a-z\d]{4,20}$/;
         var result = regex.exec($("#id").val());
        
        if(result != null){
           $(".id.regex").html("");  
        }else{
            $(".id.regex").html("올바른 아이디가 아닙니다");
            $(".id.regex").css("color","red");
        }
        
    })
	
    
	//전화번호 유효성검사
    $("#phone").on("input",function(){
         var regex = /^01\d\d{3,4}\d{4}$/;
         var result = regex.exec($("#phone").val());
        
        if(result != null){
           $(".phone.regex").html("");  
        }else{
            $(".phone.regex").html("올바른 번호가 아닙니다");
            $(".phone.regex").css("color","red");
        }
        
    })

	//email유효성 검사
    $("#email").on("input",function(){
         var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
         var result = regex.exec($("#email").val());
        
        if(result != null){
           $(".email.regex").html("");  
        }else{
            $(".email.regex").html("올바른 이메일이 아닙니다");
            $(".email.regex").css("color","red");
        }
    })
    
	//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
	$("#findpwd_submit").on("click",function(){
	   var id = $("#id").val();
	   var phone = $("#phone").val();
	   var email = $("#email").val();
	   
	   var idregex = /^[a-z][a-z\d]{4,20}$/;
	   var phoneregex = /^01\d\d{3,4}\d{4}$/;
	   var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
	   
	   var idregex = idregex.exec(id);
	   if(idregex == null){
		   alert("아이디양식을 다시 확인해주세요");
		   $("#id").focus();
		   return;
	   }
	   
	   var phoneregex = phoneregex.exec(phone);
	   if(phoneregex == null){
		   alert("핸드폰번호양식을 다시 확인해주세요");
		   $("#phone").focus();
		   return;
	   }
	   
	   var emailregex = emailregex.exec(email);
	   if(emailregex == null){
		   alert("이메일양식을 다시 확인해주세요");
		   $("#email").focus();
		   return;
	   }
	   
	 //빈칸 없을 때 제출.
	   $("#findpwdform").submit();
	
		})
	
})


</script>
<title>가지나라 - 회원 비밀 번호 찾기</title>
</head>
<body>
<div id ="container">
	<div class="logo">
		<a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
	</div>
	<form action="${pageContext.request.contextPath}/member/controller?type=findPwd" method="post" method="post" id="findpwdform">
		<div class="wrap">
			<div class="join-wrap">
				<div id="join_btn">
						<h3 class="title"> ▶ 아이디 </h3>
						<input type="text" id="id" name="id" maxlength="20" class="input-field" placeholder=" 아이디">
						<div class="id regex"></div>
				
						<h3 class="title"> ▶ 휴대 전화 </h3>
						<input type="text" id="phone" name="phone" maxlength="11" class="input-field" placeholder=" '-'제외 하고 입력">
						<div class="phone regex"></div>
						
						<h3 class="title"> ▶ Email </h3>
						<input type="text" id="email" name="email" maxlength="50" class="input-field" placeholder=" email">
						<div class="email regex"></div>
					</div>
					<div class="btn_findPwd">
						<input type="button" id="findpwd_submit" value="비밀 번호 찾기" >
					</div>
					<div class="btn_link">
						<ul class="findPwd_btn">
							<li>
								<a href="${pageContext.request.contextPath}/member/findId.jsp" class="findPwd_text">아이디 찾기</a>
							</li>
							<li class="bar">
								|
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/boardcontrol?type=start" class="findPwd_text">메인 페이지</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</div>
