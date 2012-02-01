package br.com.borgeslandeiro.intranet;

class Building {

    String nome
    SecUser responsavel
    static hasMany = [torres: String]

    static constraints = {
        nome blank: false, nullable: false, maxSize: 100, unique: true
    }

    String toString(){
        nome
    }
}
