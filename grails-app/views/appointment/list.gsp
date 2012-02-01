
<%@ page import="br.com.borgeslandeiro.intranet.Appointment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="create" action="create">Novo</g:link></span>
        </div>
        <div class="body">
            <h1>Listagem de agendamentos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="${message(code: 'appointment.id.label', default: 'Id')}" />
                            <g:sortableColumn property="cliente" title="${message(code: 'appointment.empreendimento.label', default: 'Unidade')}" />
                            <g:sortableColumn property="cliente" title="${message(code: 'appointment.cliente.label', default: 'Cliente')}" />
                            <g:sortableColumn property="telefone" title="${message(code: 'appointment.telefone.label', default: 'Contato')}" />
                            <g:sortableColumn property="telefone" title="${message(code: 'appointment.dataPrevista.label', default: 'Data')}" />
                            <g:sortableColumn property="telefone" title="${message(code: 'appointment.fase.label', default: 'Fase')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "id")}</g:link></td>
                            <td>${fieldValue(bean: appointmentInstance, field: "empreendimento.nome")}</td>
                            <td>${fieldValue(bean: appointmentInstance, field: "cliente")}</td>
                            <td>${fieldValue(bean: appointmentInstance, field: "telefone")}</td>
                            <td><g:formatDate date="${appointmentInstance?.dataPrevista}" format="dd/MM/yyyy"/></td>
                            <td>${fieldValue(bean: appointmentInstance, field: "fase")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${appointmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
