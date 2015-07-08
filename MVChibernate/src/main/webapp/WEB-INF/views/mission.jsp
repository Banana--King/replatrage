<%@ include file="/WEB-INF/views/includes.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">

    <title>Missions</title>

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

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<c:url value="js/html5shiv.js"/>"></script>
    <script src="<c:url value="js/respond.min.js"/>"></script>
    <![endif]-->
    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr"></script>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  </head>
<body>
	<!-- container section start -->
	<section id="container">
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<%@ include file="/WEB-INF/views/sidebar.jsp" %>
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header"><i class="fa fa-file-text-o"></i> Missions</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
							<li><i class="icon_document_alt"></i>Missions</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="col-lg-4 col-md-12">
						<section class="panel">
							<header class="panel-heading"> Cr&eacute;er une mission </header>
							<div class="panel-body">
								<c:if test="${!empty message}">
									<c:if test="${fn:contains(message, 'SUCCES')}">
						        		<div class="alert alert-success">${message}</div>
						    		</c:if>
						    		<c:if test="${fn:contains(message, 'ERREUR')}">
						        		<div class="alert alert-danger">${message}</div>
						    		</c:if>
								</c:if>
								<c:url var="addAction" value="/Mission/add" ></c:url>
								<form:form class="form-horizontal" action="${addAction}" commandName="Mission">					
									<c:if test="${!empty Mission.titre}">
		 							<div class="form-group">
										<form:label path="id" class="col-sm-2 control-label"> <spring:message text="ID"/> </form:label>
										<div class="col-sm-10">
											<form:input path="id" type="numeric" class="form-control" readonly="true" size="8"  disabled="true" />
											<form:hidden path="id" />
										</div>
									</div>
									</c:if>
		 							<div class="form-group">
					            		<form:label path="titre" class="col-sm-2 control-label"> <spring:message text="titre"/> </form:label>
										<div class="col-sm-10">
											<c:choose>
												<c:when test="${!empty Mission.titre}">
													<form:input readonly="true" path="titre" type="text" class="form-control" disabled="true" />
													<form:hidden path="titre" />
												</c:when>
												<c:otherwise>
													<form:input path="titre" type="text" class="form-control" />
												</c:otherwise>
											</c:choose>
										</div>
									</div>
		 							<div class="form-group">
								        <form:label path="description" class="col-sm-2 control-label"><spring:message text="description"/></form:label>
										<div class="col-sm-10">
									        <form:textarea path="description" class="form-control" />
										</div>
									</div>
		 							<div class="form-group">
										<form:label path="etat" class="col-sm-2 control-label"> <spring:message text="etat"/> </form:label>
										<div class="col-sm-10">
								            <form:select path="etat" class="form-control" >
									        	<c:forEach items="${listEtats}" var="Etat">
									        		<c:choose>
									        			<c:when test="${Etat.nom eq Mission.etat }">
									        				<option value="${Etat.nom}" selected="selected">${Etat.nom}</option>
									        			</c:when>
									        			<c:otherwise>
									        				<option value="${Etat.nom}">${Etat.nom}</option>
									        			</c:otherwise>
									        		</c:choose>
									    		</c:forEach>
								    		</form:select>
							    		</div>
									</div>
		 							<div class="form-group">
				            			<form:label path="adresse" class="col-sm-2 control-label"> <spring:message text="adresse"/> </form:label>
				            			<div class="col-sm-10">
											<c:choose>
							        			<c:when test="${!empty Mission.titre}">
							        				<form:input id="adresse" class="form-control"  readonly="true" path="adresse" disabled="true" />
							        				<form:hidden path="adresse" />
							        			</c:when>
							        			<c:otherwise>
							        				<form:input id="adresse" class="form-control"  path="adresse" />
							        			</c:otherwise>
							        		</c:choose>
						        		</div>
									</div>
		 							<div class="form-group">
										<form:label path="user" class="col-sm-2 control-label"> <spring:message text="user"/> </form:label>
								    	<div class="col-sm-10">
								    		<form:select path="user" class="form-control"  >
								    			<option value="0">Choisir un utilisateur</option>
									        	<c:forEach items="${listUsers}" var="User">
									        				<option value="${User.id}">${User.username}</option>
									    		</c:forEach>
								    		</form:select>
								    	</div>
									</div>

				            <c:if test="${!empty Mission.titre}">
				                <input type="submit"
				                    value="<spring:message text="Edit Mission"/>"  class="btn btn-warning"/>
				                    
				            </c:if>
				            <c:if test="${empty Mission.titre}">
				                <input type="submit"
				                    value="<spring:message text="Add Mission"/>"  class="btn btn-primary"/>
				            </c:if>

								</form:form>
							</div>
						</section>
					</div>
					</sec:authorize>
					
                
		<c:if test="${empty Mission.titre}">
			<c:if test="${!empty listMissions}">
					<div class="col-lg-8 col-md-12">
						<section class="panel">
							<header class="panel-heading"> Liste des missions </header>
                          		<table class="table table-striped table-advance table-hover">
									<tbody>
										<tr>
											<th width="80">#</th>
											<th width="120">Titre</th>
											<th width="120">Etat</th>
											<th width="120"><i class="fa fa-file-text-o"></i> Description</th>
											<th width="120"><i class="icon_pin_alt"></i> Adresse</th>
											<th width="120"><i class="icon_profile"></i> Intervenant</th>
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<th width="60"><i class="icon_cogs"></i> Action</th>
										</sec:authorize>
										</tr>

									<c:forEach items="${listMissions}" var="bla">
										<c:if test="${not empty bla}">
										<c:if test="${bla.id != 0}">
										<c:if test="${bla.etat ne 'cloture'}">
											<tr>
												<td>${bla.id}</td>
												<td>${bla.titre}</td>
												<td>${bla.etat}</td>
												<td>${bla.description}</td>
												<td>${bla.adresse}</td>
												<td>
													<c:choose>
													<c:when test="${!empty bla.user.username}">
													${bla.user.username}
													</c:when>
													<c:otherwise>
													AUCUN
													</c:otherwise>
													</c:choose>
												</td>
											<sec:authorize access="hasRole('ROLE_ADMIN')">
												<td><a href="<c:url value='/Mission/edit/${bla.id}' />" >Edit</a></td>
											</sec:authorize>
											</tr>
										</c:if>
										</c:if>
										</c:if>
									</c:forEach>                     
								</tbody>
							</table>
						</section>
					</div>
				</c:if>
				</c:if>
				
				</div> <!-- row end -->
				<div class="row">
			    	<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h2><i class="fa fa-map-marker red"></i><strong>Carte</strong></h2>
								<div class="panel-actions">
									<a href="#" class="btn-setting"><i class="fa fa-rotate-right"></i></a>
									<a href="#" class="btn-minimize"><i class="fa fa-chevron-up"></i></a>
									<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
								</div>	
							</div>
							<div class="panel-body-map">
							<div id="map-error" class="alert alert-danger"></div>
							<div id="map-canvas" style="height:380px;"></div>
							</div>
		
						</div>
					</div>
                </div> <!--  row end -->
                
		</section>
		</section>
