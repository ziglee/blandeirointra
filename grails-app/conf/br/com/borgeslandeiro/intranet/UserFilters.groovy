package br.com.borgeslandeiro.intranet

class UserFilters {
    def filters = {
        loggedInOnly(controller: 'home', invert: true) {
            before = {
                if(controllerName && actionName){
                    if (controllerName.equals('appointment') && (actionName.equals('showOpen') || actionName.equals('createOpen') || actionName.equals('saveOpen')))
                        return true
                    if (controllerName.equals('building') && actionName.equals('listTorres'))
                        return true
                }

                if (!session.user) {
                    redirect(controller: "home", action: "login")
                    return false
                }
            }
        }
    }
}
