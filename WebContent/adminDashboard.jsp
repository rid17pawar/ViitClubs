<%@page import="java.util.List" %>
<%@page import="com.entity.ClubEntity" %>
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
<!-- for inputting tags -->	
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- for badges and tags: to display tags -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
<link rel="stylesheet" type="text/css" href="css/adminDashboard_style.css">
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
		<% if(request.getAttribute("action")!=null){ %>
<!-- Toast to display operations done -->	
	
		<div class="alert alert-dismissible alert-warning">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=request.getAttribute("action") %></strong>
		</div>
		<%} %>
		
<!-- Responsive Card Deck -->
		
		<main class="grid">
	<%
		if(request.getAttribute("clubsData")==null){  
	%>
		  <h1 class="display-1">No Clubs Found....</h1>
	<%  }
		else
		{
		  List<ClubEntity> clubs=(List<ClubEntity>)request.getAttribute("clubsData");
		  for(ClubEntity club: clubs)
		  {
	%>	
			<article>
				<img src="./showicon?id=<%=club.getClubid()%>">
				<div class="text">
					<h3 class="text-uppercase"> <%=club.getClubacronym() %> </h3>
					<p class="text-capitalize"> <%=club.getClubname() %> </p>
					<a href="#"><button class="view" value="<%=club.getClubid() %>">View</button></a>
				</div>
			</article>
			
<!-- Modal to view club details-->

		<!-- Button trigger modal -->
		<div class="modal fade" id="viewClubModal<%=club.getClubid() %>" tabindex="-1" role="dialog" aria-labelledby="viewClubModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		    <div class="modal-content">
		    
		      <div class="modal-header">
		        <h5 class="modal-title" id="viewClubModalLabel">  Club Details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span style="color: black;" aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		      <div class="modal-body">
		        <div class="container-fluid">
		        	<!-- display club details -->  
				      <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabelLg" class="col-sm-2 col-form-label">Club Icon:</label>
					    <div class="col-sm-10">
						    <img style="height: 100px; width: 200px;" class="rounded" src="./showicon?id=<%=club.getClubid()%>">
						</div>
					  </div>  
					  <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabelLg" class="col-sm-2 col-form-label ">Acronym:</label>
					    <div class="col-sm-10 text-uppercase">
					      <p><%=club.getClubacronym() %></p>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabelLg" class="col-sm-2 col-form-label ">Name:</label>
					    <div class="col-sm-10 text-capitalize">
					      <p><%=club.getClubname() %></p>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabel" class="col-sm-2 col-form-label">Description:</label>
					    <div class="col-sm-10">
					      <p>
	  							<% if(club.getClubdescription().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubdescription()); }  %>
	  						</p>
					    </div>
					  </div>
					  
					  <div class="seperator">More About Club</div><br/>
					  <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabel" class="col-sm-2 col-form-label">Vision:</label>
					    <div class="col-sm-10">
					      <p>
	  							<% if(club.getClubvision().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubvision()); }  %>
	  						</p>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabel" class="col-sm-2 col-form-label">Mission:</label>
					    <div class="col-sm-10">
					       <p>
	  							<% if(club.getClubmission().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubmission()); }  %>
	  						</p>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabel" class="col-sm-2 col-form-label">Objectives:</label>
					    <div class="col-sm-10">
					      <p>
	  							<% if(club.getClubobjectives().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubobjectives()); }  %>
	  						</p>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabel" class="col-sm-2 col-form-label">Staff Co-ordinators:</label>
					    <div class="col-sm-10">
					    <p>
	  							<% if(club.getClubstaff().equals("")){ out.print("Not Available"); }else{ out.print(club.getClubstaff()); }  %>
	  						</p>
					    </div>
					  </div>

					  <div class="seperator">Social Media Handles</div><br/>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i style="color: #e75480;" class="fa fa-instagram fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					    	<p >
	  							<% if(club.getInstagramlink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getInstagramlink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getInstagramlink() %></span>
	  							</a><%} %>
	  						</p>  
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i style="color: #00008B;" class="fa fa-linkedin-square fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					      <p>
	  							<% if(club.getLinkedinlink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getLinkedinlink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getLinkedinlink() %></span>
	  							</a><%} %>
	  						</p>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i style="color: #87ceff;" class="fa fa-twitter-square fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					      <p>
	  							<% if(club.getTwitterlink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getTwitterlink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getTwitterlink() %></span>
	  							</a><%} %>
	  						</p>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i style="color: #00008B;" class="fa fa-facebook-official fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					      <p>
	  							<% if(club.getFacebooklink().equals("")){ out.print("Not Available"); }else{ %>
	  							<a href="<%=club.getFacebooklink() %>" target="_blank">
	  							<span style="color: #50d1c0;"><%=club.getFacebooklink() %></span>
	  							</a><%} %>
	  						</p>
					    </div>
					  </div>
		        	 <div class="form-group row">
					    <label style="font-weight: bold;" for="colFormLabel" class="col-sm-2 col-form-label">Categories<span class="required">*</span></label>
					    <div class="col-sm-10">
					    <%
					    String temp=club.getCategories();
					    try{
					    	String[] categories=temp.split(",");
					    	for(String category: categories)
					    	{
					    %>
					      <span class="w3-tag w3-padding w3-round-large w3-red w3-center"><%=category.toUpperCase() %></span>
					    <%
					        }
					    }catch(Exception e)
					    { 
					    %>
						  <span class="w3-tag w3-padding w3-round-large w3-green w3-center"><%=temp %></span>
					    <%
						}
					    %>
					    </div>
					  </div>
				</div>
		      </div>
		      
		      <div class="modal-footer">
		      	<a href="editclub?id=<%=club.getClubid()%>"><i style="color: black;" class="fa fa-pencil fa-2x" aria-hidden="true"></i> </a>&nbsp;
		      	<a href="deleteclub?id=<%=club.getClubid()%>"><i style="color: black;" class="fa fa-trash fa-2x" aria-hidden="true"></i> </a>
		      </div>
		    </div>
		  </div>
		</div>	
					
	<% 
	     }
	   }
	%>
	
		</main>
		
