<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Login</title> 
  <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="css/adminLogin_style.css">
</head>
 
<body>
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <section class="container-fluid">

		<% if(request.getAttribute("action")!=null){ %>
<!-- Toast to display operations done -->		
		<div class="alert alert-dismissible alert-warning">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong><%=request.getAttribute("action") %></strong>
		</div>
		<%} %>  
  
  
<!-- row and justify-content-center class is used to place the form in center -->
    <section class="row justify-content-center">
      <section class="col-12 col-sm-6 col-md-4">
        <form class="form-container" action="login" method="post">
        <div class="form-group">
          <h1 class="text-center display-4 font-weight-normal"> Admin Login </h1><br>
          <label for="InputEmail1" class="font-weight-bold">UserName</label>
           <input type="text" class="form-control" id="username" name="username" aria-describeby="emailHelp" placeholder="Enter Username" required="required">
        </div>
        <div class="form-group">
          <label for="InputPassword1" class="font-weight-bold">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" minlength="5" required="required">
        </div><br/>
        <button type="submit" class="btn btn-primary btn-block">LOGIN</button>
		<br/>
        </form>
      </section>
    </section>
  </section>
<!-- Login form creation ends -->

<script>

$(document).ready(function() {
	
	//validate for alphabets and numbers input only
	$('#username').keypress(function (e) {
        var regex = new RegExp("^[a-zA-Z0-9]+$"); //^[a-zA-Z]+$
        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
        if (regex.test(str)) {
            return true;
        }
        else
        {
        e.preventDefault();
        alert('Please Enter valid Username');
        return false;
        }
    });

	
});
</script>

</body>
</html>