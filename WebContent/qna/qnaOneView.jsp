<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.gaji.qna.vo.QnaVO" %>
<%@ page import="com.gaji.member.vo.MemberVO" %>
<%@include file ="/common/headerQna.jsp" %>     

 <section>   
    <div class="container">
		<div class="row">
			<table class="table table-striped" style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${qvo.title }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${qvo.id }</td>
					
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${qvo.regdate }</td>
					</tr>
					<tr>
						<td colspan="3">
						
						
						<c:forEach var="img" items="${array}">       
                            <img src="${pageContext.request.contextPath}/qna/img/${img }" alt="사진" style="width:300px;">
						 </c:forEach>
						
						
						</td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;"><pre style="font-family:'Gowun Dodum', sans-serif; font-size:16px">${qvo.content }</pre></td>
					</tr>
				</tbody>
			</table>
			<div style="width:90%">
				<a href="${pageContext.request.contextPath}/QnaController?type=qnaMain" class="btn btn-outline-secondary">이전</a> 
				<%
			 	MemberVO vo = (MemberVO)session.getAttribute("mvo"); 
			 	QnaVO qvo = (QnaVO)session.getAttribute("qvo"); 
				
			 	if(  vo.getId().equals(qvo.getId()) || vo.getId().equals("admin")) {
			 	%>
					<a href="${pageContext.request.contextPath}/QnaController?type=searchIdx&qnaIdx=${qvo.qnaIdx}" class="btn btn-outline-secondary">수정</a>
					<a href="${pageContext.request.contextPath}/QnaController?type=qnaDelete&qnaIdx=${qvo.qnaIdx}" class="btn btn-outline-secondary" onclick="return confirm('삭제하겠습니까?');">삭제</a>
					</div>
			 	<%
			 	}
			 	
			 	if(vo.getId().equals("admin")){
				%>
					<a href="${pageContext.request.contextPath}/admin/adminController?type=qnaRe&id=<%= vo.getId()%>&qnaIdx=${qvo.qnaIdx}&qnaPwd=${qvo.qnaPwd }" class="btn btn-outline-secondary">답글쓰기</a>
				<%
				}
				%>
		</div>
	</div>
</section>	

	<%@include file ="/common/footer2.jsp" %>