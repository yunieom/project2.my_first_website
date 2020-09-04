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

		
		// 페이지 로드 이벤트
		$(document).ready(function(){

			var regExpPw = /^(?=.*[a-zA-Z~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,}$/;   
			$('#mPw').keyup(function() {
				if ( regExpPw.test($('#mPw').val()) ) {
					$('#pwCheckResult').text('Valid password');
					$('#pwCheckResult').css('color', 'blue').css('font-weight', 'bold');
				} else {
					$('#pwCheckResult').text('Use 8 or more characters with a mix of letters, numbers & symbols');
					$('#pwCheckResult').css('color', 'red');
				}
			});
			$('#mPw2').keyup(function() {
				if ( $('#mPw').val() != $('#mPw2').val() ) {
					$('#pwConfirmResult').text('Those passwords didn\'t match. Try again.');
					$('#pwConfirmResult').css('color', 'red');
					pwPass = false;
				} else {
					$('#pwConfirmResult').text('Matched');
					$('#pwConfirmResult').css('color', 'blue').css('font-weight', 'bold');
					pwPass = true;  // 비밀번호 체크 통과
				}
			});
			
			
		
			
			
			
			// 5. 비밀번호
			$('#updatePwBtn').click(function() {
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
								alert('비밀번호 변경에 성공했습니다.');
								location.href = '/MYHOME_P/loginPage.member';
							} else {
								alert('비밀번호 변경에 실패했습니다.');
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
	
	<br/><br/>
	<form id="f" method="post">
	
		<h3>CHANGE YOUR PASSWORD</h3>

		NEW PASSWORD<br/>	
		<input id="mPw" type="password" name="mPw" /><br/>
		<div id="pwCheckResult"></div><br/>
		
		CONFIRM NEW PASSWORD<br/>	
		<input id="mPw2" type="password" name="mPw2" /><br/>
		<div id="pwConfirmResult"></div><br/>
		
		
		<input id="updatePwBtn" type="button" value="CHANGE PASSWORD" />
		<input id="clearBtn" type="reset" value="CANCEL" />
		
	</form>
	

<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>
