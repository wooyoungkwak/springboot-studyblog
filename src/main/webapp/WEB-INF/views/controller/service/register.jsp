<%--
  Created by IntelliJ IDEA.
  User: zilet
  Date: 2022-04-05
  Time: 오전 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://stripes.sourceforge.net/stripes.tld" prefix="stripes" %>
<%@ taglib prefix="script" uri="http://stripes.sourceforge.net/stripes-buffered-layout.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="com.young.springbootstudyblog.model.dto.home.enums.*" %>
<% String contextPath = request.getContextPath(); %>


<stripes:layout-render name="/WEB-INF/views/layout/default.jsp">

    <stripes:layout-component name="contents">

        <!-- Page content-->
        <div class="container">

            <!-- Blog Title-->
            <div class="row mb-4">
                <div class="form-floating mb-2">
                    <select class="grade form-select">
                        <c:forEach var="optGrade" items="${Grade.values()}" varStatus="status">
                            <option value="${optGrade}" <c:if test="${optGrade.name() == grade}">selected</c:if>>
                                ${optGrade.getValue()}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-floating">
                    <select class="subject form-select">
                        <c:forEach var="optSubject" items="${Subject.values()}" varStatus="status">
                            <option value="${optSubject}" <c:if test="${ optSubject.name() == subject }">selected</c:if>>
                                    ${optSubject.getValue()}
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <!-- Blog Content-->
            <div class="row mb-4">
                <div class="form-floating">
                    <textarea class="form-control" placeholder="내용을 입력하세요." id="contents" style="height: 600px">${contents}</textarea>
                    <label for="contents">Summary</label>
                </div>
            </div>

            <div class="card mb-4" id="fileUpload">
                <div class="card-header">
                    파일 업로드
                </div>
                <div class="card-body">
                    <div class="row mb-2">
                        <div class="col-9">
                            <!-- input -->
                            <div class="input-group">
                                <label class="input-group-text" for="pdfFile">문제지 PDF 파일 업로드</label>
                                <input type="file" class="form-control" id="pdfFile">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-9">
                            <!-- input -->
                            <div class="input-group">
                                <label class="input-group-text" for="thumbnailFile">섬네일 이미지 업로드</label>
                                <input type="file" class="form-control" id="thumbnailFile">
                            </div>
                        </div>
<%--                        <div class="col-3">--%>
<%--                            <!-- Blog Image Preview -->--%>
<%--                            <c:choose>--%>
<%--                                <c:when test="${thumbnailUrl == ''}">--%>
<%--                                    <img class="img-fluid" id="preThumbnail" src="<%=contextPath%>/resources/assets/thumbnail/sample.jpg" alt="...">--%>
<%--                                </c:when>--%>
<%--                                <c:otherwise>--%>
<%--                                    <img class="img-fluid" id="preThumbnail" src="<%=contextPath%>${thumbnailUrl}" alt="...">--%>
<%--                                </c:otherwise>--%>
<%--                            </c:choose>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>

            <div class="row justify-content-end mb-4">
                <div class="col-10"></div>
                <div class="col">
                    <a class="btn btn-primary register">등록</a>
                    <a class="btn btn-light cancel">취소</a>
                </div>
            </div>
        </div>

    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="application/javascript">

            $.fileUpload = function (opt) {
                let formData = new FormData();

                $('#fileUpload').find(':file').each(function () {
                    let key = $(this).attr("name");
                    if (key == undefined) {
                        return;
                    }

                    $.each($(this)[0].files, function (index, file) {
                        formData.append(key, file);
                    });
                });

                $.ajax({
                    url: opt.contextPath,
                    type: 'post',
                    processData: false,
                    contentType: false,
                    data: formData,
                    dataType: "json",
                    beforeSend: function (xhr, options) {
                        xhr.setRequestHeader('AJAX', true);
                    },
                    xhr: function () {
                        let myXhr = $.ajaxSettings.xhr();
                        return myXhr;
                    },
                    error: function (jqXHR, statusCode, errorThrown) {
                        log.info(jqXHR.status, statusCode, errorThrown);
                    },
                    success: function (data, statusCode, jqXHR) {
                        log.info(jqXHR.status, JSON.stringify(data));
                    }
                });
            }

            $.fn.executeEvent = function (event) {
                let propClass = $(this).prop('class');

                if (propClass.indexOf("cancel") != -1) {
                    location.href = '/blog';
                } else if (propClass.indexOf("register") != -1) {

                    let _contextPath = $.getContextPath();

                    $.fileUpload({
                        contextPath: _contextPath + "/fileUpload",
                        subject: $('select.subject').val(),
                        grade: $('select.grade').val()
                    });

                    // let parameter = {
                    //     title: $('#title').val(),
                    //     contents: $('#contents').val()
                    // };
                    // location.href = '/blog?' + encodeURI($.param(parameter));
                }

            };

            let registerEvent = {
                init: function () {
                    this.initBtnStatus("${status}");
                    this.initEvent();
                },
                initEvent: function () {
                    $('a.btn').on('click', function (event) {
                        $(this).executeEvent(event);
                    });
                },
                initBtnStatus: function (status) {
                    if (status === "modify") {
                        $('a.btn.register').html("수정");
                    } else {
                        $('a.btn.register').html("등록");
                    }
                }
            };

            registerEvent.init();

        </script>
    </stripes:layout-component>

</stripes:layout-render>
