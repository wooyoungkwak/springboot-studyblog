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
<% String contextPath = request.getContextPath(); %>

<stripes:layout-render name="/WEB-INF/views/layout/general.jsp">

    <stripes:layout-component name="contents">

        <!-- Page content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">

                <table class="table table-striped table-hover caption-top">
                    <caption>사용자 의견</caption>
                    <thead class="table-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">제목</th>
                            <th scope="col">조회</th>
                            <th scope="col">날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach begin="1" end="20" varStatus="status">
                        <tr>
                            <th scope="row">${status.index}</th>
                            <td>...</td>
                            <td>${status.index}회</td>
                            <td>2022-01-1</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>


    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="text/javascript" src="<%=contextPath%>/resources/js/proj-blog-scripts.js"></script>
    </stripes:layout-component>
</stripes:layout-render>