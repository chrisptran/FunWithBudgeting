<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="ISO-8859-1">
            <title>Insert title here</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        </head>

        <body>
            <h1 class="text-center text-primary" >Fun with Budgeting</h1>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h1>Register</h1>
                        <form:form action="/users/process" method="post" modelAttribute="newUser">
                            <div class="form-group">
                                <label>Name</label>
                                <form:input path="name" class="form-control" />
                                <form:errors path="name" class="text-danger" />
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <form:input path="email" class="form-control" />
                                <form:errors path="email" class="text-danger" />
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <form:input type="password" path="password" class="form-control" />
                                <form:errors path="password" class="text-danger" />
                            </div>
                            <div class="form-group">
                                <label>Confirm PW</label>
                                <form:input type="password" path="confirm" class="form-control" />
                                <form:errors path="confirm" class="text-danger" />
                            </div>
                            <input type="submit" value="Submit" class="btn btn-primary" />
                        </form:form>
                    </div>
                    <div class="col">
                        <h1>Log In</h1>
                        <form:form action="/users/login" method="post" modelAttribute="loginUser">
                            <div class="form-group">
                                <label>Email</label>
                                <form:input path="email" class="form-control" />
                                <form:errors path="email" class="text-danger" />
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <form:input type="password" path="password" class="form-control" />
                                <form:errors path="password" class="text-danger" />
                            </div>
                            <input type="submit" value="Submit" class="btn btn-primary" />
                        </form:form>
                    </div>
                </div>
            </div>
        </body>

        </html>