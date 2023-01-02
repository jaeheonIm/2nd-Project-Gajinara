<%@page import="com.gaji.admin.dao.MemberDAO"%>
<%@page import="com.gaji.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.gaji.admin.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@include file ="/common/headerAdmin.jsp" %>
<html lang="en">
<style>
	#bbs table {
		width: 580px;
		margin-left: 10px;
		border-collapse: collapse;
		font-size: 14px;
	}
	#bbs table caption {
		font-size: 2em;
		font-weight: bold;
		margin-bottom: 10px;
	}
	#bbs th, #bbs td {
		border: 1px solid black;
		padding: 4px 10px;
		text-align: center;
	}
	
	#bbs .align-left {text-align: left; }
	
	.title { background-color: orange; }
	.no { width: 10%; }
	.writer { width: 15%; }
	.regdate { width: 20%; }
	.hit { width: 15%; }
	
	/*** 페이지 표시 영역 스타일(시작) ****/
	.paging { list-style: none; }
	.paging li { 
		float: left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa5;
	}
</style>
<%
	//페이징 처리를 위한 객체(Paging) 생성
	Paging p = new Paging();

	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(MemberDAO.getTotalCount());
	p.setTotalPage();
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> cPage : " + cPage);
	System.out.println("> paging nowPage : " + p.getNowPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	//3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
	if (p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//------ 블록(block) 계산하기 -----------
	//4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
	int nowPage = p.getNowPage();
	int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(beginPage + p.getNumPerBlock() - 1);
	
	//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
	// 끝페이지를 전체페이지 수로 변경 처리
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	System.out.println(">> beginPage : " + p.getBeginPage());
	System.out.println(">> endPage : " + p.getEndPage());
	
	//=====================
	//DB 데이터 가져오기
	//시작번호(begin), 끝번호(end) 사용해서 게시글 조회
	//List<MemberVO> list = MemberDAO.getList(p.getBegin(), p.getEnd());
	//System.out.println(">> 현재페이지 글목록(list) : " + list);
	
	//===================================
	//EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
%>


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
								<td>패스워드</td>
								<td>전화번호</td>
								<td>주민번호</td>
								<td>주소</td>
								<td>메일</td>
								<td>등급</td>
								<td>상태</td>
							</tr>
							
							<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="5">
									<h2>현재 등록된 게시글이 없습니다</h2>
								<td>
							</tr>
						</c:when>
						<c:otherwise>
							
							
							<c:forEach var="vo" items="${list }">
								<tr>
									<!--   <td id="id" onclick="location.href='userUpdate.jsp'">${vo.id }</td>-->
									<td><a href="/TeamProject/admin/adminController?type=searchId&id=${vo.id}">${vo.id }</a></td>
									<td>${vo.name }</td>
									<td>${vo.pwd }</td>
									<td>${vo.phone }</td>
									<td>${vo.joomin }</td>
									<td>${vo.addr }</td>
									<td>${vo.email }</td>
									<td>${vo.grade }</td>
									<td>${vo.status }</td>
								</tr>
							</c:forEach>
							</c:otherwise>
		
							</c:choose>	
						</tbody>
						<tfoot>
						<tr>
							<td colspan="4">
								<ol class="paging">
								<%--[이전으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.beginPage == 1 }">
									<li class="disable">이전으로</li>
								</c:if>	
								<c:if test="${pvo.beginPage != 1 }">
									<li>
										<a href="list.jsp?cPage=${pvo.beginPage - 1 }">이전으로</a>
									</li>
								</c:if>
								
								<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="now">${pageNo }</li>
								</c:if>	
								<c:if test="${pageNo != pvo.nowPage }">
									<li><a href="list.jsp?cPage=${pageNo }">${pageNo }</a></li>
								</c:if>	
								</c:forEach>
									
								<%--[다음으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li>
										<a href="list.jsp?cPage=${pvo.endPage + 1 }">다음으로</a>
									</li>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">다음으로</li>
								</c:if>
									
								</ol>
							</td>
						</tr>
						
						</tfoot>
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
                            <a href="/TeamProject/index.jsp"><img src="/TeamProject/img/logo.png" alt=""></a>
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