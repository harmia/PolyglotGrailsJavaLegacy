package info.harmia.polyglot.grails.service
import grails.validation.Validateable
import info.harmia.polyglot.springapp.mvc.core.model.Employee
import org.joda.time.LocalDate
/**
 * Created with IntelliJ IDEA.
 * User: harmia
 * Date: 18.5.2013
 * Time: 14:19
 * Copyright (C) 2013 Juhana "harmia" Harmanen
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
@Validateable
class EmployeeForm {
    String firstName
    String lastName
    String email
    LocalDate contractBeginDate
    Long departmentId
    String municipalityName
    Long municipalityId

    static constraints = {
        importFrom Employee
        departmentId nullable: false
        municipalityId nullable: false
        municipalityName blank: false, minSize: 1, maxSize: 255
    }
}