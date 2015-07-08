<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Gestion des roles</title>
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
	    Add a Role
	</h1>
	 
	 <c:url var="addAction" value="/Role/add" ></c:url>
	 
	<form:form action="${addAction}" commandName="Role">
	<table>
	    <c:if test="${!empty Role.name}">
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
	            <form:label path="name">
	                <spring:message text="name"/>
	            </form:label>
	        </td>
	        <td>
	            <form:input path="name" />
	        </td> 
	    </tr>
	    <tr>
	        <td colspan="2">
	            <c:if test="${!empty Role.name}">
	                <input type="submit"
	                    value="<spring:message text="Edit Role"/>" />
	            </c:if>
	            <c:if test="${empty Role.name}">
	                <input type="submit"
	                    value="<spring:message text="Add Role"/>" />
	            </c:if>
	        </td>
	    </tr>
	</table>  
	</form:form>
</sec:authorize>

<h3>Roles List</h3>
<c:if test="${!empty listRoles}">
    <table class="tg">
    <tr>
        <th width="80">Role ID</th>
        <th width="120">Role Name</th>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        	<th width="60">Edit</th>
        	<th width="60">Delete</th>
        </sec:authorize>
    </tr>
    <c:forEach items="${listRoles}" var="Role">
        <tr>
            <td>${Role.id}</td>
            <td>${Role.name}</td>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
	            <td><a href="<c:url value='/Role/edit/${Role.id}' />" >Edit</a></td>
	            <td><a href="<c:url value='/Role/remove/${Role.id}' />" >Delete</a></td>
            </sec:authorize>
        </tr>
    </c:forEach>
    </table>
</c:if>
</body>
</html>