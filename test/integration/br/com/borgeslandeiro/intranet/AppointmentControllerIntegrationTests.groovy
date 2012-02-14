package br.com.borgeslandeiro.intranet

import org.junit.Before
import org.junit.Test
import grails.test.GrailsUnitTestCase

class AppointmentControllerIntegrationTests extends GrailsUnitTestCase {

    @Before void before() {
        def user1 = new SecUser(password: '123456', email: 'user1@teste.com', nome: 'user1').save(flush: true, failOnError: true)
        def user2 = new SecUser(password: '123456', email: 'user2@teste.com', nome: 'user2').save(flush: true, failOnError: true)
        new SecUser(password: '123456', email: 'user3@teste.com', nome: 'user3').save(flush: true, failOnError: true)

        def buenaVista = new Building(nome: 'Buena Vista', responsavel: user1).save(flush: true, failOnError: true)
        def belaResidence = new Building(nome: 'Bela Residence', responsavel: user1, torres: ['A','B']).save(flush: true, failOnError: true)
        def caimi = new Building(nome: 'Caimi', responsavel: user2).save(flush: true, failOnError: true)
        def helsinki = new Building(nome: 'Helsinki', responsavel: user2, torres: ['1','2']).save(flush: true, failOnError: true)

        new Appointment(cliente: 'João', dataPrevista: new GregorianCalendar(2012, Calendar.JANUARY, 22).time,
                email: 'joao@a.com.br', empreendimento: buenaVista, fase: AppointmentPhase.SOLICITADO,
                telefone: '111', unidade: '101').save(flush: true, failOnError: true)
        new Appointment(cliente: 'José', dataPrevista: new GregorianCalendar(2012, Calendar.JANUARY, 30).time,
                email: 'jose@a.com.br', empreendimento: buenaVista, fase: AppointmentPhase.SOLICITADO,
                telefone: '222', unidade: '102', torre: '2').save(flush: true, failOnError: true)
        new Appointment(cliente: 'Carlos', dataPrevista: new GregorianCalendar(2012, Calendar.JANUARY, 25).time,
                email: 'carlos@a.com.br', empreendimento: buenaVista, fase: AppointmentPhase.CONFIRMADO,
                telefone: '666', unidade: '103').save(flush: true, failOnError: true)
        new Appointment(cliente: 'Adao', dataPrevista: new GregorianCalendar(2012, Calendar.JANUARY, 26).time,
                email: 'adao@a.com.br', empreendimento: buenaVista, fase: AppointmentPhase.RESOLVIDO,
                telefone: '777', unidade: '104').save(flush: true, failOnError: true)
        new Appointment(cliente: 'Maria', dataPrevista: new GregorianCalendar(2011, Calendar.DECEMBER, 1).time,
                email: 'maria@a.com.br', empreendimento: belaResidence, fase: AppointmentPhase.SOLICITADO,
                telefone: '333', unidade: '201', torre: 'A').save(flush: true, failOnError: true)
        new Appointment(cliente: 'Joana', dataPrevista: new GregorianCalendar(2011, Calendar.DECEMBER, 15).time,
                email: 'joana@a.com.br', empreendimento: belaResidence, fase: AppointmentPhase.SOLICITADO,
                telefone: '444', unidade: '202', torre: 'B').save(flush: true, failOnError: true)
        new Appointment(cliente: 'Pedro', dataPrevista: new GregorianCalendar(2011, Calendar.DECEMBER, 20).time,
                email: 'pedro@a.com.br', empreendimento: caimi, fase: AppointmentPhase.SOLICITADO,
                telefone: '555', unidade: '301').save(flush: true, failOnError: true)
    }

    @Test void index_action() {
        def c = new AppointmentController()
        c.index()
        assertEquals 200, c.response.status
        assertEquals '/appointment/agenda', c.response.redirectedUrl
    }

    @Test void agenda_action_user1_logado() {
        def c = new AppointmentController()
        c.session.user = SecUser.findByNome('user1')
        def result = c.agenda()

        assertEquals 3, result.fases.size()
        assertEquals 6, result.appointmentInstanceList.size()
        assertEquals 2, result.empreendimentos.size()
        assertEquals 'Bela Residence', result.empreendimentos.get(0).nome
        assertEquals 'Buena Vista', result.empreendimentos.get(1).nome
    }

    @Test void agenda_action_user2_logado() {
        def c = new AppointmentController()
        c.session.user = SecUser.findByNome('user2')
        def result = c.agenda()

        assertEquals 1, result.appointmentInstanceList.size()
        assertEquals 2, result.empreendimentos.size()
        assertEquals 'Caimi', result.empreendimentos.get(0).nome
        assertEquals 'Helsinki', result.empreendimentos.get(1).nome
    }

