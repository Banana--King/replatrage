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
	
	<!-- Custom styles for this template -->
	<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/style-responsive.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/jquery-ui-1.10.4.min.css" />" rel="stylesheet">
	
   <!-- full calendar css-->
	<link href="<c:url value="/resources/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/assets/fullcalendar/fullcalendar/fullcalendar.css" />" rel="stylesheet">
	
    <!-- easy pie chart-->
	<link href="<c:url value="/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" />" rel="stylesheet" type="text/css" media="screen">

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="<c:url value="js/html5shiv.js"/>"></script>
	<script src="<c:url value="js/respond.min.js"/>"></script>
	<![endif]-->
</head>
<body style="background-color: white">
	<!-- container section start -->
	<section id="container" class="">
		<div class="container">
			<%@ include file="/WEB-INF/views/header.jsp" %>
			
			<!--main content start-->
			<section id="main-content">
				<section class="wrapper">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Accueil</h3>
				
                                       <a href="Users">  <img style="width: 256px ; height: 256px; "  src="http://www.icone-png.com/png/28/28370.png"/></a>
                                <a href="RoleUsers"><img style="width: 256px ; height: 256px; "src="http://www.iconshock.com/img_jpg/IMPRESSIONS/networking/jpg/256/role_icon.jpg"/></a>
                                 <a href="Partenaires"><img style="width: 256px ; height: 256px; "src="http://new.lesclownsstethoscopes.fr/sites/default/files/default_images/img_partenaire.png"/> </a>     
                                 <a href="Etats"> <img style="width: 256px ; height: 256px; "src="http://myitforum.com/myitforumwp/wp-content/uploads/2014/01/Workflow-engine.png"/></a>
                                 <a href="Missions"><img style="width: 256px ; height: 256px; "src="http://www.clker.com/cliparts/g/p/Q/h/v/0/mission-md.png"/>    </a>                          
                                <a href="Export"><img style="width: 256px ; height: 256px; "src="http://www.publishyourarticles.net/wp-content/uploads/2015/06/Export-Stamp.jpg"/></a>
                              
                                </section>
			</section>
		</div> <!-- /container -->
	</section>
	
    <!-- javascripts -->
<!--    <script src="<c:url value="/resources/js/jquery.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.4.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-1.8.3.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.9.2.custom.min.js" />"></script>
     bootstrap 
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
     nice scroll 
    <script src="<c:url value="/resources/js/jquery.scrollTo.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.nicescroll.js" />" type="text/javascript"></script>
     charts scripts 
    <script src="<c:url value="/resources/assets/jquery-knob/js/jquery.knob.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.sparkline.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js" />"></script>
    <script src="<c:url value="/resources/js/owl.carousel.js" />"></script>
     jQuery full calendar 
    <script src="<c:url value="/resources/js/fullcalendar.min.js" />"></script>
    <script src="<c:url value="/resources/assets/fullcalendar/fullcalendar/fullcalendar.js" />"></script>
    script for this page only
    <script src="<c:url value="/resources/js/calendar-custom.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.rateit.min.js" />" type="text/javascript"></script>
     custom select 
    <script src="<c:url value="/resources/js/jquery.customSelect.min.j" />"></script>
    <script src="<c:url value="/resources/assets/chart-master/Chart.js" />" type="text/javascript"></script>
   
    custome script for all page
    <script src="<c:url value="/resources/js/scripts.js" />"></script>
     custom script for this page
    <script src="js/sparkline-chart.js"></script>
    <script src="js/easy-pie-chart.js"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/xcharts.min.js"></script>
	<script src="js/jquery.autosize.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/gdp-data.js"></script>	
	<script src="js/morris.min.js"></script>
	<script src="js/sparklines.js"></script>	
	<script src="js/charts.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
  <script>

  //knob
  $(function() {
    $(".knob").knob({
      'draw' : function () { 
        $(this.i).val(this.cv + '%')
      }
    })
  });

  //carousel
  $(document).ready(function() {
      $("#owl-slider").owlCarousel({
          navigation : true,
          slideSpeed : 300,
          paginationSpeed : 400,
          singleItem : true

      });
  });

  //custom select box

  $(function(){
      $('select.styled').customSelect();
  });
  
  /* ---------- Map ---------- */
$(function(){
  $('#map').vectorMap({
    map: 'world_mill_en',
    series: {
      regions: [{
        values: gdpData,
        scale: ['#000', '#000'],
        normalizeFunction: 'polynomial'
      }]
    },
	backgroundColor: '#eef3f7',
    onLabelShow: function(e, el, code){
      el.html(el.html()+' (GDP - '+gdpData[code]+')');
    }
  });
});



</script>-->
</body>
</html>
