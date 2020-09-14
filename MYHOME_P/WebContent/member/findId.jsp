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
					data: 'mEmail=' + $('#findIdmEmail').val(),
					dataType: 'json',
					success: function(result) {
						if(result.resultId =='none') {
							$('#findIdResult').text('The email address that you\'ve entered doesn\'t match any account.');
							$('#findIdResult').css('color','#17a2b8').css('font-size','large');
						}else {
							$('#findIdResult').text('Your Id is \' ' + result.resultId + ' \'' );
							$('#findIdResult').css('color','#dc3545').css('font-size','large');
						}
					},
					error: function() {
						alert('error');
					}
				});
			});
		}

	</script>
	<br/><br/><br/><br/>
		<div class="findId">
		<form>
			<h3>FIND YOUR ID</h3>
			Enter your email
			<br/><br/>
			<p><input id="findIdmEmail" type="text" name="mEmail" placeholder="email" autofocus /><br/></p>
			<button type="button" class="btn btn-outline-dark" id="findIdBtn">FIND ID</button>
			<!-- <input id="findIdBtn" type="button" value="Find Id" /> --> 
		</form>
		<!-- Find Id result -->
		<br/>
		<div id="findIdResult">
		</div>
	</div>
	<br/>
<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>