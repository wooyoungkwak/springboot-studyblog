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
<% String contextPath = request.getContextPath(); %>

<stripes:layout-render name="/WEB-INF/views/layout/default.jsp">

    <stripes:layout-component name="contents">
        <div class="row">
            <div class="col">
                <iframe src="<%=contextPath%>${pdfUrl}" style="position: relative; width:100%; height:1100px; border:1px solid #00c;"></iframe>
            </div>
        </div>
<%--        <div class="row justify-content-end mb-4" style="position: fixed">--%>
<%--            <div class="col-10"></div>--%>
<%--            <div class="col">--%>
<%--                <div class="btn-group">--%>
<%--                    <a class="btn btn-light close">닫기</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="application/javascript">
            $.fn.executeEvent = function (event) {
                let propClass = $(this).prop('class');
                if (propClass.indexOf("close") != -1) {
                    location.href = '/blog';
                }
            }

            let viewerEvent = {
                init: function () {
                    this.initEvent();
                },
                initEvent: function () {
                    $('a.btn.close').on('click', function () {
                        $(this).executeEvent();
                    });
                }
            }

            viewerEvent.init();
        </script>
    </stripes:layout-component>

</stripes:layout-render>
