<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
    <title>User Page</title>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        .tg .tg-4eph{background-color:#f9f9f9}
    </style>
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
	    Add a User
	</h1>
	 
	 <c:url var="addAction" value="/User/add" ></c:url>
	 
	<form:form action="${addAction}" commandName="User">
	<table>
	    <c:if test="${!empty User.nom}">
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
	        <td>
	            <form:label path="prenom">
	                <spring:message text="prenom"/>
	            </form:label>
	        </td>
	        <td>
	            <form:input path="prenom" />
	        </td>
	    </tr>
	    <tr>
	        <td>
	            <form:label path="username">
	                <spring:message text="username"/>
	            </form:label>
	        </td>
	        <td>
	            <form:input path="username" />
	        </td>
	    </tr>
	    <tr>
	        <td>
	            <form:label path="password">
	                <spring:message text="password"/>
	            </form:label>
	        </td>
	        <td>
	            <form:password path="password" />
	        </td>
	    </tr>
	    <tr>
	        <td>
	            <form:label path="enabled">
	                <spring:message text="enabled"/>
	            </form:label>
	        </td>
	        <td>
	            <form:checkbox path="enabled" />
	        </td>
	    </tr>
	    <tr>
	        <td colspan="2">
	            <c:if test="${!empty User.nom}">
	                <input type="submit"
	                    value="<spring:message text="Edit User"/>" />
	            </c:if>
	            <c:if test="${empty User.nom}">
	                <input type="submit"
	                    value="<spring:message text="Add User"/>" />
	            </c:if>
	        </td>
	    </tr>
	</table>  
	</form:form>
</sec:authorize>

<br>
<h3>Users List</h3>
<c:if test="${!empty listUsers}">
    <table class="tg">
    <tr>
        <th width="80">User ID</th>
        <th width="120">User Name</th>
        <th width="120">User Prenom</th>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        	<th width="60">Edit</th>
        	<th width="60">Delete</th>
        </sec:authorize>
    </tr>
    <c:forEach items="${listUsers}" var="User">
        <tr>
            <td>${User.id}</td>
            <td>${User.nom}</td>
            <td>${User.prenom}</td>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
	            <td><a href="<c:url value='/User/edit/${User.id}' />" >Edit</a></td>
	            <td><a href="<c:url value='/User/remove/${User.id}' />" >Delete</a></td>
            </sec:authorize>
        </tr>
    </c:forEach>
    </table>
</c:if>
</body>
</html>