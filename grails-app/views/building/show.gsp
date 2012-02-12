
<%@ page import="br.com.borgeslandeiro.intranet.Building" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="topnav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listagem</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Novo</g:link></span>
        </div>
        <div class="body">
            <h1>Empreendimento</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="building.nome.label" default="Nome" />:</td>
                            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "nome")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="building.responsavel.label" default="Responsavel" />:</td>
                            <td valign="top" class="value"><g:link controller="secUser" action="show" id="${buildingInstance?.responsavel?.id}">${buildingInstance?.responsavel?.encodeAsHTML()}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="building.torres.label" default="Torres" />:</td>
                            <td valign="top" class="value">${fieldValue(bean: buildingInstance, field: "torres")}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${buildingInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="Editar" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="Excluir" onclick="return confirm('Confirmar exclusão?');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
