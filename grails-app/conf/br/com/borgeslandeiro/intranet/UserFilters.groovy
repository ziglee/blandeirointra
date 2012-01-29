package br.com.borgeslandeiro.intranet

class UserFilters {
    def filters = {
        loggedInOnly(controller: 'home', invert: true) {
            before = {
                if (!session.user) {
                    redirect(controller: "home", action: "login")
                    return false
                }
            }
        }
    }
}
