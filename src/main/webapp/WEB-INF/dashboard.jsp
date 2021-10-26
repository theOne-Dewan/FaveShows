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
<title>TV Shows</title>
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
				<h2>Welcome <c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></h2>
				<br>
				<h3>TV Shows</h3>
				<br>
				<table class="table table-bordered">
				  <thead>
				    <tr>
				      <th scope="col">Show</th>
				      <th scope="col">Network</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${allShows}" var="show">
				    <tr>
				      <th scope="row"><a href="/shows/${show.id}"><c:out value="${show.title}"/></a></th>
				      <td><c:out value="${show.network}"/></td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table>
				<br>
				<a class="btn btn-secondary mt-5" href="/shows/new">Create A Show</a>
			</div> <!-- End of Main Column -->
			<div class="col-2">	
			</div> <!-- End of Padding Column 2 -->
		</div> <!-- End of Row -->
	</div> <!-- End of Container -->
</body>
</html>