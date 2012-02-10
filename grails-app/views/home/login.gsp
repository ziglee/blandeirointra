<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#email').focus();
        });
    </script>
</head>
<body>
<div class="wrapper">
    <h1 class="t2">Informe seus dados de login:</h1>
	<br/><br/>
	<g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:form action="authenticate" method="post">
        <div class="dialog">
            <div class="quadro">
                <table width="500" align="center">
                    <tbody>
                    <tr class="prop">
                        <td valign="top">
                            <label for="email">Email:</label><br/>
                            <input type="text" id="email" name="email" class="text signin" style="width:470px"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top">
                            <label for="password">Senha:</label><br/>
                            <input type="password" id="password" name="password" class="text signin" style="width:470px"/>

                            <br/><br/>
                            <input type="submit" value="Entrar" class="entrar btn01"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>