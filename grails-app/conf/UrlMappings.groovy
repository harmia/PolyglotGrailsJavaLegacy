class UrlMappings {

    static mappings = {
        "/departments"(controller: "department", action: "departments", view: "department/departments")
        "/departments/add"(controller: "department", action: "add", view: "department/departments")
        "/departments/delete/$departmentId?"(controller: "department", action: "delete", view: "department/departments")

        "/employees"(controller: "employee", action: "employees", view: "employee/employees")
        "/employees/add"(controller: "employee", action: "add", view: "employee/employees")
        "/employees/delete/$employeeId?"(controller: "employee", action: "delete", view: "employee/employees")
        "/employees/change/$employeeId?/$departmentId?"(controller: "employee", action: "changeDepartment", view: "employee/employees")

        "/api/employees/"(controller: "employee", action: "listEmployeesJson")
        "/api/departments/"(controller: "department", action: "listDepartmentsJson")
        "/api/municipalities/"(controller: "municipality", action: "listMunicipalitiesJson")
        "/api/municipalities/$term?"(controller: "municipality", action: "checkMunicipalitiesJson")

        "/"(controller: "overview", action: "overview", view:"overview")
        "500"(view:'/error')
    }
}
