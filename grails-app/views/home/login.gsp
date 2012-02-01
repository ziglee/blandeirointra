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
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:form action="authenticate" method="post">
        <div class="dialog">
            <div class="quadro">
                <table>
                    <tbody>
                    <tr class="prop">
                        <td valign="top">
                            <label for="email">Email:</label><br/>
                            <input type="text" id="email" name="email" class="text"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top">
                            <label for="password">Senha:</label><br/>
                            <input type="password" id="password" name="password" class="text"/>

                            <br/><br/>
                            <input type="submit" value="Entrar" class="entrar"/>
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