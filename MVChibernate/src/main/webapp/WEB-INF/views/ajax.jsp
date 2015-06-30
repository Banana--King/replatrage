<%@ include file="/WEB-INF/views/includes.jsp" %>

<c:if test="${action eq 'getAllAdresses'}">
	<c:forEach items="${listMissions}" var="Mission">
	   	<c:if test="${Mission.id != 0}">
	         ${Mission.adresse};;;
	    </c:if>
	</c:forEach>
</c:if>

