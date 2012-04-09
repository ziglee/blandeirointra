<%@ page import="br.com.borgeslandeiro.intranet.Appointment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'appointment.label', default: 'Appointment')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <r:require modules="fullcalendar"/>
        <calendar:resources lang="br" theme="tiger"/>
        <script src='${resource(dir:"js", file:"appointment.js")}'></script>
        <script src='${resource(dir:"js", file:"jquery.maskedinput-1.1.4.pack.js")}'></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#telefone").mask("(99) 9999-9999");
            });
        </script>
    </head>
    <body>
        <div class="topnav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="list" action="agenda">Listagem</g:link></span>
        </div>
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
            <g:form action="save" >
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
                                    <label for="cliente">*<g:message code="appointment.cliente.label" default="Proprietário" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'cliente', 'errors')}">
                                    <g:textField name="cliente" maxlength="100" value="${appointmentInstance?.cliente}" class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="empreendimento">*<g:message code="appointment.empreendimento.label" default="Empreendimento" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'empreendimento', 'errors')}">
                                    <g:select id="empreendimento" name="empreendimento.id"  class="large" noSelection="['': 'Selecione...']" from="${br.com.borgeslandeiro.intranet.Building.list()}" optionKey="id" value="${appointmentInstance?.empreendimento?.id}"  />
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
                                    <label for="unidade">*<g:message code="appointment.unidade.label" default="Apartamento" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'unidade', 'errors')}">
                                    <g:textField name="unidade" maxlength="30" value="${appointmentInstance?.unidade}"  class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefone">*<g:message code="appointment.telefone.label" default="Telefone" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" maxlength="30" value="${appointmentInstance?.telefone}" id="telefone" class="large"/>
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
                                    <label for="dataPrevista">*<g:message code="appointment.dataPrevista.label" default="Data Prevista" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: appointmentInstance, field: 'dataPrevista', 'errors')}">
                                    <input type="hidden" name="dataPrevista_year" id="dataPrevista_year" value="${params.dataPrevista_year}">
                                    <input type="hidden" name="dataPrevista_month" id="dataPrevista_month" value="${params.dataPrevista_month}">
                                    <input type="hidden" name="dataPrevista_day" id="dataPrevista_day" value="${params.dataPrevista_day}">
                                    <input type="hidden" name="dataPrevista_hour" id="dataPrevista_hour" value="0">
                                    <input type="hidden" name="dataPrevista_minute" id="dataPrevista_minute" value="0">
                                    <input type="text" id="dataPrevista_value" name="dataPrevista_value" readonly="true" value="${params.dataPrevista_value}" style="width:70px"> 
                                    &nbsp;&nbsp;&nbsp;<span style="color:#666">*Clique em um dia no calendário</span>
                                    <br/>
                                    <div id="calendar"></div>
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
                    <span class="button"><g:submitButton name="create" class="save" value="Salvar" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
