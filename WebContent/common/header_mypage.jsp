<%@page import="com.gaji.dongnae.vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="com.gaji.dongnae.dao.Dongnae_BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<%
	Dongnae_BoardDAO dao = new Dongnae_BoardDAO();
	List<CategoryVO> list = dao.getCategory();	
	request.setAttribute("Categories", list);		
	int allCount = dao.getTotalCount();
	request.setAttribute("allCount", allCount);
%>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>가지 나라</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
 	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<style>
	
	 
  .push a {
    border:0px solid rgba(115, 56, 173, 0.7);
    border-radius: 5px;
    background-color: transparent;
    margin:13px;
    height:30px;
    color:rgba(115, 56, 173);
	}
	
	 
	.push a:hover {
	transition-duration:0.2s;
	font-weight: bolder;
	font-size: 1.3em;
	color: #6F42C1;
	outline:none;
	 }
</style>
<body>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> gajinara@gajinara.com</li>
                                <li>가까이, 지금 가지나라 하세요~</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">                           
                            
                            <c:if test="${mvo == null }">
				            <div class="header__top__right__auth">
				                <a href="${pageContext.request.contextPath}/member/login.jsp"><i class="fa fa-user"></i> Login</a>
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
                        <a href="${pageContext.request.contextPath}/boardcontrol?type=start"><img src="${pageContext.request.contextPath}/img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/boardcontrol?type=start">홈</a></li>
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
                            <li><a href="#">고객센터</a>
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
        
        	<div class="row justify-content-center align-items-center">
		        <div class="col-lg-3 col-md-5">
				</div>
		        <div class="col-lg-9">
                
                    <div class="hero__search">
                        <div class="hero__search__form" >
                            <form action="${pageContext.request.contextPath}/boardcontrol">
                                <div class="hero__search__categories">
<!--                                     카테고리                                     -->
<!--                                     <span class="arrow_carrot-down"></span> -->
                                    통합검색
                                </div>
                                <input type="text" placeholder="WHAT DO YOU WANT?" name="search">
                                <input type="hidden" name="type" value="titConSearch">
                                <button type="submit" class="site-btn" >SEARCH</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
        	
        	</div>
		</div>
            <div class="row">
            	<div class="col-lg-3 col-md-5">
            	<div class="sidebar">
            		<div>
                        <div class="sidebar__item">
                            <h4>마이페이지</h4>
                            <ul>
	                        	<li class="push"><a href="${pageContext.request.contextPath}/member/controller?type=infoList">회원 정보 조회</a></li>
	                            <li class="push"><a href="${pageContext.request.contextPath}/member/controller?type=soldOutList">판매 내역</a></li>
	                            <li class="push"><a href="${pageContext.request.contextPath}/member/controller?type=buyList">구매 내역</a></li>
	                            <li class="push"><a href="${pageContext.request.contextPath}/member/controller?type=saleList">판매중인 상품</a></li>
	                            <li class="push"><a href="${pageContext.request.contextPath}/member/controller?type=wishList">찜 한 내역</a></li>
	                            <li class="push"><a href="${pageContext.request.contextPath}/member/controller?type=commentList">게시글의 작성 댓글</a></li>
	                            <li class="push"><a href="${pageContext.request.contextPath}/member/controller?type=uriCommentList">동네생활의 작성 댓글</a></li>
                            </ul>
                        </div>
                     </div>
				</div>
				</div>
<!--                 검색 기능 구현 -->
				

                    
                    <div class="col-lg-9">
                    <div class="hero__item set-bg" data-setbg="${pageContext.request.contextPath}/img/hero/banner.jpg" id="backbanner" >
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
    <!-- Hero Section End -->