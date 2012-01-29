package br.com.borgeslandeiro.intranet

import grails.test.GrailsUnitTestCase
import org.junit.Test

class SecUserIntegrationTests extends GrailsUnitTestCase {

    @Test void insert_encoding_password_123456() {
        def d = new SecUser(password: '123456', email: 'teste@teste.com', nome: 'Teste').save(flush: true, failOnError: true)
        assertEquals '123456'.encodeAsSHA256(), d.password
    }

    @Test void update_encoding_password_123456() {
        def d = new SecUser(password: '123456', email: 'teste@teste.com', nome: 'Teste').save(flush: true, failOnError: true)
        assertEquals '123456'.encodeAsSHA256(), d.password
        
        d.password = '123456'
        d.save(flush: true, failOnError: true)
        assertEquals '123456'.encodeAsSHA256(), d.password
    }
}
