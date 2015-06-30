<%@ include file="/WEB-INF/views/includes.jsp" %>

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
		connect� en tant que: <sec:authentication property="name"/> <sec:authentication property="authorities"/>
		<a href="logout">Deconnexion</a>
      <%@ include file="/WEB-INF/views/nav.jsp" %>
      
      <h1>Page d'accueil !</h1>
      
      <h3>avec un menu principal normalement, qui s'affiche en fonction des droits des gens of course !</h3>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
