<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">
     <title>Gestion des partenaires </title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="<c:url value="/resources/css/elegant-icons-style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style-responsive.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery-ui-1.10.4.min.css" />" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="<c:url value="js/html5shiv.js"/>"></script>
    <script src="<c:url value="js/respond.min.js"/>"></script>
    <![endif]-->
</head>
<body>
 <section id="container">

    <%@ include file="/WEB-INF/views/header.jsp" %>
			<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	<section id="main-content">
            <section class="wrapper">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Les droits </h3>
			<h1>Gestion des utilisateurs </h1>
	
	<c:if test="${!empty message}">
		<c:if test="${fn:contains(message, 'SUCCES')}">
	        <div class="alert alert-success">${message}</div>
	    </c:if>
	    <c:if test="${fn:contains(message, 'ERREUR')}">
	        <div class="alert alert-danger">${message}</div>
	    </c:if>
	</c:if>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h2>
		   Ajouter des droits
		</h2>
		 
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
		        	<form:select class="btn btn-default" path="username">
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
		        	<form:select class="btn btn-default" path="roleName">
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
		                <input class="btn btn-default" type="submit"
		                    value="<spring:message text="Edit Role "/>" />
		            </c:if>
		            <c:if test="${empty RoleUser.roleName}">
		                <input class="btn btn-default" type="submit"
		                    value="<spring:message text="Add Role"/>" />
		            </c:if>
		        </td>
		    </tr>
		</table>  
		</form:form>
	</sec:authorize>
	
	<h3>Roles List</h3>
	<c:if test="${!empty listRoleUsers}">
	    <table class="table table-striped">
	    <tr>
	        
	        <th width="80">User Name</th>
	        <th width="120">Role Name</th>
	        <sec:authorize access="hasRole('ROLE_ADMIN')">
	        	<th width="60">Edit</th>
	        	<th width="60">Delete</th>
	        </sec:authorize>
	    </tr>
	    <c:forEach items="${listRoleUsers}" var="RoleUser">
	        <tr>
	            
	            <td>${RoleUser.username}</td>
	            <td>${RoleUser.roleName}</td>
	            <sec:authorize access="hasRole('ROLE_ADMIN')">
		            <td><a href="<c:url value='/RoleUser/edit/${RoleUser.id}' />" class="btn btn-primary">Edit</a></td>
		            <td><a href="<c:url value='/RoleUser/remove/${RoleUser.id}' />" class="btn btn-danger">Delete</a></td>
	            </sec:authorize>
	        </tr>
	    </c:forEach>
	    </table>
	</c:if>
</section>
</section>
</section>
</body>
</html>