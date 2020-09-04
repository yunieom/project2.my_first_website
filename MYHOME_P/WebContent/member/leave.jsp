<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>

<!-- header.jsp 포함(동적) -->
<jsp:include page="/templates/header.jsp">
	<jsp:param value="Delete Account" name="title" />
</jsp:include>
	<script>
	// page load event
	$(document).ready(function(){
		
		$('#leaveBtn').click(function(){
			//valid ID check
			if ($('#mId').val() == '') {
				alert('plese input your ID.');
				return false;
			} else if ($('#mId').val() != '${loginUser.mId}') {
				alert('Please check your ID.');
				return false;
			}
			//valid PW check
			if ($('#mPw').val() == '') {
				alert('please input your Password.');
				return false;
			} else if ($('#mPw').val() != '${loginUser.mPw}') {
				alert('Please check your Password.');
				return false;
			}
			if ( !confirm('Your account will be PERMANENTLY deleted.')){
				return false;
			}
			$.ajax({
				url: '/MYHOME_P/leave.member',
				dataType: 'json',
				success: function(obj) {
					if (obj.isSuccess){
						alert('We have now permanently deleted your user account. You are alawys welcome to join again!');
						location.href='/MYHOME_P/index.member'
					} else {
						alert('We could\'t delete your user account some reasons.');
						history.back();
					}	
				},
				error: function() {
					alert('error');
				}
				
			});
		
		});
		
		
	}); 
	
	
	</script>
	
	<form method="post">
		<h3>Are you sure you want permanently delete your user account?</h3>
		<input id="mId" type="text" name="mId" placeholder="ID" autofocus /><br/>
		<input id="mPw" type="password" name="mPw" placeholder="****" /><br/><br/>
		<input id="leaveBtn" type="button" value="Delete Account" /> 
		
	</form>


<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>