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
<div class="col-md-8 offset-md-2">
<h3 class="mb-5 mt-5 text-center">Registration for ${course.name} - ${openClass.teacher}</h3>

<div class="row">
<div>
<c:url var="addNew" value="/registration-edit">
<c:param name="courseId" value="${course.id}"></c:param>
<c:param name="classId" value="${openClass.id}"></c:param>
</c:url>
<a class="btn btn-primary mb-3" href="${addNew}"> Register</a>
</div>
	<div class="">
	
	<c:choose>
	
	<c:when test="${empty classes}">
	<div class="alert alert-warning">
	There is no registration student.
	</div>
	</c:when>
	<c:otherwise>
	
	<table class="table table-striped">
	
	<thead>
		<tr>
			<th>ID</th>
			<th>Student</th>
			<th>Phone</th>
			<th>Email</th>	

			<th>Start Date</th>
			
			
			
		</tr>
	</thead>
	<tbody>
	<c:forEach var="c" items="${classes}">
		<tr>
		<td>${c.id}</td>
		<td>${c.student}</td>
		<td>${c.phone}</td>
		<td>${c.email}</td>

		<td>${c.openClass.startDate}</td>
		</tr>
		
		</c:forEach>
		
	</tbody>
	
	</table>
	
	</c:otherwise>
	
	</c:choose>
	
	<a href="/course" class="mt-5">Home Page</a>	
	</div>
</div>
</div>
</div>
	

	
</body>
</html>