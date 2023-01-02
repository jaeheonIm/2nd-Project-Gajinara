
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<%@include file ="/common/headerAdmin.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <!--  <h1 class="h3 mb-2 text-gray-800">회원관리</h1> -->
                    <div class="row">
						<div class="col-sm-2"></div>
						
						
						<div class="col-sm-9">
							<h3 class="text-center">회원 관리</h3><br>
						
						<form action="adminController?type=search" method="post">
							<table  style="margin-left: auto; margin-right: auto;">
								<tr>
									<td>
									아이디 <input type="text" name="id" style="width:200px;"> 
									이름 <input type="text" name="name" style="width:200px;">
									</td>
									
									<td>
									<select name="status" >
										<option value="선택">선택</option>
										<option value="이용중">이용중</option>
										<option value="잠김">잠김</option>
										<option value="탈퇴">탈퇴</option>
									</select> 
									</td>
									<td>
									<select name="grade" >
										<option value="선택">선택</option>
										<option value="일반회원">일반회원</option>
										<option value="우수회원">우수회원</option>
										<option value="최우수회원">최우수회원</option>
									</select>
									</td>
									<td>
									<input type="submit" value="검색">
									</td>
								</tr>
							</table>
						</form>
					
					<div class="table-responsive">
						<table class="table table-striped">
							<tr>
								<td>아이디</td>
								<td>이름</td>
								
						
								
								<td>등급</td>
								<td>상태</td>
							</tr>

							<c:forEach var="vo" items="${list }">
								<tr>
									<!--   <td id="id" onclick="location.href='userUpdate.jsp'">${vo.id }</td>-->
									<td><a href="/TeamProject/admin/adminController?type=searchId&id=${vo.id}">${vo.id }</a></td>
									<td>${vo.name }</td>
									
								
									
									<td>${vo.grade }</td>
									<td>${vo.status }</td>
								</tr>
							</c:forEach>

						</table>
					</div>




					<!-- ------------------------- -->               
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
   
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
            
            
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="/TeamProject/index.html"><img src="/TeamProject/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello@colorlib.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <div class="footer__copyright__payment"><img src="/TeamProject/img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="/TeamProject/js/jquery-3.3.1.min.js"></script>
    <script src="/TeamProject/js/bootstrap.min.js"></script>
    <script src="/TeamProject/js/jquery.nice-select.min.js"></script>
    <script src="/TeamProject/js/jquery-ui.min.js"></script>
    <script src="/TeamProject/js/jquery.slicknav.js"></script>
    <script src="/TeamProject/js/mixitup.min.js"></script>
    <script src="/TeamProject/js/owl.carousel.min.js"></script>
    <script src="/TeamProject/js/main.js"></script>



</body>

</html>