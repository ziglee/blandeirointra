package br.com.borgeslandeiro.intranet

class BlandeiroMailerService implements MailerService {

    static transactional = true

    def mailService

    def notificarResponsavel(Appointment appointment) {
        mailService.sendMail {
            to appointment.empreendimento.responsavel.email
            from "dev@smartfingers.com.br"
            subject "Borges Landeiro - Agendamento de visita"
            html "Novo agendamento: ${appointment}"
        }
    }

    def notificarCliente(Appointment appointment) {
        mailService.sendMail {
            to appointment.email
            from "dev@smartfingers.com.br"
            subject "Borges Landeiro - Confirmação de agendamento"
            html "Agendamento confirmado: ${appointment}"
        }
    }
}
