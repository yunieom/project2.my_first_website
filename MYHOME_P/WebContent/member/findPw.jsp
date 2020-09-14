<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>

<!-- header.jsp 포함(동적) -->
<jsp:include page="/templates/header.jsp">
	<jsp:param value="Find Password" name="title" />
</jsp:include>

	<script>
		//page load event
		$(document).ready(function(){
			fn_findPw();
		});
		
		function fn_findPw() {
			$('#findPwBtn').click(function() {
				$.ajax({
					url: '/MYHOME_P/findPw.member',
					type: 'post',
					data: $('#f').serialize(),
					dataType: 'json',
					success: function(obj){
						if (obj.isMember) {
							$('#findPwResult').text('Your temporary password is \' ' + obj.tempPw + ' \' ');
							$('#findPwResult').css('color','#dc3545').css('font-size','large');
						} else {
							$('#findPwResult').text('No matching users found.');
							$('#findPwResult').css('color','#17a2b8').css('font-size','large');
						}
					},
					error: function(){
						alert('error');
					}
					
				});
			});
		}
	
	</script>
	<br/><br/><br/><br/>
	<div class="findPw">
	<form id="f">
		<h3>FIND YOUR PASSWORD</h3>
		Enter your ID and Phone
		<br/><br/>
		<p><input id="findPwmId" type="text" name="mId" placeholder="id"/><br/></p>
		<p><input id="findPwmPhone" type="text" name="mPhone" placeholder="010-0000-0000"/><br/></p>
		<button type="button" class="btn btn-outline-dark" id="findPwBtn">FIND PW</button>
		<!-- <input id="findPwBtn" type="button" value="Find Password" /> -->
	</form>
	</div>
	<br/>
	<div id="findPwResult"></div>
	<br/>


<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>