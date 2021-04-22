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
  
  <link rel="stylesheet" type="text/css" href="css/index_style.css">
</head>
  <body>
  	
	<!-- redirect to get clubdata and then load the page again -->  		
  	<% 
  		if(request.getAttribute("clubsCount")==null)
  		{ response.sendRedirect("homepage"); System.out.println("clubsCount null "); }  	
  		else{
  	%>	
  		
<!-- header starts-->  		
  	<div class="header" id="topheader">
<!-- navbar starts -->
  		<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		 <div class="container text-uppercase p-2">
		  <a class="navbar-brand font-weight-bold text-white" href="#">Life @VIIT</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav ml-auto text-uppercase">
		      <li class="nav-item active">
		        <a class="nav-link" href="homepage">Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#clients-feedback-div">Clubs</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="aboutus">About</a>
		      </li> 
		      <li class="nav-item">
		        <a class="nav-link" href="#contactus-div">Contact Us</a>
		      </li> 
		    </ul>
		  </div>
		 </div>
		</nav>
<!-- navbar ends -->

<!-- first section starts -->
	<section class="header-section">
		<div class="center-div">
			<h1 class="font-weight-bold text-uppercase">LET'S GROW TOGETHER</h1>
			<p class="text-capitalize">we believe in collaboration over competition</p>
			<div class="header-buttons">
				<a href="#header-extra-div">Why Join US ?</a>
				<a href="aboutus">About US</a>
			</div>
		</div>
	</section>
<!-- first section ends -->
  	</div>	
<!-- header ends-->  
  
<!-- second section starts -->  		
  	<section class="header-extradiv" id="header-extra-div">
  		<div class="container headings text-center">
  			<h1 class="text-center font-weight-bold text-capitalize">Why Join Us ?</h1>
  			<p class="text-center text-capitalize">
  				Not Convinced Yet? Want some more Reasons? <a href="./reasonstojoinclub"> Explore All </a>
  			</p>
  		</div><br/>
  		<div class="container">
  			<div class="row">
  				<div class="extra-div col-lg-4 col-md-4 col-12">
  					<a href="#"><i class="fa-3x fa fa-user" aria-hidden="true"></i></a>
  					<h2 class="text-uppercase">Learn more about yourself</h2>
  					<p>
  						Joining a club presents many opportunities to learn more about yourself.
  					    You will be able to discover your passion, your skills and experiment with areas of expertise.
  					    This self-awareness will be beneficial in your future career.
  					</p>
  				</div>
  				<div class="extra-div col-lg-4 col-md-4 col-12">
  					<a href="#"><i class="fa-3x fa fa-trophy" aria-hidden="true"></i></a>
  					<h2 class="text-uppercase">Develop soft skills</h2>
  					<p>
  						Soft skills allow us to effectively interact with others, like communication, attitude, and work ethics. 
  						Participating in club improves these skills.  
  						You will gain emotional intelligence as you develop new relationships.
  					</p>
  				</div>
  				<div class="extra-div col-lg-4 col-md-4 col-12">
  					<a href="#"><i class="fa-3x fa fa-users" aria-hidden="true"></i></a>
  					<h2 class="text-uppercase">Expand your Network</h2>
  					<p>
  						Joining a club enables you to connect to a peer groups who shares similar interests as you. 
  						This can be an amazing platform to meet potential employers. 
  						These connections will be invaluable for you in the near future.   
  					</p>
  				</div>
  			</div>
  		</div>
  	</section>  
<!-- second section ends -->  	
 
<!--  sixth section starts-->
	<section class="clients-feedback" id="clients-feedback-div">
  		<div class="container headings text-center">
  			<h1 class="text-center font-weight-bold text-capitalize">Our Clubs?</h1>
  			<p class="text-center text-capitalize">
  				VIIT has various technical, cultural, social clubs
  			</p>
  		</div><br/>
  		<div class="container">
  		
	  		<!-- carosel : for cycling through elements -->
	  		<div id="demo" class="carousel slide" data-ride="carousel">		  
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				  </ul>
				  		
			  <!-- The slideshow -->
				  
			  <div class="carousel-inner container">
				<!-- add 4 carousel items in carousel -->
				
					<%	String firstCarouselItem="active";
						List<ClubEntity> clubs=(List<ClubEntity>)request.getAttribute("clubsData");
						int clubsCount= Integer.parseInt(request.getAttribute("clubsCount").toString());
						System.out.println("clubsCount: "+clubsCount); 
						int remainder= clubsCount%3;
						int quotient= clubsCount/3;
						int cardArrayListIndex=0;
					
					 for(int i=0; i<quotient; i++){ 
					%>
					    <div class="carousel-item <%=firstCarouselItem %>">
					<%firstCarouselItem=""; %>
					      <!-- add 3 cards in 1 carousel item -->
					      <div class="row">
					<%for(int j=0; j<3; j++){ %>		      
					      	<div class="col-lg-4 col-md-4 col-12">
					      		<div class="box">
					      			<a href="./clubDetails?id=<%=clubs.get(cardArrayListIndex).getClubid()%>"><img src="./showicon?id=<%=clubs.get(cardArrayListIndex).getClubid()%>" class="img-fluid img-thumbnail"></a>
					      			<p class="m-4 text-lowercase">
					      				<%=clubs.get(cardArrayListIndex).getClubvision().substring(0, 30)+"..."%>	
					      			</p>
					      			<h1 class="text-capitalize"><%=clubs.get(cardArrayListIndex).getClubname() %></h1>
					      			<h2 class="text-uppercase"><%=clubs.get(cardArrayListIndex).getClubacronym()%></h2>
					      		</div>
					      	</div>
					<%
					 cardArrayListIndex++; System.out.println("cardArrayListIndex3: "+cardArrayListIndex); } 
					%>		      	
					      </div>
					    </div>
					<%
					} 
					if(remainder!=0){
					%>	
					<div class="carousel-item <%=firstCarouselItem %>">
					      <!-- add 3 cards in 1 carousel item -->
					      <div class="row">
					<%while(remainder--!=0){ %>		      
					      	<div class="col-lg-4 col-md-4 col-12">
					      		<div class="box">
					      			<a href="./clubDetails?id=<%=clubs.get(cardArrayListIndex).getClubid()%>"><img src="./showicon?id=<%=clubs.get(cardArrayListIndex).getClubid()%>" class="img-fluid img-thumbnail"></a>
					      			<p class="m-4 text-lowercase">
					      				<%=clubs.get(cardArrayListIndex).getClubvision().substring(0, 30)+"..."%>	
					      			</p>
					      			<h1 class="text-capitalize"><%=clubs.get(cardArrayListIndex).getClubname() %></h1>
					      			<h2 class="text-uppercase"><%=clubs.get(cardArrayListIndex).getClubacronym()%></h2>
					      		</div>
					      	</div>
					<%
					cardArrayListIndex++; System.out.println("cardArrayListIndex[rem]: "+cardArrayListIndex); }}  }
					%>		      	
					      </div>
					    </div>
	 
			  </div>
			  
			  <!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span> 
			    <!--  style="background-color: #808080; border-radius: 30px;" of span tag -->
			  </a>		
			</div>
  		</div>
  	</section>
