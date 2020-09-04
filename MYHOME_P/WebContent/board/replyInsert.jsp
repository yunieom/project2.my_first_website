<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/templates/header.jsp">
	<jsp:param value="Write a comment" name="title" />
</jsp:include>
	<script>
		function fn_replyInsert(f) {
			f.action='/MYHOME_P/replyInsert.board';
			f.submit();
		}
	</script>



	<form method="post">
		<h3>Write a Comment</h3>
		
		Writer <input type="text" name="mId" value="${loginUser.mId}" readonly /><br/>
		Title <input type="text" name="bTitle" autofocus/><br/>
		Content <br/> <textarea name="bContent" rows="5" cols="30"></textarea>
		<br/><br/>
		
		<input type="hidden" name="bNo" value="${param.bNo}" />
		<input type="hidden" name="page" value="${param.page}" />
		
		<input type="button" value="Submit" onclick="fn_replyInsert(this.form)"/>
		<input type="reset" value="Reset" />
		<input type="button" value="To List" onclick="location.href='/MYHOME_P/boardList.board'" />
	</form>
	<br/><br/>
<%@ include file="/templates/footer.jsp" %>