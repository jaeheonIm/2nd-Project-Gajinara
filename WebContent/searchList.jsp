<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@include file ="/common/headerAdmin.jsp" %>
<head>
  <meta charset="UTF-8">
  <title>회원관리</title>
  <link rel="stylesheet" href="css/paginate.css">
  <link rel="stylesheet" href="css/ligne.css">
  <script type="text/javascript" src="js/paginate.js"></script>

 <style>
	#backbanner {
		background-image: url("${pageContext.request.contextPath}/img/hero/banner.jpg");    
		background-size : contain;
	}
	#text {
	width: 150px;  /* 원하는 너비 설정 */ 
  height: auto;  /* 높이값 초기화 */
  line-height : normal;  /* line-height 초기화 */
  padding: .4em .4em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
  font-family: inherit;  /* 폰트 상속 */
  border-radius: 5px;
  border: 1px solid #9999997d;
 
	}
	</style>
</head>
<body>
<div class="container" style=" text-align: center; margin-bottom:60px;" >
    <div class="section-title product__discount__title" style="text-align: center;">
            <h2>회원관리</h2>
    </div>
    
    <form action="adminController?type=search" method="post">
		<table  style="margin-left: 270px; ">
			<tr>
			<td>
				<select name="status" >
					<option value="선택">회원상태</option>
					<option value="이용중">이용중</option>
					<option value="잠김">잠김</option>
					<option value="탈퇴">탈퇴</option>
				</select> 
				</td>
				<td>
				<select name="grade" >
					<option value="선택">회원등급</option>
					<option value="일반회원">일반회원</option>
					<option value="우수회원">우수회원</option>
					<option value="최우수회원">최우수회원</option>
				</select>
				</td>
				<td>
				<input type="text" id="text" name="id" placeholder="아이디">
				<input type="text" id="text" name="name" placeholder="이름">
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
            <th>회원번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>등급</th>
            <th>상태</th>
        </tr>
        
        <c:forEach var="vo" items="${list }">
			<tr>
			<td>${vo.idx }</td>
				<td><a href="${pageContext.request.contextPath}/admin/adminController?type=searchId&id=${vo.id}">${vo.id }</a></td>
				<td>${vo.name }</td>
				<td>${vo.grade }</td>
				<td>${vo.status }</td>
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