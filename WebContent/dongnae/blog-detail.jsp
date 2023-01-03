<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/dongnae/header-blog.jsp"%>
<script>
	$(function(){
		$("#comment_btn").on("click",function(){
			
			if($("#commentId").val() == ''){
				alert("로그인 정보가 없습니다.\n로그인 페이지로 이동합니다.");
				location.href="${pageContext.request.contextPath}/member/login.jsp";
				return false;
			}		
			
			if($.trim($('#cmtcontent').val()) == ''){
				alert("댓글 내용을 입력해주세요.");
				$('#cmtcontent').focus();
				return false;
			}
						
		});
	});
</script>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad" style="padding-top: 40px">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5 order-md-1 order-2" style="max-width: 20%;">
                    <div class="blog__sidebar" style="padding-top: inherit;">
                        <div class="blog__sidebar__search">
                            <form action="${pageContext.request.contextPath}/dongnae/controller?type=search_all" method="post">
                                <input name="keyword" type="text" placeholder="우리 동네 검색(제목)">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>카테고리</h4>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board">전체</a></li>
								<c:forEach var="category" items="${Categories }">
								<li><a href="${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board&category=${category.category }">${category.value }</a></li>
								</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>       
                <div class="col-lg-8 col-md-7 order-md-1 order-1" style="flex:80%; max-width: 80%">
				    <div id="board-list">
				        <div class="container" style="width:inherit">
				            <table class="board-table">
				                <thead>
				                <tr>
				                    <th scope="col" class="th-num">${board.name }</th>
				                    <th scope="col" class="th-title">${board.title }(${board.cc })</th>
				                    <th scope="col" class="th-date">${board.regdate }</th>
				                    <th id="likes_board"scope="col" class="th-date">조회수: ${board.hit } 좋아요: ${board.likes }</th>
				                </tr>
				                </thead>
				                <tbody>
				                	<tr style="border-bottom: hidden; ">
				                		<td colspan="4"><img src="${pageContext.request.contextPath}/upload/${board.img }" ></td>
				                	</tr>
					                <tr style="height: 10em;">
					                	<td id="content_align" colspan="4" style="padding-left:7%; text-align: left; font-size:20px"> ${board.content }</td>
					                </tr>
					                <tr style="border-top: hidden;">
					                	<td colspan="4">
					                		<a id="likes"class="like btn btn-link" onclick="update_likes(${board.uriBoardIdx})">
  											<i class="fa fa-heart-o fa-2x">
  											</i>
  											<br>좋아요(${board.likes })										  							
  											</a>
				                		</td>
					                </tr> 	                     	                   
				                </tbody>
				                <tfoot>
							        <tr>
					                    <th scope="col" class="th-num">작성자</th>
					                    <th scope="col" class="th-title">댓글 내용</th>
					                    <th scope="col" class="th-date">작성일자</th>
					                    <th scope="col" class="th-date" colspan="2" style="width:20%;" >댓글 수정 삭제</th>	                   
					                    	                    
							        </tr>
							        <!-- tr태그 이용 -->
							        <c:if test="${empty commentList }">
							        	<tr>
							        		<th colspan="4">댓글이 없습니다.</th>
							        	</tr>
							        </c:if>
							        <c:if test="${not empty commentList }">
							        	<c:forEach var="comment" items="${commentList }">
								        	<tr class="comment">
									        	<th>
									        		${comment.name } 
									        	</th>
									        	<td id="td_${comment.uriCommentIdx }" style="padding-left:3em;" >${comment.content }</td>
									        	<td style="text-align: center;">${comment.regdate }</td>
									        	<c:if test="${comment.id == mvo.id || mvo.status == 'admin'}">
									               	<td colspan="2" style="padding-right: 6%;" id="btn_${comment.uriCommentIdx }">				               							            
									               		<input type="button" value="삭제" class="edit2 btn-cmt btn-dark" onclick="cmt_del(${comment.uriCommentIdx})">
				               							<input type="button" value="수정" class="edit1 btn-cmt btn-dark" id="${comment.uriCommentIdx }">	               		
									               	</td>					        	
								               	</c:if>	       
								        	</tr>	             
							        	</c:forEach>			        	
							        </c:if>
				                </tfoot>      
				            </table>
				            	<section>
							    <div id="board-comment">
							        <div class="container">
							        <form id="cmt_validation"action="${pageContext.request.contextPath}/dongnae/controller?type=comment_write" method="post">
								            <table class="board-table">
								                <thead>
								                <tr>
								                    <th scope="col" class="th-num">작성자</th>
								                    <th scope="col" class="th-title" colspan="2">내용</th>
								                </tr>
								                </thead>
								                <tbody>
												<!--tr코드 forEach -->
								                <tr>
													<td>
														<input type="text" value="${mvo.id }" readonly style="text-align: center; border:none" id="commentId" name="userid">
													</td>
													<td colspan="2">
														<textarea placeholder="내용을 입력해 주세요."cols="60" style="width: -webkit-fill-available; height: -webkit-fill-available;resize:none;height:auto" id="cmtcontent" name="cmtcontent"></textarea>
													</td>
									               	<td>
									               		<button id="comment_btn" type="submit" class="btn btn-dark"> 댓글 작성</button>		       
									               	</td>	               
								                </tr>
								                </tbody>
								                <tfoot>								                  									               	
								                </tfoot>               
								            </table>
							            </form>
							            <div style="float: right; padding-top:10px;">
					               			<button type="button" onclick="location.href='${pageContext.request.contextPath}/dongnae/controller?type=moveTo_Board'" class="btn btn-dark">목록</button>		       
						                	<c:if test="${board.id == mvo.id || mvo.status =='admin'}">
							               		<button type="button" onclick="location.href='${pageContext.request.contextPath}/dongnae/controller?type=update_board'" class="btn btn-dark">수정</button>		       
							               		<button type="button" onclick="delete_check()" class="btn btn-dark">삭제</button>		       
						                	</c:if>
					                	</div>								            
							        </div>
							    </div>        
							</section>	
				        </div>										        
				    </div>			    
                </div>
            </div>
        </div>
    </section>

    <!-- Blog Details Section End -->

