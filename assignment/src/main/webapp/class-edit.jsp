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

	
	
	<div class="row">
	<div class="col-md-4 offset-md-4">
	<h3 class="mb-5 mt-5 text-center">Add New Class for ${course.name}</h3>
	<c:url var="save" value="/classes"></c:url>
	<form action="${save}" method="post">
	
	<div class="mb-3">
	<label class="form-label">Course id </label>
	<input  type="text" name="courseId" placeholder="Course Id" required="required" class="form-control" value="${course.id}" readonly="true">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Course Name</label>
	<input  type="text" name="courseName" placeholder="Course Name" required="required" class="form-control" value="${course.name}" readonly="true">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Start Date</label>
	<input type="date" name="startDate" required="required" class="form-control">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Teacher</label>
	<input autocomplete="off" type="text" name="teacher" placeholder="Enter Teacher Name" required="required" class="form-control" >
	</div>
	
	<input type="submit" value="Save Class" class="btn btn-primary mt-3">
	<input type="reset" value="Clear Input Data" class="btn btn-secondary mt-3">
	
	</form>
	
	</div>
	
	</div>
</body>
</html>