    @Test void agenda_action_user3_logado() {
        def c = new AppointmentController()
        c.session.user = SecUser.findByNome('user3')
        def result = c.agenda()

        assertEquals 0, result.appointmentInstanceList.size()
        assertEquals 0, result.empreendimentos.size()
    }

    @Test void agenda_action_user1_logado_filtro_empreend_bela_residence() {
        def c = new AppointmentController()
        c.session.user = SecUser.findByNome('user1')
        c.params.empreendimento = Building.findByNome('Bela Residence').id
        def result = c.agenda()

        assertEquals 2, result.appointmentInstanceList.size()
        assertEquals 'Bela Residence', result.appointmentInstanceList.get(0).empreendimento.nome
    }

    @Test void agenda_action_user1_logado_filtro_fase_solicitado() {
        def c = new AppointmentController()
        c.session.user = SecUser.findByNome('user1')
        c.params.fase = AppointmentPhase.SOLICITADO.nome
        def result = c.agenda()

        assertEquals 4, result.appointmentInstanceList.size()
        assertEquals AppointmentPhase.SOLICITADO, result.appointmentInstanceList.get(0).fase
    }

    @Test void agenda_action_user1_logado_filtro_fase_confirmado() {
        def c = new AppointmentController()
        c.session.user = SecUser.findByNome('user1')
        c.params.fase = AppointmentPhase.CONFIRMADO.nome
        def result = c.agenda()

        assertEquals 1, result.appointmentInstanceList.size()
        assertEquals AppointmentPhase.CONFIRMADO, result.appointmentInstanceList.get(0).fase
    }

    @Test void agenda_action_user1_logado_filtro_fase_resolvido() {
        def c = new AppointmentController()
        c.session.user = SecUser.findByNome('user1')
        c.params.fase = AppointmentPhase.RESOLVIDO.nome
        def result = c.agenda()

        assertEquals 1, result.appointmentInstanceList.size()
        assertEquals AppointmentPhase.RESOLVIDO, result.appointmentInstanceList.get(0).fase
    }

    @Test void confirmar_agendamento_joao() {
        def appointment = Appointment.findByCliente('João')
        assertEquals AppointmentPhase.SOLICITADO, appointment.fase

        def c = new AppointmentController()
        c.params.id = appointment.id
        c.confirmar()

        appointment = Appointment.findByCliente('João').fase
        assertEquals AppointmentPhase.CONFIRMADO, appointment
    }

    @Test void resolver_agendamento_joao() {
        def appointment = Appointment.findByCliente('João')
        assertEquals AppointmentPhase.SOLICITADO, appointment.fase

        def c = new AppointmentController()
        c.params.id = appointment.id
        c.resolver()

        appointment = Appointment.findByCliente('João').fase
        assertEquals AppointmentPhase.RESOLVIDO, appointment
    }

    @Test void create_open() {
        def c = new AppointmentController()
        def result = c.createOpen()
        assertNotNull result.appointmentInstance
    }

    @Test void save_open_com_email() {
        def mailerService = new MailerService() {
            def emailEnviado = false
            def enviarEmail (Appointment app){
                emailEnviado = true
            }
        }

        def c = new AppointmentController()
        c.blandeiroMailerService = mailerService
        c.params.cliente = 'Teste'
        c.params.email = 'teste@teste.com.br'
        c.params.unidade = '201'
        c.params.telefone = '43214321'
        c.params.put 'dataPrevista_year', '2013'
        c.params.put 'dataPrevista_month', '12'
        c.params.put 'dataPrevista_day', '30'
        c.params.put 'empreendimento.id', Building.findByNome('Caimi').id
        c.saveOpen()

        assertTrue mailerService.emailEnviado
    }

    @Test void save_open_sem_email() {
        def mailerService = new MailerService() {
            def emailEnviado = false
            def enviarEmail (Appointment app){
                emailEnviado = true
            }
        }

        def c = new AppointmentController()
        c.blandeiroMailerService = mailerService
        c.params.cliente = 'Teste'
        c.params.email = null
        c.params.unidade = '201'
        c.params.telefone = '43214321'
        c.params.put 'dataPrevista_year', '2013'
        c.params.put 'dataPrevista_month', '12'
        c.params.put 'dataPrevista_day', '30'
        c.params.put 'empreendimento.id', Building.findByNome('Caimi').id
        c.saveOpen()

        assertFalse mailerService.emailEnviado
    }

    @Test void show_open() {
        def c = new AppointmentController()
        c.params.id = Appointment.findByCliente('João').id
        def result = c.showOpen()
        assertNotNull result
    }
}
