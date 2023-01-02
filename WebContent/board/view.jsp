<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Dongnae.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script type="text/javascript">
	function delete_ok(){
		var deleteok = confirm("삭제 하시겠습니까?");
		if (!deleteok){
			return;
		}		
		window.location.href='${pageContext.request.contextPath}/boardcontrol?type=removeBoard&boardIdx=${bvo.boardIdx}';
	}
	
	function deleteCmt_go(commentIdx){
		var deleteok = confirm("삭제 하시겠습니까?");
		if (!deleteok){
			return;
		}
		var path = '${pageContext.request.contextPath}/boardcontrol?type=removeCmt&boardIdx=${bvo.boardIdx}&commentIdx=' + commentIdx;
		window.location.href = path;
	}
</script>

<%@include file ="/common/header_board.jsp" %>

	<style>
		.btn-group button{
			color: #fff;
			font-weight:bold;
			background-color: #9C73C5;
			border-color: #ccc;
		}
		
		.btn-group {
			margin-right: 100px;
		}

		#zzimBtn button {
			color: red;
			font-size: 1rem;
			font-weight: bold;
			background-color: white;
		}
		
		pre {
			white-space : pre-wrap;
			word-break: break-all;
			overflow: auto;
			font-family: sans-serif;
		}
		
		#zzimOn{
			border: none;
			width: 50px;
			cursor: pointer;
		}
		
		#zzimOff{
			border: none;
			width: 50px;
			cursor: pointer;
		}
		
		

	</style>

	<div class="container">	
		<section class="product-details spad">
        <div class="container">
            <div class="row">            
                
                <div class="col-lg-6 col-md-6">    
                    <div class="product__details__pic">                                        
                        <div class="product__details__pic__item" style="width: 80%">                                                
						<c:if test="${bvo.img != null }">	                   
                            <img class="product__details__pic__item--large"
                                src="${pageContext.request.contextPath}/upload/${map.ro0 }" alt="큰사진">
						</c:if>
						<c:if test="${bvo.img == null }">	                   
                            <img class="product__details__pic__item--large"
                                src="/img/blank.png" alt="큰사진">
						</c:if>
                        </div>                        
                        
                        <div class="product__details__pic__slider owl-carousel">
							<c:forEach var="img" items="${map }">
                            <img data-imgbigurl="${pageContext.request.contextPath}/upload/${img.value }"
                                src="${pageContext.request.contextPath}/upload/${img.value }" alt="작은사진">

                            </c:forEach>
                        </div>   
                    </div> 
                </div>


                
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">

					<div class="row justify-content-end align-items-center" style="margin-bottom: 20px; margin-top: 0px; margin-left: 20px "> 
					<div class="btn-group" style="width: 100px; ">
						<c:if test="${(bvo.id == mvo.id) or (mvo.status == 'admin' )}">
							<button type="button" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/boardcontrol?type=modifyView&cPage=${pvo.nowPage}&ok=no&boardIdx=${bvo.boardIdx}'">수정하기</button>
							<button type="button" class="btn btn-primary" onclick="delete_ok()">삭제하기</button>
						</c:if>
					</div>
					</div>
                        
						<div id="zzimBtn">
							<c:if test="${isZZim == 0 }">
	                        	<button onclick="zzimOn()" id="zzimOn"><img src="${pageContext.request.contextPath}/img/zzimOn.png"></button> 
	                        </c:if>
							<c:if test="${isZZim == 1 }">
	                        	<button onclick="zzimOff()" id="zzimOff"><img src="${pageContext.request.contextPath}/img/zzimCancel.png"></button>
	                        </c:if>
                        </div>
                        
                        <h3>${bvo.title }</h3>
                        <h4>판매자 : ${bvo.id }</h4>
                        <h6>회원등급 : ${seller.grade }</h6>
                        <h6>작성일자 : (${bvo.regdate })</h6>
                        
                        <div class="product__details__rating">
