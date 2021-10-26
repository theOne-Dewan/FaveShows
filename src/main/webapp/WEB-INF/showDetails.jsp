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
<title>Show Details</title>
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
			<div class="col-2">	
			</div> <!-- End of Padding Column 1 -->
			<div class="col-8">	
				<h1><c:out value="${show.title}"/></h1>
				<br>
				<h5>Network  :  <c:out value="${show.network}"/></h5>
				<br>
				<h3>Users who rated this show</h3>
				<br>
				<table class="table table-bordered">
				  <thead>
				    <tr>
				      <th scope="col">Name</th>
				      <th scope="col">Rating</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${allRatings}" var="rating">
				    <tr>
				      <th scope="row"><c:out value="${rating.user}"/></th>
				      <td><c:out value="${rating.rating}"/></td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
				<br>
				<a class="btn btn-secondary mt-5" href="/shows/${show.id}/edit">Edit</a>
				<br>
				<p>
				<form:form action="/shows/add_rating" method="post" modelAttribute="rating">
				    <form:errors class="text-danger" path="rating"/>
				        <form:label path="rating">Leave a rating: </form:label>
				        <form:input type="number" path="rating"/>
				   	<form:hidden value="${user.firstName}" path="user"/>
				   	<form:hidden value="${show.id}" path="show"/>       
				    <input class="btn btn-dark ml-20" type="submit" value="Rate!"/>
				</form:form> 
				<p>
			</div> <!-- End of Main Column -->
			<div class="col-2">	
			</div> <!-- End of Padding Column 2 -->
		</div> <!-- End of Row -->
	</div> <!-- End of Container -->
</body>
</html>