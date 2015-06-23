<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" -->

    <!-- Custom styles for this template -->
    <!-- <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet"> -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="bootstrap/js/html5shiv.js"></script>
      <script src="bootstrap/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <form class="form" action="j_spring_security_check" method="POST">
        <h2 class="form-signin-heading">Please sign in (elle est moche la page hein ???? ! #loginDegueu)</h2>
 
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		
        <input type="text" class="form-control" placeholder="Email address" autofocus name='j_username'>
        <input type="password" class="form-control" placeholder="Password" name='j_password'/>
       
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
      
      <font color="red">
      	<span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span>
      </font>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
