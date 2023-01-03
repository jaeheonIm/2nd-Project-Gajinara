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
    <link href="${pageContext.request.contextPath}/css/MemberCSS/delete.css" rel="stylesheet" type="text/css">
<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script>

$(function(){

	//비밀번호 유효성검사
	$("#pwd").on("input",function(){
	    var regex = /^[a-zA-Z0-9!@#$%^&*()?_~.]{8,20}$/;
	    var result = regex.exec($("#pwd").val())
	    
	    if(result != null){
	        $(".pwd.regex").html("");
	    } else if ($("#pwd").val()==$("#id").val()) {
	    	$(".pwd.regex").html("아이디와 비밀번호가 동일합니다.");
	    	$(".pwd.regex").css("color","red");
	    }
	    else{
	        $(".pwd.regex").html("영어대소문자,숫자, 특수문자 : !@#$%^&*()?_~. 포함 8-20자리");
	        $(".pwd.regex").css("color","red");
	    }
	});

	//비밀번호 확인    
   $("#pwd2").on("keyup",function(){
        if($("#pwd").val()==$("#pwd2").val()){
           $(".pwd2.regex").html("비밀번호가 일치합니다"); 
        } else{
         $(".pwd2.regex").html("비밀번호가 일치하지않습니다"); 
         $(".pwd2.regex").css("color","red");
        }
   })
   
	//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
	$("#submit").on("click",function(){
	 
	   var pwd = $("#pwd").val();

	   var pwdregex = /^[a-zA-Z0-9!@#$%^&*()?_~.]{8,12}$/;
	
	  var pwdregex = pwdregex.exec(pwd);
	   if(pwdregex == null){
		   alert("비밀번호양식을 다시 확인해주세요");
		   $("#pwd").focus();
		   return;
	   } else if (idregex == pwdregex) {
		   alert("아이디와 비밀번호가 동일합니다.")
		   $("#pwd").focus();
		   return;
	   }

	 //빈칸 없을 때 제출.
	   $("#joinform").submit();
	
	})
	
})


function delete_ok() {
	if (!confirm("탈퇴 하시겠습니까? Y/N")) {
		alert("탈퇴요청을 취소하셨습니다.")
	} else {
		location.href="${pageContext.request.contextPath}/member/controller?type=delete"
	}
}
</script>
<title>가지나라 - 탈퇴하기</title>
</head>
<body>
	<div id ="container">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
		</div>
			<div class="wrap">
				<div class="join-wrap">
					<div id="delete_btn">
						<h3 class="title"> ▶ 비밀 번호 </h3>
						<input type="password" id="pwd" name="pwd" maxlength="20" class="input-field" placeholder=" 비밀 번호">
						<div class="pwd regex"></div>
						
						
						<h3 class="title"> ▶ 비밀 번호 확인 </h3>
						<input type="password" id="pwd2" name="pwd2" maxlength="20" class="input-field" placeholder=" 비밀 번호 확인">
						<div class="pwd2 regex"></div>
					</div>
					<div class="btn_delete">
						<input type="submit" class="submit" value="탈퇴 요청" onclick="delete_ok()">
						<input type="hidden" name="id" value="${mvo.id }">
					</div>
					<div class="btn_link">
						<ul class="delete_btn">
							<li>
								<a target="_blank" href="${pageContext.request.contextPath}/boardcontrol?type=start" class="delete_text">메인 페이지</a>
							</li>
							<li class="bar">
								|
							</li>
							<li>
								<a target="_blank" href="${pageContext.request.contextPath}/member/logout.jsp" class="delete_text">로그 아웃</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
<%@include file ="/common/footer.jsp" %>