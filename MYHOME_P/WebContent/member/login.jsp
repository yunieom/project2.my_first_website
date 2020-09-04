<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:include page="/templates/header.jsp">
	<jsp:param value="login" name="title" />
</jsp:include>

	<script> 
	 	function fn_login(f){
	 		if(f.mId.value == '' || f.mPw.value =='') {
	 			alert('Please check your username and password and try again.');
	 			return;
	 		}
	 		f.action = '/MYHOME_P/login.member';
	 		f.submit();
	 	}
	
	</script>
	
	<form method="post">
		<input type = "text" name="mId" placeholder="id" autofocus /> <br/>
		<input type = "password" name="mPw" placeholder="****" /> <br/>
		<input type = "button" value ="login" onclick="fn_login(this.form)" /><br/><br/>
		<a href="/MYHOME_P/findIdPage.member">Find ID</a>
		&nbsp; &nbsp;
		<a href="/MYHOME_P/findPwPage.member">Find Password</a>
	</form>



<%@ include file="/templates/footer.jsp" %>