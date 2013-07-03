package info.harmia.polyglot.grails.service

import grails.converters.JSON
import info.harmia.polyglot.springapp.mvc.core.model.Department
import org.springframework.transaction.annotation.Transactional

@Transactional
class DepartmentService {

    @Transactional(readOnly = true)
    def listDepartments() {
        Department.list()
    }

    @Transactional(readOnly = true)
    def getDepartment(Long departmentId) {
        Department.get(departmentId)
    }

    def addDepartment(DepartmentForm departmentCommand) {
        def department = new Department(name: departmentCommand.getName())
        department.save()
    }

    def deleteDepartment(Long departmentId) {
        def department = Department.get(departmentId)
        if (department.getEmployees().isEmpty()) {
            department.delete()
            true
        } else {
            false
        }
    }

    @Transactional(readOnly = true)
    def listDepartmentsJson() {
        Department.list() as JSON
    }
}
