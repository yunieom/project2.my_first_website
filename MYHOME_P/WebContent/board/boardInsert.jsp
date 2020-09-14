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
	
	<br/><br/><br/><br/>
	
	
		<form method="post">
			<div class="boardInsert">
				writer <input type="text" name="mId" value="${loginUser.mId}" readonly /> <br/>
				title <input type="text" name="bTitle" autofocus /><br/>
			</div>
			<div class="boardInsertContent">	
				content<br/> <textarea name="bContent" rows="5" cols="30"></textarea> <br/><br/>
			</div>
			<div class="boardInsertBtn">
				<button type="button" id="boardInsertNewBtn" class="btn btn-outline-dark" onclick="fn_boardInsert(this.form)" >submit</button>
				<!-- <input type="button" value="submit" onclick="fn_boardInsert(this.form)" /> -->
				<button type="reset" id="boardInsertResetBtn" class="btn btn-outline-dark">reset</button>
				<!--  <input type="reset" value="reset" /> -->
				<button type="button" id="boardInsertListBtn" class="btn btn-outline-dark" onclick="location.href='/MYHOME_P/boardList.board'">to list</button>
				<!-- <input type="button" id="boardInsertListBtn" value="To List" onclick="location.href='/MYHOME_P/boardList.board'" /> -->	
			</div>
		</form>


<%@ include file="/templates/footer.jsp" %>