<!--  sixth section ends-->

<!-- fourth js counters section starts -->  
	<section class="project-works">
  		<div class="container headings text-center">
  			<h1 class="text-center font-weight-bold text-capitalize">People Associated With Us</h1><br/>
  		</div><br/>
  		
  		<div class="container d-flex justify-content-around align-items-center">
  			<div>
  				<h1 class="count">1500</h1>
  				<p>Total Students</p>
  			</div>
  			<div>
  				<h1 class="count">600</h1>
  				<p>Total Faculty</p>
  			</div>
  			<div>
  				<h1 class="count">300</h1>
  				<p>Partner Organizations</p>
  			</div>
  			<div>
  				<h1 class="count">150</h1>
  				<p>Total Visitors</p>
  			</div>
  		</div>
  	</section>
<!-- fourth js counters section ends --> 
	
<!-- seventh section form starts -->
	<section class="contactus" id="contactus-div">
  		<div class="container headings text-center">
  			<h1 class="text-center font-weight-bold text-capitalize">Contact US</h1>
  			<p class="text-center text-capitalize">
  				We are here to help and answer any questions you might have. We are looking forward to hear from you. 
  			</p>
  		</div><br/>
  		
  		<div class="container">
  			<div class="row">
  				<div class="col-lg-8 col-md-8 col-10 offset-lg-2 offset-md-2 offset-1">
  				<!-- form -->
  					<form action="addcustomerfeedback" method="post">
					  <div class="form-group">
					    <input type="text" class="form-control" placeholder="Enter Your Name" id="username" name="name" required="required" autocomplete="off">
					  </div>
					  <div class="form-group">
					    <input type="email" class="form-control" placeholder="Enter Your Email ID" id="email" name="emailid" required="required" autocomplete="off">
					  </div>
					  <div class="form-group">
					    <input type="number" class="form-control" placeholder="Enter Your Mobile No" id="mobileno" name="mobileno" required="required" autocomplete="off">
					  </div>
					  <div class="form-group">
					  	  <textarea class="form-control" rows="4" placeholder="Enter Your Message" id="message" name="message"></textarea>
					  </div>
					  <div class="d-flex justify-content-center form-button">
						<button type="submit" class="btn btn-primary">Submit</button>
					  </div>
					</form>
  				</div>
  			</div>
  		</div>
  	</section>
