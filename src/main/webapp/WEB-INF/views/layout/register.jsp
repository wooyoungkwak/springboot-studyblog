<%--
  Created by IntelliJ IDEA.
  User: zilet
  Date: 2022-04-05
  Time: 오전 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://stripes.sourceforge.net/stripes.tld" prefix="stripes" %>

<stripes:layout-definition>
    <!DOCTYPE html>
    <html lang="en">

        <%@ include file="/WEB-INF/views/reference/head.jsp" %>

        <body>
            <!-- Responsive navbar-->
            <%@ include file="/WEB-INF/views/reference/nav.jsp" %>

            <!-- content -->
            <stripes:layout-component name="contents"/>

            <!-- Footer -->
            <%@ include file="/WEB-INF/views/reference/footer.jsp" %>

            <!-- script -->
            <stripes:layout-component name="javascript"/>

        </body>

    </html>
</stripes:layout-definition>
