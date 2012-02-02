<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Borges Landeiro - Intranet</title>
    <meta name="layout" content="main" />
    </head>
    <body>
        <ul>
            <g:if test="${session.user}">
                <li><g:link controller="building" action="index">Empreendimento</g:link></li>
                <li><g:link controller="appointment" action="agenda">Minha agenda</g:link></li>
                <li><g:link controller="secUser" action="index">Cadastro de usuários</g:link></li>
                <li><g:link controller="home" action="logout">Logout</g:link></li>
            </g:if>
            <g:else>
                <li><g:link controller="home" action="login">Entrar</g:link></li>
            </g:else>
        </ul>
    </body>
</html>
