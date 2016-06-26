<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movie Add</title>
</head>
<body>
	<h2>Movie Add</h2>
	<form action="/movies/add" method="post">
		<table>
			<tr>
				<td>編號</td>
				<td>default</td>
			</tr>
			<tr>
				<td>電影名稱</td>
				<td><input type="text" name="name" value="${param.name}">
				<font color="red" size="1">${errorMsg.nameError}</font></td>
			</tr>
			<tr>
				<td>主要演員</td>
				<td><input type="text" name="actor" value="${param.actor}">
				<font color="red" size="1">${errorMsg.actorError}</font></td>
			</tr>
			<tr>
				<td>電影類型</td>
				<td><input type="text" name="genre" value="${param.genre}">
				<font color="red" size="1">${errorMsg.genreError}</font></td>
			</tr>
			<tr>
				<td>評分</td>
				<td><input type="text" name="rating" value="${param.rating}">
				<font color="red" size="1">${errorMsg.ratingError}</font></td>
			</tr>
			<tr>
				<td><input type="submit" name="insert" value="Save"></td>
				<td><input type="button" name="cancel" value="Cancel" onclick='window.location="/movies/list"'></td>
			</tr>
		</table>
	</form>
	<br>
	<br>
	<h4>${msg}${result}</h4>

</body>
</html>