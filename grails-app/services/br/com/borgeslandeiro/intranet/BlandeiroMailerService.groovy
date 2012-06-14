package br.com.borgeslandeiro.intranet

class BlandeiroMailerService implements MailerService {

    static transactional = true

    def mailService

    def notificarResponsavel(Appointment appointment) {
        mailService.sendMail {
            def texto = "<h1>Novo agendamento</h1>Empreendimento: ${appointment.empreendimento.nome}<br/>Unidade: ${appointment.unidade}<br/>Torre: ${appointment.torre}<br/>Cliente: ${appointment.cliente}<br/>E-mail: ${appointment.email}<br/>Serviço: ${appointment.servico.nome}<br/>Telefone: ${appointment.telefone}"

            if (appointment.observacoes)
                texto += "<br/>Observações: <pre>${appointment.observacoes}</pre>"

            to appointment.empreendimento.responsavel.email
            from "dev@smartfingers.com.br"
            subject "Borges Landeiro - Agendamento de visita"
            html texto
        }
    }

    def notificarCliente(Appointment appointment) {
        mailService.sendMail {
            to appointment.email
            from "dev@smartfingers.com.br"
            subject "Borges Landeiro - Confirmação de agendamento"
            html "Confirmamos seu agendamento do empreendimento '${appointment.empreendimento.nome}' para o dia ${appointment.dataPrevista.format('dd/MM/yyyy, HH:mm')}."
        }
    }
}