<!-- Floating button -->

		<div class="float">
		  <i class="fa fa-plus my-float"></i>
		</div>
		<div class="label-container">
		  <div class="label-text">New Club</div>
		  <i class="fa fa-play label-arrow"></i>
		</div>
		
<!-- Modal to add new club -->

		<!-- Button trigger modal -->
		<div class="modal fade" id="insertClubModal" tabindex="-1" role="dialog" aria-labelledby="insertClubModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		    <div class="modal-content">
		    
		      <div class="modal-header">
		        <h5 class="modal-title" id="insertClubModalLabel"><i class="fa fa-users" aria-hidden="true"></i>  Create New Club</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span style="color: black;" aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		      <div class="modal-body">
		        <div class="container-fluid">
				    <!-- add form in modal body -->
				    
				    <form id="createClubForm" action="createclub" method="post" enctype="multipart/form-data">
				      <!-- image upload control -->
				      <div class="form-group row">
					    <label for="colFormLabelLg" class="col-sm-2 col-form-label">Club Icon<span class="required">*</span></label>
					    <div class="col-sm-10">
						    <label class=newbtn>
						       <img id="preview" class="rounded-circle" src="images/defaultClubIcon.jpg">
						       <input id="pic" class="pis" name="clubicon" onchange="readURL(this);" type="file" >
						    </label>
					    </div>
					  </div>  
					  <div class="form-group row">
					    <label for="colFormLabelLg" class="col-sm-2 col-form-label">Acronym<span class="required">*</span></label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control form-control-lg requiredField" name="clubacronym" id="acronym" placeholder="Club's Short name" required="required">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabelLg" class="col-sm-2 col-form-label">Name<span class="required">*</span></label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control form-control-lg requiredField" name="clubname" id="name" placeholder="Club's Name" required="required">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabel" class="col-sm-2 col-form-label">Description<span class="required">*</span></label>
					    <div class="col-sm-10">
					      <textarea class="form-control requiredField" name="clubdescription" placeholder="Motive Of Your Club" rows="3" required="required"></textarea>
					    </div>
					  </div>
					  
					  <div class="seperator">More About Club</div><br/>
					  <div class="form-group row">
					    <label for="colFormLabel" class="col-sm-2 col-form-label">Vision<span class="required">*</span></label>
					    <div class="col-sm-10">
					      <textarea class="form-control requiredField" name="clubvision" placeholder="Vision Of Your Club" rows="3" required="required"></textarea>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabel" class="col-sm-2 col-form-label">Mission<span class="required">*</span></label>
					    <div class="col-sm-10">
					      <textarea class="form-control requiredField" name="clubmission" placeholder="Mission Of Your Club" rows="3" required="required"></textarea>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabel" class="col-sm-2 col-form-label">Objectives</label>
					    <div class="col-sm-10">
					      <textarea class="form-control" name="clubobjectives" placeholder="Objectives Of Your Club" rows="3" required="required"></textarea>
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabel" class="col-sm-2 col-form-label">Staff Co-ordinators</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="clubstaff" placeholder="Staff Coordinators Names" required="required">
					    </div>
					  </div>
					  
					  <div class="seperator">Social Media Handles</div><br/>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i class="fa fa-instagram fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control form-control-sm" id="colFormLabelSm" name="instagramlink" placeholder="Instagram Link">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i class="fa fa-twitter fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control form-control-sm" id="colFormLabelSm" name="twitterlink" placeholder="Twitter Link">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i class="fa fa-facebook fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control form-control-sm" id="colFormLabelSm" name="facebooklink" placeholder="Facebook Link">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm"><i class="fa fa-linkedin-square fa-2x" aria-hidden="true"></i></label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control form-control-sm" id="colFormLabelSm" name="linkedinlink" placeholder="LinkedIn Link">
					    </div>
					  </div>
					  <div class="form-group row">
					    <label for="colFormLabel" class="col-sm-2 col-form-label">Categories<span class="required">*</span></label>
					    <div class="col-sm-10">
					      <input class="requiredField" id="form-tags-1" name="tags-1" type="text" value="all">
					    </div>
					  </div>					  
					</form>
					
				  </div>
		      </div>
		      
		      <div class="modal-footer">
			    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" id="submitbtn">Create</button>
		      </div>
		    </div>
		  </div>
		</div>	
			
		
    </div>

