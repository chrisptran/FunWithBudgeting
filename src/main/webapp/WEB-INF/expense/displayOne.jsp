<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="ISO-8859-1">
            <title>Insert title here</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
                integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
                crossorigin="anonymous">
        </head>

        <body>
            <div class="mx-auto" style="width: 300px;">
                <h1 class="text-primary">
                    <c:out value="${oneExpense.transaction}" />
                </h1><br>
                <h3>Date:
                    <c:out value="${oneExpense.date }" />
                </h3>
                <h3>Category:
                    <c:out value="${oneExpense.category}" />
                </h3>
                <h3>Amount:
                    $<c:out value="${oneExpense.amount}" />
                </h3>
                <p>Notes:
                    <c:out value="${oneExpense.notes}" />
                </p>
            
            <div class="d-flex flex-row">
                <div class="p-1">
                    <a href="/expenses/edit/${oneExpense.id}" class="btn btn-warning">Edit</a>
                </div>
                <div class="p-1">
                    <form action="/expenses/${oneExpense.id}" method="post">
                        <input type="hidden" name="_method" value="delete" /> <input type="submit" value="delete"
                            class="btn btn-danger">
                    </form>
                </div>
            </div>
        </div>
           
        </body>

        </html>