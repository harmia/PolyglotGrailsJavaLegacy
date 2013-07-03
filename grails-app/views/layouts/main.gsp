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
<html>
<head>
    <title><g:layoutTitle/></title>

    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <r:require module="bootstrap"/>
    <r:require module="bootstrap-js"/>
    <r:require module="jquery"/>
    <r:require module="jquery-ui"/>

    <g:layoutHead/>
    <r:layoutResources/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <ul class="nav nav-tabs">
                <li class="OVERVIEW"><g:link controller="overview" action="overview"><g:message code="main.nav.overview"/></g:link></li>
                <li class="DEPARTMENTS"><g:link controller="department" action="departments"><g:message code="main.nav.departments"/></g:link></li>
                <li class="EMPLOYEES"><g:link controller="employee" action="employees"><g:message code="main.nav.employees"/></g:link></li>
                <li class="LANGUAGE pull-right"><a href="?lang=${g.message(code: "main.nav.language.locale")}" class="right"><g:message code="main.nav.language"/></a></li>
            </ul>

            <h1 class="title"><g:layoutTitle/></h1>

            <g:if test="${flash.error}">
                <div class="alert alert-error" role="status">
                    <button type="button" class="close" data-dismiss="alert"><g:message code="common.times"/></button>
                    ${flash.error}
                    ${flash.error = ""}
                </div>
            </g:if>
            <g:if test="${flash.success}">
                <div class="alert alert-success" role="status">
                    <button type="button" class="close" data-dismiss="alert"><g:message code="common.times"/></button>
                    ${flash.success}
                    ${flash.success = ""}
                </div>
            </g:if>
            <g:if test="${flash.info}">
                <div class="alert alert-info" role="status">
                    <button type="button" class="close" data-dismiss="alert"><g:message code="common.times"/></button>
                    ${flash.info}
                    ${flash.info = ""}
                </div>
            </g:if>
            <g:if test="${flash.alert}">
                <div class="alert" role="status">
                    <button type="button" class="close" data-dismiss="alert"><g:message code="common.times"/></button>
                    ${flash.alert}
                    ${flash.alert = ""}
                </div>
            </g:if>
        </div>
    </div>
</div>

<g:layoutBody/>
<r:layoutResources/>

<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <div class="disclaimer"><g:message code="main.disclaimer"/></div>
        </div>
    </div>
</div>
</body>
</html>
<g:javascript src="ui.datepicker-fi.js"/>
<script>
    $(function() {
        var activePage = $("meta[name=activePage]").attr("content");
        $("ul.nav.nav-tabs li").each(function() {
            activePage == $(this).attr("class") ? $(this).addClass("active")  : $(this).removeClass("active");
        });


        $.datepicker.setDefaults($.datepicker.regional['']);
        $.datepicker.setDefaults($.datepicker.regional['${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).language}']);

        $( "#datepicker" ).datepicker({
            showOn: "button",
            buttonImage: "/images/calendar.png",
            buttonImageOnly: true
        });

        if(!String.prototype.startsWith){
            String.prototype.startsWith = function (str) {
                return !this.indexOf(str);
            }
        }

        $( "#checkNames" ).autocomplete({
            source: function( request, response ) {
                $.getJSON( "/data/names.json").success(function( data ) {
                    response( $.map($.grep(data, function ( item ) {
                        return item.name.toUpperCase().startsWith(request.term.toUpperCase())
                    }), function( item ) {
                        return {
                            label: item.name,
                            value: item.name
                        }})
                    )
                });
            }
        });

        $( "#checkMunicipalities" ).autocomplete({
            source: function( request, response ) {
                $.getJSON( "/api/municipalities/".concat(request.term)).success(function( data ) {
                    response( $.map(data, function( item ) {
                        return {
                            label: item.name,
                            value: item.name,
                            id: item.id
                        }})
                    )
                });
            },
            select: function( event, ui ) {
                $("#municipalityId").val(ui.item.id);
            }
        });
    });
</script>
