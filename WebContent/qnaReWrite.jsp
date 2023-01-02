<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@include file ="/common/headerAdmin.jsp" %>  
<%
	String qnaIdx = request.getParameter("qnaIdx");
	String qnaPwd = request.getParameter("qnaPwd");
%>

 <section class="checkout spad">
       <div class="container">
            <div class="checkout__form">
                <h4>Q&A</h4>
                <form action="${pageContext.request.contextPath}/admin/adminController?type=qnaReOk&id=${mvo.id}&qnaIdx=<%=qnaIdx%>" method="post">
                   
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type="text" id="title" name="title" value="  ┖[답변] "> 
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>답변 내용<span>*</span></p>
                                         <p><textarea class="form-control" cols="50" rows="10" id="content" name="content"></textarea></p>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="checkout__input">
                                <p>문의글 비밀번호</p>
                                <input type="text" id="qnaPwd" name="qnaPwd" value="<%=qnaPwd%>" style="width:20%;" readonly>
                            </div>
							<input type="submit" value="작성완료" class="btn text-white" style="background-color: rgba(115, 56, 173, 0.7);" >
                    	</div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    
    <%@include file ="/common/footer2.jsp" %>      