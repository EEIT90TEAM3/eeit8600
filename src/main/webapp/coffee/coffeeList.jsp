<%@page import="tw.com.softleader.eeit8600.coffee.service.CoffeeService"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<% CoffeeService CoffeeService=new CoffeeService();
	pageContext.setAttribute("models", CoffeeService.getAll());
	%>

	
	<table border='1'>
		<tr>
			<th>ID�s��</th>
			<th>�W�l</th>
			<th>���a</th>
			<th>�ե�</th>
			<th>�w��</th>
		</tr>
		
		<c:forEach items="${models}" var="item" varStatus="status">
			<tr>
				<td>${item.ID}</td>
				<td>${item.NAME}</td>
				<td>${item.LOCAL}</td>
				<td>${item.TESTING}</td>
				<td>${item.PRICE}</td>
			</tr>
		</c:forEach>
	
	</table>
	
	

	<hr/>
	<a href="${pageContext.request.contextPath}/">Back</a>
</body>
</html>