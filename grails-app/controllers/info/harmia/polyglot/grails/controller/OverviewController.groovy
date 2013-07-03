package info.harmia.polyglot.grails.controller

class OverviewController {

    static allowedMethods = [index: "GET", overview: "GET"]

    def employeeService

    def departmentService

    def index() {
        redirect action: "overview"
    }

    def overview() {
        def employees = employeeService.listEmployees()
        def departments = departmentService.listDepartments()
        if (departments.isEmpty()) {
            flash.info = message code: "overview.empty.departments"
        } else if (employees.isEmpty()) {
            flash.info = message code: "overview.empty.employees"
        }
        [employees: employees, departments: departments]
    }
}
