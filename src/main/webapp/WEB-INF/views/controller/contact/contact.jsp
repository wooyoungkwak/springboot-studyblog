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

<stripes:layout-render name="/WEB-INF/views/layout/default.jsp">

    <stripes:layout-component name="contents">

        <!-- Page content-->
        <main class="mb-4">
            <div class="container px-4 px-lg-5">

                <div class="row gx-4 gx-lg-5 border-bottom border-2 mb-4">
                    <div class="col-2 p-2 text-center tabMenu linkUs tabActive">연계 문의</div>
                    <div class="col-2 p-2 text-center tabMenu estimate">견적 문의</div>
                </div>

                <div class="row gx-4 gx-lg-5 justify-content-center" id="linkUs">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <p class="h4 fw-bold"> 연계 문의 </p>
                        <p> LMS 시스템을 업체에서 직접 관리 하는 시스템 구축에대한 연계 문의 입니다.</p>
                        <div class="my-5">
                            <!-- to get an API token!-->
                            <div id="linkUsForm" data-sb-form-api-token="API_TOKEN">
                                <div class="form-floating mb-2">
                                    <select class="form-select" id="linkUsPurpose">
                                        <option val="NONE">용도 선택</option>
                                        <option val="GUIDE">학습 지도</option>
                                        <option val="COURSE">진로 지도</option>
                                        <option val="TEST">학생 평가</option>
                                    </select>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <select class="form-select " id="linkUsUserScale">
                                        <option val="NONE">규모 선택</option>
                                        <option val="FIRST">10명 ~ 20명 사이</option>
                                        <option val="SECOND">20명 ~ 30명 사이</option>
                                        <option val="THIRD">30명 ~ 40명 사이</option>
                                        <option val="SIXTH">50명 이상</option>
                                    </select>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <input class="form-control" id="linkUsName" type="text" placeholder="이름을 입력하세요..." data-sb-validations="required"/>
                                    <label for="linkUsName">성함</label>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <input class="form-control" id="linkUsEmail" type="email" placeholder="Email 을 입려하세요 ..." data-sb-validations="required,email"/>
                                    <label for="linkUsEmail">Email 주소</label>
                                    <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                    <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <input class="form-control" id="linkUsPhone" type="tel" placeholder="전화번호를 입력하세요..." data-sb-validations="required"/>
                                    <label for="linkUsPhone">핸드폰 번호</label>
                                    <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                                </div>
                                <div class="form-floating">
                                    <textarea class="form-control" id="linkUsMessage" placeholder="Enter your message here..." style="height: 23rem" data-sb-validations="required"></textarea>
                                    <label for="linkUsMessage">문의 내용</label>
                                    <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                                </div>
                                <br/>

                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                                <div class="d-none" id="linkUsSuccessMessage">
                                    <div class="text-center mb-3">
                                        <div class="fw-bolder">전송 완료</div>
                                        견적 요청 내용이 전송 완료 되었습니다.
                                    </div>
                                </div>

                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                                <div class="d-none" id="linkUsErrorMessage">
                                    <div class="text-center text-danger mb-3">전송 실패!</div>
                                </div>

                                <!-- Submit Button-->
                                <button class="btn btn-primary text-uppercase" id="btnLinkUs">Send</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row gx-4 gx-lg-5 justify-content-center collapse" id="estimate">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <p class="h4 fw-bold"> 견적 문의 </p>
                        <p> LMS 시스템을 업체에서 직접 관리 하는 시스템 구축 에대한 견적 문의 입니다.</p>
                        <div class="my-5">
                            <!-- to get an API token!-->
                            <form id="estimateForm" data-sb-form-api-token="API_TOKEN">
                                <div class="form-floating mb-2">
                                    <select class="form-select" name="purpose">
                                        <option val="NONE">용도 선택</option>
                                        <option val="GUIDE">학습 지도</option>
                                        <option val="COURSE">진로 지도</option>
                                        <option val="TEST">학생 평가</option>
                                    </select>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <select class="form-select userScale">
                                        <option val="NONE">규모 선택</option>
                                        <option val="FIRST">10명 ~ 20명 사이</option>
                                        <option val="SECOND">20명 ~ 30명 사이</option>
                                        <option val="THIRD">30명 ~ 40명 사이</option>
                                        <option val="SIXTH">50명 이상</option>
                                    </select>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <input class="form-control" id="estimateName" type="text" placeholder="Enter your name..." data-sb-validations="required"/>
                                    <label for="estimateName">성함</label>
                                    <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <input class="form-control" id="estimateEmail" type="email" placeholder="Enter your email..." data-sb-validations="required,email"/>
                                    <label for="estimateEmail">Email 주소</label>
                                    <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                                    <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
                                </div>
                                <div class="form-floating mb-2">
                                    <input class="form-control" id="estimatePhone" type="tel" placeholder="Enter your phone number..." data-sb-validations="required"/>
                                    <label for="estimatePhone">핸드폰 번호</label>
                                    <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
                                </div>
                                <div class="form-floating">
                                    <textarea class="form-control" id="estimateMessage" placeholder="Enter your message here..." style="height: 23rem" data-sb-validations="required"></textarea>
                                    <label for="estimateMessage">견적 내용</label>
                                    <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
                                </div>
                                <br/>

                                <!-- Submit success message-->
                                <!---->
                                <!-- This is what your users will see when the form-->
                                <!-- has successfully submitted-->
                                <div class="d-none" id="estimateSuccessMessage">
                                    <div class="text-center mb-3">
                                        <div class="fw-bolder">전송 완료</div>
                                        견적 요청 내용이 전송 완료 되었습니다.
                                    </div>
                                </div>

                                <!-- Submit error message-->
                                <!---->
                                <!-- This is what your users will see when there is-->
                                <!-- an error submitting the form-->
                                <div class="d-none" id="estimateErrorMessage">
                                    <div class="text-center text-danger mb-3">전송 실패!</div>
                                </div>

                                <!-- Submit Button-->
                                <button class="btn btn-primary text-uppercase" id="btnEstimate">Send</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

            <div class="position-fixed ms-5 bottom-50 end-50 p-0 " style="z-index: 11">
                <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
                    <div class="toast-header">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <strong class="me-auto">Bootstrap</strong>
                        <small>11 mins ago</small>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div class="toast-body">
                        This is a toast message.
                    </div>
                </div>
            </div>

        </main>



    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="text/javascript">
            let tabMenu = {
                init: function () {
                    this.addEvent();
                },
                addEvent: function () {
                    $('.tabMenu').on('click', function (){
                        let linkUs = "linkUs";
                        let estimate = "estimate";

                        if ( $(this).hasClass(linkUs) ) {
                            $('#' + estimate).addClass("collapse");
                            $('#' + linkUs).removeClass("collapse");
                            tabMenu.setBackground(linkUs);

                        } else  {
                            $('#' + linkUs).addClass("collapse");
                            $('#' + estimate).removeClass("collapse");
                            tabMenu.setBackground(estimate);
                        }
                    });
                },
                setBackground: function (target){
                    $('.tabMenu').removeClass('tabActive');
                    $('.' +target).addClass('tabActive');
                }
            };

            let formEvent = {
                init:function (){
                    this.addEvent();
                },
                addEvent: function (){

                    $('#btnLinkUs').on('click', function (){
                        formEvent.send("linkUs");
                    });

                    $('#btnEstimate').on('click', function (){
                        formEvent.send("estimate");
                    });
                },
                initMessage: function (data){
                    $('#liveToast').removeClass("hide");
                    $('#liveToast').addClass("show");

                    $('.toast-body').text(" 메시지 전달이 완료 되었습니다. (" + data.result + ")");
                },
                send: function (target) {
                    let url = $(location).attr('href').replace('?','') + '/form';
                    let data = {
                        userScale: $('#' + target + 'UserScale').val(),
                        purpose: $('#' + target + 'Purpose').val(),
                        email: $('#' + target + 'Email').val(),
                        name: $('#' + target + 'Name').val(),
                        phone: $('#' + target + 'Phone').val(),
                        message: $('#' + target + 'Message').val()
                    }

                    $.ajaxJJ(url, data, formEvent.initMessage, alert);
                }
            };

            tabMenu.init();
            formEvent.init();

        </script>
    </stripes:layout-component>

</stripes:layout-render>