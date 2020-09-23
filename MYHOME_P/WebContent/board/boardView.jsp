<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/templates/header.jsp">
	<jsp:param value="View Post" name="title" />
</jsp:include>

	<script>
		
	
		// List
		function fn_boardList(f) {
			f.action = '/MYHOME_P/boardList.board';
			f.submit();
		}
		
		// Reply
		function fn_replyInsertPage(f) {
			f.action = '/MYHOME_P/replyInsertPage.board';
			f.submit();
		}
		// Delete Post
		function fn_boardDelete(f) {
			if (confirm('Are you sure you want to delete the post?')) {
				f.action = '/MYHOME_P/boardDelete.board';
				f.submit();
			}
			
		}
	
	</script>
	<br/><br/><br/><br/>
	
	<form method="post">
		<div class="boardView">
			<span> Total: &nbsp; ${totalRecord} posts</span>
		</div>
		<hr>
		<div class="boardViewContent">
			writer: ${bDto.mId} <br/>
			title: ${bDto.bTitle} <br/>
			posted date: ${bDto.bRegDate} <br/>
			latest modify date: ${bDto.bLastModify}<br/>
			IP: ${bDto.bIp} <br/>
			views: ${bDto.bHit}<br/>
			content<br>
			<pre>${bDto.bContent}</pre>
		</div>	
		<div class="boardViewBtn">	
			<input type="hidden" name="page" value="${page}" />
			<input type="hidden" name="bNo" value="${bDto.bNo}" />
			<button type="button" id="boardInsertListBtn" class="btn btn-outline-dark" onclick="fn_boardList(this.form)">to list</button>
			<!--  <input type="button" value="To List" onclick="fn_boardList(this.form)" />  -->
			
			<!--  loginUser only can comment--> 
			<c:if test="${loginUser ne null and bDto.bDepth eq 0}">
				<button type="button" id="boardInsertListBtn" class="btn btn-outline-dark" onclick="fn_replyInsertPage(this.form)" >comment</button>
				<!-- <input type="button" value="comment" onclick="fn_replyInsertPage(this.form)" />  -->
			</c:if>
			
			<!--  loginUser only can delete --> 
			<c:if test="${loginUser.mId eq bDto.mId}">
				<button type="button" id="boardInsertListBtn" class="btn btn-outline-dark" onclick="fn_boardDelete(this.form)">delete</button>
				<!-- <input type="button" value="delete" onclick="fn_boardDelete(this.form)" />  -->
			</c:if>
		</div>
	</form>
	
<%@ include file="/templates/footer.jsp" %>