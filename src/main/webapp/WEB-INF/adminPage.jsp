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
<title>Admin Page</title>
</head>
<body>
<div class="container">
    <div class="row top10">
    	<div class="col">
	    <h1>Welcome <c:out value="${currentUser.realname}"></c:out></h1>
	    
	    
	    <table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">User Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Authority</th>
		      <th scope="col">Last Activity</th>
		      <th scope="col">Last Post</th>
		      <th scope="col">Actions</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${users}" var="user" varStatus="idx">
			    <tr>
			      <th scope="row">
			      	<c:set var="num" value="${idx}" />
			      	<c:out value="${idx.index + 1}"/>
			      </th>
			      <td><c:out value="${user.username}"/> </td>
			      <td><c:out value="${user.email}"/> </td>
			      <td>
			      	<c:if test="${user.roles.size() == 0}">
			      		None
			      	</c:if>
			      	<c:if test="${user.roles.size() != 0}">
				      	<c:if test="${user.roles.get(0).name.contains('ADMIN') }">
				      		Admin
				      	</c:if>
				      	<c:if test="${user.roles.get(0).name.contains('USER') }">
				      		User
				      	</c:if>
			      	</c:if>	
			      </td>
			      <td><fmt:formatDate type="both" dateStyle="long" timeStyle="long"  value="${user.activeAt }" /></td>
			      <td><c:out value="${user.lastPostId}"/> #40003</td>
			      <td>
			      
			      
			      	<c:if test="${user.roles.size() == 0}">
			      		<a href="/admin/approve/${user.id}"><button class="btn btn-secondary btn-sm" >Approve User</button></a>
			      	</c:if>
			      	<c:if test="${user.roles.size() != 0 }">
			      		<c:if test="${user.roles.get(0).name.contains('USER') }">
			      			<div class="dropdown">
								  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    Actions
								  </button>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
								    <a class="dropdown-item" href="/admin/ban/${user.id}">Ban User</a>
								    <a class="dropdown-item" href="#">Promote to Admin</a>
								    <a class="dropdown-item" href="#">Reset Password</a>
								  </div>
							</div>
			      		</c:if>
			      		<c:if test="${user.roles.get(0).name.contains('ADMIN') }">
			      			<div class="dropdown">
								  <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    Actions
								  </button>
								  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">								   
								    <a class="dropdown-item" href="/admin/ban/${user.id}">Ban User</a>
								    <a class="dropdown-item" href="#">Demote to User</a>
								    <a class="dropdown-item" href="#">Reset Password</a>
								  </div>
							</div>
			      		</c:if>
			      	</c:if>
			      </td>
			    </tr>
		    </c:forEach>
		  </tbody>
		</table>
	    
	    
	    
	    
	    
	    
	    
	    <form id="logoutForm" method="POST" action="/logout">
	        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        <input type="submit" class="btn btn-secondary btn-sm"  value="Logout!" />
	    </form>
	    <br><a href="/"><button class="btn btn-primary btn-sm">Home</button></a>
	    
	    
	    </div>
    </div>
 </div>
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>