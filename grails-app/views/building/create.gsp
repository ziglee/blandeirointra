<%@ page import="br.com.borgeslandeiro.intranet.Building" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <script src='${resource(dir:"js", file:"building.js")}'></script>
    </head>
    <body>
        <div class="topnav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listagem</g:link></span>
        </div>
        <div class="body">
            <h1>Novo empreendimento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${buildingInstance}">
            <div class="errors">
                <g:renderErrors bean="${buildingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="building.nome.label" default="Nome" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buildingInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="100" value="${buildingInstance?.nome}" class="large"/>
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="responsavel"><g:message code="building.responsavel.label" default="Responsável" />:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buildingInstance, field: 'responsavel', 'errors')}">
                                    <g:select id="responsavel" name="responsavel.id" from="${br.com.borgeslandeiro.intranet.SecUser.list()}" optionKey="id" value="${buildingInstance?.responsavel?.id}" class="large" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label><g:message code="building.torres.label" default="Torres" />:</label>
									<input type="button" id="torre-add" value=" + " class="btn02"/>
                                </td>
                                <td valign="top" id="torres-td" class="value ${hasErrors(bean: buildingInstance, field: 'torres', 'errors')}">                                                                       
                                    <g:each in="${buildingInstance.torres}" var="torre" status="i">
                                        <input type="text" name="torres" id="torres-${i}" class="torres-text" value="${torre}"/><input type="button" id="torres-${i}-del" class="torres-del-btn" value="-" onclick="removerTorre(${i});"/>
                                    </g:each>
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
