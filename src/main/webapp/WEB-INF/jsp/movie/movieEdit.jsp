<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies Edit</title>
</head>
<body>
<h2>Movie Edit</h2>
	<form action="/movies/update" method="post">
		<table>
			<tr>
				<td>�s��</td>
				<td><input type="text" name="id" value="${item.id }"></td>
			</tr>
			<tr>
				<td>�q�v�W��</td>
				<td><input type="text" name="name" value="${item.name }"></td>
			</tr>
			<tr>
				<td>�D�n�t��</td>
				<td><input type="text" name="actor" value="${item.actor }"></td>
			</tr>
			<tr>
				<td>�q�v����</td>
				<td><input type="text" name="genre" value="${item.genre }"></td>
			</tr>
			<tr>
				<td><input type="submit" name="insert" value="Insert"></td>
				<td><input type="button" name="cancel" value="Cancel" onclick='window.location="/movies/list"'></td>
			</tr>
		</table>
	</form>
</body>
</html>