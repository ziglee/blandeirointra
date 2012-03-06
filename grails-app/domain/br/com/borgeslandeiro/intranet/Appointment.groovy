package br.com.borgeslandeiro.intranet

class Appointment {
    
    String cliente
    Building empreendimento
    String torre
    String unidade
    String telefone
    Date dataPrevista
    String email
    String observacoes
    AppointmentPhase fase
    AppointmentType servico

    static constraints = {
        empreendimento nullable: false
        cliente blank: false, nullable: false, maxSize: 100
        unidade blank: false, nullable: false, maxSize: 30
        telefone blank: false, nullable: false, maxSize: 30
        observacoes nullable: true, blank: true, maxSize: 1000
        email nullable: true, blank: true, maxSize: 50
        torre nullable: true, blank: true, maxSize: 50
    }

    String toString(){
        return "${empreendimento.nome} ${unidade} - ${cliente}"
    }

    static mapping = {
        sort "dataPrevista"
    }
}
