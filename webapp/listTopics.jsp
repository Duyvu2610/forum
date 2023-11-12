<%@page import="model.User"%>
<%@page import="java.util.EmptyStackException"%>
<%@page import="model.Entry"%>
<%@page import="model.Message"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collection"%>
<%@page import="model.Topic"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/list-topic.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
	<%
			Collection<Topic> topics = (Collection<Topic>) request.getAttribute("topics");
			SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy hh:mm a", Locale.US);
			User user = (User) session.getAttribute("user");
			%>
		<div class="header">
			<span>Chào <%= user.getUsername() %>| </span> <a href="logout">Thoát</a>
		</div>
		<p class="title">Dieenx dan</p>
		<%if (user != null){ %>
		<form action="new-topic">
			<button type = "submit">gui bai mo	i</button>
		</form>
		
		<%} %>
		<table>
			<tr>
				<th>Chủ đề</th>
				<th>Hồi âm</th>
			</tr>
			
			<%
			for (Topic topic : topics) {
				Entry e;
				try {
					e = topic.getNewMessage();
				} catch (EmptyStackException f) {
					e = topic;
				}
			%>
			<tr>
				<td><a href="topics?id=<%=topic.getId()%>"><%=topic.getTitle()%></a>
					<p>
						Bài mới nhất by <a href="#"><%=e.getCreator().getUsername()%></a>,
						<span><%=dateFormat.format(e.getCreatedTime().getTime())%></span>
					</p></td>
				<td><%=topic.getMessages().size()%></td>
			</tr>
			<%
			}
			%>


		</table>
	</div>
</body>
</html>