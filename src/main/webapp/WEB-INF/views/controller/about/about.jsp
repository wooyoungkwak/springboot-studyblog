<%--
  Created by IntelliJ IDEA.
  User: zilet
  Date: 2022-04-03
  Time: 오후 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://stripes.sourceforge.net/stripes.tld" prefix="stripes" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.young.springbootstudyblog.model.dto.home.enums.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<% String contextPath = request.getContextPath(); %>

<stripes:layout-render name="/WEB-INF/views/layout/default.jsp">

    <stripes:layout-component name="contents">

        <!-- Page content-->
        <div class="container px-4 px-lg-5">

            <div class="row gx-4 gx-lg-5 border-bottom border-2 mb-4">
                <div class="col-2 p-2 text-center tabMenu applyExam tabActive">적용 사례</div>
                <div class="col-2 p-2 text-center tabMenu applyQna">질의 응답</div>
            </div>

            <div class="row gx-4 gx-lg-5 justify-content-center " id="applyExam">

                <tags:searchTag searchName="applyExam" categories="${categories}" sorts="${sorts}" categoryStr="${category}" sortStr="${sort}" content="${content}" isService="false" />

                <table class="table table-striped table-hover caption-top">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">제목</th>
                            <th scope="col">조회</th>
                            <th scope="col">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="applyExam" items="${applyExams}" varStatus="status">
                            <tr>
                                <th scope="row">${applyExam.applyExamSeq}</th>
                                <td>${applyExam.subject}</td>
                                <td>${applyExam.hit}회</td>
                                <td>${applyExam.regDT}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <tags:pageTag pageNumber="${pageNumber}" pageBegin="${pageBegin}" pageEnd="${pageEnd}" isBeginOver="${isBeginOver}" isEndOver="${isEndOver}"/>

            </div>
            <div class="row gx-4 gx-lg-5 justify-content-center collapse" id="applyQna">

                <tags:searchTag searchName="applyQna" categories="${categories}" sorts="${sorts}" categoryStr="${category}" sortStr="${sort}" content="${content}" isService="false" />

                <table class="table table-striped table-hover caption-top">
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">제목</th>
                            <th scope="col">조회</th>
                            <th scope="col">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="applyExam" items="${applyExams}" varStatus="status">
                            <tr>
                                <th scope="row">${applyExam.applyExamSeq}</th>
                                <td>${applyExam.subject}</td>
                                <td>${applyExam.hit}회</td>
                                <td>${applyExam.regDT}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <tags:pageTag pageNumber="${pageNumber}" pageBegin="${pageBegin}" pageEnd="${pageEnd}" isBeginOver="${isBeginOver}" isEndOver="${isEndOver}"/>
            </div>
        </div>

    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="text/javascript" >
            $(document).ready(function (){

                let tabMenu = {
                    init: function () {
                        this.addEvent();
                    },
                    addEvent: function () {
                        $('.tabMenu').on('click', function (){
                            let applyExam = "applyExam";
                            let applyQna = "applyQna";

                            if ( $(this).hasClass(applyExam) ) {
                                $('#' + applyQna).addClass("collapse");
                                $('#' + applyExam).removeClass("collapse");
                                tabMenu.setBackground(applyExam);

                                searchEvent.searchName = applyExam;
                            } else  {
                                $('#' + applyExam).addClass("collapse");
                                $('#' + applyQna).removeClass("collapse");
                                tabMenu.setBackground(applyQna);

                                searchEvent.searchName = applyQna;
                            }
                        });
                    },
                    setBackground: function (target){
                        $('.tabMenu').removeClass('tabActive');
                        $('.' +target).addClass('tabActive');
                    }
                };

                let searchEvent = {
                    searchName: "applyExam",
                    init: function () {
                        this.initEvent();
                    },
                    initEvent: function () {
                        $('button.search').on('click', function (event) {
                            searchEvent.search();
                        });
                    },
                    initTable: function (data) {

                        // 기존 데이터 삭제
                        $('#' + searchEvent.searchName +' table tbody tr').remove();

                        // 데이터 추가
                        let trHtml = '';
                        for(let i=0; i<data.length; i++) {
                            let apply = data[i];
                            trHtml += '<tr>';
                            if( searchEvent.searchName === "applyExam") {
                                trHtml += `<th scope="row">` + apply.applyExamSeq + `</th>`;
                            } else {
                                trHtml += `<th scope="row">` + apply.applyQnaSeq + `</th>`;
                            }
                            trHtml += `<td>` + apply.subject + `</td>`;
                            trHtml += `<td>` + apply.hit + `회</td>`;
                            trHtml += `<td>` + apply.regDT + `</td>`;
                            trHtml += '</tr>';
                        }

                        $('#' + searchEvent.searchName +' table tbody').append(trHtml);
                    },
                    search: function (page) {

                        let pageNumber = page;

                        if (page === undefined) {
                            pageNumber  = $('#pageControl').find('.active').text();
                        }

                        let parameter = {
                            sort: $('#' + searchEvent.searchName +' .sort').val(),
                            category: $('#' + searchEvent.searchName +' .category').val(),
                            content: $('#' + searchEvent.searchName +' .content').val(),
                            pageNumber: pageNumber
                        };

                        let url = $(location).attr('href') + '/' + searchEvent.searchName;
                        let data = parameter;

                        $.ajaxJJ(url, data, this.initTable, alert);
                    }
                };

                let pageEvent = {
                    init: function () {
                        this.initEvent();
                    },
                    initEvent: function (search) {
                        $('.page-item a.page-link').on('click', function () {
                            let pageNumber = $(this).text();

                            if (pageNumber === "<") {

                            } else if (pageNumber === ">") {

                            } else {
                                $(this).parent().parent().find('.active').removeClass("active");
                                $(this).parent().addClass("active");
                                searchEvent.search(pageNumber);
                            }
                        });
                    }
                };

                tabMenu.init();
                searchEvent.init();
                pageEvent.init();
            });
        </script>
    </stripes:layout-component>
</stripes:layout-render>