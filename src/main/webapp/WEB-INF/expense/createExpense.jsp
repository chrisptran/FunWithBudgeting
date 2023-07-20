<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-light bg-light">
		<a href="/home">Cancel</a>
<h1 class="text-center text-primary">Add a Transaction</h1>
<a href="/users/logout">Logout</a>
</nav>

<form:form action="/expenses/process" method="post" modelAttribute="newExpense">
	<form:input type="hidden" path="user" value="${user_id}"/>
		<div class="form-group">
			<form:label path="date">Date</form:label> 
			<form:input path="date" type="date" pattern="MM-dd-yyyy"
				class="form-control" />
			<form:errors path="date" class="text-danger"/>
		</div>
		<div class="form-group">
			<form:label path="transaction">Transaction</form:label> 
			<form:input path="transaction" type="text"
				class="form-control" />
			<form:errors path="transaction" class="text-danger"/>
		</div>
        <div class="form-group">


			<form:label path="category">Category: </form:label>
			<form:select path="category">
				<form:option value="Housing" />
				<form:option value="Food and Bev" />
				<form:option value="Utilities" />
                <form:option value="Entertainment" />
                <form:option value="Savings" />
                <form:option value="Miscellaneous" />
				<form:errors path="category" class="text-danger" />
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="amount">Amount</form:label> 
			<form:input  path="amount" type="float"
				class="form-control" />
			<form:errors path="amount" class="text-danger"/>
		</div>
        <div class="form-group">
			<form:label path="notes">Notes</form:label> 
			<form:input  path="notes" type="textbox"
				class="form-control" />
			<form:errors path="notes" class="text-danger"/>
		</div>
		<input type="submit" value="Enter" class="btn btn-primary">
	</form:form>

</body>
</html>