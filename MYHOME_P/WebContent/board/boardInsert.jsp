<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/templates/header.jsp">
	<jsp:param value="New Post" name="title" />
</jsp:include>

	<script>
	function fn_boardInsert(f) {
		f.action = '/MYHOME_P/boardInsert.board';
		f.submit();
	}
	</script>

	<form method="post">
		Writer <input type="text" name="mId" value="${loginUser.mId}" readonly /> <br/>
		Title <input type="text" name="bTitle" autofocus /><br/>
		Content<br/> <textarea name="bContent" rows="5" cols="30"></textarea> <br/><br/>
		
		<input type="button" value="submit" onclick="fn_boardInsert(this.form)" />
		<input type="reset" value="reset" />
		<input type="button" value="To List" onclick="location.href='/MYHOME_P/boardList.board'" />		
	
	</form>

<%@ include file="/templates/footer.jsp" %>