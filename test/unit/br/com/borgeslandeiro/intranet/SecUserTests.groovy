package br.com.borgeslandeiro.intranet

import grails.test.GrailsUnitTestCase
import org.junit.Test

class SecUserTests extends GrailsUnitTestCase {

    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(SecUser)
    }

    protected void tearDown() {
        super.tearDown()
    }

    @Test void detects_nullable_constraints() {
        def d = new SecUser()
        assertFalse d.validate()
        assertEquals "nullable", d.errors['password']
        assertEquals "nullable", d.errors['email']
        assertEquals "nullable", d.errors['nome']
    }

    @Test void detects_blank_constraints() {
        def d = new SecUser(password: '', email: '', nome: '')
        assertFalse d.validate()
        assertEquals "blank", d.errors['password']
        assertEquals "blank", d.errors['email']
        assertEquals "blank", d.errors['nome']
    }

    @Test void detects_email_constraints() {
        def d = new SecUser(email: 'aaaa')
        assertFalse d.validate()
        assertEquals "email", d.errors['email']

        d = new SecUser(email: 'aaaa@gmail.com')
        d.validate()
        assertNull d.errors['email']
    }

    @Test void to_string_writes_email() {
        def d = new SecUser(email: 'aaaa@gmail.com')
        assertEquals 'aaaa@gmail.com', d.email
    }
}
