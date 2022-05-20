<%--
  Created by IntelliJ IDEA.
  User: zilet
  Date: 2022-04-03
  Time: 오후 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://stripes.sourceforge.net/stripes.tld" prefix="stripes" %>
<% String contextPath = request.getContextPath(); %>

<stripes:layout-render name="/WEB-INF/views/layout/general.jsp">

    <stripes:layout-component name="contents">

        <!-- Page content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-7">
                    <div class="card">
                        <div class="card-header">LVM 이란</div>
                        <div class="card-body">
                            <h4>차별화 요소</h4>
                            <img src="/fileUpload/assets/home/roof.jpeg">
                        </div>
                        <div class="card-body">
                            <h4>시스템 구성도</h4>
                            <img src="/fileUpload/assets/home/method.jpeg">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="text/javascript" src="<%=contextPath%>/resources/js/proj-blog-scripts.js"></script>
    </stripes:layout-component>

</stripes:layout-render>