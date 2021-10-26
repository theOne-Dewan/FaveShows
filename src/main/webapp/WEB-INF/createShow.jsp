<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <!-- c:out ; c:forEach ; c:if -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
  <!-- Formatting (like dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  <!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create A New Show</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="container"> <!-- Beginning of Container -->
		<a href="/shows" class="btn btn-success mt-5">Home Page</a>
		<a href="/logout" class="btn btn-danger float-right mt-5">Logout</a>
		
		<div class="row">
			<div class="col">	
				<h1>Create a new Show</h1>
				<form:form action="/shows/new" method="post" modelAttribute="show">
				    <form:errors class="text-danger" path="title"/>
				    <p>
				        <form:label path="title">Title</form:label>
				        <form:input path="title"/>
				    </p>
				    <form:errors class="text-danger" path="network"/>
				    <p>
				        <form:label path="network">Network</form:label>
				        <form:input path="network"/>
				    </p>
				   	<form:hidden value="${userId}" path="user"/>      
				    <input class="btn btn-success mt-2" type="submit" value="Create"/>
				</form:form> 
				
			</div> <!-- End of Main Column -->
		</div> <!-- End of Row -->
	</div> <!-- End of Container -->
</body>
</html>