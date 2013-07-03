package info.harmia.polyglot.grails.controller

class MunicipalityController {

    static allowedMethods = [checkMunicipalitiesJson: "GET"]

    def municipalityService

    def checkMunicipalitiesJson(String term) {
        render municipalityService.checkMunicipalitiesJson(term)
    }

    def listMunicipalitiesJson() {
        render municipalityService.listMunicipalitiesJson()
    }
}
