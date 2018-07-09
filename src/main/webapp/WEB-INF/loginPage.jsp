<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>Login Page</title>
</head>
<body>
	<br>
	<div class="container">
	
		<div class="row">
    		<div class="col"></div>
    		<div class="col-lg-6">
      			<h2>Welcome to the Lakerboard</h2>
      			<p class="lead">To sign up for an account, please <a href="/registration">register</a> today</p>
      			<hr>
		    	<c:if test="${errorMessage != null}">
		        	<c:out value="${errorMessage}"></c:out>
		        	<hr>
		    	</c:if>
		    	<c:if test="${logoutMessage != null}">
	        		<c:out value="${logoutMessage}"></c:out>
		        	<hr>
		    	</c:if>
		    	
		    	<c:if test="${regMessage != null}">
	        		<c:out value="${regMessage}"></c:out>
		        	<hr>
		    	</c:if>
		    	
			    <form method="POST" action="/login">
			     	<div class="form-group">
			     		<label for="username">User Name:</label>
			     		<input type="text" id="username" name="username" class="form-control">
			     	</div>
			     	<div class="form-group">
			        	<label for="password">Password:</label>
			        	<input type="password" id="password" name="password" class="form-control">
			     	</div>
			     	<div class="form-group">
			        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			        	<input type="submit" class="btn btn-primary"  value="Login!"/>
			     	</div>
			    </form>
		   </div>
		   <div class="col"></div>
		 </div>
    </div>
    
     <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>