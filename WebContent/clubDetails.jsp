<%@page import="java.util.List" %>
<%@page import="com.entity.ClubEntity" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Life@VIIT</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- google font poppins -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;400&display=swap" rel="stylesheet">
  <!-- fontawesome icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous" />
  <!-- bootstrap -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- for badges and tags: to display tags -->
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

  <link rel="stylesheet" type="text/css" href="css/clubDetails_style.css">
</head>
  <body>
	<!-- to get clubdata -->  		
  	<% 
  		if(request.getAttribute("club")==null)
		{ response.sendRedirect("homepage"); System.out.println("club null "); }  	
		else
		{ ClubEntity club=(ClubEntity)request.getAttribute("club"); 
	%>	
  		
<!-- header starts-->  		
  	<div class="header" id="topheader">
<!-- navbar starts -->
  		<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		 <div class="container text-uppercase p-2">
		  <a class="navbar-brand font-weight-bold text-white" href="homepage">Life @VIIT</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav ml-auto text-uppercase">
		      <li class="nav-item">
		        <a class="nav-link" href="homepage">Home</a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="homepage">Clubs</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="aboutus">About</a>
		      </li> 
		      <li class="nav-item">
		        <a class="nav-link" href="homepage">Contact Us</a>
		      </li> 
		    </ul>
		  </div>
		 </div>
		</nav>
<!-- navbar ends -->

<!-- first section starts -->
	<section class="header-section">
		<div class="center-div">
			<h1 class="font-weight-bold text-uppercase"><%=club.getClubacronym() %> Club</h1>
			<p class="text-capitalize"><%=club.getClubname() %></p>
		</div>
	</section>
<!-- first section ends -->
  	</div>	
<!-- header ends-->  
  
<!-- third section starts -->
  	<section class="services-offered" id="services-offered-div">
  		<div class="container headings text-center">
  			<h1 class="text-center font-weight-bold text-uppercase"><%=club.getClubacronym() %></h1>
  			<p class="text-center text-capitalize">
  				<%=club.getClubname() %>
  			</p>
  		</div>
  		
  		<div class="container">
  			<div class="row">
  				<div class="col-lg-6 col-md-12 col-12 service-div">
  				   <div class="row">
  						<div class="col-lg-2 col-2">  						
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2></h2>
	  						<p>
	  							<img id="preview" class="img-fluid img-thumbnail" src="./showicon?id=<%=club.getClubid() %>">
	  						</p>
	  					</div>
  					</div>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i class="fa-3x fa fa-quote-left" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2>Description</h2>
	  						<p>
	  							<% if(club.getClubdescription().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubdescription()); }  %>
	  						</p>
	  					</div>
  					</div>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i class="fa-3x fa fa-user-circle-o" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2>Staff Co-ordinators</h2>
	  						<p>
	  							<% if(club.getClubstaff().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubstaff()); }  %>
	  						</p>
	  					</div>
  					</div>
  					<br/>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
  							<i class="fa-4x fa fa-mobile" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2>Social Media Handles</h2>
	  					</div>
  					</div><br/>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i style="color: #e75480;" class="fa-2x fa fa-instagram" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2></h2>
	  						<p >
	  							<% if(club.getInstagramlink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getInstagramlink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getInstagramlink() %></span>
	  							</a><%} %>
	  						</p>
	  					</div>
  					</div>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i style="color: #00008B;" class="fa-2x fa fa-linkedin-square" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2></h2>
	  						<p>
	  							<% if(club.getLinkedinlink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getLinkedinlink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getLinkedinlink() %></span>
	  							</a><%} %>
	  						</p>
	  					</div>
  					</div>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i style="color: #87ceff;" class="fa-2x fa fa-twitter-square" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2></h2>
	  						 <p>
	  							<% if(club.getTwitterlink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getTwitterlink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getTwitterlink() %></span>
	  							</a><%} %>
	  						</p>
	  					</div>
  					</div>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i style="color: #00008B;" class="fa-2x fa fa-facebook-official" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2></h2>
	  						 <p>
	  							<% if(club.getFacebooklink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getFacebooklink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getFacebooklink() %></span>
	  							</a><%} %>
	  						</p>
	  					</div>
  					</div>
  				</div>
  				
  				<div class="col-lg-6 col-md-12 col-12 service-div">
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i class="fa-3x fa fa-eye" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2>Vision</h2>
	  						<p>
	  							<% if(club.getClubvision().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubvision()); }  %>
	  						</p>
	  					</div>
  					</div>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i class="fa-3x fa fa-rocket" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2>Mission</h2>
	  						<p>
	  							<% if(club.getClubmission().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubmission()); }  %>
	  						</p>
	  					</div>
  					</div>
  				    <div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i class="fa-3x fa fa-bullseye" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2>Objectives</h2>
	  						<p>
	  							<% if(club.getClubobjectives().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubobjectives()); }  %>
	  						</p>
	  					</div>
  					</div>
  					<div class="row">
  						<div class="col-lg-2 col-2 service-icons">
	  						<i class="fa-3x fa fa-list" aria-hidden="true"></i>
	  					</div>
	  					<div class="col-lg-10 col-10">
	  						<h2>Categories</h2>
	  						<p>
	  					<%
					    String temp=club.getCategories();
					    try{
					    	String[] categories=temp.split(",");
					    	for(String category: categories)
					    	{
					    %>
					      <span class="w3-tag w3-padding w3-round-large w3-blue w3-center"><%=category.toUpperCase() %></span>
					    <%
					        }
					    }catch(Exception e)
					    { 
					    %>
						  <span class="w3-tag w3-padding w3-round-large w3-green w3-center"><%=temp %></span>
					    <%
						}
					    %>
	  						</p>
	  					</div>
  					</div>
  					
  				</div>		
  			</div>
  		</div>
  	</section>
  	
  	<%} %>
