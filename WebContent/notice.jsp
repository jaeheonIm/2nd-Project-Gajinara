<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file ="/common/headerAdmin.jsp" %>  
<html>
<head>
<meta charset="UTF-8">
<title>공지 페이지</title>
</head>
<body>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-9">
			<h3 class="text-center">공지 등록</h3>
			<br>

			<form method="post">
				<div class="mb-3 mt-3">
					<label for="title" class="form-label">제목</label> 
					<input type="text" class="form-control" id="title" name="title" >
				</div>
				<div class="mb-3">
					<label for="content" class="form-label">내용</label>
					<p>
						<textarea cols="50" rows="10" class="form-control" name="content"></textarea>
					</p>
				</div>
				<div>
					<p> 
						<label for="file" class="form-label">파일</label> 
						<input type="file" name="filename">
					</p>
				</div>
				<a href="productMain.jsp" class="btn btn-outline-secondary">이전으로</a>
				<input type="button" value="수정완료" onclick="insert_go(this.form)"
					class="btn btn-outline-warning" />
			</form>
		</div>
	</div>
<script>
	function insert_go(frm) {
		frm.action = "insertNotice";
		frm.submit();
	}
</script>
</body>
</html>