
<%@ page import="br.com.borgeslandeiro.intranet.Appointment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="topnav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="list" action="agenda">Listagem</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Novo</g:link></span>
        </div>
        <div class="body">
            <h1>Agendamento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Código:</td>
                            <td valign="top" class="value">${appointmentInstance?.id}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Serviço:</td>
                            <td valign="top" class="value">${appointmentInstance?.servico?.encodeAsHTML()}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Proprietário:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "cliente")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Empreendimento:</td>
                            <td valign="top" class="value"><g:link controller="building" action="show" id="${appointmentInstance?.empreendimento?.id}">${appointmentInstance?.empreendimento?.encodeAsHTML()}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Torre:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "torre")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Unidade:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "unidade")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Telefone:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "telefone")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "email")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Observações:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "observacoes")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Data Prevista:</td>
                            <td valign="top" class="value"><g:formatDate date="${appointmentInstance?.dataPrevista}" format="dd/MM/yyyy"/></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Fase:</td>
                            <td valign="top" class="value">${appointmentInstance?.fase?.encodeAsHTML()}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${appointmentInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
