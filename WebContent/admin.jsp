<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gaji.member.vo.MemberVO;" %>
<%
	MemberVO vo = (MemberVO)request.getAttribute("vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script>
	function all_search(frm) {
		frm.action = "list"; // -- list 요청을 처리해줄 controller 생성(ListController 서블릿) index.jsp -> ListController -> list.jsp
	}
	window.onload = function () {
		all_search(this.form);
	}
</script>
</head>
<body>

	
	<!-- 
	<form action="*" method="post">
		<h3>회원관리 페이지</h3>
		<input type="button" value="회원관리" onclick="all_search(this.form)">
		<hr>
	</form>
	 -->

</body>
</html>