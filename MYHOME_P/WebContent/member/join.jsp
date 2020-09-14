<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>

<!-- header.jsp 포함(동적) -->
<jsp:include page="/templates/header.jsp">
	<jsp:param value="Sign up" name="title" />
</jsp:include>


	<script>

	
		// 아이디, 비밀번호, 이메일 체크 후에만 회원가입이 가능하도록 추가한 변수
		var idPass = false;  // 아이디 체크 성공(true), 실패(false)
		var pwPass = false;  // 비밀번호 체크 성공(true), 실패(false)
		var emailPass = false;  // 이메일 체크 성공(true), 실패(false)
		
		
		// 페이지 로드 이벤트
		$(document).ready(function(){
			
			
			// 1. 아이디 체크
			//    5 ~ 20 사이의 소문자나 숫자를 사용한다.
			//    첫 글자는 소문자이다.
			var regExpId = /^[a-z][a-z0-9]{4,19}$/;
			$('#mId').keyup(function(){  // keyup 대신 blur 사용하면 입력이 끝나고 이동할 때
				$.ajax({
					url: '/MYHOME_P/idCheck.member',
					type: 'post',
					data: 'mId=' + $('#mId').val(),
					
					dataType: 'json',
					success: function(obj) {
						// obj  {"isPossible":true}
						// obj  {"isPossible":false}
						
						if ( regExpId.test($('#mId').val()) ) {  // 정규식을 만족하면
							// 가입유무 확인
							if ( obj.isPossible ) {  // 가입이 가능하면
								$('#idCheckResult').text('Valid ID');
								$('#idCheckResult').css('color', '#17a2b8').css('font-size', '15px');
								idPass = true;  // 아이디 체크 통과
							} else {
								$('#idCheckResult').text('ID is taken. Try another.');
								$('#idCheckResult').css('color', '#dc3545').css('font-size', '15px');
								idPass = false;
							}
						} else {  // 정규식을 만족하지 않으면
							$('#idCheckResult').text('ID must be between 5 and 20 characters long.');
							$('#idCheckResult').css('color', '#dc3545').css('font-size', '15px');
							idPass = false;
						}
					},
					
					error: function(){
						alert('error');
					}
				});
			});
			
			
			// 2. 비밀번호 체크
			//    8 ~ 20 사이의 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*)를 사용한다.
			//    각각 1개 이상씩 포함해야만 한다.
			// var regExpPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;
			var regExpPw = /^(?=.*[a-zA-Z~!@#$%^&*()_+|<>?:{}])(?=.*[0-9]).{8,}$/;  // 
			
			function pwInputCheck() {
				if ( $('#mPw').val() != $('#mPw2').val() ) {  // 둘 다 동일하게 입력하지 않았다면,
					$('#pwConfirmResult').text('Those passwords didn\'t match. Try again.');
					$('#pwConfirmResult').css('color', '#dc3545').css('font-size', '15px');
					pwPass = false;
				} else {  // 둘 다 동일하게 입력했다면,
					$('#pwConfirmResult').text('Matched'); 
					$('#pwConfirmResult').css('color', '#17a2b8').css('font-size', '15px');
					pwPass = true;  // 비밀번호 체크 통과
				}
			}
			
			$('#mPw').keyup(function() {
				
				pwInputCheck();
				
				if ( regExpPw.test($('#mPw').val()) ) {
					$('#pwCheckResult').text('Valid Password');
					$('#pwCheckResult').css('color', '#17a2b8').css('font-size', '15px');
				} else {
					$('#pwCheckResult').text('Use 8 or more characters with a mix of letters, numbers & symbols');
					$('#pwCheckResult').css('color', '#dc3545').css('font-size', '15px');
				}
				
			});
			
			$('#mPw2').keyup(pwInputCheck);
			
			
			// 3. 이메일 체크
			var regExpEmail = /^[a-z][a-z0-9\-\_]+@[A-Za-z0-9]{3,}(\.[A-Za-z]{2,6}){1,2}$/;
			$('#mEmail').keyup(function(){
				$.ajax({
					url: '/MYHOME_P/emailCheck.member',
					type: 'post',
					data: 'mEmail=' + $('#mEmail').val(),
					
					dataType: 'json',
					success: function(obj) {
						if ( regExpEmail.test($('#mEmail').val()) ) {  // 이메일 정규식 체크
							if ( obj.isPossible ) {
								$('#emailCheckResult').text('Valid Email');
								$('#emailCheckResult').css('color', '#17a2b8').css('font-size', '15px');
								emailPass = true;  // 이메일 체크 통과
							} else {
								$('#emailCheckResult').text('Email-Address is already in use. Try another.');
								$('#emailCheckResult').css('color', '#dc3545').css('font-size', '15px');
								emailPass = false;
							}
						} else {  // 이메일 정규식 체크 실패(이메일 형식이 아님)
							$('#emailCheckResult').text('Please enter valid email address.');
							$('#emailCheckResult').css('color', '#dc3545').css('font-size', '15px');
							emailPass = false;
						}
					},
					error: function() {
						alert('실패');
					}
				});
			});
			
			
			// 4. 핸드폰 체크
			var regExpPhone = /^01[0|1|6|9]-[0-9]{3,4}-[0-9]{4}$/;
			$('#mPhone').keyup(function(){
				if ( regExpPhone.test($('#mPhone').val()) ) {
					$('#phoneCheckResult').text('OK');
					$('#phoneCheckResult').css('color', '#17a2b8').css('font-weight', 'bold');
				} else {
					$('#phoneCheckResult').text('Please enter valid your phone number.');
					$('#phoneCheckResult').css('color', '#dc3545').css('font-size', '15px');
				}
			});
			
			
			// 5. 회원가입
			$('#joinBtn').click(function() {
				if ( idPass && pwPass && emailPass ) {  // 아이디/비밀번호/이메일 체크를 모두 했는가?
					$.ajax({
						url: '/MYHOME_P/join.member',
						type: 'post',
						data: $('#f').serialize(),  // 폼의 모든 요소를 보낼 때 사용
						
						dataType: 'json',
						success: function(obj) {
							// obj : {"isSuccess":true}
							// obj : {"isSuccess":false}
							if ( obj.isSuccess ) {
								alert('Welcome. Please Log-in.');
								location.href = '/MYHOME_P/loginPage.member';
							} else {
								alert('Sorry. There wes an error verifying your account. Please try again or contact an administrator. ');
							}
						},
						
						error: function(){
							alert('error');
						}
					});
				} else {
					alert('Check your ID / PASSWORD / EMAIL / PHONE');
				}
			});
			
			// 6. 입력 취소
			$('#clearBtn').click(function() {
				// 1) 모든 입력을 지운다.
				$('input[type=text], input[type=password]').each(function() {
					//  각 요소(input[type=text] 또는 input[type=password])는 each 문 내부에서 $(this) 로 호출한다.
					$(this).val('');
				});
				// 2) 모든 결과 메시지를 지운다.
				$('.result').each(function() {
					$(this).text('');
				});
				$('#mId').focus();
			});
			
		});
	
	</script>
	
	<br/><br/><br/>
	
	<div class="join">
		<form id="f" method="post">
	
		<h3>Looks like you're new </h3><h5> Please create an account</h5>
			<br/><br/>
			<div class="joinForm">
			ID &nbsp;
			<input id="mId" type="text" name="mId" autofocus /><br/>
			<div id="idCheckResult" class="result"></div><br/>
	
			PW &nbsp;
			<input id="mPw" type="password" name="mPw" /><br/>
			<div id="pwCheckResult" class="result"></div><br/>
			
			Confirm &nbsp;
			<input id="mPw2" type="password" name="mPw2" /><br/>
			<div id="pwConfirmResult" class="result"></div><br/>
			
			Name &nbsp;
			<input id="mName" type="text" name="mName" /><br/><br/>
			
			Email &nbsp;
			<input id="mEmail" type="text" name="mEmail" /><br/>
			<div id="emailCheckResult" class="result"></div><br/>
			
			Phone &nbsp;
			<input id="mPhone" type="text" name="mPhone" /><br/>
			<div id="phoneCheckResult" class="result"></div><br/>
			 
			City &nbsp;
			<input id="mAddress" type="text" name="mAddress" /><br/><br/>
			</div>
			<br/>
			<div class="joinBtn">
			<button type="button" id="joinBtn"  class="btn btn-outline-dark">SIGN UP</button>
			<!-- <input id="joinBtn" type="button" value="SIGN UP" />  --> &nbsp;&nbsp;
			<button type="button" id="clearBtn"  class="btn btn-outline-dark">RESET</button>
			<!-- <input id="clearBtn" type="button" value="RESET" />  -->
			</div>
		</form>
	</div>
	

<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>
