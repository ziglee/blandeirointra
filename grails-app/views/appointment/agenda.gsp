<%@ page import="br.com.borgeslandeiro.intranet.AppointmentPhase; br.com.borgeslandeiro.intranet.Appointment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="Agendamento" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <calendar:resources lang="br" theme="tiger"/>
    </head>
    <body>
        <div class="topnav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="create" action="create">Novo</g:link></span>
        </div>
        <div class="filter">
            <g:form action="agenda">
                Empreendimento: <g:select name="empreendimento" noSelection="['': 'Selecione...']" from="${empreendimentos}" optionKey="id" value="${params.empreendimento}" />
                &nbsp;&nbsp;&nbsp;
				Fase: <g:select name="fase" noSelection="['': 'Selecione...']" from="${fases}" optionKey="nome" optionValue="nome" value="${params.fase}" />
                <br/>                                
				<div class="datacontainer">
					Data:
					<calendar:datePicker name="dataPrevistaInicio" defaultValue="${dataPrevistaInicio}" dateFormat="%d/%m/%Y"/> até: 
					<calendar:datePicker name="dataPrevistaFim" defaultValue="${dataPrevistaFim}" dateFormat="%d/%m/%Y"/>
					&nbsp;&nbsp;&nbsp;
					<g:submitButton name="Filtrar" class="btn02"/>
				</div>                
            </g:form>
        </div>
        <div class="body">
            <h1>Agendamentos</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="Id" />
                            <g:sortableColumn property="empreendimento" title="Unidade" />
                            <g:sortableColumn property="cliente" title="Proprietário" />
                            <g:sortableColumn property="telefone" title="Contato" />
                            <g:sortableColumn property="dataPrevista" title="Data" />
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${appointmentInstanceList}" status="i" var="appointmentInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "id")}</g:link></td>
                            <td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "empreendimento.nome")}</g:link></td>
                            <td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "cliente")}</g:link></td>
                            <td><g:link action="show" id="${appointmentInstance.id}">${fieldValue(bean: appointmentInstance, field: "telefone")}</g:link></td>
                            <td><g:link action="show" id="${appointmentInstance.id}"><g:formatDate date="${appointmentInstance?.dataPrevista}" format="dd/MM/yyyy"/></g:link></td>
                            <td>
                                <g:if test="${appointmentInstance.fase.equals(AppointmentPhase.SOLICITADO)}">
                                    <g:link action="confirmar" class="confirmar-btn" id="${appointmentInstance.id}" elementId="confirmar-btn-${appointmentInstance.id}" onclick="return confirm('Deseja confirmar o agendamento? (O cliente receberá um email)');">Confirmar</g:link>
                                    <g:link action="edit" class="alterar-btn" id="${appointmentInstance.id}" elementId="alterar-btn-${appointmentInstance.id}" >Alterar</g:link>
                                </g:if>
                                <g:elseif test="${appointmentInstance.fase.equals(AppointmentPhase.CONFIRMADO)}">
                                    <g:link action="resolver" class="resolver-btn" id="${appointmentInstance.id}" elementId="resolver-btn-${appointmentInstance.id}" onclick="return confirm('Deseja resolver o agendamento?');">Confirmado</g:link>
                                </g:elseif>
                                <g:else>
                                    <a href="#" class="resolvido-btn">Resolvido</a>
                                </g:else>
                            </td>
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
