<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Using Ioc Container</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>
</head>
<body>

	<div class="container col-md-4 offset-md-4">
	
	<h3 class="text-center mt-5 mb-5">Registration ${course.name} - ${openClass.teacher}</h3>
	
	
	<c:url var="save" value="/registration">
	<c:param name="courseId" value="${course.id}"></c:param>
	<c:param name="classId" value="${openClass.id}"></c:param>
	</c:url>
	<form action="${save}" method="post">
	
	<div class="mb-3">
	<label class="form-label">Class id </label>
	<input readonly="true" type="text" name="classId" placeholder="Class id" required="required" class="form-control" value="${openClass.id}">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Course</label>
	<input readonly="true" type="text" name="course" value="${course.name}" placeholder="Enter Student Name" required="required" class="form-control" >
	</div>
	
	<div class="mb-3">
	<label class="form-label">Start Date</label>
	<input readonly="true" type="text" name="startDate" value="${openClass.startDate}" placeholder="Enter Student Name" required="required" class="form-control" >
	</div>
	
	
	<div class="mb-3">
	<label class="form-label">Student</label>
	<input autocomplete="off" type="text" name="student" placeholder="Enter Student Name" required="required" class="form-control" >
	</div>
	
	<div class="mb-3">
	<label class="form-label">Phone</label>
	<input autocomplete="off" type="text" name="phone" placeholder="Enter Phone Number" required="required" class="form-control" >
	</div>
	
	<div class="mb-3">
	<label class="form-label">Email</label>
	<input autocomplete="off"  type="email" name="email" placeholder="Enter Email Address" required="required" class="form-control" >
	</div>
	
	
	<input type="submit" value="Save" class="btn btn-primary mt-3">
	<input type="reset" value="Clear" class="btn btn-secondary mt-3">

	
	</form>

	
	</div>
</body>
</html>