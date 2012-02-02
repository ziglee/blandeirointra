package br.com.borgeslandeiro.intranet

public enum AppointmentPhase {

    SOLICITADO('Solicitado'),
    CONFIRMADO('Confirmado'),
    RESOLVIDO('Resolvido')

    final String nome

    AppointmentPhase(String nome) {
        this.nome = nome
    }

    public static AppointmentPhase forNome(String text) {
        if (text != null) {
            for (AppointmentPhase r : AppointmentPhase.values()) {
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