<script type="text/javascript">
$(document).ready(function() {
	
//show create club form	
    $('.float').click(function(e) {
    	$('#insertClubModal').modal('show');  
    });
    
//view details of club
	$('.view').click(function(e){
		var btnValue=$(this).val();
		$('#viewClubModal'+btnValue).modal('show');
		//alert("hi "+btnValue);
	});

//*****create club form

//check if fields are not empty in create club form	
    $('#submitbtn').click(function(e) {
    	
    	//validate for alphabets input only
    	$('#acronym').keypress(function (e) {
            var regex = new RegExp("^[a-zA-Z]+$"); //^[a-zA-Z]+$
            var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
            if (regex.test(str)) {
                return true;
            }
            else
            {
            e.preventDefault();
            alert('Please Enter valid Value');
            return false;
            }
        });
    	
    	var flag=0;			
    	$('.requiredField').each(function(index){
    		if($(this).val()==''){
    			flag=1;
    		}
    	});
    	
    	if(flag==1){
    		alert('Please fill details in required fields');
    		$('#name').focus();
    	}
    	else{
    		$('#createClubForm').submit();
    	}
  
    });
    
//hide file upload control of create club form
	$('#pic').hide();

//tagsinput field
	$('#form-tags-1').tagsInput();

});

//preview club icon
$('.newbtn').bind("click" , function () {
    $('#pic').click();
	});

