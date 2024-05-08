<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08/05/2024
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .btn-edit {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1>Student Management</h1>

    <!-- Add/Edit Student Form -->
    <div class="row mb-3">
        <div class="col-md-6">
            <h2>Add/Edit Student</h2>
            <form action="${pageContext.request.contextPath}/students/add" method="post">
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Student</button>
            </form>
        </div>
    </div>

    <!-- Student List -->
    <div class="row">
        <div class="col-md-6">
            <h2>Student List</h2>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${students}" var="student">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>
                            <a class="btn btn-primary btn-edit" href="${pageContext.request.contextPath}/students/edit/${student.id}">Edit</a>
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/students/delete/${student.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>


</body>
</html>
