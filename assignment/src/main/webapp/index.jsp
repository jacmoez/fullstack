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

	
	<div class="container col-md-8 offset-md-2 mt-2">
	
	
	<h3 class="text-center mb-5 mt-5">All  Courses</h3>
	
	<div>
		<a class="btn btn-primary mb-3" href="course-edit"> Add New Course</a>
	</div>
	
	<c:choose>
	<c:when test="${ empty courses}">
	
	<div class="alert alert-warning">There is no course.Please create new course.</div>
	
	</c:when>
	<c:otherwise>
	
	<table class="table table-striped">
	<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Duration</th>
			<th>Fees</th>
			<th>Description</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="c" items="${courses}">
		
		<tr>
		<td>${c.id}</td>
		<td>${c.name}</td>
		<td>${c.duration} Months</td>
		<td>${c.fees}</td>
		<td>${c.description}</td>
		<td>
		
		<c:url var="classes" value="/classes">
			<c:param name="courseId" value="${c.id}"></c:param>
		</c:url>
		<a href="${classes}" > Open Classes</a>
		
		</td>
		
		</tr>
		
		</c:forEach>
	</tbody>
	
	</table>
	
	</c:otherwise>
	</c:choose>
	
	
	
	</div>

</body>
</html>