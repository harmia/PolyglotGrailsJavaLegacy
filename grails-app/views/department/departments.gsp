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
    <meta name="activePage" content="DEPARTMENTS"/>
    <title><g:message code="departments.title"/></title>
    <meta name="layout" content="main">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <g:form method="post" controller="department" action="add" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label" id="name"><g:message code="departments.form.name"/></label>

                    <div class="controls">
                        <g:textField name="name" value="${department?.name}"/>
                        <g:hasErrors bean="${department}" field="name">
                            <span class="alert alert-error">
                                <g:fieldError field="name" bean="${department}"/>
                            </span>
                        </g:hasErrors>
                    </div>
                </div>

                <div class="control-group">
                    <div class="controls">
                        <button class="btn btn-primary"><g:message code="departments.form.submit"/></button>
                    </div>
                </div>
            </g:form>

            <g:if test="{!empty departments}">
                <h3><g:message code="departments.title"/></h3>
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th><g:message code="departments.table.id"/></th>
                        <th><g:message code="departments.table.name"/></th>
                        <th><g:message code="common.nbsp"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${departments}" var="department">
                        <tr>
                            <td>${department?.id}</td>
                            <td>${department?.name}</td>
                            <td>
                                <g:form method="post" controller="department" action="delete" params="[departmentId: department?.id]">
                                    <a href="#deleteModal${department?.id}" role="button" class="btn btn-danger btn-mini" data-toggle="modal"><g:message code="common.delete"/></a>

                                    <div id="deleteModal${department?.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <h3 id="deleteModalLabel"><g:message code="departments.modal.header" args="[department?.name]"/></h3>
                                        </div>

                                        <div class="modal-body">
                                            <p><g:message code="departments.modal.body" args="[department?.name]"/></p>
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
        </div>
    </div>
</div>
</body>
</html>