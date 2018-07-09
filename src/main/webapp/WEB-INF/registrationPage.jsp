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
<title>Registration Page</title>
</head>
<body>

	<div class="container top30">
	
		<div class="row">
    		<div class="col"></div>
    		<div class="col-lg-6">
      			<h2>Register for the Lakerboard</h2>
      			<hr>
      			<c:if test="${err}">
	      			<form:errors path="user.*"/>
	      			<hr>
      			</c:if>
			    <form:form method="POST" action="/registration" modelAttribute="user">
			     	<div class="form-group row">
			     		<form:label path="username" class="col-sm-4 col-form-label">User Name:</form:label>
			     		<div class="col-sm-8 top5">
           					<form:input path="username" class="form-control form-control-sm" id="colFormLabelSm" />
           				</div>
			     	</div>
			     	<div class="form-group row">
			    		<label for="email" class="col-sm-4 col-form-label">Email:</label>
           				
           				<div class="col-sm-8 top5">
           					<input name="email" class="form-control form-control-sm" id="colFormLabelSm" placeholder="Email" />
           					<small class="form-text text-muted">We'll never share your email with anyone else.</small>
           				</div>
           				
			    	</div>
			  		<div class="form-group row">
				      		<label for="realname" class="col-sm-4 col-form-label">Real Name:</label>
           					<div class="col-sm-8 top5">
           						<input name="realname" class="form-control form-control-sm" id="colFormLabelSm" />
           					</div>
					</div>
					<div class="form-group row">
				      		<label for="sponsor" class="col-sm-4 col-form-label">Referred By:</label>
				      		<div class="col-sm-8 top5">
           						<input name="sponsor" class="form-control form-control-sm" id="colFormLabelSm" />
           						<small class="form-text text-muted">If you were invited, please provide their user name.</small>
           					</div>
					</div>
		    		<div class="form-group row">
		    				<label for="desc" class="col-sm-4 col-form-label">About:</label>
		    				<div class="col-sm-8 top5">
          						<textarea name="desc" class="form-control form-control-sm" id="colFormLabelSm"  ></textarea>
          						<small class="form-text text-muted">Tell us a bit about yourself &amp; why you want to join.</small>
		    				</div>
		    		</div>				  
			     	<div class="form-group row">
			            <form:label path="password" class="col-sm-4 col-form-label">Password:</form:label>
			            <div class="col-sm-8 top5">
			            	<form:password path="password" class="form-control form-control-sm" id="colFormLabelSm"/>
			            </div>
			        </div>
			       	<div class="form-group row">
			            <form:label path="passwordConfirmation" class="col-sm-4 col-form-label">Confirm Password:</form:label>
			            <div class="col-sm-8 top5">
			            	<form:password path="passwordConfirmation" class="form-control form-control-sm" id="colFormLabelSm" />
			            </div>
			        </div>
			     	<div class="form-group">
			        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			        	<input type="submit" class="btn btn-primary float-right"  value="Register"/>
			     	</div>
			    </form:form>
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