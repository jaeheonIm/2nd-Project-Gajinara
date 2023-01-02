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
				<div class="section-title product__discount__title" style="text-align:center;">
            		<h2>회원 수정</h2>
   				 </div>

				<form action="${pageContext.request.contextPath}/admin/adminController?type=memberUpdate&id=${mvo.id}" method="post">
					<div class="mb-3">
						<label for="id" class="form-label">아이디</label> 
						<input type="text" class="form-control" id="id" name="id" value="${mvo.id}" readonly>
					</div>
					<div class="mb-3 mt-3">
						<label for="name" class="form-label">이름</label> 
						<input type="text" class="form-control" id="name" name="name" value="${mvo.name}">
					</div>
					<div class="mb-3">
						<label for="pwd" class="form-label">비밀번호</label> 
						<input type="text" class="form-control" id="pwd" name="pwd" value="${mvo.pwd}">
					</div>
					<div class="mb-3">
						<label for="birth" class="form-label">생년월일</label> 
						<input type="text" class="form-control" id="birth" name="birth" value="${mvo.birth}">
					</div>
					<div class="mb-3">
						<label for="phone" class="form-label">전화번호</label> 
						<input type="text" class="form-control" id="phone" name="phone" value="${mvo.phone}">
					</div>
					
					<div class="mb-3">
						<label for="email" class="form-label">이메일</label> 
						<input type="text" class="form-control" id="email" name="email" value="${mvo.email}">
					</div>
					<div class="mb-3">
						<label for="roadaddress" class="form-label">도로명 주소</label> 
						<input type="text" class="form-control" id="roadaddress" name="roadaddress" value="${mvo.roadaddress}">
					</div>
					<div class="mb-3">
						<label for="detailaddress" class="form-label">상세 주소</label> 
						<input type="text" class="form-control" id="detailaddress" name="detailaddress" value="${mvo.detailaddress}">
					</div>
					
					<div class="mb-3">
						<label for="grade" class="form-label">현재 회원 등급</label> 
						<input type="text" class="form-control" id="gradeNow" name="gradeNow" value="${mvo.grade}" readonly><br>
      					<label for="grade" class="form-label">등급 변경 : &nbsp;&nbsp;</label> 
      					 <input type='radio'  name='grade' value='일반회원' <c:if test = "${mvo.grade eq '일반회원'}">checked="checked"</c:if>/>일반회원&nbsp;&nbsp;
					    <input type='radio' name='grade' value='우수회원' <c:if test = "${mvo.grade eq '우수회원'}">checked="checked"</c:if>/>우수회원&nbsp;&nbsp;
					    <input type='radio'  name='grade' value='최우수회원' <c:if test = "${mvo.grade eq '최우수회원'}">checked="checked"</c:if>/> 최우수회원
					</div>
					<div class="mb-3">
						<label for="status" class="form-label">현재 회원 상태</label> 
						<input type="text" class="form-control" id="statusNow" name="statusNow" value="${mvo.status}" readonly><br>
      					<label for="status" class="form-label">상태 변경 :</label> 
					    <input type='radio'  name='status' value='이용중' <c:if test = "${mvo.status eq '이용중'}">checked="checked"</c:if>/>이용중&nbsp;&nbsp;
					    <input type='radio' name='status' value='잠김' <c:if test = "${mvo.status eq '잠김'}">checked="checked"</c:if>/>잠김&nbsp;&nbsp;
					    <input type='radio'  name='status' value='탈퇴' <c:if test = "${mvo.status eq '탈퇴'}">checked="checked"</c:if>/>탈퇴
				
					</div>
			
				<div style="margin: 30px 20px 20px 120px;">
					<a href="${pageContext.request.contextPath}/admin/searchList.jsp" class="btn btn-outline-secondary">회원리스트</a>
					<input type="submit" value="수정완료" class="btn btn-outline-warning" />
				</div>
					</form>
			</div>
		</div>
	
            <!-- Footer -->
 <%@include file ="/common/footer2.jsp" %>