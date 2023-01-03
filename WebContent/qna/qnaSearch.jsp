<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gaji.member.vo.MemberVO" %>
<%@ page import="com.gaji.qna.vo.QnaVO" %>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="/common/headerQna.jsp" %>  

<head>
  <meta charset="UTF-8">
  <title>상품관리</title>
  <link rel="stylesheet" href="css/paginate.css">
  <link rel="stylesheet" href="css/ligne.css">
  <script type="text/javascript" src="js/paginate.js"></script>

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

<div class="container" style=" text-align: center;">
    <div class="section-title product__discount__title" style=" text-align: center;">
            <h2>Q&A</h2>
    </div>
              
		<form action="${pageContext.request.contextPath}/admin/adminController?type=searchQna" method="post" style="float:right;">
			<table>
				<tr style="margin-left::400px;">
					<td style="margin-right:-10px;">
					<input type="text" id="text" name="search" style="width:300px; float:right;" placeholder="아이디 또는 제목으로 검색"> 
					</td>
					
					<td>
						<input type="submit" value="검색" style="width:70px; height:35px; border-radius: 5px; border: 1px solid #9999997d;">
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
              <th scope="col">번호</th>
              <th scope="col">제목</th>
              <th scope="col">아이디</th>
              <th scope="col">날짜</th>
              <th scope="col">조회수</th>
            </tr>
        
          
          <c:forEach var="qvo" items="${qnaList }">
          
            <tr>
              	<td>${qvo.qnaIdx }</td>
              	<%
              	try {
			 		MemberVO vo = (MemberVO)session.getAttribute("mvo"); 
			 		if(vo.getId().equals("admin")){
			  		%>
              			<td style="text-align:left;"><a href="${pageContext.request.contextPath}/QnaController?type=qnaPwd&qnaIdx=${qvo.qnaIdx}&qnaId=<%=vo.getId()%>">${qvo.title }</a></td>
              		<%
			 		} else if (!vo.getId().equals(null)) {
			 		%>
			 			<td style="text-align:left;"> <a href="${pageContext.request.contextPath}/qna/qnaViewPwd.jsp?qnaIdx=${qvo.qnaIdx}">${qvo.title }</a></td>
			 		<%
			 		}
			 	} catch(Exception e) {
			 	%>	
			 		<td>
						<a href="void(0);" onclick="alert('로그인 후 이용가능합니다.');return false;">${qvo.title }</a>
					</td>
			 	<%	
				}
              	%>
              
              	<td>${qvo.id }</td>
    			<td>${qvo.regdate }</td>
    			<td>${qvo.hit }</td>
            </tr>
           
         </c:forEach>
           </tbody>
           	<tr>
			 <td colspan="5" height="3">
				<%
				try {
					MemberVO vo = (MemberVO)session.getAttribute("mvo"); 
			 		if(!vo.getId().equals("admin")){
					%>
					 <a href="${pageContext.request.contextPath}/QnaController?type=qnaWrite&id=${mvo.id}" class="primary-btn" style="float:right;">글쓰기</a>
					<%
					} 
				}catch(Exception e) {
				%>
					<a href="void(0);" onclick="alert('로그인 후 이용가능합니다.');return false;" class="primary-btn" style="float:right;">글쓰기</a>
				<%
				}
				%>
				
				</td>
				</tr>
        </table>
     
</div>
</body>
 <script>
	    let options = {
	        numberPerPage:14, //Cantidad de datos por pagina
	        goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
	        pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
	    };
	
	    let filterOptions = {
	        el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
	    };
	
	    paginate.init('.myTable',options,filterOptions);
	</script>        
<%@include file="/common/footer2.jsp" %>      
