<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container-fluid {
            margin-top: 10px;
        }

        .text-right {
            text-align: right;
        }

        .btn-edit {
            margin-right: 8px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }

        .table-hover tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.075);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h1 class="mb-4">Student Management</h1>
    <!-- Add/Edit Student Modal -->
    <div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="studentModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="studentModalLabel">Add/Edit Student</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editStudentForm" method="post" action="${pageContext.request.contextPath}/students/save">
                        <input type="hidden" id="editId" name="id">
                        <div class="form-group row">
                            <label for="editFirstName" class="col-sm-4 col-form-label text-right">First Name:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editFirstName" name="firstName" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="editLastName" class="col-sm-4 col-form-label text-right">Last Name:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editLastName" name="lastName" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="editEmail" class="col-sm-4 col-form-label text-right">Email:</label>
                            <div class="col-sm-8">
                                <input type="email" class="form-control" id="editEmail" name="email" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="editPhoneNumber" class="col-sm-4 col-form-label text-right">Phone Number:</label>
                            <div class="col-sm-8">
                                <input type="tel" class="form-control" id="editPhoneNumber" name="phoneNumber" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="editAddress" class="col-sm-4 col-form-label text-right">Address:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="editAddress" name="address" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-12 text-right">
                                <button type="submit" class="btn btn-primary">Save</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Student Button -->
    <div class="row mb-3">
        <div class="col-md-12 text-right">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#studentModal" onclick="showAddForm()">Add Student</button>
        </div>
    </div>

    <!-- Student List -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${students}" var="student">
                    <tr>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.email}</td>
                        <td>${student.phoneNumber}</td>
                        <td>${student.address}</td>
                        <td>
                            <a class="btn btn-primary btn-edit" href="#" onclick="showEditForm(${student.id}, '${student.firstName}', '${student.lastName}', '${student.email}', '${student.phoneNumber}', '${student.address}')">Edit</a>
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/students/delete/${student.id}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function showAddForm() {
        document.getElementById('editId').value = 0;
        document.getElementById('editFirstName').value = '';
        document.getElementById('editLastName').value = '';
        document.getElementById('editEmail').value = '';
        document.getElementById('editPhoneNumber').value = '';
        document.getElementById('editAddress').value = '';
        $('#studentModal').modal('show');
    }

    function showEditForm(id, firstName, lastName, email, phoneNumber, address) {
        event.preventDefault();
        document.getElementById('editId').value = id;
        document.getElementById('editFirstName').value = firstName;
        document.getElementById('editLastName').value = lastName;
        document.getElementById('editEmail').value = email;
        document.getElementById('editPhoneNumber').value = phoneNumber;
        document.getElementById('editAddress').value = address;
        $('#studentModal').modal('show');
    }
</script>
</body>
</html>