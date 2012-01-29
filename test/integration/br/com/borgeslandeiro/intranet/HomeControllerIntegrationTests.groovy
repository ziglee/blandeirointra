package br.com.borgeslandeiro.intranet

import org.junit.Test
import org.junit.Before

class HomeControllerIntegrationTests extends GroovyTestCase {

    @Test void indexHome_action() {
        def c = new HomeController()
        c.indexHome()
        assertEquals 200, c.response.status
    }

    @Before void before() {
        new SecUser(password: '123456', email: 'teste@teste.com', nome: 'Teste').save(flush: true, failOnError: true)
    }

    @Test void login_action() {
        def c = new HomeController()
        c.login()
        assertEquals 200, c.response.status
    }

    @Test void authentication_successfull() {
        def c = new HomeController()
        c.params.email = 'teste@teste.com'
        c.params.password = '123456'
        c.authenticate()
        assertNotNull c.session.user
        assertEquals 'teste@teste.com', c.session.user.email
        assertEquals "Olá Teste!", c.flash.message
        assertEquals "/", c.response.redirectedUrl
    }

    @Test void authentication_failed() {
        def c = new HomeController()
        c.params.email = 'nonexistteste@teste.com'
        c.params.password = '-'
        c.authenticate()
        assertNull c.session.user
        assertEquals "Email ou senha inválidos. Favor tente novamente.", c.flash.message
        assertEquals "/home/login", c.response.redirectedUrl
    }

    @Test void logout_successfull() {
        def c = new HomeController()
        c.session.user = new SecUser(nome: 'Teste')
        c.logout()
        assertNull c.session.user
        assertEquals "Tchau Teste!", c.flash.message
        assertEquals "/home/login", c.response.redirectedUrl
    }
}
