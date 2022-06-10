<%--
  Created by IntelliJ IDEA.
  User: zilet
  Date: 2022-04-03
  Time: 오후 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://stripes.sourceforge.net/stripes.tld" prefix="stripes" %>
<%@ taglib prefix="script" uri="http://stripes.sourceforge.net/stripes-buffered-layout.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.young.springbootstudyblog.model.dto.home.enums.*" %>
<% String contextPath = request.getContextPath(); %>

<stripes:layout-render name="/WEB-INF/views/layout/default.jsp">
    <stripes:layout-component name="contents">

        <!-- Page content-->
        <div class="container">

            <!-- Side widgets-->
            <div class="col-lg">

                <!-- Categories widget-->
                <div class="card mb-4" id="category">
                    <div class="card-header">검색</div>

                    <div class="card-body">
                        <div class="row" id="link">
                            <div class="col-2">
                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="serviceType">필터</label>
                                    <select class="form-select" aria-label="Default select example" id="serviceType">
                                        <c:forEach varStatus="status" var="type" items="${ServiceType.values()}">
                                            <option value="${type}" <c:if test="${serviceType == type.name()}">selected</c:if>>${type.getValue()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group mb-3">
                                    <label class="input-group-text" for="sort">정렬</label>
                                    <select class="form-select" aria-label="Default select example sort" id="sort">
                                        <c:forEach varStatus="status" var="sorts" items="${Sort.values()}">
                                            <option value="${sorts}" <c:if test="${sort == sorts.name()}">selected</c:if>>${sorts.getValue()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-8">
                                <div class="input-group">
                                    <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="btnSearch" id="searchContent" value="${searchContent}"/>
                                    <button class="btn btn-primary search" id="btnSearch" type="button">검색</button>
                                    <a class="btn btn-primary register text-center ms-1" id="btnRegister" >등록</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Blog entries-->
                <div class="col-lg-12">
                    <!-- blog posts-->
                    <c:forEach var="blog" items="${blogs}" varStatus="status">
                        <c:choose>
                            <c:when test="${(status.index % 3) == 0}">
                                <div class="row">
                                    <div class="col-lg-4 blogItem">
                                        <div class="card mb-4">
                                        <img class="card-img-top" src="<%=contextPath%>${blog.thumbnailUrl}" alt="..."/>
                                            <div class="card-body" index="${blog.blogSeq}">
                                                <input type="hidden" class="thumbnailUrl" value="${blog.thumbnailUrl}"/>
                                                <input type="hidden" class="pdfUrl" value="${blog.pdfUrl}"/>
                                                <div class="small text-muted mb-1">${blog.regDt}</div>
                                                <h2 class="card-title">
                                                        <span class="subject" name="${blog.subject}">
                                                            <c:forEach var="optSubject" items="${Subject.values()}" varStatus="status">
                                                                <c:if test="${ optSubject.name() == blog.subject }">${optSubject.getValue()}</c:if>
                                                            </c:forEach>
                                                        </span> /
                                                    <span class="grade" name="${blog.grade}">
                                                            <c:forEach var="optGrade" items="${Grade.values()}" varStatus="status">
                                                                <c:if test="${optGrade.name() == blog.grade}">${optGrade.getValue()}</c:if>
                                                            </c:forEach>
                                                        </span>
                                                </h2>
                                                <p class="card-text">${blog.summary}</p>
                                                <a class="btn btn-outline-primary viewer">문제 보기 →</a>
                                                <a class="btn btn-outline-success register">답안지 작성 →</a>
                                            </div>
                                        </div>
                                    </div>
                            </c:when>
                            <c:when test="${(status.index % 3) == 1}">
                                    <div class="col-lg-4 blogItem">
                                        <div class="card mb-4">
                                        <img class="card-img-top" src="<%=contextPath%>${blog.thumbnailUrl}" alt="..."/>
                                            <div class="card-body" index="${blog.blogSeq}">
                                                <input type="hidden" class="thumbnailUrl" value="${blog.thumbnailUrl}"/>
                                                <input type="hidden" class="pdfUrl" value="${blog.pdfUrl}"/>
                                                <div class="small text-muted mb-1">${blog.regDt}</div>
                                                <h2 class="card-title">
                                                        <span class="subject" name="${blog.subject}">
                                                            <c:forEach var="optSubject" items="${Subject.values()}" varStatus="status">
                                                                <c:if test="${ optSubject.name() == blog.subject }">${optSubject.getValue()}</c:if>
                                                            </c:forEach>
                                                        </span> /
                                                    <span class="grade" name="${blog.grade}">
                                                            <c:forEach var="optGrade" items="${Grade.values()}" varStatus="status">
                                                                <c:if test="${optGrade.name() == blog.grade}">${optGrade.getValue()}</c:if>
                                                            </c:forEach>
                                                        </span>
                                                </h2>
                                                <p class="card-text">${blog.summary}</p>
                                                <a class="btn btn-outline-primary viewer">문제 보기 →</a>
                                                <a class="btn btn-outline-success register">답안지 작성 →</a>
                                            </div>
                                        </div>
                                    </div>
                            </c:when>
                            <c:otherwise>
                                    <div class="col-lg-4 blogItem">
                                        <div class="card mb-4">
                                        <img class="card-img-top" src="<%=contextPath%>${blog.thumbnailUrl}" alt="..."/>
                                            <div class="card-body" index="${status.index}">
                                                <input type="hidden" class="thumbnailUrl" value="${blog.thumbnailUrl}"/>
                                                <input type="hidden" class="pdfUrl" value="${blog.pdfUrl}"/>
                                                <div class="small text-muted mb-1">${blog.regDt}</div>
                                                <h2 class="card-title">
                                                    <span class="subject" name="${blog.subject}">
                                                        <c:forEach var="optSubject" items="${Subject.values()}" varStatus="status">
                                                            <c:if test="${ optSubject.name() == blog.subject }">${optSubject.getValue()}</c:if>
                                                        </c:forEach>
                                                    </span> /
                                                    <span class="grade" name="${blog.grade}">
                                                        <c:forEach var="optGrade" items="${Grade.values()}" varStatus="status">
                                                            <c:if test="${optGrade.name() == blog.grade}">${optGrade.getValue()}</c:if>
                                                        </c:forEach>
                                                    </span>
                                                </h2>
                                                <p class="card-text">${blog.summary}</p>
                                                <a class="btn btn-outline-primary viewer">문제 보기 →</a>
                                                <a class="btn btn-outline-success register">답안지 작성 →</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>


                    <c:choose>
                        <c:when test="${(blogSize % 3) == 0}"></div></c:when>
                        <c:when test="${(blogSize % 3) == 1}"></div></c:when>
                    </c:choose>

                <!-- Pagination-->
                <nav aria-label="Pagination">
                    <hr class="my-0"/>
                    <ul class="pagination justify-content-center my-4" id="pageControl"></ul>
                </nav>
            </div>

        </div>
        </div>

    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="text/javascript">

            let page = '${page}';
            let totalPage = '${totalPage}';

            $.fn.executeEvent = function (event) {
                let propClass = $(this).prop('class');
                let parameter;

                if (propClass.indexOf("register") != -1) {
                    let status = "registry";

                    if ($(this).html().indexOf("수정 하기") !== -1) {
                        status = "modify";
                    }

                    parameter = {
                        subject: $(this).parent().find('.card-title .subject').attr("name"),
                        grade: $(this).parent().find('.card-title .grade').attr("name"),
                        contents: $(this).parent().find('.card-text').text(),
                        thumbnailUrl: $(this).parent().find('input.thumbnailUrl').val(),
                        status: status
                    };

                    location.href = '/register?' + $.param(parameter);
                } else if (propClass.indexOf("viewer") != -1) {
                    parameter = {
                        pdfUrl: $(this).parent().find('input.pdfUrl').val()
                    };
                    location.href = '/viewer?' + $.param(parameter);
                } else if (propClass.indexOf("sort") != -1) {
                    searchEvent.search();
                } else if (propClass.indexOf("search") != -1) {
                    searchEvent.search();
                }
            };

            let blogEvent = {
                init: function () {
                    this.initEvent();
                },
                initEvent: function () {
                    $('a.btn').on('click', function (event) {
                        $(this).executeEvent(event);
                    });
                }
            };

            let searchEvent = {
                init: function () {
                    this.initEvent();
                },
                initEvent: function () {
                    $('#btnSearch').on('click', function (event) {
                        $(this).executeEvent(event);
                    });

                    // $('#link a').on('click', function (event) {
                    //     alert(" link a  ... selector ??");
                    // });

                    $('#sort').on('change', function (event) {
                        $(this).executeEvent(event);
                    });
                },
                search: function (page) {

                    let currentPage = page;

                    if (page === undefined) {
                        currentPage  = $('#pageControl').find('.active').text();
                    }

                    let parameter = {
                        sort: $('#sort').val(),
                        serviceType: $('#serviceType').val(),
                        searchContent: $('#searchContent').val(),
                        page: currentPage
                    };

                    location.href = '/blog?' + $.param(parameter);
                }
            }

            let pageEvent = {
                init: function () {
                    this.pathname = location.pathname.replaceAll('/', '');
                    this.initPage();
                    this.initEvent();
                },
                initEvent: function () {
                    $('a.page-link').on('click', function () {
                        let currentPage = $(this).text();

                        if (currentPage === "<") {

                        } else if (currentPage === ">") {

                        } else {
                            searchEvent.search(currentPage);
                        }
                    });
                },
                initPage: function () {
                    let pageNumber = Number(page);
                    let totalPageNumber = Number(totalPage);

                    let pageHtml = ``;

                    if (pageNumber == 1) {
                        pageHtml += `<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true"><</a></li>`;
                    } else {
                        pageHtml += `<li class="page-item"><a class="page-link" href="#" tabindex="-1" aria-disabled="true"><</a></li>`;
                    }

                    for (let i = 1; i <= totalPageNumber; i++) {
                        if (i === pageNumber) {
                            pageHtml += `<li class="page-item active" aria-current="page"><a class="page-link">` + i + `</a></li>`;
                        } else {
                            pageHtml += `<li class="page-item" aria-current="page"><a class="page-link">` + i + `</a></li>`;
                        }
                    }

                    if (totalPageNumber > 3 && pageNumber < totalPageNumber) {
                        pageHtml += `<li class="page-item">...</li>`;
                        pageHtml += `<li class="page-item"><a class="page-link" href="#!">></a></li>`;
                    } else {
                        pageHtml += `<li class="page-item disabled"><a class="page-link" href="#!">></a></li>`;
                    }

                    $('#pageControl').html(pageHtml);
                }
            };

            let viewerEvent = {
                init: function () {
                    this.initEvent();
                },
                initEvent: function () {
                    $('a.btn').on('click', function (event) {
                        $(this).executeEvent(event);
                    });
                }
            }

            blogEvent.init();
            searchEvent.init();
            pageEvent.init();

        </script>

    </stripes:layout-component>

</stripes:layout-render>