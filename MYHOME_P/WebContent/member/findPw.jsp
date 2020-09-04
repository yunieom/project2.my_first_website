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
							$('#findPwResult').text('Your temporary password is ' + obj.tempPw + '.');
							$('#findPwResult').css('color', 'navy');
						} else {
							$('#findPwResult').text('No matching users found.');
							$('#findPwResult').css('color','red');
						}
					},
					error: function(){
						alert('error');
					}
					
				});
			});
		}
	
	</script>
	<form id="f">
		Your ID
		<input id="mId" type="text" name="mId" /><br/>
		Your Phone
		<input id="mPhone" type="text" name="mPhone" /><br/><br/>
		<input id="findPwBtn" type="button" value="Find Password" />
	</form>
	<br/><br/>
	<div id="findPwResult"></div>


<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>