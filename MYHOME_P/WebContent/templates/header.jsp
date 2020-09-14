<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	if (title == null || title.isEmpty()){
		title="default title";
	}  

%>
<title><%=title %></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-migrate-3.3.1.min.js" ></script> <!-- jquery cdn 구버전 -->
<!-- java script -->
<script type="text/javascript">
	function fn_logout() {
		if(confirm('Are you sure you want to Logout?')) {
			location.href='/MYHOME_P/logout.member'
		}
	}

</script>
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@600&display=swap" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/templates/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wrap">
		<div id="header-wrap">
			<!-- before logging in -->
			<c:if test="${loginUser eq null}">
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='/MYHOME_P/loginPage.member'" >LOGIN</button>
				<!--  <input type="button" value="LOGIN" />--> &nbsp; 
				<button type="button" class="btn btn-info" onclick="location.href='/MYHOME_P/joinPage.member'">SIGN UP</button>
				<!-- <input type="button" value="JOIN US"  /> --> &nbsp; 
				<!--  <input type="button" value="MY PAGE" onclick="location.href='/MYHOME_P/loginPage.member'" /> &nbsp;  -->
				<button type="button" class="btn btn-warning" onclick="location.href='/MYHOME_P/boardList.board'">BOARD</button>
				<!--<input type="button" value="Board"  /> --> 
			</c:if>
			<!-- after logging in -->
			<c:if test="${loginUser ne null }">
				<h5>Hello ${loginUser.mName} ! &nbsp; &nbsp;
				<button type="button" class="btn btn-info" onclick="location.href='/MYHOME_P/myPage.member'">MY PAGE</button>
				<!--  <input type="button" value="My Page" onclick="location.href='/MYHOME_P/myPage.member'" />--> &nbsp; 
				<button type="button" class="btn btn-warning" onclick="location.href='/MYHOME_P/boardList.board'">BOARD</button>
				<!-- <input type="button" value="Board" onclick="location.href='/MYHOME_P/boardList.board'" /> --> &nbsp; 
				<button type="button" class="btn btn-outline-secondary" onclick="fn_logout()">LOGOUT</button>
				<!-- <input type="button" value="logout" onclick="fn_logout()" /> --> &nbsp;
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='/MYHOME_P/leavePage.member'">LEAVE US</button>
				<!--<input type="button" value="Leave us" onclick="location.href='/MYHOME_P/leavePage.member'" />  -->
				</h5>
			</c:if>
		</div>
	<div id ="main-wrap">
	