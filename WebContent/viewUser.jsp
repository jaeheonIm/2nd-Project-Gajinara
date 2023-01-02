<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.gaji.member.vo.MemberVO" %>
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
         			<h2>회원 상세</h2>
				</div>
			<div class="row">
				<div class="col-sm-2"></div>
						<div class="col-sm-3" style="border: 1px solid #4aa1d17d; margin:0px 0px 25px 380px; border-radius: 30px 10px; box-shadow: 3px 3px 3px 3px #80808063;" >
						<form style="padding:20px 10px 30px 10px">
							
							<div class="mb-3 mt-3 ">
								<label for="id" class="form-label">아이디 </label> 
									<input type="text" class="form-control" id="id" name="id"
									value="${mvo.id}" disabled>
							</div>
							<div class="mb-3 mt-3">
								<label for="name" class="form-label">이름 </label>  <input type="text"
									class="form-control" id="form-control" name="name" value="${mvo.name}"
									disabled>
									<div class="mb-3 mt-3">
							<label for="birth" class="form-label">생년월일</label> <input
								type="text" class="form-control" id="birth" name="birth"
								value="${mvo.birth}" disabled>
							</div>
							</div>
							<div class="mb-3 mt-3">
								<label for="pwd" class="form-label">비밀번호</label> <input
									type="text" class="form-control" id="pwd" name="pwd"
									value="${mvo.pwd}" disabled>
							</div>
							<div class="mb-3 mt-3">
								<label for="phone" class="form-label">전화번호</label> <input
									type="text" class="form-control" id="phone" name="phone"
									value="${mvo.phone}" disabled>
							</div>
							<div class="mb-3 mt-3">
								<label for="email" class="form-label">이메일</label> <input
									type="text" class="form-control" id="email" name="email"
									value="${mvo.email}" disabled>
							</div>
							<div class="mb-3 mt-3">
								<label for="roadaddress" class="form-label">도로명 주소</label> <input
									type="text" class="form-control" id="roadaddress" name="roadaddress"
									value="${mvo.roadaddress}" disabled>
							</div>
							<div class="mb-3 mt-3">
								<label for="detailaddress" class="form-label">상세 주소</label> <input
									type="text" class="form-control" id="detailaddress" name="detailaddress"
									value="${mvo.detailaddress}" disabled>
							</div>
							
							<div class="mb-3 mt-3">
								<label for="grade" class="form-label">등급</label> <input
									type="text" class="form-control" id="grade" name="grade"
									value="${mvo.grade}" disabled>
							</div>
							<div class="mb-3 mt-3">
								<label for="status" class="form-label">상태</label> <input
									type="text" class="form-control" id="status" name="status"
									value="${mvo.status}" disabled>
							</div>
							</form>
							
							
							</div>
							</div>
							</div>
							
								<div style="margin: 15px 20px 100px 750px;">
									<a href="searchList.jsp" class="btn btn-outline-secondary" style="padding: 0.375rem 2.75rem">이전</a> 
								
									<a href="adminController?type=searchIdx&idx=${mvo.idx}" class="btn btn-outline-secondary" style="padding: 0.375rem 2.75rem">수정</a>
									<a href="adminController?type=memberDelete&id=${mvo.id}" class="btn btn-outline-secondary" style="padding: 0.375rem 2.75rem" onclick="return confirm('탈퇴처리 하겠습니까?');">탈퇴</a>
									<!--  <input type="button" value="탈퇴" onclick="delete(this.form)" class="btn btn-outline-danger" />-->
								
								</div>
						
				
				             
				
				          <!-- Footer -->
<%@include file ="/common/footer2.jsp" %>