<!--                             여기 등급 들어가야 함 -->
                            <span>(${bvo.cc } comment)</span>
                            <span>(${bvo.likes } like)</span>
                            <span>(${bvo.hit } read)</span>
                        </div>
                        <div class="product__details__price">${bvo.price }원</div>
                        
                        <div><p><pre>${bvo.content }</pre></p></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	<section>
		<table class="board-table">				                
		<tbody>
			<tr style="height: 10em;">
			<td id="content_align"colspan="4" style="padding-left:7%"> ${board.content }</td>
			</tr> 	                     	                   
		</tbody>
		<tfoot>
			<tr>
			<th scope="col" class="th-num">작성자</th>
            <th scope="col" class="th-title">댓글 내용</th>
            <th scope="col" class="th-date">작성일자</th>
            <th scope="col" class="th-date" colspan="2" style="width:20%;" >삭제</th>	                   
			</tr>
			
	        <!-- tr태그 이용 -->
	        <c:if test="${empty cmtList }">
	        	<tr>
	        		<th colspan="4">댓글이 없습니다.</th>
	        	</tr>
	        </c:if>
	        <c:if test="${not empty cmtList }">
	        	<c:forEach var="cmtvo" items="${cmtList }">
	        	<tr class="comment">
		        	<th>
		        		${cmtvo.id } 
		        	</th>
	        		<c:choose>		        	
		        	<c:when test="${cmtvo.id == mvo.id }">
		        		<td id="td_${cmtvo.commentIdx }" style="padding-left:3em; background-color: #F7E598;" >${cmtvo.content }</td>
			        	<td style="text-align: center;background-color: #F7E598;">${cmtvo.regdate }</td>
		               	<td colspan="2" style="padding-right: 6%;background-color: #F7E598;" id="btn_${cmtvo.commentIdx }">				               							            
		               	<input type="button" value="삭제" class="edit2 btn-cmt btn-dark" onclick="deleteCmt_go(${cmtvo.commentIdx })">               		
		               	</td>					        	
		        	</c:when>
		        	
		        	<c:when test="${cmtvo.id == bvo.id }">
		        		<td id="td_${cmtvo.commentIdx }" style="padding-left:3em; background-color: #C7CAF7;" >${cmtvo.content }</td>
			        	<td style="text-align: center;background-color: #C7CAF7;">${cmtvo.regdate }</td>
		               	<td colspan="2" style="padding-right: 6%;background-color: #C7CAF7;" id="btn_${cmtvo.commentIdx }">				               							                           		
		               	</td>					        	
		        	</c:when>		        	
		        	
		        	<c:otherwise>
		        		<td id="td_${cmtvo.commentIdx }" style="padding-left:3em;" >${cmtvo.content }</td>
			        	<td style="text-align: center;">${cmtvo.regdate }</td>			        	
		               	<td colspan="2" style="padding-right: 6%;" id="btn_${cmtvo.commentIdx }">
		               	</td>					        	
		        	</c:otherwise>
		        	</c:choose>	       
	        	</tr>	             
	        	</c:forEach>			        	
	        </c:if>
	        
	        
		</tfoot>      
		</table>
		</section>

		<section>
		<div id="board-comment">
		<div class="container">
			<form action="${pageContext.request.contextPath}/boardcontrol?type=insertCmt&boardIdx=${bvo.boardIdx }" method="post">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">작성자</th>
                    <th scope="col" class="th-title" colspan="2">내용</th>
                </tr>
                </thead>
                <tbody>
				<!--tr코드 forEach -->
                <tr>
					<td>
						<input type="text" value="${mvo.id }" readonly style="text-align: center; border:none" name="userid">
					</td>
					<td colspan="2">
						<textarea placeholder="내용을 입력해 주세요."cols="60" style="width: -webkit-fill-available; height: -webkit-fill-available;resize:none;height:auto" name="content"></textarea>
					</td>
	               	<td>
	               		<button type="submit" class="btn btn-dark"> 댓글 작성</button>		       
	               	</td>	               
                </tr>
                </tbody>
                <tfoot>   							                                     
                </tfoot>               
            </table>
			</form>
		</div>
		</div>
		</section>

	</div>

<%@include file ="/common/footer.jsp" %>

<script type="text/javascript">
	function zzimOn() {
		alert("찜하기");
		let zzimBtnChg = '<button onclick="zzimOff()" id="zzimOff"><img src="${pageContext.request.contextPath}/img/zzimCancel.png"></button>';
		$("#zzimBtn").html(zzimBtnChg);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/boardcontrol",
			type : "get",
			data : {
				type: "zzim",
				zzim: "on",
				boardIdx: "${bvo.boardIdx}",
				id: "${mvo.id}"
			},
			success: function(data){
				
			},
			error: function(){
				alert("error");
			}
		});
		
	}
	
	function zzimOff() {
		alert("찜하기 취소");
		let zzimBtnChg = '<button onclick="zzimOn()" id="zzimOn"><img src="${pageContext.request.contextPath}/img/zzimOn.png"></button> ';
		$("#zzimBtn").html(zzimBtnChg);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/boardcontrol",
			type : "get",
			data : {
				type: "zzim",
				zzim: "off",
				boardIdx: "${bvo.boardIdx}",
				id: "${mvo.id}"
			},
			success: function(data){
				
			},
			error: function(){
				alert("error");
			}
		});
		
	}
	
	
</script>