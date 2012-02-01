package br.com.borgeslandeiro.intranet

import grails.converters.JSON

class BuildingController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [buildingInstanceList: Building.list(params), buildingInstanceTotal: Building.count()]
    }

    def create = {
        def buildingInstance = new Building()
        buildingInstance.properties = params
        return [buildingInstance: buildingInstance]
    }

    def save = {
        def buildingInstance = new Building()
        buildingInstance.nome = params.nome
        buildingInstance.responsavel = SecUser.get(params.long('responsavel.id'))
        buildingInstance.torres = params.list('torres')

        if (buildingInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'building.label', default: 'Building'), buildingInstance.nome])}"
            redirect(action: "show", id: buildingInstance.id)
        }
        else {
            render(view: "create", model: [buildingInstance: buildingInstance])
        }
    }

    def show = {
        def buildingInstance = Building.get(params.id)
        if (!buildingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])}"
            redirect(action: "list")
        }
        else {
            [buildingInstance: buildingInstance]
        }
    }

    def edit = {
        def buildingInstance = Building.get(params.id)
        if (!buildingInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [buildingInstance: buildingInstance]
        }
    }

    def update = {
        def buildingInstance = Building.get(params.id)
        if (buildingInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (buildingInstance.version > version) {
                    
                    buildingInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'building.label', default: 'Building')] as Object[], "Another user has updated this Building while you were editing")
                    render(view: "edit", model: [buildingInstance: buildingInstance])
                    return
                }
            }

            buildingInstance.nome = params.nome
            buildingInstance.responsavel = SecUser.get(params.long('responsavel.id'))
            buildingInstance.torres = params.list('torres')

            if (!buildingInstance.hasErrors() && buildingInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'building.label', default: 'Building'), buildingInstance.nome])}"
                redirect(action: "show", id: buildingInstance.id)
            }
            else {
                render(view: "edit", model: [buildingInstance: buildingInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def buildingInstance = Building.get(params.id)
        if (buildingInstance) {
            def nome = buildingInstance.nome
            try {
                buildingInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'building.label', default: 'Building'), nome])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'building.label', default: 'Building'), nome])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'building.label', default: 'Building'), params.id])}"
            redirect(action: "list")
        }
    }

    def listTorres = {
        def building = Building.get(params.id)
        if (building)
            render building.torres as JSON
        else
            render new ArrayList<String>() as JSON
    }
}
