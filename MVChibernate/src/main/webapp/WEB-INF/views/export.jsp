<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion des partenaires</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	connecté en tant que: <sec:authentication property="name"/> <sec:authentication property="authorities"/>
	<a href="logout">Deconnexion</a>
	
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	
	<c:if test="${!empty message}">
		<c:if test="${fn:contains(message, 'SUCCES')}">
	        <div class="alert alert-success">${message}</div>
	    </c:if>
	    <c:if test="${fn:contains(message, 'ERREUR')}">
	        <div class="alert alert-danger">${message}</div>
	    </c:if>
	</c:if>
	
	<h1>Exporter une mission</h1>

	<c:url var="exportAction" value="/Export/mission" ></c:url>
	 
	<form:form action="${exportAction}" commandName="Mission">
		<tr>
	        <td>
	            <form:label path="adresse">
	                <spring:message text="adresse"/>
	            </form:label>
	        </td>
	        <td>
	        	<form:select path="adresse">
		        	<c:forEach items="${listMissions}" var="mission">
		        		<c:if test="${not empty mission}">
		        			<option value="${mission.adresse}">${mission.titre} / ${mission.adresse}</option>
		        		</c:if>
		    		</c:forEach>
	    		</form:select>
	        </td> 
	    </tr>
	    <tr>
	        <td colspan="2">
	            <input type="submit" value="<spring:message text="Exporter"/>" />
	        </td>
	    </tr>
	</form:form>
</div>
</body>
</html>