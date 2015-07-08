<%@ include file="/WEB-INF/views/includes.jsp" %>

<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.png">
    <title>Gestion des exportations </title>

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
					<h3 class="page-header"><i class="fa fa-laptop"></i> Exportation </h3>
			<h1>Gestion des exportations </h1>
	
	<c:if test="${!empty message}">
		<c:if test="${fn:contains(message, 'SUCCES')}">
	        <div class="alert alert-success">${message}</div>
	    </c:if>
	    <c:if test="${fn:contains(message, 'ERREUR')}">
	        <div class="alert alert-danger">${message}</div>
	    </c:if>
	</c:if>
	
	<h2>Exporter une mission</h2>

	<c:url var="exportAction" value="/Export/mission" ></c:url>
	 
	<form:form action="${exportAction}" commandName="Mission">
		<tr>
	        <td>
	            <form:label path="adresse">
	                <spring:message text="adresse"/>
	            </form:label>
	        </td>
	        <td>
	        	<form:select class="btn btn-default" path="adresse">
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
	            <input type="submit" class="btn btn-default" value="<spring:message text="Exporter"/>" />
	        </td>
	    </tr>
	</form:form>
</div>
</body>
</html>