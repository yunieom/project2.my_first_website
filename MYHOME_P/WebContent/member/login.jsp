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
	<br/><br/><br/><br/>
	
	<div class="login">
		<form method="post">
			<p><input type = "text" name="mId" id="loginmId" placeholder="id" autofocus /> <br/></p>
			<input type = "password" name="mPw" id="loginmPw" placeholder="****" /> <br/>
			<br/>
			<button type="button" class="btn btn-outline-dark" onclick="fn_login(this.form)">LOGIN</button>
			<!-- <input type = "button" value ="login" onclick="fn_login(this.form)" /> --><br/><br/>
			<a href="/MYHOME_P/findIdPage.member">Find ID</a>
			&nbsp; &nbsp;
			<a href="/MYHOME_P/findPwPage.member">Find PW</a>
		</form>
	</div>



<%@ include file="/templates/footer.jsp" %>