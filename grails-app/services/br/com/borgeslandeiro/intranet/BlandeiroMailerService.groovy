package br.com.borgeslandeiro.intranet

class BlandeiroMailerService {

    static transactional = true

    def mailService

    def enviarEmail(Appointment appointment) {
        mailService.sendMail {
            to appointment.email
            from "dev@smartfingers.com.br"
            subject "Borges Landeiro - Agendamento de visita"
            html 'this is some text'
        }
    }
}
