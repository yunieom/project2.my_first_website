<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	if ( ${param.result} > 0 ) {
		alert('Successfully deleted.');
		location.href = '/MYHOME_P/boardList.board?page=' + ${param.page};
	} else {
		alert('Delete failed.');
		history.back();
	}
</script>

</body>
</html>