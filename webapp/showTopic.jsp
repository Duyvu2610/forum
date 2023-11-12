<%@page import="java.util.EmptyStackException"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collection"%>
<%@page import="model.Message"%>
<%@page import="model.Topic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/showTopic.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
</head>
<body>
	<div class="wrapper">
		<%
		Topic topic = (Topic) request.getAttribute("topic");
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy hh:mm a", Locale.US);
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("MM-dd-yyyy");
		%>
		<div class="header">
			<span>Chào chuotcon| </span> <a href="logout">Thoát</a>
		</div>
		<p class="title">Chủ đề:&nbsp;<%=topic.getTitle()%></p>
		<% 
		
				Entry e;
				try {%>
				<span>Bài mới nhất gửi <%=dateFormat.format(topic.getNewMessage().getCreatedTime().getTime())%>, do <span><%=topic.getNewMessage().getCreator().getUsername()%></span> gửi. <span><%=topic.getMessages().size() %> hồi âm</span></span>
				<% 
					
				} catch (EmptyStackException f) {
					
				
			%>
		

		<div class="table">
			<div class="time"><%=dateFormat.format(topic.getCreatedTime().getTime())%></div>
			<div class="group">
				<div class="user">
					<span><%=topic.getCreator().getUsername()%></span>
					<p>
						Tham gia
						<%=dateFormat2.format(topic.getCreatedTime().getTime())%></p>
				</div>
				<div class="content">
					<div class="content-title">
						<span><%=topic.getTitle()%></span> <a href="#">Trả lời</a>
					</div>
					<div class="content-detail"><%=topic.getContent()%></div>
				</div>
			</div>
		</div>
		<%
		try {
			for (Message mess : topic.getMessages()) {
		%>
		<div class="table">
			<div class="time"><%=dateFormat.format(mess.getCreatedTime().getTime())%></div>
			<div class="group">
				<div class="user">
					<span><%=mess.getCreator().getUsername()%></span>
					<p>
						Tham gia
						<%=dateFormat2.format(mess.getCreatedTime().getTime())%></p>
				</div>
				<div class="content">
					<div class="content-title">
						<span><%=mess.getTitle()%></span> <a href="#">Trả lời</a>
					</div>
					<div class="content-detail"><%=mess.getContent()%></div>
				</div>
			</div>
		</div>
		<%
		}
		%>
		<%
		} catch (EmptyStackException f) {

		}
		%>
		<div  class = "list"><a href = "topics">Danh sách chủ đề</a></div>

	</div>
</body>
</html>