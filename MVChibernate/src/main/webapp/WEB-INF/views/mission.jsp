<%@ include file="/WEB-INF/views/includes.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr"></script>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="container">
	connecté en tant que: <sec:authentication property="name"/> <sec:authentication property="authorities"/>
	<a href="logout">Deconnexion</a>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	
	<h1>Gestion des missions</h1>
		
	<c:if test="${!empty message}">
		<c:if test="${fn:contains(message, 'SUCCES')}">
	        <div class="alert alert-success">${message}</div>
	    </c:if>
	    <c:if test="${fn:contains(message, 'ERREUR')}">
	        <div class="alert alert-danger">${message}</div>
	    </c:if>
	</c:if>
	
	<div id="map-error" class="alert alert-danger"></div>
	<div id="map-canvas" style="float:right;height:500px;width:45%"></div>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h1>
		    Add a Mission
		</h1>
		 
		<c:url var="addAction" value="/Mission/add" ></c:url>
		 
		<form:form action="${addAction}" commandName="Mission">
		<table>
		    <c:if test="${!empty Mission.titre}">
		    <tr>
		        <td>
		            <form:label path="id">
		                <spring:message text="ID"/>
		            </form:label>
		        </td>
		        <td>
		            <form:input path="id" readonly="true" size="8"  disabled="true" />
		            <form:hidden path="id" />
		        </td> 
		    </tr>
		    </c:if>
		    <tr>
		        <td>
		            <form:label path="titre">
		                <spring:message text="titre"/>
		            </form:label>
		        </td>
		        <td>
		        	<c:choose>
	        			<c:when test="${!empty Mission.titre}">
	        				<form:input readonly="true" path="titre" disabled="true" />
	        				<form:hidden path="titre" />
	        			</c:when>
	        			<c:otherwise>
	        				<form:input path="titre" />
	        			</c:otherwise>
	        		</c:choose>
		        </td> 
		    </tr>
		    <tr>
		        <td>
		            <form:label path="description">
		                <spring:message text="description"/>
		            </form:label>
		        </td>
		        <td>
		            <form:input path="description" />
		        </td> 
		    </tr>
		    <tr>
		        <td>
		            <form:label path="etat">
		                <spring:message text="etat"/>
		            </form:label>
		        </td>
		        <td>
		            <form:select path="etat">
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
		        </td> 
		    </tr>
		    <tr>
		        <td>
		            <form:label path="adresse">
		                <spring:message text="adresse"/>
		            </form:label>
		        </td>
		        <td>
		        	<c:choose>
	        			<c:when test="${!empty Mission.titre}">
	        				<form:input id="adresse" readonly="true" path="adresse" disabled="true" />
	        				<form:hidden path="adresse" />
	        			</c:when>
	        			<c:otherwise>
	        				<form:input id="adresse" path="adresse" />
	        			</c:otherwise>
	        		</c:choose>
		        </td> 
		    </tr>
		    <tr>
		    	<td>
		            <form:label path="user">
		                <spring:message text="user"/>
		            </form:label>
		        </td>
		    	<td>
		    		<form:select path="user">
		    			<option value="0">Choisir un utilisateur</option>
			        	<c:forEach items="${listUsers}" var="User">
			        				<option value="${User.id}">${User.username}</option>
			    		</c:forEach>
		    		</form:select>
		    	</td>
		    </tr>
		    <tr>
		        <td colspan="2">
		            <c:if test="${!empty Mission.titre}">
		                <input type="submit"
		                    value="<spring:message text="Edit Mission"/>" />
		            </c:if>
		            <c:if test="${empty Mission.titre}">
		                <input type="submit"
		                    value="<spring:message text="Add Mission"/>" />
		            </c:if>
		        </td>
		    </tr>
		</table>
		</form:form>
	</sec:authorize>
	
	
<c:if test="${empty Mission.titre}">
	<h3>Mission List</h3>
	<c:if test="${!empty listMissions}">
	    <table class="tg">
	    <tr>
	        <th width="80">Mission ID</th>
	        <th width="120">Titre</th>
	        <th width="120">Etat</th>
	        <th width="120">Description</th>
	        <th width="120">Adresse</th>
	        <th width="120">Intervenant</th>
	        <sec:authorize access="hasRole('ROLE_ADMIN')">
	        	<th width="60">Edit</th>
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
	    </table>
	</c:if>
</c:if>
</div>
	
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
</c:if>
	
</body>
</html>