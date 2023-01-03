<%@page import="com.gaji.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gaji.qna.vo.QnaVO" %>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<%@include file ="/common/headerQna.jsp" %>  
<style>
#text {
  height: auto;  /* 높이값 초기화 */
  line-height : normal;  /* line-height 초기화 */
  padding: .4em .4em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
  font-family: inherit;  /* 폰트 상속 */
  border-radius: 5px;
  border: 1px solid #9999997d;
}

</style>
<% 
System.out.println("qnaViewPwd.jsp페이지");
	String qnaIdx = request.getParameter("qnaIdx"); 
	MemberVO vo = (MemberVO)session.getAttribute("mvo"); 
	String qnaId = vo.getId();
	

%>
<div style="text-align:center; margin: 30px 0px 100px 0px;">
<form action="${pageContext.request.contextPath}/QnaController?type=qnaPwd" method="post" style="display:inline-block;">
	<table>
		<tbody>
			<tr>
				<th>비밀번호</th>
				<td><input type="qnaPwd" name="qnaPwd" id="text"></td>
				<td><input type="hidden" name="qnaIdx" value="<%=qnaIdx%>"></td>
				<td><input type="hidden" name="qnaId" value="<%=qnaId%>"></td>
				<td><input type="submit" value="확인"></td>&nbsp;&nbsp;
				<td><input type="button" value="이전으로" onclick="history.back()"></td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
<%@include file ="/common/footer2.jsp" %>  