<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<%@include file ="/common/header_board.jsp" %>

<style>
	.page-link {
		color: #000; 
		background-color: #fff;
		border: 1px solid #ccc; 
	}
	
	.page-item {
		margin-left: 1px;
		margin-right: 1px;
	}
	
	.page-item.active .page-link {
		z-index: 1;
		color: #555;
		font-weight:bold;
		background-color: #f1f1f1;
		border-color: #ccc;	 
	}
	
	.page-item.disabled .page-link {
		z-index: 1;
		color: #555;
		font-weight:bold;
		background-color: #f1f1f1;
		border-color: #ccc;	 
	}
	
	.page-item .page-link {
		z-index: 1;
		color: #fff;
		font-weight:bold;
		background-color: #9C73C5;
		border-color: #ccc;	 
	}
			
	.page-link:focus, .page-link:hover {
		color: rgb(230, 230, 230);
		background-color: #a384c2; 
		border-color: #ccc;
	}

	.imgBox {
		height: 200px;
	}
	
	#liveSection a{
		font-weight: bolder;
		font-size: 1.3em;
		color: #6F42C1;
	}
	
	.pagination {
		margin-top: 15px;
	}
	

</style>


<!-- 	게시글 나오는 곳 여기에 아래로 버튼 누르면 뒤에 붙겠금 해야 함, 한번에 불러오는 수 조절 해야 함 -->

	
<section class="product spad">
	<div class="container">
		<div class="row">
				<!-- 카테고리 출력 왼쪽바 -->
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>상품분류</h4>
                            <ul>
                            <c:choose>
                            <c:when test="${section == '전체' }">
                            <li id="liveSection"><a href="${pageContext.request.contextPath}/boardcontrol?type=viewList">전체</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="${pageContext.request.contextPath}/boardcontrol?type=viewList">전체</a></li>
                            </c:otherwise>
                            </c:choose>
                            
							<c:if test="${not empty caList }">
							<c:forEach var="cvo" items="${caList }">
								<c:choose>
								<c:when test="${section == cvo.value }">
								<li id="liveSection"><a href="${pageContext.request.contextPath}/boardcontrol?type=viewSectionList&section=${cvo.value }">${cvo.value }</a></li>
								</c:when>
								<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/boardcontrol?type=viewSectionList&section=${cvo.value }">${cvo.value }</a></li>
								</c:otherwise>
								</c:choose>
							</c:forEach>
							</c:if> 
                            </ul>
                        </div>
                    </div>
                </div>
                
				<!--게시판 나오는 곳 -->                
                <div class="col-lg-9 col-md-7">                                        
                    <div class="row">                    
                        <c:choose>
						<c:when test="${empty bbsList }">
								<tr><td colspan="2">아직 데이터가 없습니다</td></tr>
						</c:when>
						<c:otherwise>                        
                        <table class="table table-hover">
							<thead>
								<tr>
									<th width="30%">상품이미지</th>
									<th width="50%">제목</th>
									<th>가격</th>
								</tr>
							</thead>
							<tbody>              
								<c:forEach var="bvo" items="${bbsList }">   
								<tr>
									<td>
									<div class="imgBox justify-content-center align-items-center">
									<c:if test="${bvo.img != null }">
									<a href="${pageContext.request.contextPath}/boardcontrol?type=viewcon&boardIdx=${bvo.boardIdx }&cPage=${pvo.nowPage}"><img style="border-radius: 20px;" src="${pageContext.request.contextPath}/upload/${bvo.img }" height="100%"></a>
									</c:if>

									
									<c:if test="${bvo.img == null }">									
									<img src="/img/blank.png" height="100%">
									</c:if>									
									</div>
									</td>
									
									<td style="vertical-align: middle;"><a href="${pageContext.request.contextPath}/boardcontrol?type=viewcon&boardIdx=${bvo.boardIdx }&cPage=${pvo.nowPage}" class="text-dark"><strong>${bvo.title }</strong><br>${bvo.content }</a></td>
									
									<td style="vertical-align: middle;" class="text-dark">${bvo.price } 원</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						</c:otherwise>
						</c:choose> 
					</div>
					
					<!-- 페이징처리 -->

					<ol class="pagination container-fluid row justify-content-center align-items-center">
						<c:choose>
						<c:when test="${section == '전체' }">
							<c:if test="${pvo.beginPage == 1 }">
								<li class="page-item disabled"><a class="page-link">이전으로<a></li>
							</c:if>
							<c:if test="${pvo.beginPage != 1 }">
								<li class="page-item"><a class="page-link" href="boardcontrol?type=viewList&cPage=${pvo.beginPage -1 }">이전으로</a></li>
							</c:if>
							
							<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="page-item active"><a class="page-link">${pageNo }</a></li>
								</c:if>
								
								<c:if test="${pageNo != pvo.nowPage }">
									<li class="page-item"><a class="page-link" href="boardcontrol?type=viewList&cPage=${pageNo }">${pageNo }</a></li>
								</c:if>
							</c:forEach>
							
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li class="page-item"><a class="page-link" href="boardcontrol?type=viewList&cPage=${pvo.endPage + 1 }">다음으로</a></li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="page-item disabled"><a class="page-link">다음으로</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${pvo.beginPage == 1 }">
								<li class="page-item disabled"><a class="page-link">이전으로</a></li>
							</c:if>
							<c:if test="${pvo.beginPage != 1 }">
								<li class="page-item"><a class="page-link" href="boardcontrol?type=viewSectionList&section=${section }&cPage=${pvo.beginPage -1 }">이전으로</a></li>
							</c:if>
							
							<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="page-item active"><a class="page-link">${pageNo }</a></li>
								</c:if>
								
								<c:if test="${pageNo != pvo.nowPage }">
									<li class="page-item"><a class="page-link" href="boardcontrol?type=viewSectionList&section=${section }&cPage=${pageNo }">${pageNo }</a></li>
								</c:if>
							</c:forEach>
							
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li class="page-item"><a class="page-link" href="boardcontrol?type=viewSectionList&section=${section }&cPage=${pvo.endPage + 1 }">다음으로</a></li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="page-item disabled"><a class="page-link">다음으로</a></li>
							</c:if>						
						</c:otherwise>
						</c:choose>
					</ol>

					<!-- 글쓰기 버튼 -->
					<button type="button" class="btn btn-primary pull-right"
					style="background-color: #9C73C5; border: #6F42C1"
					onclick="window.location.href='boardcontrol?type=writeboard&ok=no'">
						글쓰기
					</button>										
				</div>            
            </div>
                    
    </div>
</section>
		
<%@include file ="/common/footer.jsp" %>