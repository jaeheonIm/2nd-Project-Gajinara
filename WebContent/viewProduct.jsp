<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gaji.board.vo.BoardVO" %>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file ="/common/headerAdmin.jsp" %>
<style>

</style>


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"></h1>
                    <!--*************************** -->
                    <!--  여기부터 jsp 파일  			-->
                    <!--  script는 최하단에 작성		-->
                    <!--  스타일부분은 상단에 작성		-->
                    <!--*************************** -->
					<div class="section-title product__discount__title" style=" text-align: center;">
            			<h2>상품 상세</h2>
    				</div>
                    <div class="row">
						<div class="col-sm-2"></div>
						<div class="col-sm-4" style="margin:0px 0px 25px 300px; border: 1px solid  #4aa1d17d;  border-radius: 30px 10px; box-shadow: 3px 3px 3px 3px #80808063;">

				<form style="padding:20px 10px 30px 10px">
					
					<div class="mb-3 mt-3">
						<label for="boardIdx" class="form-label">글번호</label> <input type="text"
							class="form-control" id="boardIdx" name="boardIdx" value="${bvo.boardIdx}"
							disabled>
					</div>
					<div class="mb-3 mt-3">
						<label for="category" class="form-label">카테고리</label> <input type="text"
							class="form-control" id="category" name="category" value="${bvo.category}"
							disabled>
					</div>
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label> <input
							type="text" class="form-control" id="id" name="id"
							value="${bvo.id}" disabled>
					</div>
					
					<div class="mb-3">
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="title"
							value="${bvo.title}" disabled>
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label> <input
							type="text" class="form-control" id="content" name="content"
							value="${bvo.content}" disabled>
					</div>
					<div class="mb-3">
						<label for="price" class="form-label">가격</label> <input
							type="text" class="form-control" id="price" name="price"
							value="${bvo.price}" disabled>
					</div>
					<div class="mb-3">
						<label for="status" class="form-label">상태</label> <input
							type="text" class="form-control" id="status" name="status"
							value="${bvo.status}"disabled>
					</div>
					<div class="mb-3">
						<label for="regdate" class="form-label">작성날짜</label> <input
							type="text" class="form-control" id="regdate" name="regdate"
							value="${bvo.regdate}" disabled>
					</div>
					</form>
					
					
					</div>
					
				</div>
			
	</div>
			<div style="margin:15px 20px 100px 730px;" >
				<a href="${pageContext.request.contextPath}/admin/adminController?type=product" class="btn btn-outline-secondary" style="padding: 0.375rem 2.75rem">이전</a> 
				<a href="${pageContext.request.contextPath}/admin/updateProduct.jsp?boardIdx=${bvo.boardIdx}" class="btn btn-outline-secondary" style="padding: 0.375rem 2.75rem">수정</a>
				<a href="${pageContext.request.contextPath}/admin/adminController?type=productDelete&boardIdx=${bvo.boardIdx}" class="btn btn-outline-secondary" style="padding: 0.375rem 2.75rem" onclick="return confirm('삭제하겠습니까?');">삭제</a>
			<div>
			
			
			
		
					<!-- 여기까지 jsp -->
					
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
 <%@include file ="/common/footer2.jsp" %>