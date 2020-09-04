<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		if (${param.result}>0) {
			alert('Successfully posted!');
			location.href='/MYHOME_P/boardList.board';
		} else {
			alert('post upload got failed.');
			history.back();
		}
	</script>

</head>
<body>

</body>
</html>