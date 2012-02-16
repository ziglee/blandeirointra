package br.com.borgeslandeiro.intranet

public interface MailerService {
    def notificarResponsavel(Appointment appointment)
    def notificarCliente(Appointment appointment)
}