</section>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#map-error").hide();
		});
	</script>
<c:if test="${empty Mission.titre}">
	<script type="text/javascript">
		$(document).ready(function(){
			$("#map-error").hide();
		});
		
		var geocoder;
		var map;
		// initialisation de la carte Google Map de départ
		function initialiserCarte() {
		  geocoder = new google.maps.Geocoder();
		  
		  var latlng = new google.maps.LatLng(48.831083, 2.266250799999966);
		  var mapOptions = {
		    zoom      : 15,
		    center    : latlng,
		    mapTypeId : google.maps.MapTypeId.ROADMAP
		  }
		  // map-canvas est le conteneur HTML de la carte Google Map
		  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
		  
		  ajaxGetMissionAdresse();
		}
		 
		function TrouverAdresse(adresse) {
		  // Récupération de l'adresse tapée dans le formulaire
		  geocoder.geocode( { 'address': adresse}, function(results, status) {
		    if (status == google.maps.GeocoderStatus.OK) {
		      // Récupération des coordonnées GPS du lieu tapé dans le formulaire
		      map.setCenter(results[0].geometry.location);
		      var strposition = results[0].geometry.location+"";
		      strposition=strposition.replace('(', '');
		      strposition=strposition.replace(')', '');

		      // Création du marqueur du lieu (épingle)
		      var marker = new google.maps.Marker({
		          map: map,
		          position: results[0].geometry.location
		      });
		    } else {
		      $("#map-error").append("Adresse introuvable : "+ adresse +"<br/>");
		      //alert(adresse);
		      //alert(adresse.length);
		      $("#map-error").show();
		    }
		  });
		}
		// Lancement de la construction de la carte google map
		google.maps.event.addDomListener(window, 'load', initialiserCarte);
		
		function ajaxGetMissionAdresse()
		{
			$.ajax({
				url: "./Ajax",
				success: function(response){
					var list_adresse = response.split(";;;");
					$.each(list_adresse, function(index, adresse) {
					    if(!adresse.trim()){/* on ne fait rien */}
					    else{TrouverAdresse(adresse);}
					});
				},
				error: function(){
					alert("erreur lors de la recherche des adresse ...");
				}
			});
		}
	</script>
	
    <script src="<c:url value="/resources/js/form-component.js" />"></script>
</c:if>
	
</body>
</html>