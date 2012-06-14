package br.com.borgeslandeiro.intranet

public enum AppointmentType {

    VISITA_POS_OBRA(1,'Visita pós-obra'),
    VISITA_DE_MEDICAO(2,'Visita de medição'),
    AVALIACAO_DE_IMOVEL(3,'Avaliação de imóvel'),
    ATENDIMENTO(4,'Atendimento')

    final Integer id
    final String nome

    AppointmentType(Integer id, String nome) {
        this.id = id
        this.nome = nome
    }

    public static AppointmentType forNome(String text) {
        if (text != null) {
            for (AppointmentType r : AppointmentType.values()) {
                if (text.equalsIgnoreCase(r.nome)) {
                    return r;
                }
            }
        }
        return null;
    }

    String toString() {
        nome
    }
}