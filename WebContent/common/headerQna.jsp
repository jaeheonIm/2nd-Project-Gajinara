<%@page import="com.gaji.dongnae.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="com.gaji.dongnae.dao.Dongnae_BoardDAO"%>
<%@page import="com.gaji.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
	List<CategoryVO> list = dao.getCategory();	
	request.setAttribute("Categories", list);		
	int allCount = dao.getTotalCount();
	request.setAttribute("allCount", allCount);
	
%>

<html lang="zxx">

<head>
<style>
 #backbanner {
 	background-image: url("${pageContext.request.contextPath}/img/hero/banner.jpg");    
 	background-size : contain;
 }

</style>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>가지나라</title>

    <!-- Google Font -->
 	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/chat/Chat.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/chat/Home.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	
$(document).ready(function() {
	console.log("테스트");
	  $('#test').focus();
});
</script>       
</head>

<body>


    

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container" >
                <div class="row">
                    <div class="col-lg-6 col-md-6" >
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> gajinara@contact.com</li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                           
                            
                            <div class="header__top__right__auth">
                                <c:if test="${mvo == null }">
		                            <div class="header__top__right__auth">
		                                <a href="${pageContext.request.contextPath}/member/login.jsp"><i class="fa fa-user"></i> 로그인/회원가입</a>
		                            </div>
	                            </c:if>
	                            <c:if test="${mvo != null }">
		                            <div class="header__top__right__auth">
		                                <a href="${pageContext.request.contextPath}/member/myPage.jsp"><i class="fa fa-user"></i> 마이페이지</a>
		                            </div>
		                            <div class="header__top__right__auth">
		                                <a href="${pageContext.request.contextPath}/member/logout.jsp"><i class="fa fa-user"></i> 로그아웃</a>
		                            </div>
	                            </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" >
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" alt="" width="150"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/boardcontrol?type=start">홈</a></li>
                            <li><a href="./shop-grid.html"></a></li>
                            <li><a href="#">거래하기</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="${pageContext.request.contextPath}/boardcontrol?type=viewList">전체판매보기</a></li>
                                    <li><a href="${pageContext.request.contextPath}/boardcontrol?type=writeboard&ok=no">판매글 작성하기</a></li>
                                </ul>
                            </li>
                           <li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board">동네생활</a>
                            	<ul class="header__menu__dropdown">
                            		<c:forEach var="category" items="${Categories }">
                            			<li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&category=${category.category }">${category.value }</a></li>	
                            		</c:forEach>
                            	</ul>
                            </li>
                            <li class="active"><a href="#">고객센터</a>
			                  <ul class="header__menu__dropdown">
			                      <li><a href="${pageContext.request.contextPath}/QnaController?type=qnaMain&id=${mvo.id}">QNA</a></li>
			                      <li><a href="${pageContext.request.contextPath}/contact.jsp">오시는길</a></li>
			                  </ul>
               				 </li>
               				<c:if test="${mvo.status == 'admin' }">
							<li><a href="#">관리자</a>
								<ul class="header__menu__dropdown">
									<li><a href="${pageContext.request.contextPath}/admin/adminController?type=list">회원관리</a></li>
									<li><a href="${pageContext.request.contextPath}/admin/adminController?type=product">상품관리</a></li>
                                </ul>
							</li>
							</c:if>
                        </ul>
                    </nav>
                </div> 
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>3</span></a></li> <!-- 찜하기 -->
                            <li><a href="#"><i class="fa fa-user"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

     <!-- Hero Section Begin -->
    <section class="hero hero-normal">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                             <span>카테고리</span>
                        </div>
                        <ul>
                           <li><a href="#">가전제품</a></li>
                            <li><a href="#">도서</a></li>
                            <li><a href="#">식품</a></li>
                            <li><a href="#">스포츠용품</a></li>
                            <li><a href="#">악세사리</a></li>
                            <li><a href="#">화장품</a></li>
                            <li><a href="#">가구</a></li>
                            <li><a href="#">반려동물용품</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    카테고리
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="무엇을 검색하시겠습니까?" id="test">
                                <button type="submit" class="site-btn">검색</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>02-2200-0000</h5>
                                <span>상담시간 평일 09~18</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
                  
  <script>
   function goTop(){
      document.documentElement.scrollTop = 0;
   }
   </script>
                
                    