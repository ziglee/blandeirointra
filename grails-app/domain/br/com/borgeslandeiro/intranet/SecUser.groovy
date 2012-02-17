package br.com.borgeslandeiro.intranet;

class SecUser {

    String password
    String email
    String nome

    static constraints = {
        password blank: false, nullable: false, password: true, maxSize: 200
        email blank: false, nullable: false, email: true, unique: true, maxSize: 50
        nome blank: false, nullable: false, maxSize: 50
    }

    def beforeInsert = {
        password = password.encodeAsSHA256()
    }

    def beforeUpdate = {
        password = password.encodeAsSHA256()
    }

    String toString(){
        nome
    }

    static mapping = {
        sort "nome"
    }
}
