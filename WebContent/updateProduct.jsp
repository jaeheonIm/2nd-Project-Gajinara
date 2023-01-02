<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gaji.member.vo.MemberVO" %>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<%@include file ="/common/headerAdmin.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    
                    
                   
                    <!--*************************** -->
                    <!--  여기부터 jsp 파일  			-->
                    <!--  script는 최하단에 작성		-->
                    <!--  스타일부분은 상단에 작성		-->
                    <!--*************************** -->
                    
			
				<div class="col-sm-4" style="margin: 70px 100px 200px 550px; font-size:1.1rem;">
				<div class="section-title product__discount__title" style=" text-align: center;">
            		<h2>상품 수정하기</h2>
    			</div>

				<form action="${pageContext.request.contextPath}/admin/adminController?type=productUpdate&boardIdx=${bvo.boardIdx}" method="post">
					<div class="mb-3 mt-3">
						<label for="boardIdx" class="form-label">글번호</label> 
						<input type="text" class="form-control" id="boardIdx" name="boardIdx" value="${bvo.boardIdx}" disabled>
					</div>
					<div class="mb-3">
      					<label for="category" class="form-label">카테고리 변경 :</label> <br>
					    <input type='radio'  name='category' value='가전제품' <c:if test = "${bvo.category eq '가전제품'}">checked="checked"</c:if>/>가전제품&nbsp;
					    <input type='radio' name='category' value='도서' <c:if test = "${bvo.category eq '도서'}">checked="checked"</c:if>/>도서&nbsp;&nbsp;
					    <input type='radio'  name='category' value='식품' <c:if test = "${bvo.category eq '식품'}">checked="checked"</c:if>/>식품
					    <input type='radio'  name='category' value='스포츠용품' <c:if test = "${bvo.category eq '스포츠용품'}">checked="checked"</c:if>/>스포츠용품<br>
					    <input type='radio'  name='category' value='악세사리' <c:if test = "${bvo.category eq '악세사리'}">checked="checked"</c:if>/>악세사리&nbsp;
					    <input type='radio'  name='category' value='화장품' <c:if test = "${bvo.category eq '화장품'}">checked="checked"</c:if>/>화장품 
					    <input type='radio'  name='category' value='가구' <c:if test = "${bvo.category eq '가구'}">checked="checked"</c:if>/>가구
					    <input type='radio'  name='category' value='반려동물용품' <c:if test = "${bvo.category eq '반려동물용품'}">checked="checked"</c:if>/>반려동물용품
					</div>
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label> <input
							type="text" class="form-control" id="id" name="id"
							value="${bvo.id}" disabled>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="title"
							value="${bvo.title}">
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label> <input
							type="text" class="form-control" id="content" name="content"
							value="${bvo.content}">
					</div>
					
					<div class="mb-3">
						<label for="price" class="form-label">가격</label> <input
							type="text" class="form-control" id="price" name="price"
							value="${bvo.price}">
					</div>
					
					<div class="mb-3">
						<label for="status" class="form-label">현재 게시글 상태</label> 
						<input type="text" class="form-control" id="statusNow" name="statusNow" value="${bvo.status}" readonly><br>
      					<label for="status" class="form-label">상태 변경 :</label> 
					    <input type='radio'  name='status' value='판매중' <c:if test = "${bvo.status eq '판매중'}">checked="checked"</c:if>/>판매중&nbsp;&nbsp;
					    <input type='radio' name='status' value='판매완료' <c:if test = "${bvo.status eq '판매완료'}">checked="checked"</c:if>/>판매완료&nbsp;&nbsp;
					    <input type='radio' name='status' value='삭제' <c:if test = "${bvo.status eq '삭제'}">checked="checked"</c:if>/>삭제&nbsp;&nbsp;
					</div>
				
			
				<div style="margin: 30px 0px 0px 120px;">
					<a href="${pageContext.request.contextPath}/admin/productMain.jsp" class="btn btn-outline-secondary">상품리스트</a>
					<input type="submit" value="수정완료" class="btn btn-outline-warning" />
				</div>
</form>
</div>
		</div>
					
               

            <!-- Footer -->
 <%@include file ="/common/footer2.jsp" %>