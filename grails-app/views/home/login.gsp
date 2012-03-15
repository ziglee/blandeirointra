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
    <br/><br/><br/>
	<h1 class="t2">Informe seus dados de login: </h1>
	<br/><br/>
	<g:if test="${flash.message}">
        <div class="message" style="width:300px;">${flash.message}</div>
    </g:if>
    <g:form action="authenticate" method="post">
        <div style="height:400px">
			<table align="center" style="border:0px">
				<tbody>
				<tr class="prop">
					<td valign="top">
						<label for="email">Email:</label><br/>
						<input type="text" id="email" name="email" class="text signin" style="width:300px"/>
					</td>
				</tr>
				<tr class="prop">
					<td valign="top">
						<label for="password">Senha:</label><br/>
						<input type="password" id="password" name="password" class="text signin" style="width:300px"/>

						<br/><br/>
						<input type="submit" value="Entrar" class="entrar btn01"/>
					</td>
				</tr>
				</tbody>
			</table>
			<img src="${resource(dir:'images',file:'bg.png')}" style="position:absolute;bottom:0px;right:0px;"/>
		</div>
    </g:form>
</div>
</body>
</html>