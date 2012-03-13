<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <title><g:layoutTitle default="Borges Landeiro" /></title>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <r:require modules="jquery-ui, style, application"/>
	    <r:layoutResources/>
        <g:layoutHead />
    </head>
    <body>
        <div id="margem">
			<div id="spinner" class="spinner" style="display:none;">
				<img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
			</div>			
			<div class="box" style="margin-top:15px;">
				<div id="grailsLogo">
					<g:link controller="home" action="indexHome"><img src="${resource(dir:'images',file:'bl_logo.png')}" alt="Grails" border="0" /></g:link>
				</div>
				<center>									
					<g:layoutBody />
					<r:layoutResources/>
					<br/><br/><br/><br/>
				</center>
			</div>
		</div>
    </body>
</html>