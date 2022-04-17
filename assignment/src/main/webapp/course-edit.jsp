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
	<h3 class="mb-5 mt-5 text-center">Add New Course</h3>
	
	<c:url var="save" value="/courses"></c:url>
	<form action="${save}" method="post">
	
	<div class="mb-3">
	<label class="form-label">Name</label>
	<input autocomplete="off" type="text" name="name" placeholder="Enter Course Name" required="required" class="form-control">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Duration</label>
	<input autocomplete="off"  type="number" name="duration" placeholder="Enter Course Duration" required="required" class="form-control">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Fees</label>
	<input autocomplete="off"  type="number" name="fees" placeholder="Enter Course Fees" required="required" class="form-control">
	</div>
	
	<div class="mb-3">
	<label class="form-label">Description</label>
	<textarea name="description" rows="4" cols="40" class="form-control"></textarea>
	
	<input type="submit" value="Save Course" class="btn btn-primary mt-3">
	<input type="reset" value="Clear" class="btn btn-secondary mt-3">
	</div>
	
	</form>
	</div>
	</div>
</body>
</html>