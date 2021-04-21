<%@page import="java.util.List" %>
<%@page import="com.entity.FeedbackEntity" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>
<!-- for all frontend formatting -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
		
<link rel="stylesheet" type="text/css" href="css/customerFeedbacks_style.css">
</head>
<body>

<!-- navbar -->	

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		 <div class="container text-uppercase p-2">
		  <a class="navbar-brand font-weight-bold text-white" href="#">Admin Panel</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav ml-auto text-uppercase">
		      <li class="nav-item active">
		        <a class="nav-link" href="showadmindashboard">Dashboard <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="showcustomerfeedbacks">Feedbacks</a>
		      </li> 
		      <li class="nav-item">
		        <a class="nav-link" href="homepage">Life @VIIT</a>
		      </li>   
		      <li class="nav-item">
		      	<%
           	    if(session.getAttribute("username")==null){ response.sendRedirect("adminlogin"); }
           		 %>
		        <a class="nav-link" href="adminlogin">Hello,<%= session.getAttribute("username") %>&nbsp;<i class="fa fa-sign-out fa-lg" aria-hidden="true"></i></a>
		      </li> 
		    </ul>
		  </div>
		 </div>
	</nav>
	
	<div class="container">
		<div class="showFeedback">
			<%
				if(request.getAttribute("feedbackData")==null){  
			%>
				  <h1 class="display-1">No Feedbacks Found....</h1>
			<%  }
				else
				{
			%>	
			
				<div class="row mx-auto">
					<h2>Customers Feedback</h2>
				</div><br/>
				<table class="table table-hover">
				  <thead style="background-color: #C0C0C0;">
				    <tr>
				      <th scope="col">ID</th>
				      <th scope="col">Name</th>
				      <th scope="col">Email ID</th>
				      <th scope="col">Mobile No</th>
				      <th scope="col">Feedback</th>
				    </tr>
				  </thead>
				  <tbody>
		
			<%
				List<FeedbackEntity> feedbacks=(List<FeedbackEntity>)request.getAttribute("feedbackData");
				for(FeedbackEntity feedback: feedbacks)
				{
			%>
				    <tr>
				      <th scope="row"><%=feedback.getFeedbackid() %></th>
				      <td><%=feedback.getName() %></td>
				      <td><%=feedback.getEmailid() %></td>
				      <td><%=feedback.getMobileno() %></td>
				      <td><%=feedback.getMessage() %></td>
				    </tr>
			<%  } %>	    
				  </tbody>
				</table>
			<% } %><br/><br/>
			
			</div>
		</div>

</body>
</html>