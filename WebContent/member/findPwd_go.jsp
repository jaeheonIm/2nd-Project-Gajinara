<%@page import="com.gaji.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가지나라 - 회원 비밀 번호 찾기</title>
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
    <link href="${pageContext.request.contextPath}/css/MemberCSS/findPwd_go.css" rel="stylesheet" type="text/css">
<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
	<div id="container">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
		</div>
		<div id="wrap">
			<div class="findPwd_go_wrap">
				<div id="findPwd_go_btn">
					<h3 class="findPwd_go_title"> ▶ 찾으신 비밀 번호 </h3>
					<div class="input_field">${FindPwd1.getPwd() }</div>
					<div class="btn_link">
						<ul class="findPwd_go_btn">
							<li>
								<a href="${pageContext.request.contextPath}/member/findId.jsp" class="findPwd_go_text">아이디 찾기</a>
							</li>
							<li class="bar">
								|
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/member/login.jsp" class="findPwd_go_text">로그인</a>
							</li>
							<li class="bar">
								|
							</li>			
							<li>
								<a href="${pageContext.request.contextPath}/boardcontrol?type=start" class="findPwd_go_text">메인 페이지</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>