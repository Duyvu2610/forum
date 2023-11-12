<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/newTopic.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
</head>
<body>
	<div class="wrapper">

		<div class="header">
			<span>Chào chuotcon| </span> <a href="logout">Thoát</a>
		</div>
		<form class="input" action="new-topic?type=submit" method="post">
			<span>Tiêu đề</span> <input type="text" name="title"> <br>
			<span>Nội dung</span>
			<textarea rows="4" cols="50" name="content"></textarea>
			<div class="submit">
				<button type="submit">gui</button>
				<button><a href = "new-topic?type=cancel">hủy bỏ</a></button>
			</div>
		</form>
	</div>

</body>
</html>