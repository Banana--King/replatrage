<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion des partenaires</title>
</head>
<body>
	connecté en tant que: <sec:authentication property="name"/> <sec:authentication property="authorities"/>
<a href="logout">Deconnexion</a>

<%@ include file="/WEB-INF/views/nav.jsp" %>

<c:if test="${!empty message}">
	<h2>${message}</h2>
</c:if>

<h1>Exporter une mission</h1>

	<c:url var="addAction" value="/Export/mission" ></c:url>
	 
	<form:form action="${addAction}" commandName="Mission">
		<tr>
	        <td>
	            <form:label path="adresse">
	                <spring:message text="adresse"/>
	            </form:label>
	        </td>
	        <td>
	        	<form:select path="adresse">
		        	<c:forEach items="${listMissions}" var="Mission">
		        		<option value="${Mission.adresse}">${Mission.titre} / ${Mission.adresse}</option>
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
	
</body>
</html>