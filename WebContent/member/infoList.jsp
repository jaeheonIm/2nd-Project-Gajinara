<%@page import="com.gaji.member.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <link href="${pageContext.request.contextPath}/css/MemberCSS/infoList.css" rel="stylesheet" type="text/css">
<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script>

$(document).ready(function() {
    console.log("테스트");
      $('#test').focus();
 });
 
</script>

<title>가지나라 - 회원 정보 조회</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
	<div id="container">
		<form action="${pageContext.request.contextPath}/member/controller?type=infoList" method="post">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
			</div>
			<div class="wrap">
				<div class="infoList_wrap">
					<div id="infoList_text">
						<h3 class="infoList_title" id="test"> 아이디 </h3>
						<div class="input_field">${mvo.id }</div>
						<h3 class="infoList_title"> 이름 </h3>
						<div class="input_field">${mvo.name }</div>
						<h3 class="infoList_title"> 회원 등급 </h3>
						<div class="input_field">${mvo.grade }</div>
						<h3 class="infoList_title"> 생년월일 </h3>
						<div class="input_field">${mvo.birth }</div>
						<h3 class="infoList_title"> 휴대 전화 </h3>
						<div class="input_field">${mvo.phone }</div>
						<h3 class="infoList_title"> 도로명 주소 </h3>
						<div class="input_field">${mvo.roadaddress }</div>
						<h3 class="infoList_title"> 상세 주소 </h3>
						<div class="input_field">${mvo.detailaddress }</div>
						<h3 class="infoList_title"> Email</h3>
						<div class="input_field">${mvo.email }</div>
					</div>
					<div class="btn_link">
						<ul class="info_btn">
							<li>
								<a href="${pageContext.request.contextPath}/member/myPage.jsp" class="info_text">마이 페이지로 이동</a>
							</li>
							<li class="bar">
								|
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/modifyPw.jsp" class="info_text">회원 정보 수정</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</div>