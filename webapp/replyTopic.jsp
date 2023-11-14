<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/newTopic.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
</head>
<body>
	<div class="wrapper">
		<c:set var="user" value="${sessionScope.user}" />
		<div class="header">
			<span>Chào ${user.username}| </span> <a href="logout">Thoát</a>
		</div>
		<form class="input" action="reply?id=${requestScope.id}"
			method="post">
			<span>Tiêu đề</span> <input type="text" name="title"
				value="Re: ${requestScope.title}"> <br> <span>Nội dung</span>
			<textarea rows="4" cols="50" name="content"></textarea>
			<div class="submit">
				<button type="submit">gui</button>
				<button>
					<a href="new-topic?type=cancel">hủy bỏ</a>
				</button>
			</div>
		</form>
	</div>

</body>
</html>