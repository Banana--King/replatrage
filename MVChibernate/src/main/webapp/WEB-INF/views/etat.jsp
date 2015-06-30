<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion du Workflow</title>

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
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h1>
		    Ajouter un état
		</h1>
		 
		 <c:url var="addAction" value="/Etat/add" ></c:url>
		 
		<form:form action="${addAction}" commandName="Etat">
		<table>
		    <c:if test="${!empty Etat.nom}">
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
		            <form:label path="nom">
		                <spring:message text="nom"/>
		            </form:label>
		        </td>
		        <td>
		            <form:input path="nom" />
		        </td> 
		    </tr>
		    <tr>
		        <td colspan="2">
		            <c:if test="${!empty Etat.nom}">
		                <input type="submit"
		                    value="<spring:message text="Edit Etat"/>" />
		            </c:if>
		            <c:if test="${empty Etat.nom}">
		                <input type="submit"
		                    value="<spring:message text="Add Etat"/>" />
		            </c:if>
		        </td>
		    </tr>
		</table>  
		</form:form>
	</sec:authorize>
	
	<h3>Etats List</h3>
	<c:if test="${!empty listEtats}">
	    <table class="tg">
	    <tr>
	        <th width="80">Etat ID</th>
	        <th width="120">Etat Name</th>
	        <sec:authorize access="hasRole('ROLE_ADMIN')">
	        	<th width="60">Edit</th>
	        	<th width="60">Delete</th>
	        </sec:authorize>
	    </tr>
	    <c:forEach items="${listEtats}" var="Etat">
	        <tr>
	            <td>${Etat.id}</td>
	            <td>${Etat.nom}</td>
	            <sec:authorize access="hasRole('ROLE_ADMIN')">
		            <td><a href="<c:url value='/Etat/edit/${Etat.id}' />" >Edit</a></td>
		            <td><a href="<c:url value='/Etat/remove/${Etat.id}' />" >Delete</a></td>
	            </sec:authorize>
	        </tr>
	    </c:forEach>
	    </table>
	</c:if>
</div>
</body>
</html>