<%@ page import="br.com.borgeslandeiro.intranet.Appointment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="Agendamento" />
        <title>Agendar visita</title>
		<script>
			function closeWindow() {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserWrite");				
				window.open('','_self');
				window.close();
			}
		</script>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">Código:</td>
                            <td valign="top" class="value">${appointmentInstance?.id}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Serviço:</td>
                            <td valign="top" class="value">${appointmentInstance?.servico?.encodeAsHTML()}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Proprietário:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "cliente")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Empreendimento:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "empreendimento.nome")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Torre:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "torre")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Unidade:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "unidade")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Telefone:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "telefone")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "email")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Observações:</td>
                            <td valign="top" class="value">${fieldValue(bean: appointmentInstance, field: "observacoes")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">Data Prevista:</td>
                            <td valign="top" class="value"><g:formatDate date="${appointmentInstance?.dataPrevista}" format="dd/MM/yyyy"/></td>
                        </tr>						
                    </tbody>
                </table>
				<br/><br/>
				<center><a href="http://www.borgeslandeiro.com.br" class="btn01" target="_self">Fechar</a></center>
            </div>
        </div>
    </body>
</html>
