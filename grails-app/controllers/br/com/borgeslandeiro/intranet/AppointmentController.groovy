package br.com.borgeslandeiro.intranet

class AppointmentController {

    def blandeiroMailerService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "agenda", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [appointmentInstanceList: Appointment.list(params), appointmentInstanceTotal: Appointment.count()]
    }

    def create = {
        def appointmentInstance = new Appointment()
        appointmentInstance.properties = params
        return [appointmentInstance: appointmentInstance]
    }

    def createOpen = {
        def appointmentInstance = new Appointment()
        appointmentInstance.properties = params
        return [appointmentInstance: appointmentInstance]
    }

    def save = {
        def appointmentInstance = new Appointment(params)
        if (appointmentInstance.save(flush: true)) {
            flash.message = "${message(code: 'appointment.created.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.cliente])}"
            redirect(action: "show", id: appointmentInstance.id)
        } else {
            render(view: "create", model: [appointmentInstance: appointmentInstance])
        }
    }

    def saveOpen = {
        def appointmentInstance = new Appointment(params)
        appointmentInstance.fase = AppointmentPhase.SOLICITADO
        if (appointmentInstance.save(flush: true)) {
            blandeiroMailerService.notificarResponsavel(appointmentInstance)
            flash.message = "${message(code: 'appointment.created.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.cliente])}"
            redirect(action: "showOpen", id: appointmentInstance.id)
        } else {
            render(view: "createOpen", model: [appointmentInstance: appointmentInstance])
        }
    }

    def show = {
        def appointmentInstance = Appointment.get(params.id)
        if (!appointmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
            redirect(action: "agenda")
        } else {
            [appointmentInstance: appointmentInstance]
        }
    }

    def showOpen = {
        [appointmentInstance: Appointment.get(params.id)]
    }

    def edit = {
        def appointmentInstance = Appointment.get(params.id)
        if (!appointmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
            redirect(action: "agenda")
        } else {
            return [appointmentInstance: appointmentInstance]
        }
    }

    def update = {
        def appointmentInstance = Appointment.get(params.id)
        if (appointmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (appointmentInstance.version > version) {
                    appointmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'appointment.label', default: 'Appointment')] as Object[], "Another user has updated this Appointment while you were editing")
                    render(view: "edit", model: [appointmentInstance: appointmentInstance])
                    return
                }
            }
            appointmentInstance.properties = params
            if (!appointmentInstance.hasErrors() && appointmentInstance.save(flush: true)) {
                flash.message = "${message(code: 'appointment.updated.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.cliente])}"
                redirect(action: "show", id: appointmentInstance.id)
            } else {
                render(view: "edit", model: [appointmentInstance: appointmentInstance])
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
            redirect(action: "agenda")
        }
    }

    def delete = {
        def appointmentInstance = Appointment.get(params.id)
        if (appointmentInstance) {
            def cliente = appointmentInstance.cliente
            try {
                appointmentInstance.delete(flush: true)
                flash.message = "${message(code: 'appointment.deleted.message', args: [message(code: 'appointment.label', default: 'Appointment'), cliente])}"
                redirect(action: "agenda")
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
            redirect(action: "agenda")
        }
    }

    def agenda = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

        def hqlParams = ['responsavelId' : session.user.id]
        def hql = 'select a from Appointment as a where a.empreendimento.responsavel.id = :responsavelId'

        if (params.empreendimento) {
            hql += " and a.empreendimento.id = :empreendimento"
            hqlParams.put 'empreendimento', params.long('empreendimento')
        }

        if (params.fase) {
            hql += " and a.fase = :fase"
            hqlParams.put 'fase', AppointmentPhase.forNome(params.fase)
        }

        if (params.sort) {
            hql += " order by ${params.sort} "
        } else {
            hql += " order by a.empreendimento.nome "
        }

        if (params.order)
            hql += params.order

        def lista = Appointment.executeQuery(hql, hqlParams, params)
        def count = Appointment.executeQuery(hql, hqlParams).size()

        def empreendimentos = Building.findAllByResponsavel(session.user).sort{it.nome}
        def fases = AppointmentPhase.values()

        [appointmentInstanceList: lista, appointmentInstanceTotal: count, empreendimentos: empreendimentos, fases: fases]
    }

    def confirmar = {
        def appointmentInstance = Appointment.get(params.id)
        if (appointmentInstance) {
            try {
                appointmentInstance.fase = AppointmentPhase.CONFIRMADO
                appointmentInstance.save(flush: true)

                if (appointmentInstance.email)
                    blandeiroMailerService.notificarCliente(appointmentInstance)

                flash.message = "${message(code: 'appointment.confirmed.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.cliente])}"
                redirect(action: "agenda")
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'appointment.not.confirmed.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
            redirect(action: "agenda")
        }
    }

    def resolver = {
        def appointmentInstance = Appointment.get(params.id)
        if (appointmentInstance) {
            try {
                appointmentInstance.fase = AppointmentPhase.RESOLVIDO
                appointmentInstance.save(flush: true)
                flash.message = "${message(code: 'appointment.resolved.message', args: [message(code: 'appointment.label', default: 'Appointment'), appointmentInstance.cliente])}"
                redirect(action: "agenda")
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'appointment.not.resolved.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'appointment.label', default: 'Appointment'), params.id])}"
            redirect(action: "agenda")
        }
    }
}
