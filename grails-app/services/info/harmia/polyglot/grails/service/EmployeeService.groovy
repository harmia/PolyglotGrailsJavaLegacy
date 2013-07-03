package info.harmia.polyglot.grails.service

import grails.converters.JSON
import info.harmia.polyglot.springapp.mvc.core.model.Department
import info.harmia.polyglot.springapp.mvc.core.model.Employee
import info.harmia.polyglot.springapp.mvc.core.model.Municipality
import org.springframework.transaction.annotation.Transactional

@Transactional
class EmployeeService {

    @Transactional(readOnly = true)
    def listEmployees() {
        Employee.list()
    }

    @Transactional(readOnly = true)
    def getEmployee(Long EmployeeId) {
        Employee.get(EmployeeId)
    }

    def addEmployee(EmployeeForm employeeForm) {
        def department = Department.get(employeeForm.getDepartmentId())
        def municipality = Municipality.get(employeeForm.getMunicipalityId())
        def employee = new Employee(firstName: employeeForm.getFirstName(), lastName: employeeForm.getLastName(), email: employeeForm.getEmail(), contractBeginDate: employeeForm.getContractBeginDate(), department: department, municipality: municipality)
        department.addToEmployees(employee)
        employee.save()
    }

    def deleteEmployee(Long EmployeeId) {
        def employee = Employee.get(EmployeeId)
        def department = employee.getDepartment()
        department.removeFromEmployees(employee)
        employee.delete()
        true
    }

    def changeDepartment(Long employeeId, Long departmentId) {
        def employee = Employee.get(employeeId)
        def oldDepartment = employee.getDepartment()
        oldDepartment.removeFromEmployees(employee)
        def newDepartment = Department.get(departmentId)
        newDepartment.addToEmployees(employee)
        employee.setDepartment(newDepartment)
        true
    }

    @Transactional(readOnly = true)
    def listEmployeesJson() {
        Employee.list() as JSON
    }
}
