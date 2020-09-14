<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>

<!-- header.jsp 포함(동적) -->
<jsp:include page="/templates/header.jsp">
	<jsp:param value="Change Password" name="title" />
</jsp:include>

	<script>

	
		// 아이디, 비밀번호, 이메일 체크 후에만 회원가입이 가능하도록 추가한 변수
		var pwPass = false;  // 비밀번호 체크 성공(true), 실패(false)

		
		$(document).ready(function(){

			var regExpPw = /^(?=.*[a-zA-Z~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,}$/;   
			$('#mPw').keyup(function() {
				if ( regExpPw.test($('#mPw').val()) ) {
					$('#updatePwCheckResult').text('Valid password');
					$('#updatePwCheckResult').css('color', '#17a2b8').css('font-size', '15px');
				} else {
					$('#updatePwCheckResult').text('Use 8 or more characters with a mix of letters, numbers & symbols');
					$('#updatePwCheckResult').css('color', '#dc3545').css('font-size', '15px');
				}
			});
			$('#mPw2').keyup(function() {
				if ( $('#mPw').val() != $('#mPw2').val() ) {
					$('#updatePwConfirmResult').text('Those passwords didn\'t match. Try again.');
					$('#updatePwConfirmResult').css('color', '#dc3545').css('font-size', '15px');
					pwPass = false;
				} else {
					$('#updatePwConfirmResult').text('Matched');
					$('#updatePwConfirmResult').css('color', '#17a2b8').css('font-size', '15px');
					pwPass = true;  // 비밀번호 체크 통과
				}
			});
			
			
		
			
			
			
			// password
			$('#updatePwBtn2').click(function() {
				if (  pwPass ) { 
					$.ajax({
						url: '/MYHOME_P/updatePw.member',
						type: 'post',
						data: $('#f').serialize(),  // 폼의 모든 요소를 보낼 때 사용
						
						dataType: 'json',
						success: function(obj) {
							// obj : {"isSuccess":true}
							// obj : {"isSuccess":false}
							if ( obj.isSuccess ) {
								alert('Successfully changed your password');
								location.href = '/MYHOME_P/loginPage.member';
							} else {
								alert('Failed to change your password');
							}
						},
						
						error: function(){
							alert('error');
						}
					});
				} else {
					alert('Please check your new password.');
				}
			});
			
			
		});
	
	</script>
	
	<br/><br/><br/><br/>
	<div class="changePw">
		<form id="f" method="post">
		
			<h3>CHANGE YOUR PASSWORD</h3>
			<br/>
	
			NEW PASSWORD<br/>	
			<input id="mPw" type="password" name="mPw" /><br/>
			<div id="updatePwCheckResult"></div><br/>
			
			CONFIRM NEW PASSWORD<br/>	
			<input id="mPw2" type="password" name="mPw2" /><br/>
			<div id="updatePwConfirmResult"></div><br/><br/>
			
			
			<button type="button" id="updatePwBtn2"  class="btn btn-outline-dark">CHANGE PW</button>
			<!--  <input id="updatePwBtn" type="button" value="CHANGE PASSWORD" /> -->&nbsp;&nbsp;
			<button type="reset" id="clearBtn"  class="btn btn-outline-dark">CANCEL</button>
			<!-- <input id="clearBtn" type="reset" value="CANCEL" />  -->
			
		</form>
	</div>

<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>
