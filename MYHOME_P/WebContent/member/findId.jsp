<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>

<!-- header.jsp 포함(동적) -->
<jsp:include page="/templates/header.jsp">
	<jsp:param value="Find Id" name="title" />
</jsp:include>

	<script>
		$(document).ready(function (){
			fn_findId();
		});
		

		function fn_findId() {
			$('#findIdBtn').click(function(){
				$.ajax({
					url:'/MYHOME_P/findId.member',
					type: 'get',
					data: 'mEmail=' + $('#mEmail').val(),
					dataType: 'json',
					success: function(result) {
						if(result.resultId =='none') {
							$('#findIdResult').text('The email address that you\'ve entered doesn\'t match any account.');
							$('#findIdResult').css('color','red');
						}else {
							$('#findIdResult').text('Your Id is \' ' + result.resultId + ' \'.' );
							$('#findIdResult').css('color','navy');
						}
					},
					error: function() {
						alert('failed');
					}
				});
			});
		}

	</script>

	<form>
		<h3>Your Email</h3>
		<input id="mEmail" type="text" name="mEmail" autofocus />
		<input id="findIdBtn" type="button" value="Find Id" />
	</form>
	<!-- Find Id result -->
	<div id="findIdResult">
	</div>

<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>