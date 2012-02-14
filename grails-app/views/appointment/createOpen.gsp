<%@ page import="br.com.borgeslandeiro.intranet.Appointment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <calendar:resources lang="br" theme="tiger"/>
        <script src='${resource(dir:"js", file:"appointment.js")}'></script>
    </head>
    <body>
        <div class="body">
            <h1>Novo agendamento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${appointmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${appointmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="saveOpen" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cliente"><g:message code="appointment.cliente.label" default="Proprietário" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'cliente', 'errors')}">
                                    <g:textField name="cliente" maxlength="100" value="${appointmentInstance?.cliente}" class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="empreendimento"><g:message code="appointment.empreendimento.label" default="Empreendimento" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'empreendimento', 'errors')}">
                                    <g:select id="empreendimento" name="empreendimento.id"  class="large" noSelection="['-1': 'Selecione...']" from="${br.com.borgeslandeiro.intranet.Building.list()}" optionKey="id" value="${appointmentInstance?.empreendimento?.id}"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="torre"><g:message code="appointment.torre.label" default="Torre" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'torre', 'errors')}">
                                    <g:select name="torre" id="torre" value="${appointmentInstance?.torre}" from="${appointmentInstance?.empreendimento?.torres}"  class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="unidade"><g:message code="appointment.unidade.label" default="Apartamento" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'unidade', 'errors')}">
                                    <g:textField name="unidade" maxlength="30" value="${appointmentInstance?.unidade}"  class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefone"><g:message code="appointment.telefone.label" default="Telefone" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" maxlength="30" value="${appointmentInstance?.telefone}"  class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="appointment.email.label" default="Email" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" maxlength="50" value="${appointmentInstance?.email}"  class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="observacoes"><g:message code="appointment.observacoes.label" default="Observações" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'observacoes', 'errors')}">
                                    <g:textArea name="observacoes" cols="40" rows="5" value="${appointmentInstance?.observacoes}"  class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataPrevista"><g:message code="appointment.dataPrevista.label" default="Data Prevista" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'dataPrevista', 'errors')}">
                                    <calendar:datePicker name="dataPrevista" defaultValue="${appointmentInstance?.dataPrevista}" dateFormat="%d/%m/%Y"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Salvar" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
