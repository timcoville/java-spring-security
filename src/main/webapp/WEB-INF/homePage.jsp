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
<title>Welcome Page</title>
</head>
<body>
			
				
	<div class="container-fluid">
		<div class="row top7">
			<div class="col"></div>
			<div class="col-10">
			  	<form id="logoutForm" method="POST" action="/logout">
				    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				    <input type="submit" class="btn btn-primary btn-sm" value="Logout" />
				</form>
				<img class="img-fluid rounded mx-auto d-block" src="http://www.splunged.com/images/banner2.jpg">
				<div class="row justify-content-center top7 no-gutters">
					<div class="col-12 text-center">
						<a class="top10" href="/">Previous 20</a>
						
						<p class="top10 font-weight-light">Welcome, <a href="users/${currentUser.id}"><c:out value="${currentUser.username}" /></a>! You have 0 new posts.</p>
						
						<form id="searchForm" method="POST" action="/search">

							<label for="post"  class="col-form-label top5" style="margin-left:35px; display:inline-block;">Search posts:</label>

								<input type="text" class="form-control form-control-sm top10" style="width:250px; display:inline-block;" id="post" name="post" >

								<input type="submit" class="btn btn-primary btn-sm" style="margin-bottom:1px;" value="Go" />
								<button class="btn btn-primary btn-sm left10" style="margin-bottom:1px;">Advanced Search</button>

						</form>
						
					</div>
					
				</div>
				
				

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