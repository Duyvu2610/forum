<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/Login.css">
</head>
<body>
	<%
	try {
		String statusParam = (String)request.getAttribute("status");
		System.out.print(statusParam);
		if (statusParam != null && statusParam.equals("failed")) {
	%>
	<div class = "err">loi</div>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace(); // It's a good practice to log exceptions for debugging.
	}
	%>



	<div class="form">
	
		<p class = "header">Đăng nhập</p>
		<form action="login" method="post" class="form-login">
			<div>
				<label for = "userName">Tên đăng nhập</label> <input type="text" id = "userName" name = "userName">
			</div>
			<div class = "pass">
				<label for = "password">Mật khẩu</label> <input type="text" id = "password" name = "password">
			</div>

			<button type="submit">Đăng nhập</button>
		</form>
	</div>
</body>
</html>