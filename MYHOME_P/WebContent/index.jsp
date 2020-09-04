<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% request.setCharacterEncoding("utf-8"); %>

<!-- header.jsp 포함(동적) -->
<jsp:include page="/templates/header.jsp">
	<jsp:param value="myHomepage" name="title" />
</jsp:include>
<br/>
<br/>
<br/>

	<div class="welcome">
		<h2>Welcome to My first website</h2>
	</div>


<!-- footer.jsp 포함(정적) -->
<%@ include file="/templates/footer.jsp" %>
