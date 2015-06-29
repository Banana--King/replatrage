<%@ include file="/WEB-INF/views/includes.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr"></script>
	
	<script type="text/javascript"></script>
</head>
<body>
connecté en tant que: <sec:authentication property="name"/> <sec:authentication property="authorities"/>
<a href="logout">Deconnexion</a>

	<h1>Gestion des missions</h1>
	
<c:if test="${!empty message}">
	<h2>${message}</h2>
</c:if>

<% System.out.println(); %>

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
        				<form:input readonly="true" path="adresse" disabled="true" />
        				<form:hidden path="adresse" />
        			</c:when>
        			<c:otherwise>
        				<form:input path="adresse" />
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
	
	<span id="text_latlng"></span>
	<div id="map-canvas" style="float:right;height:500px;width:45%"></div>
	
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
	    <% StringBuilder sb = new StringBuilder(); %>
	    <c:forEach items="${listMissions}" var="Mission">
	    	<c:if test="${Mission.id != 0}">
		        <tr>
		            <td>${Mission.id}</td>
		            <td>${Mission.titre}</td>
		            <td>${Mission.etat}</td>
		            <td>${Mission.description}</td>
		            <td>${Mission.adresse}</td>
		            <td>
		            	<c:choose>
		        			<c:when test="${!empty Mission.user.username}">
		        				${Mission.user.username}
		        			</c:when>
		        			<c:otherwise>
		        				AUCUN
		        			</c:otherwise>
		        		</c:choose>
		            </td>
		            <sec:authorize access="hasRole('ROLE_ADMIN')">
			            <td><a href="<c:url value='/Mission/edit/${Mission.id}' />" >Edit</a></td>
		            </sec:authorize>
		        </tr>
	        </c:if>
	    </c:forEach>
	    </table>
	</c:if>
	
	<script type="text/javascript">
		var geocoder;
		var map;
		// initialisation de la carte Google Map de départ
		function initialiserCarte() {
		  geocoder = new google.maps.Geocoder();
		  
		  var latlng = new google.maps.LatLng(48.831083, 2.266250799999966);
		  var mapOptions = {
		    zoom      : 50,
		    center    : latlng,
		    mapTypeId : google.maps.MapTypeId.ROADMAP
		  }
		  // map-canvas est le conteneur HTML de la carte Google Map
		  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
		  TrouverAdresse("48 rue Camille des Moulins, Issy-Les-Moulineaux");
		}
		 
		function TrouverAdresse(adresse) {
			console.log("hihihihihi");
		  // Récupération de l'adresse tapée dans le formulaire
		  //var adresse = document.getElementById('adresse').value;
		  geocoder.geocode( { 'address': adresse}, function(results, status) {
		    if (status == google.maps.GeocoderStatus.OK) {
		      map.setCenter(results[0].geometry.location);
		      // Récupération des coordonnées GPS du lieu tapé dans le formulaire
		      console.log(results);
		      var strposition = results[0].geometry.location+"";
		      strposition=strposition.replace('(', '');
		      strposition=strposition.replace(')', '');
		      // Affichage des coordonnées dans le <span>
		      document.getElementById('text_latlng').innerHTML='Coordonnées : '+strposition;
		      // Création du marqueur du lieu (épingle)
		      var marker = new google.maps.Marker({
		          map: map,
		          position: results[0].geometry.location
		      });
		    } else {
		      alert('Adresse introuvable: ' + status);
		    }
		  });
		}
		// Lancement de la construction de la carte google map
		google.maps.event.addDomListener(window, 'load', initialiserCarte);
		//TrouverAdresse("48 rue Camille des Moulins, Issy-Les-Moulineaux");
	</script>
</body>
</html>