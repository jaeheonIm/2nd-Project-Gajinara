<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<%@include file ="/common/headerAdmin.jsp" %>  
<head>
  <meta charset="UTF-8">
  <title>상품관리</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/paginate.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ligne.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/paginate.js"></script>

 <style>
	#backbanner {
		background-image: url("${pageContext.request.contextPath}/img/hero/banner.jpg");    
		background-size : contain;
	}
	#text {
  height: auto;  /* 높이값 초기화 */
  line-height : normal;  /* line-height 초기화 */
  padding: .3em .3em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
  font-family: inherit;  /* 폰트 상속 */
  border-radius: 5px;
  border: 1px solid #9999997d;
 
	}
	</style>
</head>
<body>
<div class="container" style=" text-align: center; margin-bottom:60px;">
    <div class="section-title product__discount__title" style=" text-align: center;">
            <h2>상품관리</h2>
    </div>
						
		<form action="${pageContext.request.contextPath}/admin/adminController?type=searchProduct" method="post">
			<table  style="margin-left: 200px; width:70%;">
				<tr>
					<td>
						<select name="category" >
							<option value="카테고리">카테고리</option>
							<option value="가전제품">가전제품</option>
							<option value="도서">도서</option>
							<option value="식품">식품</option>
							<option value="스포츠용품">스포츠용품</option>
							<option value="악세사리">악세사리</option>
							<option value="화장품">화장품</option>
							<option value="가구">가구</option>
							<option value="반려동물용품">반려동물용품</option>
						</select> 
					</td>
					<td>
						<select name="status" >
							<option value="판매상태">판매상태</option>
							<option value="판매중">판매중</option>
							<option value="판매완료">판매완료</option>
							<option value="삭제">삭제</option>
						</select>
					</td>
				
					<td>
					아이디 <input type="text" id="text" name="id" style="width:30%;"> 
					제목 <input type="text" id="text" name="title" style="width:50%;">
					</td>
					
					<td>
						<input type="submit" value="검색" style="width:70px; height:39px; border-radius: 5px; border: 1px solid #9999997d;">
					</td>
				</tr>
			</table>
		</form>
     
     
		<div class="panel">
		        <div class="body">
		            <div class="input-group">
		               <!--   <label for=""></label>
		                <input type="search" id="searchBox" placeholder="Filtrar..."> -->
		             <input type="hidden" id="searchBox" placeholder="Filtrar...">
		            </div>
		        </div>
		    </div>
		    <table class="myTable table hover">
		        <tbody>
					<tr>
						<td>번호</td>
						<td>카테고리</td>
						<td>아이디</td>
						<td>제목</td>
						<td>내용</td>
						<td>가격</td>
						<td>판매상태</td>
						<td>찜</td>
						<td>조회수</td>
						<td>작성날짜</td>
					</tr>

					<c:forEach var="bvo" items="${productList }">
						<tr>
							<td>${bvo.boardIdx }</td>
							<td>${bvo.category }</td>
							<td>${bvo.id }</td>
							<c:choose>
								<c:when test="${fn:length(bvo.title) gt 21}">
									<td>
									<a href="${pageContext.request.contextPath}/admin/adminController?type=productIdx&boardIdx=${bvo.boardIdx}">
									${fn:substring(bvo.title,0,20) }
									</a>
									</td>
								</c:when>
								<c:otherwise>
									<td>
									<a href="${pageContext.request.contextPath}/admin/adminController?type=productIdx&boardIdx=${bvo.boardIdx}">${bvo.title }</a>
									</td>
								</c:otherwise>
							</c:choose>							
							<c:choose>
								<c:when test="${fn:length(bvo.content) gt 21}">
									<td>${fn:substring(bvo.content,0,20)}....</td>
								</c:when>
								<c:otherwise>
									<td>${bvo.content }</td>
								</c:otherwise>
							</c:choose>
							<td>${bvo.price }</td>
							<td>${bvo.status }</td>
							<td>${bvo.likes }</td>
							<td>${bvo.hit }</td>
							<td>${bvo.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	<script>
	
	    let options = {
	        numberPerPage:10, //Cantidad de datos por pagina
	        goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
	        pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
	    };
	
	    let filterOptions = {
	        el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
	    };
	
	    paginate.init('.myTable',options,filterOptions);
	</script>          
<%@include file ="/common/footer2.jsp" %>