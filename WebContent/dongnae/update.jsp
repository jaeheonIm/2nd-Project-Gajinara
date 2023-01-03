<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/dongnae/header-blog.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		$("#check").on("click",function(){
			
			if($("#category option:selected").val().match("카테고리")){
				alert("카테고리를 선택해주세요.");
				$("#category option:selected").focus();
				return false;
			}		
			
			if($.trim($('#title').val()) == ''){
				alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}
			
			if($.trim($('#content').val()) == ''){
				alert("내용을 입력해주세요.");
				$('#content').focus();
				return false;
			}			
				
		});
	});
</script>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad" style="padding-top: 40px">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-7 order-md-1 order-1" style="flex:100%; max-width: 100%">
				    <div id="board-list">
				    	<form action="controller?type=update_board_ok" method="post" enctype="multipart/form-data">
					        <div class="container" style="width:inherit">				        
					            <table class="board-table">
					                <thead>
					                <tr>
					                    <th scope="col" class="th-num" style="width: 130px">					                    	
					                    	<select name="category">
			                    					<option selected="selected" value="${board.category }">${board.categoryName }</option>
					                    		<c:forEach var="category" items="${categoryList }">
					                    			<option value="${category.category }">${category.value }</option>
					                    		</c:forEach>
					                    	</select>
					                    </th>
					                    <th scope="col" class="th-title" style="text-align: left;">
					                    	<input type="text" value="${board.title }" style="width: -webkit-fill-available;" name="title">
					                    </th>
					                    <th scope="col" class="th-date"><input type="hidden" name="id" value="${mvo.id }">작성자:${mvo.id }</th>
					                </tr>
					                </thead>
					                <tbody>
						                <tr style="height: 10em;">
							                <td id="content_align"colspan="4" style="padding-left:7%;">
							                	<textarea style="width: -webkit-fill-available; height: 20em; margin-right: 15em; margin-left: 4em;" name="content">${board.content }</textarea>
							                </td>
						                </tr>
						                <tr>
						                	<td colspan="2" style="text-align: left;">
						                		<c:if test="${fn:length('${board.img}') >= 1 }">
						                			${board.img }
						                			<br>
						                		</c:if>
						                		<input type="file" name="filename">
						                	</td>
						                </tr> 						                	
					                </tbody>
					                <tfoot>
					                </tfoot>      
					            </table>
					            <div style="float: right; padding-top:10px;">
			               			<button id="check" type="submit" class="btn btn-dark" >수정</button>			       
			               			<button onclick="history.back()"type="button" class="btn btn-dark" >이전</button>			       
			                	</div>							            
					        </div>	
				        </form>									        
				    </div>			    
                </div>
            </div>
        </div>
    </section>

    <!-- Blog Details Section End -->

<%@include file="/dongnae/footer.jsp" %>