<%--
 * edit.jsp
 *
 * Copyright (C) 2016 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<form:form action="event/organiser/edit.do" modelAttribute="event">
	
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="customers"/>
	<form:hidden path="organiser"/>
	
	<div>
		<form:label path="title">
			<spring:message code="event.title" />
		</form:label>
		<form:input path="title"/>
		<form:errors cssClass="error" path="title" />
	</div>
	
	<div>
		<form:label path="moment">
			<spring:message code="event.moment" />
		</form:label>
		<form:input cssClass="datepicker" path="moment"/>
		<form:errors cssClass="error" path="moment" />
	</div>
	
	<div>
		<form:label path="description">
			<spring:message code="event.description" />
		</form:label>
		<form:textarea path="description"/>
		<form:errors cssClass="error" path="description" />
	</div>
	
	<div>
		<form:label path="price">
			<spring:message code="event.price" var="priceText" />
		</form:label>
		<form:input path="price"/>
		<form:errors cssClass="error" path="price" />
	</div>
	
	<div>
		<spring:message code="event.save" var="saveText"/>
		<input type="submit" name="save" value="${saveText}"/>
		
		<jstl:if test="${event.id != 0}">
			<spring:message code="event.delete" var="deleteText" />
			<spring:message code="event.confirm.delete" var="confDeleteText" />
			<input type="submit" name="delete" value="${deleteText}"
			 onclick="return confirm('${confDeleteText}')" />
		</jstl:if>
		
		<spring:message code="event.cancel" var="cancelText" />
		<input type="button" name="cancel"
			value="${cancelText}"
			onclick="window.location='event/organiser/list-organised.do'" />
	</div>
	
</form:form>