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
	    Add a Role
	</h1>
	 
	 <c:url var="addAction" value="/RoleUser/add" ></c:url>
	 
	<form:form action="${addAction}" commandName="RoleUser">
	<table>
	    <c:if test="${!empty RoleUser.roleName}">
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
	            <form:label path="username">
	                <spring:message text="username"/>
	            </form:label>
	        </td>
	        <td>
	        	<form:select path="username">
		        	<c:forEach items="${listUsers}" var="User">
		        		<c:choose>
		        			<c:when test="${RoleUser.username eq User.username }">
		        				<option value="${User.username}" selected="selected">${User.username}</option>
		        			</c:when>
		        			<c:otherwise>
		        				<option value="${User.username}">${User.username}</option>
		        			</c:otherwise>
		        		</c:choose>
		    		</c:forEach>
	    		</form:select>
	        </td> 
	    </tr>
	    <tr>
	        <td>
	            <form:label path="roleName">
	                <spring:message text="roleName"/>
	            </form:label>
	        </td>
	        <td>
	        	<form:select path="roleName">
		        	<c:forEach items="${listRoleNames}" var="Role">
		        		<c:choose>
		        			<c:when test="${RoleUser.roleName eq Role.name }">
		        				<option value="${Role.name}" selected="selected">${Role.name}</option>
		        			</c:when>
		        			<c:otherwise>
		        				<option value="${Role.name}">${Role.name}</option>
		        			</c:otherwise>
		        		</c:choose>	
		    		</c:forEach>
	    		</form:select>
	            <!-- form:input path="roleName" / -->
	        </td> 
	    </tr>
	    <tr>
	        <td colspan="2">
	            <c:if test="${!empty RoleUser.roleName}">
	                <input type="submit"
	                    value="<spring:message text="Edit Role"/>" />
	            </c:if>
	            <c:if test="${empty RoleUser.roleName}">
	                <input type="submit"
	                    value="<spring:message text="Add Role"/>" />
	            </c:if>
	        </td>
	    </tr>
	</table>  
	</form:form>
</sec:authorize>

<h3>Roles List</h3>
<c:if test="${!empty listRoleUsers}">
    <table class="tg">
    <tr>
        <th width="80">Role ID</th>
        <th width="80">User Name</th>
        <th width="120">Role Name</th>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        	<th width="60">Edit</th>
        	<th width="60">Delete</th>
        </sec:authorize>
    </tr>
    <c:forEach items="${listRoleUsers}" var="RoleUser">
        <tr>
            <td>${RoleUser.id}</td>
            <td>${RoleUser.username}</td>
            <td>${RoleUser.roleName}</td>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
	            <td><a href="<c:url value='/RoleUser/edit/${RoleUser.id}' />" >Edit</a></td>
	            <td><a href="<c:url value='/RoleUser/remove/${RoleUser.id}' />" >Delete</a></td>
            </sec:authorize>
        </tr>
    </c:forEach>
    </table>
</c:if>
</body>
</html>