<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:javascript library="jquery" plugin="jquery"/>
        <g:javascript library="application" />
        <g:layoutHead />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo">
            <g:link controller="home" action="indexHome"><img src="${resource(dir:'images',file:'bl_logo.png')}" alt="Grails" border="0" /></g:link>
        </div>
        <g:layoutBody />
    </body>
</html>