<%@ include file="/dongnae/footer.jsp"%>
<script>
function goBack(){	
	history.back();
}

function delete_check(){
	if(!confirm("삭제하시겠습니까? Y / N")){
		alert("아니오를 선택하셨습니다.")
	} else {
		location.href="${pageContext.request.contextPath}/dongnae/controller?type=delete_board";
	}
}	

$(function(){
	$("td").on("click",function(){
		$(".edit1").click(function(){
			var id = $(this).attr('id');
			var txt = $('#td_'+id).text();
	        $('#td_'+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt
	                +"</textarea>");
	        $('#btn_'+id).html(
	              "<input type='button' class='btn-cmt btn-dark' style='margin-right:15%;' value='확인' onclick='up("+id+")'>");
		});
	});
});

function up(id) {
    var replytext = $('#tt_'+id).val();
    var formData = "uriCommentIdx="+id+'&content='+replytext
        +"&uriBoardIdx=${board.uriBoardIdx}";
        console.log(replytext);
        console.log(formData);
        console.log(id);
    $.ajax("${pageContext.request.contextPath}/dongnae/controller?type=comment_Update",{
    	type : "post",
    	data : formData,
    	dataType:"json",
    	success : function(data){    		
    		console.log(data);
    		console.log(data.content);
				$('#td_'+id).html(data.content);
		        $('#btn_'+id).html(
		                "<input type='button' class='btn-cmt btn-dark' value='삭제' onclick='cmt_del("+id +")'> "
		                +"<input type='button' class='edit1 btn-cmt btn-dark' value='수정' id='"+id+"'>");      
    	}
   	});
 };
 
 function lst(){
	 
	 
 }
 
 function cmt_del(commentIdx){
	if(!confirm("삭제하시겠습니까? Y / N")){
		alert("아니오를 선택하셨습니다.")
		
	} else {
		var formData = "uriCommentIdx="+commentIdx+"&uriBoardIdx=${board.uriBoardIdx}";
		console.log(commentIdx);
		console.log(formData);
		
		$.ajax("${pageContext.request.contextPath}/dongnae/controller?type=comment_Delete",{
			type: "post",
			data: formData,
			success : function(data){
				console.log(data);
				console.log("status 2로 변경");
				location.replace(location.href);
			}
		});
	}	 
 }
 
 var count = 0;
 function update_likes(uriBoardIdx){
	 var formData = "uriBoardIdx="+uriBoardIdx;	 
	 if(count == 0){
		 $.ajax("${pageContext.request.contextPath}/dongnae/controller?type=updateLikes",{			
			 type : "get",
			 data : formData,
			 dataType:"json",
			 success : function(data){				 
				 console.log(data);				
					let htmlTag ="";
					$.each(data,function(key,value){
						htmlTag += "<a id='likes' class='like btn btn-link'>";
		                htmlTag += "<i class='fa fa-heart fa-2x' style='color:red'></i>";
		  		        htmlTag += "<br>좋아요" + "(" + value + ")</a>"
		  		      
		  		        $("#likes").html(htmlTag);		  		        	  		      	
		  		        $("#likes_board").text('조회수: ${board.hit } 좋아요:' + value);	  	
		  		        count++;
					});					
			 },			 
			error : function(jqXHR, textStatus, errorThrown){ //에러가 발생했냐
				count = 0;
				alert("Ajax 처리 실패 : \n"
						+ "jqXHR.readyState" + jqXHR.readyState + "\n"
						+ "textStatus" + textStatus + "\n"
						+ "errorThrown" + errorThrown);			
			}
		 });
	 } else {
		 alert("이미 좋아요를 누르셨습니다.");
		 return false;
	 }
 }
</script>
</body>

</html>