<!-- third section ends -->    		

<!-- nineth section footer starts -->
	<footer class="footersection" id="footer-div">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 col-12 footer-text">
					<div>
						<h3>About VIIT</h3>
						<p>
							The Vishwakarma Institute of Information Technology is an autonomous institute of engineering in Pune, India. 
							<br/>It was Established in 2002, it is affiliated to the Savitribai Phule Pune University.
							<a style="color:#0000FF;" href="./aboutus"> Know More </a>
						</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 footer-text">
					<div>
						<h3>Navigation Links</h3>
						<li><a style="color:#0000FF;" href="homepage">Home</a></li>
						<li><a style="color:#0000FF;" href="homepage">Clubs</a></li>
						<li><a style="color:#0000FF;" href="aboutus">About</a></li>
						<li><a style="color:#0000FF;" href="homepage">Contact Us</a></li>
						<li><a style="color:#0000FF;" href="adminlogin">Admin Login</a></li>
					</div>
				</div>
				<div class="col-lg-4 col-md-12 col-12 footer-text">
					<div>
						<h3>Developed By</h3>
						<p>
							<li><a href="https://www.linkedin.com/in/riddhipawar" target="_blank" class="members">232071 Riddhi Pawar</a></li>
							<li><a href="https://www.linkedin.com/in/pranav-wagh-095b68146" target="_blank"  class="members">232074 Pranav Wagh</a></li>
							<li><a href="https://www.linkedin.com/in/patole-nilima-7b89a7209" target="_blank"  class="members">232072 Nilima Patole</a></li>
							<li><a href="https://www.linkedin.com/in/namrata-thakur-8a1714198" target="_blank"  class="members">232069 Namrata Thakur</a></li>
							<li><a href="https://www.linkedin.com/in/rutuja-patil-968829205" target="_blank"  class="members">232075 Rutuja Patil</a></li>
						</p>
					</div>
				</div>
			</div>
			<div class="mt-5 text-center">
				<p>
					Made with <i style="color: #FFB6C1;" class="fa fa-heart" aria-hidden="true"></i> by VIITians<br/>
					Copyright <i style="color: #606060;" class="fa fa-copyright" aria-hidden="true"></i> 2021 VIIT. All rights reserved. 
				</p>
			</div>

		</div>
	</footer>
<!-- nineth section footer ends -->

	
<!-- js plugins cdn links -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <!-- for jquery counter waypoints:Easily execute a function when you scroll to an element,  counter-up:A lightweight jQuery plugin that counts up to a targeted number when the number becomes visible. -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js" integrity="sha512-CEiA+78TpP9KAIPzqBvxUv8hy41jyI3f2uHi7DGp/Y/Ka973qgSdybNegWFciqh6GrN2UePx2KkflnQUbUhNIA==" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.js" integrity="sha512-+/4Q+xH9jXbMNJzNt2eMrYv/Zs2rzr4Bu2thfvzlshZBvH1g+VGP55W8b6xfku0c0KknE7qlbBPhDPrHFbgK4g==" crossorigin="anonymous"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>

	
</script>

  </body>
</html>