<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


</head>
<body>
	<nav class="navbar navbar-light bg-light">
		<a href="expenses/new">Create Transaction</a>
		<h1 class="text-primary">Dashboard</h1>
		<a href="/users/logout">Logout</a>
	</nav>
	<br>
	<h3 class="ml-3">
		Hi
		<c:out value="${loggedInUser.name}"></c:out>!
	</h3>
	<br>
	<h3 class="ml-3">
		Total Spent: $
		<c:if test="${loggedInUser.id == user.id}">
			<td><c:out value="${formattedAmount}" /></td>
		</c:if>
	</h3>


	<table class="table table-hover">
		<thead>
			<tr>
				<th>Date</th>
				<th>Transactions</th>
				<th>Category</th>
				<th>Amount</th>
			</tr>
		</thead>
		<c:forEach var="eachTransaction" items="${expenses }">
			<tr>
				<c:if test="${user_id == eachTransaction.user.id}">
					<td><c:out value="${eachTransaction.date}"></c:out></td>
					<td><a href="/expenses/${eachTransaction.id }"><c:out
								value="${eachTransaction.transaction}"></c:out></a></td>
					<td><c:out value="${eachTransaction.category}"></c:out></td>
					<td>$<c:out value="${eachTransaction.amount}"></c:out></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>