<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Borges Landeiro - Intranet</title>
    <meta name="layout" content="main" />
    </head>
    <body>
    	<div style="height:500px;">
			<br/><br/><br/>
			<h1 class="t1">Sistema de Agendamentos</h1>
			<br/><br/><br/><br/>
			<g:if test="${session.user}">
				<ul class="menu">
					<li>
						<img src="${resource(dir:'images',file:'key.png')}" alt="" align="absmiddle"/>&nbsp;&nbsp;&nbsp;
						<g:link controller="building" action="index">Empreendimento</g:link>
					</li>
					<li>
						<img src="${resource(dir:'images',file:'calendar.png')}" alt="" align="absmiddle"/>&nbsp;&nbsp;&nbsp;
						<g:link controller="appointment" action="agenda">Minha agenda</g:link>
					</li>
					<li>
						<img src="${resource(dir:'images',file:'man.png')}" alt="" align="absmiddle"/>&nbsp;&nbsp;&nbsp;
						<g:link controller="secUser" action="index">Cadastro de usuários</g:link>
					</li>					
				</ul>
				<br/><br/><br/>
				<g:link controller="home" action="logout" class="btn02" style="margin-left:20px">Sair</g:link>
				<br/><br/><br/>
			</g:if>
			<g:else>
				<div style="width:400px">
				<h1 class="t3">
					O sistema de agendamentos da Borges Landeiro é uma ferramenta que facilita a comunicação entre os clientes e os corretores. 
					<br/><br/>
					Em poucos minutos, o comprador pode marcar um dia para visitar o empreendimento e o corretor pode controlar de forma mais prática a sua disponibilidade.
				</h1>
				</div>
				<br/><br/><br/>
				<g:link controller="home" action="login" class="btn01">Entrar</g:link>				
			</g:else>
			<img src="${resource(dir:'images',file:'bg.png')}" style="position:absolute;bottom:0px;right:0px;"/>
			<div style="position:absolute;bottom:10px;left:10px;">
				<b>@BorgesLandeiro</b> <a href="http://www.twitter.com/borgeslandeiro" target="_blank"><img src="${resource(dir:'images',file:'twitter.png')}" align="absmiddle" border="0"/></a>
			</div>
		</div>
    </body>
</html>
