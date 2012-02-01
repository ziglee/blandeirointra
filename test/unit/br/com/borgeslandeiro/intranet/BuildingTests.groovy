package br.com.borgeslandeiro.intranet

import grails.test.GrailsUnitTestCase
import org.junit.Test

class BuildingTests extends GrailsUnitTestCase {

    protected void setUp() {
        super.setUp()
        mockForConstraintsTests(Building)
    }

    protected void tearDown() {
        super.tearDown()
    }

    @Test void detects_nullable_constraints() {
        def d = new Building()
        assertFalse d.validate()
        assertEquals "nullable", d.errors['responsavel']
        assertEquals "nullable", d.errors['nome']
    }

    @Test void detects_blank_constraints() {
        def d = new Building(nome: '')
        assertFalse d.validate()
        assertEquals "blank", d.errors['nome']
    }

    @Test void to_string_writes_nome() {
        def d = new Building(nome: 'Bela Vista Residence')
        assertEquals 'Bela Vista Residence', d.nome
    }
}
