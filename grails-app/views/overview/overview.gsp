<%--
  Created by IntelliJ IDEA.
  User: harmia
  Date: 14.5.2013
  Time: 14:40
  Copyright (C) 2013 Juhana "harmia" Harmanen
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="activePage" content="OVERVIEW"/>
    <title><g:message code="overview.title" /></title>
    <meta name="layout" content="main">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">

            <h3><g:message code="overview.total" args="[departments.size(), employees.size()]"/></h3>

            <ul class="nav nav-pills" data-tabs="tabs">
                <g:each in="${departments}" var="department"  status="index">
                    <li ${index == 0 ? 'class="active"' : ''}><a href="#${department?.id}" data-toggle="tab">${department?.name}</a></li>
                </g:each>
            </ul>

            <div class="pill-content">
                <g:each in="${departments}" var="department" status="index">
                    <div class="pill-pane ${index == 0 ? ' active' : ''}" id="${department?.id}">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${employees}" var="employee">
                                <g:if test="${employee?.department.id == department?.id}">
                                    <tr>
                                        <td>${employee?.lastName}, ${employee?.firstName}</td>
                                        <td>${employee?.email}</td>
                                    </tr>
                                </g:if>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </g:each>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function () {
        $(".nav.nav-pills").tabs();
    });
</script>