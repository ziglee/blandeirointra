package br.com.borgeslandeiro.intranet

public enum AppointmentType {

    ENTREGA(1,'Entrega'),
    MEDICAO(2,'Medição')

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