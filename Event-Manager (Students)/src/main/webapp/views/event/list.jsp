<%--
 * list.jsp
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

<display:table name="events" id="event"
  requestURI="${requestURI}" pagesize="5"
  class="displaytag">
  	
  	<jstl:choose>
  		<jstl:when test="${registered == true}">
  			<display:column>
	  			<a href="event/customer/unregister.do?eventId=${event.id}">
	  				<spring:message code="event.unregister" var="unregisterText" />
	  				<jstl:out value="${unregisterText}" />
	  			</a>
  			</display:column>
  		</jstl:when>
  		
  		<jstl:when test="${registered == false}">
  			<display:column>
	  			<a href="event/customer/register.do?eventId=${event.id}">
	  				<spring:message code="event.register" var="registerText" />
	  				<jstl:out value="${registerText}" />
	  			</a>
  			</display:column>
  		</jstl:when>
  		
  		<jstl:otherwise>
  			<display:column>
	  			<a href="event/organiser/edit.do?eventId=${event.id}">
	  				<spring:message code="event.edit" var="editText" />
	  				<jstl:out value="${editText}" />
	  			</a>
  			</display:column>
  		</jstl:otherwise>
  		
  	</jstl:choose>
  	
	<spring:message code="event.title" var="titleHeader"/>
	<display:column property="title" title="${titleHeader}" sortable="true" />
	
	<spring:message code="event.moment" var="momentHeader"/>
	<display:column property="moment" title="${momentHeader}" sortable="true" />
	
	<spring:message code="event.description" var="descriptionHeader"/>
	<display:column property="description" title="${descriptionHeader}" sortable="false" />
	
	<spring:message code="event.price" var="priceHeader"/>
	<display:column property="price" title="${priceHeader}" sortable="false" />

</display:table>

<div>
	<jstl:if test="${registered == null}">
		<a href="event/organiser/create.do">
			<spring:message code="event.create" var="createText" />
			<jstl:out value="${createText}" />
		</a>
	</jstl:if>
</div>