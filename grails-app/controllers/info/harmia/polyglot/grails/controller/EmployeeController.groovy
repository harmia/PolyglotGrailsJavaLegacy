package info.harmia.polyglot.grails.controller

import info.harmia.polyglot.grails.service.EmployeeForm

class EmployeeController {

    static allowedMethods = [index: "GET", employees: "GET", add: "POST", delete: "POST", changeDepartment: "POST"]

    def employeeService

    def departmentService

    def index() {
        redirect(action: "employees")
    }

    def employees() {
        def employees = employeeService.listEmployees()
        def departments = departmentService.listDepartments()
        if (departments.isEmpty()) {
            flash.info = message code: "employees.empty.departments"
        }
        [employees: employees, departments: departments]
    }

    def add(EmployeeForm employeeForm) {
        if (employeeForm.hasErrors()) {
            flash.error = message code: "employees.add.error", args: [employeeForm.getLastName(), employeeForm.getFirstName()]
            chain action: "employees", model: [employee: employeeForm]
            return
        }

        employeeService.addEmployee(employeeForm)
        flash.success = message code: "employees.add.success", args: [employeeForm.getLastName(), employeeForm.getFirstName()]
        redirect action: "employees"
    }

    def delete(Long employeeId) {
        if (employeeService.deleteEmployee(employeeId)) {
            flash.success = message code: "employees.delete.success", args: [employeeId]
        } else {
            flash.error = message code: "employees.delete.error", args: [employeeId]
        }
        redirect action: "employees"
    }

    def changeDepartment(Long employeeId, Long departmentId) {
        if (employeeService.changeDepartment(employeeId, departmentId)) {
            flash.success = message code: "employees.change.success", args: [employeeId, departmentId]
        } else {
            flash.error = message code: "employees.change.error", args: [employeeId, departmentId]
        }
        redirect action: "employees"
    }

    def listEmployeesJson() {
        render employeeService.listEmployeesJson()
    }
}
