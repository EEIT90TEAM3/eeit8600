<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ingredient addPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body>
	<form action="/ingredients/post" method="post">
		<table>
			<%-- readonly="readonly" --%>
			<tr>
				
				<td><input type="text" name="ingredId"
					value="${ingredient.ingredId}"></td>
				<td>${errorMsg.ingredId}</td>
			</tr>
			<tr>
				<td>成分</td>
				<td><input type="text" name="ingredName"
					value="${ingredient.ingredName}"></td>
				<td>${errorMsg.ingredName}</td>
			</tr>
			<tr>
				<td>中文名稱</td>
				<td><input type="text" name="ingredChName"
					value="${ingredient.ingredChName}"></td>
				<td>${errorMsg.ingredChName}</td>
			</tr>
			<tr>
				<td>特性</td>
				<td><input type="text" name="ingredChar"
					value="${ingredient.ingredChar}"></td>
				<td>${errorMsg.ingredChar}</td>
			</tr>
			<tr>
				<td>刺激度</td>
				<td><input type="text" name="ingredIrritant"
					value="${ingredient.ingredIrritant}"></td>
				<td>${errorMsg.ingredIrritant}</td>
			</tr>
			<tr>
				<td>致粉刺性</td>
				<td><input type="text" name="ingredAcne"
					value="${ingredient.ingredAcne}"></td>
				<td>${errorMsg.ingredAcne}</td>
			</tr>
			<tr>
				<td>安心度</td>
				<td><input type="text" name="ingredSafety"
					value="${ingredient.ingredSafety}"></td>
				<td>${errorMsg.ingredSafety}</td>
			</tr>
		</table>
		<br>
		<input type="submit" name="update" value="insert"><br>
		<input type="button" name="cancel" value="Cancel" onclick='window.location="/ingredients/list"'><br>
		</form>
</body>
</html>