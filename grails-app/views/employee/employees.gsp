<%--
  Created by IntelliJ IDEA.
  User: harmia
  Date: 15.5.2013
  Time: 14:45
  Copyright (C) 2013 Juhana "harmia" Harmanen
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="activePage" content="EMPLOYEES"/>
    <title><g:message code="employees.title"/></title>
    <meta name="layout" content="main">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <g:if test="${!departments.empty}">
                <g:form method="post" controller="employee" action="add" class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label" id="firstName"><g:message code="employees.form.firstName"/></label>
                        <div class="controls">
                            <g:textField name="firstName" value="${employee?.firstName}"  id="checkNames"/>
                            <g:hasErrors bean="${employee}" field="firstName">
                                <span class="alert alert-error"><g:fieldError field="firstName" bean="${employee}"/></span>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" id="lastName"><g:message code="employees.form.lastName"/></label>
                        <div class="controls">
                            <g:textField name="lastName" value="${employee?.lastName}"/>
                            <g:hasErrors bean="${employee}" field="lastName">
                                <span class="alert alert-error"><g:fieldError field="lastName" bean="${employee}"/></span>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" name="email"><g:message code="employees.form.email"/></label>
                        <div class="controls">
                            <g:textField name="email" value="${employee?.email}"/>
                            <g:hasErrors bean="${employee}" field="email">
                                <span class="alert alert-error"><g:fieldError field="email" bean="${employee}"/></span>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" name="departmentId"><g:message code="employees.form.department"/></label>
                        <div class="controls">
                            <g:select name="departmentId" value="${employee?.departmentId}" from="${departments}" optionKey="id" optionValue="name"/>
                            <g:hasErrors bean="${employee}" field="departmentId">
                                <span class="alert alert-error"><g:fieldError field="departmentId" bean="${employee}"/></span>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" name="contractBeginDate"><g:message code="employees.form.contractBeginDate"/></label>
                        <div class="controls">
                            <g:textField name="contractBeginDate" value="${joda.format(value: employee?.contractBeginDate, style: "S-" )}" id="datepicker" readonly="true"/>
                            <g:hasErrors bean="${employee}" field="contractBeginDate">
                                <span class="alert alert-error"><g:fieldError field="contractBeginDate" bean="${employee}"/></span>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" name="municipalityId"><g:message code="employees.form.municipalityId"/></label>
                        <div class="controls">
                            <g:textField name="municipalityName" value="${employee?.municipalityName}" id="checkMunicipalities"/>
                            <g:hasErrors bean="${employee}" field="municipalityName">
                                <span class="alert alert-error"><g:fieldError field="municipalityName" bean="${employee}"/></span>
                            </g:hasErrors>
                            <g:hasErrors bean="${employee}" field="municipalityId">
                                <span class="alert alert-error"><g:fieldError field="municipalityId" bean="${employee}"/></span>
                            </g:hasErrors>
                            <g:hiddenField name="municipalityId" value="${employee?.municipalityId}" class="hidden"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button class="btn btn-primary"><g:message code="employees.form.submit"/></button>
                        </div>
                    </div>
                </g:form>

                <g:if test="${!employees.empty}">
                    <h3><g:message code="employees.title"/></h3>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th><g:message code="employees.table.id"/></th>
                            <th><g:message code="employees.table.name"/></th>
                            <th><g:message code="employees.table.email"/></th>
                            <th><g:message code="employees.table.department"/></th>
                            <th><g:message code="employees.table.contractBeginDate"/></th>
                            <th><g:message code="employees.table.municipality"/></th>
                            <th><g:message code="common.nbsp"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${employees}" var="employee">
                            <tr>
                                <td>${employee?.id}</td>
                                <td>${employee?.lastName}, ${employee?.firstName}</td>
                                <td>${employee?.email}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                            ${employee?.department.name}
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <g:each in="${departments}" var="department">
                                                <li>
                                                    <a onclick="$(this).find('form').submit()">
                                                        ${department?.name}
                                                        <g:form method="post" controller="employee" action="changeDepartment" params="[employeeId: employee?.id, departmentId: department?.id]" class="hidden">
                                                            <button class="btn btn-primary hidden"><g:message code="common.change"/></button>
                                                        </g:form>
                                                    </a>
                                                </li>
                                            </g:each>
                                        </ul>
                                    </div>
                                </td>
                                <td><joda:format value="${employee?.contractBeginDate}"/></td>
                                <td>${employee?.municipality.name}</td>
                                <td>
                                    <g:form method="post" controller="employee" action="delete" params="[employeeId: employee?.id]">
                                        <a href="#deleteModal${employee?.id}" role="button" class="btn btn-danger btn-mini" data-toggle="modal"><g:message code="common.delete"/></a>
                                        <div id="deleteModal${employee?.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                            <div class="modal-header">
                                                <h3 id="deleteModalLabel"><g:message code="employees.modal.header" args="[employee?.lastName, employee?.firstName]"/></h3>
                                            </div>
                                            <div class="modal-body">
                                                <p><g:message code="employees.modal.body" args="[employee?.lastName, employee?.firstName]"/></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn" data-dismiss="modal" aria-hidden="true"><g:message code="common.close"/></button>
                                                <button class="btn btn-primary"><g:message code="common.saveChanges"/></button>
                                            </div>
                                        </div>
                                    </g:form>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </g:if>
            </g:if>
        </div>
    </div>
</div>
</body>
</html>