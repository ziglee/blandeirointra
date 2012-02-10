import grails.util.GrailsUtil
import br.com.borgeslandeiro.intranet.SecUser

class BootStrap {

    def init = { servletContext ->
        initData()

        switch(GrailsUtil.environment){
            case "development":
                break;
            case "test":
                break
            case "production":
                break
        }
    }

    def destroy = {
    }

    def initData() {
        def admin = SecUser.findByEmail("admin@blandeiro.com.br") ?: new SecUser(nome: 'Admin', email: 'admin@blandeiro.com.br', password: "123456")
        admin.save(flush: true, failOnError: true)
    }
}
