package info.harmia.polyglot.grails.controller
import info.harmia.polyglot.grails.service.DepartmentForm

class DepartmentController {

    static allowedMethods = [index: "GET", departments: "GET", add: "POST", delete: "POST"]

    def departmentService

    def index() {
        redirect action: "departments"
    }

    def departments() {
        [departments: departmentService.listDepartments()]
    }

    def add(DepartmentForm departmentForm) {
        if (departmentForm.hasErrors()) {
            flash.error = message code: "departments.add.error", args: [departmentForm.name]
            chain action: "departments", model: [department: departmentForm]
            return
        }
        departmentService.addDepartment(departmentForm)
        flash.success = message code: "departments.add.success", args: [departmentForm.name]
        redirect action: "departments"
    }

    def delete(Long departmentId) {
        if (departmentService.deleteDepartment(departmentId)) {
            flash.success = message code: "departments.delete.success", args: [departmentId]
        } else {
            flash.error = message code: "departments.delete.error", args: [departmentId]
            flash.info = message code: "departments.delete.info"
        }
        redirect action: "departments"
    }

    def listDepartmentsJson() {
        render departmentService.listDepartmentsJson()
    }


}
