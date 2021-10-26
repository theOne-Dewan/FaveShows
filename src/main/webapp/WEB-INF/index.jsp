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
<title>Log In or Register</title>
  <!-- Bootstrap -->
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<div class="container"> <!-- Beginning of Container -->
		<div class="row">
			<div class="col">
			<p class="text-danger"><c:out value="${alert}" /></p>
				<h1>Register!</h1>
    
			    <p><form:errors class="text-danger" path="user.*"/></p>
			    
			    <form:form class="form-group" method="POST" action="/registration" modelAttribute="user">
			        <p>
			            <form:label path="firstName">First Name:</form:label>
			            <form:input type="text" path="firstName"/>
			        </p>
			        <p>
			            <form:label path="lastName">Last Name:</form:label>
			            <form:input type="text" path="lastName"/>
			        </p>
			        <p>
			            <form:label path="email">Email:</form:label>
			            <form:input type="email" path="email"/>
			        </p>
			        <p>
			            <form:label path="password">Password:</form:label>
			            <form:password path="password"/>
			        </p>
			        <p>
			            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
			            <form:password path="passwordConfirmation"/>
			        </p>
			        <input class="btn btn-danger mt-3" type="submit" value="Register!"/>
			    </form:form>
			</div> <!-- End of Registration Column -->
			<div class="col">
				<h1>Login</h1>
			    <p class="text-danger"><c:out value="${error}" /></p>
			    <form class="form-group" method="post" action="/login">
			        <p>
			            <label for="email">Email:</label>
			            <input type="text" id="email" name="email"/>
			        </p>
			        <p>
			            <label for="password">Password:</label>
			            <input type="password" id="password" name="password"/>
			        </p>
			        <input class="btn btn-primary mt-3" type="submit" value="Login!"/>
			    </form>  
			</div> <!-- End of Login Column -->
		</div> <!-- End of Row -->
	</div> <!-- End of Container -->
</body>
</html>