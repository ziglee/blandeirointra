<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Borges Landeiro - Intranet</title>
    <meta name="layout" content="main" />
    </head>
    <body>
    	<h1 class="t1">Sistema de Agendamentos</h1>
		<br/><br/><br/><br/>
		<g:if test="${session.user}">
			<ul class="menu">
				<li>
					<img src="${resource(dir:'images',file:'key.png')}" alt="" align="absmiddle"/>
					<g:link controller="building" action="index">Empreendimento</g:link>
				</li>
				<li>
					<img src="${resource(dir:'images',file:'calendar.png')}" alt="" align="absmiddle"/>
					<g:link controller="appointment" action="agenda">Minha agenda</g:link>
				</li>
				<li>
					<img src="${resource(dir:'images',file:'man.png')}" alt="" align="absmiddle"/>
					<g:link controller="secUser" action="index">Cadastro de usuários</g:link>
				</li>
				<li style="border:none;background:none">					
					<g:link controller="home" action="logout" class="btn01">Sair</g:link>
				</li>
			</ul>
			<br/><br/><br/>
		</g:if>
		<g:else>
			<g:link controller="home" action="login" class="btn01">Entrar</g:link>
		</g:else>
    </body>
</html>
