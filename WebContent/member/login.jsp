<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link href="${pageContext.request.contextPath}/css/MemberCSS/Login.css" rel="stylesheet" type="text/css">
<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<title>가지나라 - 로그인</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<div id="container">
	<div class="logo">
        <a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
    </div>
	<form action="${pageContext.request.contextPath}/member/controller?type=login" method="post">
            <div class="form-wrap">
                <div class="login-wrap">
                    <div id="lgn_btn">
	                   	<input type="text" name="id" class="input-field" placeholder="  아이디" >
	                    <input type="password" name="pwd" class="input-field" placeholder="  비밀번호" >
	                    <input type="submit" class="submit" value="로그인">
                	</div>
                </div>
                <div class="find_wrap" id="find_wrap">
	                <ul class="find_link">
						<li>
							<a href="${pageContext.request.contextPath}/member/findId.jsp" class="find_text"> 아이디 찾기 </a>
						</li>
						<li class="bar">
							|
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/member/findPwd.jsp" class="find_text"> 비밀 번호 찾기 </a>
						</li>
						<li class="bar">
							|
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/member/join.jsp" class="find_text"> 회원 가입 </a>
						</li>
					</ul>
				</div>

             </div>	 
	</form>
</div>	