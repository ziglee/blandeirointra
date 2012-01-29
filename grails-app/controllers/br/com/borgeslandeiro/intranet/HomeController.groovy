package br.com.borgeslandeiro.intranet

class HomeController {

    def indexHome = { }

    def login = {}

    def logout = {
        flash.message = "Tchau ${session.user.nome}!"
        session.user = null
        redirect(action: "login")
    }

    def authenticate = {
        def user = SecUser.findByEmailAndPassword(params.email, params.password.encodeAsSHA256())
        if (user) {
            session.user = user
            flash.message = "Olá ${user.nome}!"
            redirect(controller: 'home', action: 'indexHome')
        } else {
            flash.message = "Email ou senha inválidos. Favor tente novamente."
            redirect(action: "login")
        }
    }
}
