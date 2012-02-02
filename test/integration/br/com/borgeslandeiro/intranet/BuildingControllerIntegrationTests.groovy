package br.com.borgeslandeiro.intranet

import org.junit.Before
import org.junit.Test
import grails.converters.JSON

class BuildingControllerIntegrationTests extends GroovyTestCase {

    @Before void before() {
        new SecUser(password: '123456', email: 'teste@teste.com', nome: 'Teste').save(flush: true, failOnError: true)
    }

    @Test void index_action() {
        def c = new BuildingController()
        c.index()
        assertEquals 200, c.response.status
    }

    @Test void create_building_with_success() {
        def c = new BuildingController()
        c.params.nome = "Buena Vista"
        c.params.put("responsavel.id", SecUser.findByEmail('teste@teste.com').id)
        c.save()

        assertEquals 200, c.response.status

        def building = Building.findByNome('Buena Vista')
        assertNotNull building
        assertEquals 'Teste', building.responsavel.nome
    }

    @Test void create_building_with_torres_with_success() {
        def c = new BuildingController()
        c.params.nome = "Helsinki"
        c.params.put("responsavel.id", SecUser.findByEmail('teste@teste.com').id)
        c.params.put('torres', ['primeira', 'segunda'])
        c.save()

        assertEquals 200, c.response.status

        def building = Building.findByNome('Helsinki')
        assertNotNull building
        assertEquals 'Teste', building.responsavel.nome
        assertEquals 2, building.torres.size()
    }
    
    @Test void list_building_with_torres_A_B_json() {
        def responsavel = SecUser.findByEmail('teste@teste.com')
        def b = new Building(nome: 'Teste', responsavel: responsavel, torres: ['B','A']).save(flush: true, failOnError: true)

        def c = new BuildingController()
        c.params.id = b.id
        c.listTorres()

        def json = JSON.parse(c.response.contentAsString)
        assertEquals "application/json;charset=UTF-8", c.response.contentType
        assertEquals 2, json.size()
        assertEquals 'A', json.get(0)
        assertEquals 'B', json.get(1)
    }

    @Test void list_building_without_torres_json() {
        def responsavel = SecUser.findByEmail('teste@teste.com')
        def b = new Building(nome: 'Teste', responsavel: responsavel).save(flush: true, failOnError: true)

        def c = new BuildingController()
        c.params.id = b.id
        c.listTorres()

        def json = JSON.parse(c.response.contentAsString)
        assertEquals "application/json;charset=UTF-8", c.response.contentType
        assertEquals 0, json.size()
    }
}
