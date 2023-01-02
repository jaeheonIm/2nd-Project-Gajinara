<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet"/>

<!-- Css Styles -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Dongnae.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<%@include file="/common/header_board.jsp" %>

<style>
	#thumbBox{
		height: 200px;
	}

	#thumbBox div img {
		width: 100%;
	}

</style>

<div class="container">
	<section class="blog-details spad" style="padding-top: 0px">
    <div class="container">
		<h3>안녕하세요 ${mvo.id } 님</h3>
		<br />
		<h4>글쓰기 페이지 입니다</h4>

		<div class="row">
        <div class="col-lg-8 col-md-7 order-md-1 order-1" style="flex: 100%; max-width: 100%">
			<div id="board-list">
            <form name="firstForm" action="${pageContext.request.contextPath}/boardcontrol?type=writeboard&ok=ok"method="post" enctype="multipart/form-data">
				<table class="table">
                <tbody>
				<tr>
                    <td width="20%">
						<select name="category" id="category">
                        <option label="text" selected>카테고리를 선택하세요</option>
                        <c:forEach var="cvo" items="${caList }">
                        <option value="${cvo.value }">${cvo.value }</option>
                        </c:forEach>
						</select>
                    </td>                    
                    
                    <td><input type="button" value="글쓰기" onclick="write_go()" class="site-btn" style="float: right"/></td>
				</tr>
				
				<tr>
                    <th style="text-align: center; vertical-align: middle">
					제목
                    </th>
                    <td>
					<input type="text" value="" id="title" placeholder="제목을 입력해주세요" style="width: -webkit-fill-available" name="title"/>
                    </td>
				</tr>
				<tr>
                    <th style="text-align: center; vertical-align: middle">내용
                    </th>
                    <td>
					<textarea name="content" placeholder="내용을 입력해주세요" style="width: 100%; height: 20em"></textarea>
                    </td>
				</tr>
                <tr>
                    <th style="text-align: center; vertical-align: middle">가격
                    </th>
                    <td>
                    <input type="text" name="price" value="" id="price" placeholder="가격을 입력해주세요" style="width: 100%"/>
                    </td>
                </tr>
                <tr>
                    <th style="text-align: center; vertical-align: middle">파일입력1</th>
                    <td>
						<input class="imgs" accept="image/*" type="file" name="img1" style="width: 100%" onchange="setThumbnail1(event)"/>
                    </td>
				</tr>
				<tr>
                    <th style="text-align: center; vertical-align: middle">파일입력2</th>
                    <td>
						<input class="imgs" accept="image/*" type="file" name="img2" style="width: 100%" onchange="setThumbnail2(event)"/>
                    </td>
				</tr>
                <tr>
                    <th style="text-align: center; vertical-align: middle">파일입력3</th>
                    <td>
						<input class="imgs" accept="image/*" type="file" name="img3" style="width: 100%" onchange="setThumbnail3(event)"/>
                    </td>
				</tr>
				<tr>
                    <th style="text-align: center; vertical-align: middle">파일입력4</th>
                    <td> 
						<input class="imgs" accept="image/*" type="file" name="img4" style="width: 100%" onchange="setThumbnail4(event)"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
						<div class="row" id="thumbBox">
							<div class="col-lg-3" >								
								<img id="thumb1" />
							</div>
							<div class="col-lg-3">								
								<img id="thumb2" />
							</div>
							<div class="col-lg-3">								
								<img id="thumb3" />
							</div>
							<div class="col-lg-3">								
								<img id="thumb4" />
							</div>
						</div>
                    </td>
				</tr>
                </tbody>
			</table>
			
            </form>
			</div>
        </div>
    </div>
	</section>
</div>

<script type="text/javascript">
    $(function (){$(".imgs").change(function () {
        var imgfile = this.value;
        var imgfilelength = imgfile.length;
        var lastDot = imgfile.lastIndexOf(".");
        var imgExtension = imgfile.substring(lastDot + 1, imgfilelength);

        var imgimgExtensions = ["jpg", "png", "gif", "jpeg", "webp"];

        for (let i = 0; i < imgimgExtensions.length; i++) {
			if (imgimgExtensions[i] == imgExtension) {
            return;
		}
    }

		alert("확장자가 잘못되었습니다\njpg, png, gif, jpeg, webp 사용가능");
			this.value = "";
		});
    });

    function setThumbnail1(event) {
		var reader = new FileReader();
		reader.onload = function (event) {
        var img = document.getElementById("thumb1");
        img.setAttribute("src", event.target.result); //이미지 주소를 변경해줌
		};
		reader.readAsDataURL(event.target.files[0]);
    }

    function setThumbnail2(event) {
		var reader = new FileReader();
		reader.onload = function (event) {
        var img = document.getElementById("thumb2");
        img.setAttribute("src", event.target.result); //이미지 주소를 변경해줌
		};
		reader.readAsDataURL(event.target.files[0]);
    }
    function setThumbnail3(event) {
		var reader = new FileReader();
		reader.onload = function (event) {
        var img = document.getElementById("thumb3");
        img.setAttribute("src", event.target.result); //이미지 주소를 변경해줌
		};
		reader.readAsDataURL(event.target.files[0]);
    }
    function setThumbnail4(event) {
		var reader = new FileReader();
		reader.onload = function (event) {
        var img = document.getElementById("thumb4");
        img.setAttribute("src", event.target.result); //이미지 주소를 변경해줌
		};
		reader.readAsDataURL(event.target.files[0]);
    }

    function write_go() {
		if (isNaN(price.value)) {
        console.log("숫자 아님");
        alert("가격에 숫자를 입력해주세요");
        price.value = "";
        price.focus();
        return;
	}

	if (price.value.trim() == "") {
        console.log("가격 입력 안됨");
        alert("가격을 입력해주세요");
        price.value = "";
        price.focus();
        return;
	}

	if (title.value.trim() == "") {
        alert("제목을 입력해주세요");
        title.value = "";
        title.focus();
        return;
	}

	if (category.value.trim() == "카테고리를 선택하세요") {
        alert("카테고리를 선택해주세요");
        return;
	}



	firstForm.submit();
    }
</script>

</div>
<!-- 	글쓰기 버튼 - 드랍다운으로 분류를 여기서 정할 수 있어도 좋을듯 / 글 쓸 때 변수 한개 더 줘서, 같은 커맨드 사용하면 편할듯 -->

<%@include file ="/common/footer.jsp" %>