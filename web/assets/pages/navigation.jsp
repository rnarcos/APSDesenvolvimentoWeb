<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="mySidenav" class="sidenav">
    <c:choose>
        <c:when test="${action.equals('home') || action == null}">
            <span id="currentNav">Home</span>	
        </c:when>
        <c:when test="${action.equals('schedule')}">
            <span id="currentNav">Agendar Consulta</span>	
        </c:when>
        <c:otherwise>
            <span id="currentNav">Listar Consultas</span>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${action.equals('home') || action == null}">
            <a href="/index.html" class="_disabled">Home</a>
        </c:when>
        <c:otherwise>
            <a href="/index.html">Home</a>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${action.equals('schedule')}">
            <a href="/schedule" class="_disabled">Agendar Consulta</a>
        </c:when>
        <c:otherwise>
            <a href="/schedule">Agendar Consulta</a>
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${action.equals('list')}">
            <a href="/list" class="_disabled">Listar Consultas</a>
        </c:when>
        <c:otherwise>
            <a href="/list">Listar Consultas</a>
        </c:otherwise>
    </c:choose>
</div>
<div id ="title">
	<span id="navButton" onclick="toggleNav()">&#9776; Menu</span>
	<span class="companyName">Clínica Médica</span>
</div>
            