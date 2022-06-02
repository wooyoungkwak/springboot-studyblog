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

<%@ page import="com.young.studyblog.model.dto.home.enums.*" %>
<% String contextPath = request.getContextPath(); %>

<stripes:layout-render name="/WEB-INF/views/layout/general.jsp">
    <stripes:layout-component name="contents">

        <!-- Page content-->
        <div class="container">
            <div class="row">

                <!-- Blog entries-->
                <div class="col-lg-8">

<%--                    <table class="table table-hover">--%>
<%--                        <thead class="text-center">--%>
<%--                            <th>#</th>--%>
<%--                            <th>과목</th>--%>
<%--                            <th>학년</th>--%>
<%--                            <th>개요</th>--%>
<%--                            <th>등록일자</th>--%>
<%--                        </thead>--%>
<%--                        <tbody>--%>
<%--                            <c:forEach begin="1" end="10" varStatus="status">--%>
<%--                                <tr>--%>
<%--                                    <td class="text-center">${status.index}</td>--%>
<%--                                    <td class="text-center">수학</td>--%>
<%--                                    <td class="text-center">중1</td>--%>
<%--                                    <td class="text-lg-start">이 문제집은 테스트 문제집으로 확인을 위한 테스트 문제집 입니다.</td>--%>
<%--                                    <td class="text-center">2022-01-01</td>--%>
<%--                                </tr>--%>
<%--                            </c:forEach>--%>
<%--                        </tbody>--%>
<%--                    </table>--%>

                    <!-- blog posts-->
                    <c:forEach var="blog" items="${blogs}" varStatus="status" >
                        <c:choose>
                            <c:when test="${(status.index % 2) == 0}">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="card mb-4">
<%--                                        <img class="card-img-top" src="<%=contextPath%>${blog.thumbnailUrl}" alt="..."/>--%>
                                            <div class="card-body" index="${blog.blogSeq}">
                                                <input type="hidden" class="thumbnailUrl" value="${blog.thumbnailUrl}"/>
                                                <input type="hidden" class="pdfUrl" value="${blog.pdfUrl}"/>
                                                <div class="small text-muted mb-1">${blog.regDt}</div>
                                                <h2 class="card-title">
                                                    <span class="subject" name="${blog.subject}">
                                                        <c:forEach var="optSubject" items="${Subject.values()}" varStatus="status">
                                                            <c:if test="${ optSubject.name() == blog.subject }">${optSubject.getName()}</c:if>
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
                                    <div class="col-lg-6">
                                    <div class="card mb-4">
<%--                                        <img class="card-img-top" src="<%=contextPath%>${blog.thumbnailUrl}" alt="..."/>--%>
                                        <div class="card-body" index="${status.index}">
                                            <input type="hidden" class="thumbnailUrl" value="${blog.thumbnailUrl}"/>
                                            <input type="hidden" class="pdfUrl" value="${blog.pdfUrl}"/>
                                            <div class="small text-muted mb-1">${blog.regDt}</div>
                                            <h2 class="card-title">
                                                <span class="subject" name="${blog.subject}">
                                                    <c:forEach var="optSubject" items="${Subject.values()}" varStatus="status">
                                                        <c:if test="${ optSubject.name() == blog.subject }">${optSubject.getName()}</c:if>
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

                    <c:if test="${(blogSize % 2) == 1}"></div></c:if>

                    <!-- Pagination-->
                    <nav aria-label="Pagination">
                        <hr class="my-0"/>
                        <ul class="pagination justify-content-center my-4" id="pageControl"></ul>
                    </nav>
                </div>

                <!-- Side widgets-->
                <div class="col-lg-4">

                    <!-- Categories widget-->
                    <div class="card mb-4" id="category">
                        <div class="card-header">카테고리</div>

                        <div class="card-body">
                            <div class="row" id="link">
                                <div class="col">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="NONE" <c:if test="${category == 'NONE'}">checked</c:if>>
                                        <label class="form-check-label" for="inlineRadio1">없음</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="grade" <c:if test="${category == 'grade'}">checked</c:if>>
                                        <label class="form-check-label" for="inlineRadio2">학년</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="subject" <c:if test="${category == 'subject'}">checked</c:if>>
                                        <label class="form-check-label" for="inlineRadio3">과목</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="date" <c:if test="${category == 'date'}">checked</c:if>>
                                        <label class="form-check-label" for="inlineRadio4">날짜</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="btnSearch" value="${searchContent}"/>
                                <button class="btn btn-primary search" id="btnSearch" type="button">Go!</button>
                            </div>
                        </div>
                    </div>

                    <!-- Sort widget-->
                    <div class="card mb-4">
                        <div class="card-header">블러그 목록 정렬</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-8">
                                    <div class="input-group mb-3">
                                        <label class="input-group-text" for="sort">정렬</label>
                                        <select class="form-select" aria-label="Default select example sort" id="sort">
                                            <option value="none" <c:if test="${sort == 'NONE'}">selected</c:if>>선택</option>
                                            <option value="asc" <c:if test="${sort == 'asc'}">selected</c:if>>오름차순</option>
                                            <option value="desc" <c:if test="${sort == 'desc'}">selected</c:if>>내림차순</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Registry widget -->
<%--                    <div class="card mb-4">--%>
<%--                        <div class="card-header">학습지 등록</div>--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="row">--%>
<%--                                <a class="btn btn-primary register btn-lg text-center">등록</a>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

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

                let registerPath = "register";
                let viewerPath = "viewer";
                let parameter;

                if (propClass.indexOf(registerPath) != -1) {
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

                    // location.href = '/register?' + encodeURI($.param(parameter));
                    location.href = '/register?' + $.param(parameter);
                } else if (propClass.indexOf(viewerPath) != -1) {
                    parameter = {
                        pdfUrl: $(this).parent().find('input.pdfUrl').val()
                    };
                    location.href = '/viewer?' + $.param(parameter);
                } else if (propClass.indexOf("sort") != -1) {
                    parameter = {
                        sort: $(this).val(),
                        category: searchEvent.getCategory(),
                        searchContent:  $('#btnSearch').parents().children('.form-control').val()
                    };

                    location.href = '/blog?' + $.param(parameter);
                } else if (propClass.indexOf("search") != -1) {
                    parameter = {
                        sort: $('#sort').val(),
                        category: searchEvent.getCategory(),
                        searchContent:  $(this).parents().children('.form-control').val()
                    };

                    location.href = '/blog?' + $.param(parameter);
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

                    $('#link a').on('click', function (event) {
                        alert(" link a  ... selector ??");
                    });

                    $('#sort').on('change', function (event){
                        $(this).executeEvent(event);
                    });
                },
                getCategory: function (){
                    let category = "";
                    $('#category').find("input").each( function (){
                        if ( $(this).is(":checked") ){
                            category = $(this).val();
                            return;
                        }
                    });
                    return category;
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
                        location.href = '/' + pageEvent.pathname + '?page=' + currentPage;
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