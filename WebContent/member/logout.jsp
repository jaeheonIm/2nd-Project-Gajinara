<%@page import="com.gaji.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<div id="container">
	<form action="${pageContext.request.contextPath}/member/controller?type=logout" method="post">
		<input type="hidden" name="id" value=${id }>
	</form>	
</div>
</body>
<script>
    alert("로그아웃 되었습니다.\n"
    		+ "메인 페이지로 이동합니다.");
    location.href = "${pageContext.request.contextPath}/member/controller?type=logout";
</script>
</html>
