<%@page import="com.gaji.member.dao.MemberDAO"%>
<%@page import="com.gaji.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
    <link href="${pageContext.request.contextPath}/css/MemberCSS/Modify.css" rel="stylesheet" type="text/css">
<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script>

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
    
            var roadAddr = data.roadAddress; 
            var extraRoadAddr = '';
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
          
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
        }
    }).open();
}


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
           $(".pwd2.regex").css("color","black");
        } else{
         $(".pwd2.regex").html("비밀번호가 일치하지않습니다"); 
         $(".pwd2.regex").css("color","red");
        }
   });

	//이름 유효성검사
    $("#name").on("input",function(){
        var regex = /[가-힣]{2,}/;
        var result = regex.exec($("#name").val());
        
        if(result != null){
           $(".name.regex").html("");  
        }else{
            $(".name.regex").html("한글만 입력 가능합니다.");
            $(".name.regex").css("color","red");
        }
        
    });

    //생년월일 유효성검사
    $("#birth").on("input",function(){
         var regex = /(^(19|20)\d{2})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/; 
         var result = regex.exec($("#birth").val());
        
        if(result != null){
           $(".birth.regex").html("");  
        }else{
            $(".birth.regex").html("올바른 생년월일이 아닙니다");
            $(".birth.regex").css("color","red");
        }
        
    });
    
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
        
    });

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
    });
    
	//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
	$("#modify_submit").on("click",function(){
		 
		var id = $("#id").val();
	   var pwd = $("#pwd").val();
	   var name = $("#name").val();
	   var birth = $("#birth").val();
	   var phone = $("#phone").val();
	   var email = $("#email").val();
	   
	   var idregex = /^[a-z][a-z\d]{4,20}$/;
	   var pwdregex = /^[a-zA-Z0-9!@#$%^&*()?_~.]{8,12}$/;
	   var nameregex = /[가-힣]{2,}/;
	   var birthregex = /(^(19|20)\d{2})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/; 
	   var phoneregex = /^01\d\d{3,4}\d{4}$/;
	   var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
	   
	   var idregex = idregex.exec(id);
	   if(idregex == null){
		   alert("아이디양식을 다시 확인해주세요");
		   $("#id").focus();
		   return;
	   }
	   
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
	   
	   var nameregex = nameregex.exec(name);
	   if(nameregex == null){
		   alert("이름양식을 다시 확인해주세요");
		   $("#name").focus();
		   return;
	   }
	   
	   var birthregex = birthregex.exec(birth);
	   if(birthregex == null){
		   alert("생년월일양식을 다시 확인해주세요");
		   $("#birth").focus();
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
	   $("#modifyform").submit(); 
	
		});
	
});



</script>
<title>가지나라 - 회원 정보 수정</title>
</head>
<body>
	<div id="container">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
		</div>
		<form action="${pageContext.request.contextPath}/member/controller?type=modify" method="post" id="modifyform">
			<div class="warp">
				<div class="join-wrap">
					<div id="join_btn">
						<h3 class="title"> ▶ 아이디 </h3>
						<div class="input_field" >${mvo.id }</div>
						
						<h3 class="title"> ▶ 비밀 번호 </h3>
						<input type="password" id="pwd" name="pwd" maxlength="20" class="input-field" value=${mvo.pwd }>
						<div class="pwd regex"></div>
						
						<h3 class="title"> ▶ 비밀 번호 확인 </h3>
						<input type="password" id="pwd2" name="pwd2" maxlength="20" class="input-field" placeholder=" 비밀 번호 확인">
						<div class="pwd2 regex"></div>
						
						<h3 class="title"> ▶ 이름 </h3>
						<input type="text" id="name" name="name" maxlength="40" class="input-field" value=${mvo.name }>
						<div class="name regex"></div>
						
						<h3 class="title"> ▶ 생년월일 </h3>
						<input type="text" id="birth" name="birth" maxlength="40" class="input-field" value=${mvo.birth }>
						<div class="birth regex"></div>
						
						<h3 class="title"> ▶ 휴대 전화 </h3>
						<input type="text" id="phone" name="phone" maxlength="11" class="input-field" value=${mvo.phone }>
						<div class="phone regex"></div>
						 
						<h3 class="title"> ▶ 주소 </h3>
						<h4 class="subtitle"> - 우편 번호 -</h4><input type="button" class="push" id="push"  onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
						<input type="text" id="postcode" name="zipcode" maxlength="10" class="input-field" value=${mvo.postcord }>
						<input type="text" id="roadAddress" name="roadaddress" maxlength="30" class="input-field" value=${mvo.roadaddress }>
						<input type="text" id="detailAddress" name="detailaddress" maxlength="20" class="input-field" value=${mvo.detailaddress }>
						 
						<h3 class="title"> ▶ Email </h3>
						<input type="text" id="email" name="email" maxlength="50" class="input-field" value=${mvo.email }>
						<div class="email regex"></div>
					</div>
					<div class="btn_modify">
						<input type="button" id="modify_submit" value="수정하기">
						<input type="hidden" name="id" value="${mvo.id }">
					</div>
					</div>
				</div>
				<div class="btn_link">
						<ul class="mdy_btn">
							<li class="bar">
								<a href="${pageContext.request.contextPath}/boardcontrol?type=start" class="mdy_text">메인페이지</a>
							</li>
							<li class="bar">
								|
							</li>
							<li >
								<a href="${pageContext.request.contextPath}/member/logout.jsp" class="mdy_text">로그 아웃</a>
							</li>
							<li class="bar">
								|
							</li>
							<li class="bar">
								<a href="${pageContext.request.contextPath}/member/delete.jsp" class="mdy_text">회원 탈퇴</a>
							</li>
						</ul>
					</div>
			</form>
		</div>
				