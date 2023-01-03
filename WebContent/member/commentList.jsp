<%@page import="com.gaji.board.vo.BoardVO" %>
<%@page import="com.gaji.dongnae.vo.UriBoardVO" %>
<%@page import="com.gaji.board.vo.CommentVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<%@include file ="/common/header_board.jsp" %>
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

<section id="content">
	    <!-- 좌측 side menu -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
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

         <!-- Comment List 출력 -->
         
                <div class="col-lg-9 col-md-7">    
                    <div class="row">                   
                    	<h5>게시글의 작성 댓글</h5> 
                        <hr>
	                        <table class="table table-hover" style="text-align: center;">
                        		<thead>
	                        	<tr>
	                        		<th width="15%">게시글 No.</th>
				                    <th width="15%">댓글 No.</th>
				                    <th width="15%">작성자</th>
				                    <th width="35%">내용</th>
				                    <th width="20%">등록일</th>
	                        	</tr>
	                        	</thead>
	                       			<c:forEach var="cvo" items="${commentList }">
			                        	<tr>
						                    <th width="15%"><a href="${pageContext.request.contextPath}/boardcontrol?type=viewcon&boardIdx=${cvo.boardIdx}" class="text-blue">${cvo.boardIdx }</a></th>
			                        		<th width="15%">${cvo.commentIdx }</th>
						                    <th width="15%">${cvo.id }</th>
						                    <th width="35%"><a href="${pageContext.request.contextPath}/boardcontrol?type=viewcon&boardIdx=${cvo.boardIdx}" class="text-blue">${cvo.content }</a></th>
						                    <th width="20%">${cvo.regdate }</th>
			                        	</tr>
		                        	</c:forEach>
                        	</table>
                       	</div>	 
		            </div>
		        </div>
		    </div>
		</section>
	</section>
<%@include file ="/common/footer.jsp" %>