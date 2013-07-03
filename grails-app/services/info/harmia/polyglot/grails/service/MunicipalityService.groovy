package info.harmia.polyglot.grails.service

import grails.converters.JSON
import info.harmia.polyglot.springapp.mvc.core.model.Municipality
import org.springframework.transaction.annotation.Transactional

@Transactional
class MunicipalityService {

    @Transactional(readOnly = true)
    def listMunicipalities() {
        Municipality.list()
    }

    @Transactional(readOnly = true)
    def getMunicipality(Long municipalityId) {
        Municipality.get(municipalityId)
    }

    @Transactional(readOnly = true)
    def checkMunicipalitiesJson(String term) {
        Municipality.findAllByNameLike("$term%") as JSON
    }

    @Transactional(readOnly = true)
    def listMunicipalitiesJson() {
        Municipality.list() as JSON
    }
}
