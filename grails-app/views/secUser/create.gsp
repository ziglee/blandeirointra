

<%@ page import="br.com.borgeslandeiro.intranet.SecUser" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'secUser.label', default: 'SecUser')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Início</a></span>
            <span class="menuButton"><g:link class="list" action="list">Listagem</g:link></span>
        </div>
        <div class="body">
            <h1>Novo usuário</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${secUserInstance}">
            <div class="errors">
                <g:renderErrors bean="${secUserInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="secUser.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: secUserInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" maxlength="30" value="${secUserInstance?.password}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="secUser.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: secUserInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" maxlength="50" value="${secUserInstance?.email}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="secUser.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: secUserInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="50" value="${secUserInstance?.nome}" />
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
