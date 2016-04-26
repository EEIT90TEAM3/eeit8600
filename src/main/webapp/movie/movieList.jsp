<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="tw.com.softleader.eeit8600.movie.service.MovieService" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	MovieService movieService = new MovieService();
	pageContext.setAttribute("models", movieService.getAll());
	%>
	
	<table border='1'>
		<tr>
			<td>�s��</td>
			<td>�q�v�W��</td>
			<td>�D�t�t��</td>
			<td>����</td>
		</tr>
		
		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.actor}</td>
				<td>${item.type}</td>
			</tr>
		</c:forEach>
	</table>
	
	<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>