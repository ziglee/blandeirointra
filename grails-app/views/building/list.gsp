
<%@ page import="br.com.borgeslandeiro.intranet.Building" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="topnav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="create" action="create">Novo</g:link></span>
        </div>
        <div class="body">
            <h1>Lista de empreendimentos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'building.id.label', default: 'Id')}" />
                            <g:sortableColumn property="nome" title="${message(code: 'building.nome.label', default: 'Nome')}" />
                            <th><g:message code="building.responsavel.label" default="Responsavel" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${buildingInstanceList}" status="i" var="buildingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${buildingInstance.id}">${fieldValue(bean: buildingInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: buildingInstance, field: "nome")}</td>
                            <td>${fieldValue(bean: buildingInstance, field: "responsavel")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${buildingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
