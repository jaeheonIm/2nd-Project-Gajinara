<%@page import="com.gaji.dongnae.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="com.gaji.dongnae.dao.Dongnae_BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%
	Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
	List<CategoryVO> list = dao.getCategory();
	request.setAttribute("list", list);

%>
<!DOCTYPE html>
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
    
    
    
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
             
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> 로그인</a>
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="${pageContext.request.contextPath}/boardcontrol?type=start">홈</a></li>
                <li><a href="./shop-grid.html"></a></li>
                <li><a href="#"></a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">전체 판매 보기</a></li>
                        <li><a href="./shoping-cart.html">판매글 작성하기</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board">동네생활</a></li>
                <li><a href="${pageContext.request.contextPath}/contact.html">고객센터</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> gajinara@contact.com</li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
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
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png" alt="" width="150"></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="${pageContext.request.contextPath}/boardcontrol?type=start">홈</a></li>
                            <li><a href="./shop-grid.html"></a></li>
                            <li><a href="#">거래하기</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./shop-details.html">전체판매보기</a></li>
                                    <li><a href="./shoping-cart.html">판매글 작성하기</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board">동네생활</a>
                            	<ul class="header__menu__dropdown">
                            		<c:forEach var="category" items="${Categories }">
                            			<li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&category=${category.category }">${category.value }</a></li>	
                            		</c:forEach>
                            	</ul>
                            </li>
                            <li><a href="./contact.html">고객센터</a></li>
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
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>카테고리</span>
                        </div>
                        <ul>
                            <li><a href="#">전자기기/IT</a></li>
                            <li><a href="#">식품</a></li>
                            <li><a href="#">도서</a></li>
                            <li><a href="#">여성의류/잡화</a></li>
                            <li><a href="#">남성의류/잡화</a></li>
                            <li><a href="#">유아동</a></li>
                            <li><a href="#">가구/인테리어</a></li>
                            <li><a href="#">뷰티/미용</a></li>
                            <li><a href="#">스포츠</a></li>
                            <li><a href="#">기타</a></li>
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
                                <input type="text" placeholder="무엇을 검색하시겠습니까?">
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
                    <div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath}/img/hero/banner.jpg" id="backbanner">
                        <div class="hero__text">
                            <span>시작해보세요</span>
                            <h2>가까이,지금</h2>
                            <p>내 물건 사고 팔땐 가지나라</p>
                            <a href="#" class="primary-btn">내 물건 판매하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>