<%@include file="/dongnae/header-blog.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text" >                    
                    	<c:choose>
                    		<c:when test="${param.type == 'search_all' }">
                    			<h2 style="color: navy;">검색어:${param.keyword }</h2>
                    		</c:when>
                    		<c:when test="${param.type == 'moveTo_Board' && empty param.category }">
                    			<h2 style="color: navy;">전체</h2>
                    		</c:when>                  		
                    	</c:choose>                  				
                    	<c:if test="${not empty param.category }">	
                    		<c:forEach var="category" items="${Categories }">                          			              			
                    			<c:choose>
                    				<c:when test="${param.category eq category.category }">
                    					<h2 style="color: navy">${category.value }</h2>
                    				</c:when>
                    			</c:choose>
               				</c:forEach>
                    	</c:if>                        
                        <div class="breadcrumb__option">
                            <a href="${pageContext.request.contextPath}/boardcontrol?type=start" style="color: navy;">Home</a>
                            <span style="color: navy;">동네 생활</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->    
    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="${pageContext.request.contextPath}/dongnae/controller?type=search_all" method="post">
                                <input name="keyword" type="text" placeholder="우리 동네 검색(제목)">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>카테고리</h4>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board">전체(${allCount })</a></li>
								<c:forEach var="category" items="${Categories }">
								<li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&category=${category.category }">${category.value }</a></li>
								</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>       
                     
                <div class="col-lg-8 col-md-7">
                    <div class="row">
                    	<c:if test="${empty categoryList && empty fullList && empty searchList}">
                    		<div class="col-lg-6 col-md-6 col-sm-6">
                    			<div class="blog__item">
                    				<p>게시글이 없습니다.</p>
                    			</div>
                    		</div>
                    	</c:if>
                    	<c:if test="${not empty fullList }">
		                    <c:forEach var="board" items="${fullList }"> 
		                        <div class="col-lg-6 col-md-6 col-sm-6">
		                            <div class="blog__item">
		                                <div class="blog__item__pic">
		                                    <img src="${pageContext.request.contextPath}/upload/${board.img }" alt="#" onerror="this.src='${pageContext.request.contextPath}/img/noImg.jpg'">
		                                </div>
		                                <div class="blog__item__text">
		                                    <ul>
		                                        <li><i class="fa fa-hand-pointer-o"></i> ${board.hit }</li>
		                                        <li><i class="fa fa-comment-o"></i> ${board.cc }</li>
		                                        <li><i class="fa fa-heart-o"></i> ${board.likes }</li>
		                                        <li><i class="fa fa-calendar-o"></i> ${board.regdate }</li>
		                                    </ul>		                                    
		                                    <h5><a href="${pageContext.request.contextPath}/dongnae/controller?type=detail&uriBoardIdx=${board.uriBoardIdx }&cPage=${pvo.nowPage}">${board.title }</a></h5>
		                                    	<c:choose>		                               
				                                    <c:when test="${fn:length(board.content) gt 21}">
				                                    	<p>${fn:substring(board.content,0,20) } ......</p> 
				                                    </c:when>
				                                    <c:otherwise>
				                                    	<p>${board.content }</p>
				                                    </c:otherwise>
		                                    	</c:choose>		
		                                    <a href="${pageContext.request.contextPath}/dongnae/controller?type=detail&uriBoardIdx=${board.uriBoardIdx }&cPage=${pvo.nowPage}" class="blog__btn">더 보기 <span class="arrow_right"></span></a>
		                                </div>
		                            </div>
		                        </div>
							</c:forEach>
						</c:if>
                    	<c:if test="${not empty categoryList }">
		                    <c:forEach var="board" items="${categoryList }"> 
		                        <div class="col-lg-6 col-md-6 col-sm-6">
		                            <div class="blog__item">
		                                <div class="blog__item__pic">
		                                    <img src="${pageContext.request.contextPath}/upload/${board.img }" alt="#" onerror="this.src='${pageContext.request.contextPath}/img/noImg.jpg'">
		                                </div>
		                                <div class="blog__item__text">
		                                    <ul>
		                                        <li><i class="fa fa-hand-pointer-o"></i> ${board.hit }</li>
		                                        <li><i class="fa fa-comment-o"></i> ${board.cc }</li>
		                                        <li><i class="fa fa-heart-o"></i> ${board.likes }</li>
		                                        <li><i class="fa fa-calendar-o"></i> ${board.regdate }</li>
		                                    </ul>
		                                    <h5><a href="${pageContext.request.contextPath}/dongnae/controller?type=detail&uriBoardIdx=${board.uriBoardIdx }&cPage=${pvo.nowPage}">${board.title }</a></h5>
		                                    	<c:choose>		                               
				                                    <c:when test="${fn:length(board.content) gt 21}">
				                                    	<p>${fn:substring(board.content,0,20) } ......</p> 
				                                    </c:when>
				                                    <c:otherwise>
				                                    	<p>${board.content }</p>
				                                    </c:otherwise>
		                                    	</c:choose>				                                    
		                                    <a href="${pageContext.request.contextPath}/dongnae/controller?type=detail&uriBoardIdx=${board.uriBoardIdx }&cPage=${pvo.nowPage}" class="blog__btn">더 보기 <span class="arrow_right"></span></a>
		                                </div>
		                            </div>
		                        </div>
							</c:forEach>
						</c:if>	
                    	<c:if test="${not empty searchList }">
		                    <c:forEach var="board" items="${searchList }"> 
		                        <div class="col-lg-6 col-md-6 col-sm-6">
		                            <div class="blog__item">
		                                <div class="blog__item__pic">
		                                    <img src="${pageContext.request.contextPath}/upload/${board.img }" alt="#" onerror="this.src='${pageContext.request.contextPath}/img/noImg.jpg'">
		                                </div>
		                                <div class="blog__item__text">
		                                    <ul>
		                                        <li><i class="fa fa-hand-pointer-o"></i> ${board.hit }</li>
		                                        <li><i class="fa fa-comment-o"></i> ${board.cc }</li>
		                                        <li><i class="fa fa-heart-o"></i> ${board.likes }</li>
		                                        <li><i class="fa fa-calendar-o"></i> ${board.regdate }</li>
		                                    </ul>
		                                    <h5><a href="${pageContext.request.contextPath}/dongnae/controller?type=detail&uriBoardIdx=${board.uriBoardIdx }&cPage=${pvo.nowPage}">${board.title }</a></h5>
		                                    	<c:choose>		                               
				                                    <c:when test="${fn:length(board.content) gt 21}">
				                                    	<p>${fn:substring(board.content,0,20) } ......</p> 
				                                    </c:when>
				                                    <c:otherwise>
				                                    	<p>${board.content }</p>
				                                    </c:otherwise>
		                                    	</c:choose>				                                    
		                                    <a href="${pageContext.request.contextPath}/dongnae/controller?type=detail&uriBoardIdx=${board.uriBoardIdx }&cPage=${pvo.nowPage}" class="blog__btn">더 보기 <span class="arrow_right"></span></a>
		                                </div>
		                            </div>
		                        </div>
							</c:forEach>
						</c:if>												
                        <div class="col-lg-12">
                            <div class="product__pagination blog__pagination">
                            	<c:if test="${not empty fullList}">
									<c:if test="${pvo.beginPage != 1 }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&cPage=${pvo.beginPage - 1 }">
											<i class="fa fa-long-arrow-left"></i>
										</a>
									</c:if>	                            
									<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
									<c:if test="${pageNo == pvo.nowPage }">
										<a style="background: mediumpurple; color: #fff;">${pageNo }</a>
									</c:if>
									<c:if test="${pageNo != pvo.nowPage }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&cPage=${pageNo }">${pageNo }</a>
									</c:if>
									</c:forEach>								
									<c:if test="${pvo.endPage < pvo.totalPage }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&cPage=${pvo.endPage + 1 }">
											<i class="fa fa-long-arrow-right"></i>
										</a>
									</c:if>	
								</c:if>
                            	<c:if test="${not empty categoryList }">
									<c:if test="${pvo.beginPage != 1 }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&category=${category.category }&cPage=${pvo.beginPage - 1 }">
											<i class="fa fa-long-arrow-left"></i>
										</a>
									</c:if>	                            
									<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
									<c:if test="${pageNo == pvo.nowPage }">
										<a style="background: mediumpurple; color: #fff;">${pageNo }</a>
									</c:if>
									<c:if test="${pageNo != pvo.nowPage }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&category=${category.category }&cPage=${pageNo }">${pageNo }</a>
									</c:if>
									</c:forEach>								
									<c:if test="${pvo.endPage < pvo.totalPage }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&category=${category.category }&cPage=${pvo.endPage + 1 }">
											<i class="fa fa-long-arrow-right"></i>
										</a>
									</c:if>	
								</c:if>		
                            	<c:if test="${not empty searchList }">
									<c:if test="${pvo.beginPage != 1 }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=search_all&category=${category.category }&cPage=${pvo.beginPage - 1 }&keyword=${param.keyword}">
											<i class="fa fa-long-arrow-left"></i>
										</a>
									</c:if>	                            
									<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
									<c:if test="${pageNo == pvo.nowPage }">
										<a style="background: mediumpurple; color: #fff;">${pageNo }</a>
									</c:if>
									<c:if test="${pageNo != pvo.nowPage }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=search_all&category=${category.category }&cPage=${pageNo }&keyword=${param.keyword}">${pageNo }</a>
									</c:if>
									</c:forEach>								
									<c:if test="${pvo.endPage < pvo.totalPage }">
										<a href="${pageContext.request.contextPath}/dongnae/controller?type=search_all&category=${category.category }&cPage=${pvo.endPage + 1 }&keyword=${param.keyword}">
											<i class="fa fa-long-arrow-right"></i>
										</a>
									</c:if>	
								</c:if>																																					
                            </div>
	                            <div class="blog__item__text">
	                            	<a id="id_check" href="${pageContext.request.contextPath}/dongnae/controller?type=boardWrite" class="blog__btn" style="position: absolute;left: 45em;top: -0.5em;">글쓰기<span class="arrow_right"></span></a>
	                            </div>	                            
                        </div>
                    </div>                   
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->
<script>
	$(function(){
		$("#id_check").on("click",function(){
			var mvo = "<c:out value='${mvo}' />";
			if(mvo == ""){
				alert("로그인 정보가 없습니다.\n로그인 화면으로 이동합니다.");
			}
		});
	});
	
</script>
<%@ include file="/dongnae/footer.jsp"%>