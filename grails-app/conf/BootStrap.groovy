import grails.converters.JSON
import info.harmia.polyglot.springapp.mvc.core.model.Municipality

class BootStrap {

    def init = { servletContext ->
        // Check whether the test data already exists.
        if (!Municipality.count()) {
            def json = JSON.parse(new FileInputStream("web-app/data/data.json"), "UTF-8")

            json.each() {object ->
                def municipality = new Municipality(name: object.getAt("name"))
                municipality.save()
            }
        }
    }
    def destroy = {
    }
}
