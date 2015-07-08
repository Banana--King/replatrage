<%@ include file="/WEB-INF/views/includes.jsp" %>

<html lang="fr">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="shortcut icon" href="../../assets/ico/favicon.png">
	
	<title>Home</title>

	<!-- Bootstrap core CSS -->
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<!-- bootstrap theme -->
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<!--external css-->
	<!-- font icon -->
	<link href="<c:url value="/resources/css/elegant-icons-style.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
	<!-- full calendar css-->
	<link href="<c:url value="/resources/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/assets/fullcalendar/fullcalendar/fullcalendar.css" />" rel="stylesheet">
	<!-- easy pie chart-->
	<link href="<c:url value="/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" />" rel="stylesheet" type="text/css" media="screen">
	<!-- owl carousel -->
	<link href="<c:url value="/resources/css/owl.carousel.css" />" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/css/jquery-jvectormap-1.2.2.css" />" rel="stylesheet">
		<!-- Custom styles for this template -->
	<link href="<c:url value="/resources/css/fullcalendar.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/widgets.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/style-responsive.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/xcharts.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/jquery-ui-1.10.4.min.css" />" rel="stylesheet">
	
	<!-- day -->
	<link href="<c:url value="/resources/day/css/animate.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/day/css/style.css" />" rel="stylesheet">
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
	<script src="<c:url value="/resources/js/respond.min.js"/>"></script>
      <script src="<c:url value="/resources/js/lte-ie7.js"/>"></script>
	<![endif]-->
</head>
<body style="background-color: white">
	<!-- container section start -->
	<section id="container" class="">
			<%@ include file="/WEB-INF/views/header.jsp" %>
			
	<div class="gallery">
		<div class="container">		
			<div class="col-md-4">
				<a title="Utiisateurs " href="Users">  
					<figure class="effect-marley">
						<img style="height:30%" src="<c:url value='resources/images/28370.png' />" alt="" class="img-responsive"/>
						<figcaption>
							<h4>Utilisateurs</h4>
							<p>Cette page vous permettra de gérer les utilisateurs</p>				
						</figcaption>			
					</figure>
				</a>
			</div>
			<div class="col-md-4">
				<a title="Role des utilisateurs " href="Users">  
					<figure class="effect-marley">
						<img style="height:30%" src="<c:url value='resources/images/role_icon.png' />" alt="" class="img-responsive"/>
						<figcaption>
							<h4>Role des utilisateurs</h4>
							<p>Cette page vous permettra de gérer les rôles des utilisateurs</p>				
						</figcaption>			
					</figure>
				</a>
			</div>
			<div class="col-md-4">
				<a title="Partenaires " href="Users">  
					<figure class="effect-marley">
						<img style="height:30%" src="<c:url value='resources/images/img_partenaire.png' />" alt="" class="img-responsive"/>
						<figcaption>
							<h4>Partenaires</h4>
							<p>Cette page vous permettra de gérer les partenaires</p>				
						</figcaption>			
					</figure>
				</a>
			</div>
		</div>
		
		<div class="container">
			<div class="col-md-4">
				<a title="Etats" href="Etats">  
					<figure class="effect-marley">
						<img style="height:30%" src="<c:url value='resources/images/Workflow-engine.png' />" alt="" class="img-responsive"/>
						<figcaption>
							<h4>Etats</h4>
							<p>Cette page vous permettra de créer de nouveaux etats pour les missions</p>		
						</figcaption>			
					</figure>
				</a>
			</div>
			<div class="col-md-4">
				<a title="Missions " href="Missions">  
					<figure class="effect-marley">
						<img style="height:30%" src="<c:url value='resources/images/mission-md.png' />" alt="" class="img-responsive"/>
						<figcaption>
							<h4>Missions</h4>	
							<p>Cette page vous permettra de gérer les missions</p>					
						</figcaption>			
					</figure>
				</a>
			</div>
			<div class="col-md-4">
				<a title="Export" href="Export">  
					<figure class="effect-marley">
						<img style="height:30%" src="<c:url value='resources/images/Export-Stamp.jpg' />" alt="" class="img-responsive"/>
						<figcaption>
							<h4>Export</h4>
							<p>Exportation des missions</p>				
						</figcaption>			
					</figure>
				</a>
			</div>
	</div>	
	</div>
	</section><!-- /container -->
	
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value="/resources/js/jquery.js" />"></script>		
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>	
    <script src="<c:url value="/resources/day/js/wow.min.js" />"></script>	
	<script>
	wow = new WOW(
	 {
	
		}	) 
		.init();
	</script>	
</body>
</html>