function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#preview')
                    .attr('src', e.target.result).height(100).width(200);
            };
            reader.onerror = function (e) {
           	    alert("error in image upload: "+e.target.error.code);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

//tagsinput field
/* jQuery Tags Input Revisited Plugin
	 *
	 * Copyright (c) Krzysztof Rusnarczyk
	 * Licensed under the MIT license */

	(function($) {
		var delimiter = [];
		var inputSettings = [];
		var callbacks = [];

		$.fn.addTag = function(value, options) {
			options = jQuery.extend({
				focus: false,
				callback: true
			}, options);
			
			this.each(function() {
				var id = $(this).attr('id');

				var tagslist = $(this).val().split(_getDelimiter(delimiter[id]));
				if (tagslist[0] === '') tagslist = [];

				value = jQuery.trim(value);
				
				if ((inputSettings[id].unique && $(this).tagExist(value)) || !_validateTag(value, inputSettings[id], tagslist, delimiter[id])) {
					$('#' + id + '_tag').addClass('error');
					return false;
				}
				
				$('<span>', {class: 'tag'}).append(
					$('<span>', {class: 'tag-text'}).text(value),
					$('<button>', {class: 'tag-remove'}).click(function() {
						return $('#' + id).removeTag(encodeURI(value));
					})
				).insertBefore('#' + id + '_addTag');

				tagslist.push(value);

				$('#' + id + '_tag').val('');
				if (options.focus) {
					$('#' + id + '_tag').focus();
				} else {
					$('#' + id + '_tag').blur();
				}

				$.fn.tagsInput.updateTagsField(this, tagslist);

				if (options.callback && callbacks[id] && callbacks[id]['onAddTag']) {
					var f = callbacks[id]['onAddTag'];
					f.call(this, this, value);
				}
				
				if (callbacks[id] && callbacks[id]['onChange']) {
					var i = tagslist.length;
					var f = callbacks[id]['onChange'];
					f.call(this, this, value);
				}
			});

			return false;
		};

		$.fn.removeTag = function(value) {
			value = decodeURI(value);
			
			this.each(function() {
				var id = $(this).attr('id');

				var old = $(this).val().split(_getDelimiter(delimiter[id]));

				$('#' + id + '_tagsinput .tag').remove();
				
				var str = '';
				for (i = 0; i < old.length; ++i) {
					if (old[i] != value) {
						str = str + _getDelimiter(delimiter[id]) + old[i];
					}
				}

				$.fn.tagsInput.importTags(this, str);

				if (callbacks[id] && callbacks[id]['onRemoveTag']) {
					var f = callbacks[id]['onRemoveTag'];
					f.call(this, this, value);
				}
			});

			return false;
		};

		$.fn.tagExist = function(val) {
			var id = $(this).attr('id');
			var tagslist = $(this).val().split(_getDelimiter(delimiter[id]));
			return (jQuery.inArray(val, tagslist) >= 0);
		};

		$.fn.importTags = function(str) {
			var id = $(this).attr('id');
			$('#' + id + '_tagsinput .tag').remove();
			$.fn.tagsInput.importTags(this, str);
		};

		$.fn.tagsInput = function(options) {
			var settings = jQuery.extend({
				interactive: true,
				placeholder: 'Add a tag',
				minChars: 0,
				maxChars: null,
				limit: null,
				validationPattern: null,
				width: 'auto',
				height: 'auto',
				autocomplete: null,
				hide: true,
				delimiter: ',',
				unique: true,
				removeWithBackspace: true
			}, options);

			var uniqueIdCounter = 0;

			this.each(function() {
				if (typeof $(this).data('tagsinput-init') !== 'undefined') return;

				$(this).data('tagsinput-init', true);

				if (settings.hide) $(this).hide();
				
				var id = $(this).attr('id');
				if (!id || _getDelimiter(delimiter[$(this).attr('id')])) {
					id = $(this).attr('id', 'tags' + new Date().getTime() + (++uniqueIdCounter)).attr('id');
				}

				var data = jQuery.extend({
					pid: id,
					real_input: '#' + id,
					holder: '#' + id + '_tagsinput',
					input_wrapper: '#' + id + '_addTag',
					fake_input: '#' + id + '_tag'
				}, settings);

				delimiter[id] = data.delimiter;
				inputSettings[id] = {
					minChars: settings.minChars,
					maxChars: settings.maxChars,
					limit: settings.limit,
					validationPattern: settings.validationPattern,
					unique: settings.unique
				};

				if (settings.onAddTag || settings.onRemoveTag || settings.onChange) {
					callbacks[id] = [];
					callbacks[id]['onAddTag'] = settings.onAddTag;
					callbacks[id]['onRemoveTag'] = settings.onRemoveTag;
					callbacks[id]['onChange'] = settings.onChange;
				}

				var markup = $('<div>', {id: id + '_tagsinput', class: 'tagsinput'}).append(
					$('<div>', {id: id + '_addTag'}).append(
						settings.interactive ? $('<input>', {id: id + '_tag', class: 'tag-input', value: '', placeholder: settings.placeholder}) : null
					)
				);

				$(markup).insertAfter(this);

				$(data.holder).css('width', settings.width);
				$(data.holder).css('min-height', settings.height);
				$(data.holder).css('height', settings.height);

				if ($(data.real_input).val() !== '') {
					$.fn.tagsInput.importTags($(data.real_input), $(data.real_input).val());
				}
				
				// Stop here if interactive option is not chosen
				if (!settings.interactive) return;
				
				$(data.fake_input).val('');
				$(data.fake_input).data('pasted', false);
				
				$(data.fake_input).on('focus', data, function(event) {
					$(data.holder).addClass('focus');
					
					if ($(this).val() === '') {
						$(this).removeClass('error');
					}
				});
				
				$(data.fake_input).on('blur', data, function(event) {
					$(data.holder).removeClass('focus');
				});

				if (settings.autocomplete !== null && jQuery.ui.autocomplete !== undefined) {
					$(data.fake_input).autocomplete(settings.autocomplete);
					$(data.fake_input).on('autocompleteselect', data, function(event, ui) {
						$(event.data.real_input).addTag(ui.item.value, {
							focus: true,
							unique: settings.unique
						});
						
						return false;
					});
					
					$(data.fake_input).on('keypress', data, function(event) {
						if (_checkDelimiter(event)) {
							$(this).autocomplete("close");
						}
					});
				} else {
					$(data.fake_input).on('blur', data, function(event) {
						$(event.data.real_input).addTag($(event.data.fake_input).val(), {
							focus: true,
							unique: settings.unique
						});
						
						return false;
					});
				}
				
				// If a user types a delimiter create a new tag
				$(data.fake_input).on('keypress', data, function(event) {
					if (_checkDelimiter(event)) {
						event.preventDefault();
						
						$(event.data.real_input).addTag($(event.data.fake_input).val(), {
							focus: true,
							unique: settings.unique
						});
						
						return false;
					}
				});
				
				$(data.fake_input).on('paste', function () {
					$(this).data('pasted', true);
				});
				
				// If a user pastes the text check if it shouldn't be splitted into tags
				$(data.fake_input).on('input', data, function(event) {
					if (!$(this).data('pasted')) return;
					
					$(this).data('pasted', false);
					
					var value = $(event.data.fake_input).val();
					
					value = value.replace(/\n/g, '');
					value = value.replace(/\s/g, '');
					
					var tags = _splitIntoTags(event.data.delimiter, value);
					
					if (tags.length > 1) {
						for (var i = 0; i < tags.length; ++i) {
							$(event.data.real_input).addTag(tags[i], {
								focus: true,
								unique: settings.unique
							});
						}
						
						return false;
					}
				});
				
				// Deletes last tag on backspace
				data.removeWithBackspace && $(data.fake_input).on('keydown', function(event) {
					if (event.keyCode == 8 && $(this).val() === '') {
						 event.preventDefault();
						 var lastTag = $(this).closest('.tagsinput').find('.tag:last > span').text();
						 var id = $(this).attr('id').replace(/_tag$/, '');
						 $('#' + id).removeTag(encodeURI(lastTag));
						 $(this).trigger('focus');
					}
				});

				// Removes the error class when user changes the value of the fake input
				$(data.fake_input).keydown(function(event) {
					// enter, alt, shift, esc, ctrl and arrows keys are ignored
					if (jQuery.inArray(event.keyCode, [13, 37, 38, 39, 40, 27, 16, 17, 18, 225]) === -1) {
						$(this).removeClass('error');
					}
				});
			});

			return this;
		};
		
		$.fn.tagsInput.updateTagsField = function(obj, tagslist) {
			var id = $(obj).attr('id');
			$(obj).val(tagslist.join(_getDelimiter(delimiter[id])));
		};

		$.fn.tagsInput.importTags = function(obj, val) {
			$(obj).val('');
			
			var id = $(obj).attr('id');
			var tags = _splitIntoTags(delimiter[id], val); 
			
			for (i = 0; i < tags.length; ++i) {
				$(obj).addTag(tags[i], {
					focus: false,
					callback: false
				});
			}
			
			if (callbacks[id] && callbacks[id]['onChange']) {
				var f = callbacks[id]['onChange'];
				f.call(obj, obj, tags);
			}
		};
		
		var _getDelimiter = function(delimiter) {
			if (typeof delimiter === 'undefined') {
				return delimiter;
			} else if (typeof delimiter === 'string') {
				return delimiter;
			} else {
				return delimiter[0];
			}
		};
		
		var _validateTag = function(value, inputSettings, tagslist, delimiter) {
			var result = true;
			
			if (value === '') result = false;
			if (value.length < inputSettings.minChars) result = false;
			if (inputSettings.maxChars !== null && value.length > inputSettings.maxChars) result = false;
			if (inputSettings.limit !== null && tagslist.length >= inputSettings.limit) result = false;
			if (inputSettings.validationPattern !== null && !inputSettings.validationPattern.test(value)) result = false;
			
			if (typeof delimiter === 'string') {
				if (value.indexOf(delimiter) > -1) result = false;
			} else {
				$.each(delimiter, function(index, _delimiter) {
					if (value.indexOf(_delimiter) > -1) result = false;
					return false;
				});
			}
			
			return result;
		};
	 
		var _checkDelimiter = function(event) {
			var found = false;
			
			if (event.which === 13) {
				return true;
			}

			if (typeof event.data.delimiter === 'string') {
				if (event.which === event.data.delimiter.charCodeAt(0)) {
					found = true;
				}
			} else {
				$.each(event.data.delimiter, function(index, delimiter) {
					if (event.which === delimiter.charCodeAt(0)) {
						found = true;
					}
				});
			}
			
			return found;
		 };
		 
		 var _splitIntoTags = function(delimiter, value) {
			 if (value === '') return [];
			 
			 if (typeof delimiter === 'string') {
				 return value.split(delimiter);
			 } else {
				 var tmpDelimiter = '∞';
				 var text = value;
				 
				 $.each(delimiter, function(index, _delimiter) {
					 text = text.split(_delimiter).join(tmpDelimiter);
				 });
				 
				 return text.split(tmpDelimiter);
			 }
			 
			 return [];
		 };
	})(jQuery);

</script>

</body>
</html>