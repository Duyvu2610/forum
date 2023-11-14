<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/list-topic.css">
<link rel="stylesheet" type="text/css" href="./css/index.css">
<title>Insert title here</title>
</head>
<body>
	<c:set var="user" value="${sessionScope.user}" />
	<div class="wrapper">
		<div class="header">
			<span>Chào ${user.username}| </span> <a href="logout">Thoát</a>
		</div>
		<p class="title">Diễn đàn: Chuyện học phí và các chính sách hỗ trợ học tập</p>
		<c:if test="${not empty user}">
			<form action="new-topic">
				<button type="submit">gửi bài mới</button>
			</form>
		</c:if>
		<table>
			<tr>
				<th>Chủ đề</th>
				<th>Hồi âm</th>
			</tr>

			<c:forEach var="topic" items="${requestScope.topics}">
				<c:choose>
					<c:when test="${empty topic.messages}">
						<c:set var="e" value="${topic}" />
					</c:when>
					<c:otherwise>
						<c:set var="e" value="${topic.newMessage}" />
					</c:otherwise>
				</c:choose>
				
				<tr>
					<td><a href="topics?id=${topic.id}">${topic.title}</a>
						<p>
							Bài mới nhất by <a href="#">${e.creator.username}</a>, <span><fmt:formatDate
									type="both" value="${e.createdTime.time}" pattern="MM/dd/yyyy hh:mm a" /></span>
						</p></td>
					<td>${fn:length(topic.messages)}</td>
				</tr>
			</c:forEach>


		</table>
	</div>
</body>
</html>