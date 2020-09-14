<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>

<!-- header.jsp 포함(동적) -->
<jsp:include page="/templates/header.jsp">
	<jsp:param value="My Page" name="title" />
</jsp:include>
	<script>
		//page load event (update user info, change password)
		$(document).ready(function(){
			$('#updateInfoBtn').click(function(){
				$.ajax({
					url: '/MYHOME_P/updateInfo.member',
					type: 'post',
					data: $('#f').serialize(),
					dataType: 'json',
					success: function(obj){
						if (obj.isSuccess){
							alert('Your account info has been successfully changed.');
						}else {
							alert('Your account info couldn\'t be changed.');
						}
						location.href = '/MYHOME_P/myPage.member';
					},
					error: function() {
						alert('error');
					}
				});
				
			});
			
			$('#updatePwBtn').click(function(){
				location.href = '/MYHOME_P/updatePwPage.member';
			});
			
		});

	</script>

<br/><br/><br/>
<div class="myPage">
	<form id="f" method="post">
		
		<h3>Welcome, ${loginUser.mName}</h3>
		<h5>Manage your info, privacy and security to make us work better for you</h5>
		
		<br/><br/>
		<div class="mypageForm">
			ID &nbsp;
			<input id="mId" type="text" name="mId" value="${loginUser.mId}" readonly /><br/><br/>
			Name &nbsp;
			<input id="mName" type="text" name="mName" value="${loginUser.mName}" /> <br/><br/>
	
			Email &nbsp;
			<input id="mEmail" type="text" name="mEmail" value="${loginUser.mEmail}" /><br/><br/>
	
			Phone &nbsp;
			<input id="mPhone" type="text" name="mPhone" value="${loginUser.mPhone}" /><br/><br/>
	
			City &nbsp;
			<input id="mAddress" type="text" name="mAddress" value="${loginUser.mAddress}" /><br/><br/>
	
			Joined &nbsp;
			<input id="mRegDate" type="text" name="mRegdate" value="${loginUser.mRegdate}" readonly /><br/><br/>
			</div>
			<br/>
		<div class="UpdateBtn">
			<button type="button" id="updatePwBtn"  class="btn btn-outline-dark">CHANGE PW</button>
			<!-- <input id="updatePwBtn" type="button" value="Change your password" /> --> &nbsp;&nbsp;
			<button type="button" id="updateInfoBtn" class="btn btn-outline-dark">UPDATE INFO</button>
			<!-- <input id="updateInfoBtn" type="button" value="Update your info" / -->
		</div>
	</form>
</div>


<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>