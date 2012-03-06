<%@ page import="br.com.borgeslandeiro.intranet.Appointment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <calendar:resources lang="br" theme="tiger"/>
        <script src='${resource(dir:"js", file:"appointment.js")}'></script>
    </head>
    <body>
        <div class="topnav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="list" action="agenda">Listagem</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Novo</g:link></span>
        </div>
        <div class="body">
            <h1>Editar agendamento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${appointmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${appointmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${appointmentInstance?.id}" />
                <g:hiddenField name="version" value="${appointmentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="servico"><g:message code="appointment.servico.label" default="Serviço" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'servico', 'errors')}">
                                    <g:select name="servico" from="${br.com.borgeslandeiro.intranet.AppointmentType?.values()}" keys="${br.com.borgeslandeiro.intranet.AppointmentType?.values()*.name()}" value="${appointmentInstance?.servico?.name()}"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cliente"><g:message code="appointment.cliente.label" default="Proprietário" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'cliente', 'errors')}">
                                    <g:textField name="cliente" maxlength="100" value="${appointmentInstance?.cliente}"  class="large"/>
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
                                  <label for="unidade"><g:message code="appointment.unidade.label" default="Unidade" />:</label>
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
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fase"><g:message code="appointment.fase.label" default="Fase" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'fase', 'errors')}">
                                    <g:select name="fase" from="${br.com.borgeslandeiro.intranet.AppointmentPhase?.values()}" keys="${br.com.borgeslandeiro.intranet.AppointmentPhase?.values()*.name()}" value="${appointmentInstance?.fase?.name()}"  />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="Atualizar" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="Excluir" onclick="return confirm('Confirmar exclusão?');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
