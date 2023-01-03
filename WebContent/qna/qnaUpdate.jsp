<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.gaji.qna.vo.QnaVO" %>
<!DOCTYPE html>
<html lang="en">
<%@include file ="/common/headerQna.jsp" %>  



 <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
               		 <h6><span class="icon_tag_alt"></span> 상담 전화번호 및 오시는 길을 확인하시려면 <a href="contact.jsp">여기</a>를 클릭하세요.
                    	</h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>Q&A</h4>
                <form action="QnaController?type=qnaUpdate&qnaIdx=${qvo.qnaIdx}" method="post">
                   
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="checkout__input">
                                        <p>제목<span>*</span></p>
                                        <input type="text" id="title" name="title" value="${qvo.title}">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>전화번호<span>*</span></p>
                                        <input type="text" id="phone" name="phone" value="${qvo.phone}">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>이메일<span>*</span></p>
                                        <input type="text" id="email" name="email" value="${qvo.email}">
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-lg-12" style="margin: 0px -40px -3px 0px;">
                                    <div class="checkout__input">
                                        <p>문의 내용<span>*</span></p>
                                         <p><textarea class="form-control" cols="50" rows="10" id="content" name="content"  style="white-space: pre;">${qvo.content }</textarea></p>
                                    </div>
                                </div>
               				</div>	
                            
                             <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>파일업로드</p>
										<input type="file" name="files" multiple>
                                    </div>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="col-lg-4" style="margin: 0px 0px 40px 0px;">
                               		 
                               		 <p>문의글 비밀번호<span>*</span></p>
                                		<input type="text" id="qnaPwd" name="qnaPwd" value="${qvo.qnaPwd }">
                            	</div>
                            </div>
                          
							<input type="submit" value="작성완료" class="btn text-white" style="background-color: rgba(115, 56, 173, 0.7);" >
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    
    <%@include file ="/common/footer2.jsp" %>      