<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">
     <title>Gestion des Partenaires </title>

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
<div class="container">
	<%@ include file="/WEB-INF/views/header.jsp" %>
			<%@ include file="/WEB-INF/views/sidebar.jsp" %>
	
	
	<section id="main-content">
            <section class="wrapper">
					<h3 class="page-header"><i class="fa fa-laptop"></i> Les partenaires</h3>
			<h1>Gestion des partenaires </h1>
	
	<c:if test="${!empty message}">
		<c:if test="${fn:contains(message, 'SUCCES')}">
	        <div class="alert alert-success">${message}</div>
	    </c:if>
	    <c:if test="${fn:contains(message, 'ERREUR')}">
	        <div class="alert alert-danger">${message}</div>
	    </c:if>
	</c:if>
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
		<h2>
		    Ajouter un partenaire
		</h2>
		 
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
		            <form:input class="form-control" path="nom" />
		        </td> 
		    </tr>
		    <tr>
		        <td colspan="2">
		            <c:if test="${!empty Partenaire.nom}">
		                <input class="btn btn-default" type="submit"
		                    value="<spring:message text="Edit Partenaire"/>" />
		            </c:if>
		            <c:if test="${empty Partenaire.nom}">
		                <input class="btn btn-default" type="submit"
		                    value="<spring:message text="Add Partenaire"/>" />
		            </c:if>
		        </td>
		    </tr>
		</table>  
		</form:form>
	</sec:authorize>
	
	<h3>Liste des Partenaires</h3>
	<c:if test="${!empty listPartenaires}">
	    <table class="table table-striped">
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
		            <td><a href="<c:url value='/Partenaire/edit/${Partenaire.id}' />" class="btn btn-primary">Edit</a></td>
		            <td><a href="<c:url value='/Partenaire/remove/${Partenaire.id}' />"class="btn btn-danger" >Delete</a></td>
	            </sec:authorize>
	        </tr>
	    </c:forEach>
	    </table>
	</c:if>
</div>
</body>
</html>