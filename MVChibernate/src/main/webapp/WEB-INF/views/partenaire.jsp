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

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<h1>
	    Add a Partenaire
	</h1>
	 
	 <c:url var="addAction" value="/Partenaire/add" ></c:url>
	 
	<form:form action="${addAction}" commandName="Partenaire">
	<table>
	    <c:if test="${!empty Partenaire.nom}">
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
	            <c:if test="${!empty Partenaire.nom}">
	                <input type="submit"
	                    value="<spring:message text="Edit Partenaire"/>" />
	            </c:if>
	            <c:if test="${empty Partenaire.nom}">
	                <input type="submit"
	                    value="<spring:message text="Add Partenaire"/>" />
	            </c:if>
	        </td>
	    </tr>
	</table>  
	</form:form>
</sec:authorize>

<h3>Partenaires List</h3>
<c:if test="${!empty listPartenaires}">
    <table class="tg">
    <tr>
        <th width="80">Partenaire ID</th>
        <th width="120">Partenaire Name</th>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        	<th width="60">Edit</th>
        	<th width="60">Delete</th>
        </sec:authorize>
    </tr>
    <c:forEach items="${listPartenaires}" var="Partenaire">
        <tr>
            <td>${Partenaire.id}</td>
            <td>${Partenaire.nom}</td>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
	            <td><a href="<c:url value='/Partenaire/edit/${Partenaire.id}' />" >Edit</a></td>
	            <td><a href="<c:url value='/Partenaire/remove/${Partenaire.id}' />" >Delete</a></td>
            </sec:authorize>
        </tr>
    </c:forEach>
    </table>
</c:if>
</body>
</html>