<!-- seventh section form ends -->	

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
							<a href="./aboutus"> Know More </a>
						</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12 footer-text">
					<div>
						<h3>Navigation Links</h3>
						<li><a href="#">Home</a></li>
						<li><a href="#clients-feedback-div">Clubs</a></li>
						<li><a href="aboutus">About</a></li>
						<li><a href="#contactus-div">Contact Us</a></li>
						<li><a href="adminlogin">Admin Login</a></li>
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
			
			<!-- uparrow floating button -->
			<div class="scrolltop float-right">
				<i class="fa fa-arrow-up" onclick="topFunction()" id="myBtn"></i>
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

//floating uparrow button
mybtn= document.getElementById("myBtn");

$(document).ready(function() {
	mybtn.style.display= "none";
	
	//validate for alphabets input only
	$('#username').keypress(function (e) {
        var regex = new RegExp("^[a-zA-Z\s]+$"); //^[a-zA-Z]+$
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        else
        {
        e.preventDefault();
        alert('Please Enter valid name');
        return false;
        }
    });

	//validate email . char
	$('#mobileno').focusin(function(){
		if(!$('#email').val().includes('.')){
			alert('Please enter valid EmailID');
			$('#email').focus(); //to show alert only once
		}
	});
	
	//validate mobile no 10 digits
	$('#message').focusin(function(){
		if($('#mobileno').val().length<10 || $('#mobileno').val().length>10){
			alert('Please enter valid Mobile No');
			$('#mobileno').focus(); //to show alert only once
		}
	});

	
});

//for counter elements
	$('.count').counterUp({
		delay: 10,
		time: 3000
	})
	
	//when user scrolls 20px down from top show floating button
	window.onscroll= function(){ scrollFunction() };
	
	function scrollFunction(){
		if(document.body.scrollTop>20 || document.documentElement.scrollTop>20){
			mybtn.style.display= "block";
		}	
		else{
			mybtn.style.display= "none";
		}
	}
	
	//when user clicks on uparrow float button
	function topFunction(){
		document.body.scrollTop=0;	//for safari
		document.documentElement.scrollTop=0; //for chrome, firefox, internet explorer, opera
	}
	
</script>

  </body>
</html>