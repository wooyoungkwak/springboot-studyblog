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
        <div class="container px-4 px-lg-5 introduce">
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

            <div class="testSlide">
                <img src="https://cdn.pixabay.com/photo/2020/05/14/15/46/puffins-5170171_960_720.jpg">
                <img src="https://cdn.pixabay.com/photo/2020/05/11/19/01/swans-5159767_960_720.jpg">
                <img src="https://cdn.pixabay.com/photo/2016/02/10/16/37/cat-1192026_960_720.jpg">
            </div>
        </div>

    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="text/javascript">
            let testSlide = {
                now: 0,
                img: 2,
                init: function () {
                    $('.testSlide img').eq(0).siblings().hide();
                    setInterval(this.showSlide, 5000);
                },
                addEvent: function (){

                },
                showSlide: function () {
                    if (testSlide.now == testSlide.img) {
                        $('.testSlide img').eq(testSlide.now).fadeOut(1000);
                        $('.testSlide img').eq(0).fadeIn(1000);
                        testSlide.now = 0;
                    } else {
                        $('.testSlide img').eq(testSlide.now).fadeOut(1000);
                        $('.testSlide img').eq(testSlide.now + 1).fadeIn(1000);
                        testSlide.now++;
                    }
                }
            }

            testSlide.init();

            $('header').css({
                "height": "895px"
            });
        </script>
    </stripes:layout-component>

</stripes:layout-render>