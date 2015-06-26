<%@ include file="/WEB-INF/views/includes.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
</head>
<body>
	<h1>Gestion des missions</h1>
	
<c:if test="${!empty message}">
	<h2>${message}</h2>
</c:if>

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
	            <form:input path="titre" />
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
	            <form:input path="adresse" />
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
	    			<option value="">Choisir un utilisateur</option>
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
	        	<th width="60">Delete</th>
	        </sec:authorize>
	    </tr>
	    <c:forEach items="${listMissions}" var="Mission">
	        <tr>
	            <td>${Mission.id}</td>
	            <td>${Mission.titre}</td>
	            <td>${Mission.etat}</td>
	            <td>${Mission.description}</td>
	            <td>${Mission.adresse}</td>
	            <td>${Mission.user.username}</td>
	            <sec:authorize access="hasRole('ROLE_ADMIN')">
		            <td><a href="<c:url value='/Mission/edit/${Mission.id}' />" >Edit</a></td>
		            <td><a href="<c:url value='/Mission/remove/${Mission.id}' />" >Delete</a></td>
	            </sec:authorize>
	        </tr>
	    </c:forEach>
	    </table>
	</c:if>
</body>
</html>