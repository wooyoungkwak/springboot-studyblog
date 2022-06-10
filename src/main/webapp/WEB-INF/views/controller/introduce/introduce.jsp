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
                <div class="col">
                    <div class="card mb-4">
                        <div class="card-header fw-bold fs-2">효과적인 학습 맞춤 지원</div>
                        <img src="/fileUpload/assets/introduce/structure_relation.jpeg" class="mb-2">
                        <div class="card-body">
                            <p class="lh-lg">
                                <span class="fw-bold">LMS(학습관리시스템 : Learning Management System)</span> 는 고객사의 사이버 교육을 효과적으로 운영하고 관리할 수 있는 시스템입니다. <br />
                                가상 공간에서 학습자가 원하는 학습 진행을 위해서 관리자는 사전에 교육과정을 개설하고 교육에 필요한 제반 사항들을 설정함으로써, 수강신청을 통해 학습자가 학습에 참여하고,
                                학습자의 학습과정을 추적하고 학습이력을 관리하여 학습자 개인에 대한 맞춤형 학습을 지원합니다.<br />
                                또한 교강사는 학습자가 자기주도적 학습할 수 있도록 학급(반)편성, 협동학습, 출결관리, 성적관리, 학습독려, 게시판관리 등의 업무를 지원합니다. <br />
                                포씨소프트의 고도화된 LMS는 학습자의 개별학습을 위한 맞춤형 학습 환경을 효과적으로 구축할 수 있도록 지원합니다. <br />
                                <span class="fw-bold"> 안정성! 확장성! 최신 트랜드 기술!</span> <br />
                                통합적인 설계안을 마련하여 공공기관, 기업(연수원).대학교, 학원 등의 다양한 고객의 요구에 우호적으로 대응할 수 있으며, 컴포넌트 기반의 개발로 안정성 및 추가적인 개발에 대한 확장성이 용이하며, 최신 트랜드 기술(AJAX Toolkit)등의 도입으로 앞서가는 가상교육시스템을 구축할 수 있습니다.
                            </p>
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header fw-bold fs-2">서비스 구성도</div>
                        <img src="/fileUpload/assets/introduce/service_structure.png">
                        <div class="card-body">
                            <div class="row align-items-center">
                                <div class="col-3">
                                    <img src="/fileUpload/assets/introduce/effect.png" class="mb-2">
                                </div>
                                <div class="col-9">
                                    <p class="lh-lg mt-2">
                                        <span class="fw-bold">학습효과극대화</span> <br />
                                        학습자 패턴에 맞는 self-paced 학습이 가능하며, 이해하기 어려운 부분에 대해 충분히 이해할 수 있을때까지 반복학습이 가능하며 학습 종료 후에도 일정기간동안 재학습이 가능합니다.
                                        또한 실시간화상을 통하여 시공간적인 제약을 벗어나 면대면으로 학습이 가능합니다.
                                    </p>
                                </div>
                            </div>

                            <div class="row align-items-center">
                                <div class="col-3">
                                    <img src="/fileUpload/assets/introduce/professional.png" class="">
                                </div>
                                <div class="col-9">
                                    <p class="lh-lg mt-2">
                                        <span class="fw-bold">강사학습극대화</span> <br />
                                        개강일, 종강일, 시험, 과제, 토론 등의 학습자, 교강사 행위를 사전에 등록 관리함으로써, 학습자의 학습 몰입이 가능하며, 교강사의 학습지도 업무를 알려줍니다.
                                        또한 교강사가 직접 저작도구를 활용하여 저작한 콘텐츠를 등록하고 관리할 수 있습니다.
                                    </p>
                                </div>
                            </div>

                            <div class="row align-items-center">
                                <div class="col-3">
                                    <img src="/fileUpload/assets/introduce/several.png" class="">
                                </div>
                                <div class="col-9">
                                    <p class="lh-lg mt-2">
                                        <span class="fw-bold">다양한교육방식</span> <br />
                                        기존 교육의 단점을 보완하는 온ㆍ오프라인 통합교육지원 시스템으로 학습자, 강사, 관리자의 혼합형 교육 요구 충족함으로써, 오프라인과 웹 기반 수업의 연계할 수 있으며, 온라인과정, 집합과정, 우편과정, 블랜디드과정, 패키지 과정 등의 다양한 과정 등을 운영 가능합니다.
                                    </p>
                                </div>
                            </div>

                            <div class="row  align-items-center">
                                <div class="col-3">
                                    <img src="/fileUpload/assets/introduce/hard.png" class="">
                                </div>
                                <div class="col-9">
                                    <p class="lh-lg mt-2">
                                        <span class="fw-bold">강렬한평가</span> <br />
                                        문제은행 방식을 채택하여 다양한 문제유형 지원 및 문제의 재사용이 용이합니다.
                                        또한 기업에서 노동부 정책에 따른 배수출제의 편의성을 제공하며, 학원에서는 진단평가를 통한 학급배정의 편의성 제공합니다.
                                    </p>
                                </div>
                            </div>

                            <div class="row align-items-center">
                                <div class="col-3">
                                    <img src="/fileUpload/assets/introduce/operation.png" class="">
                                </div>
                                <div class="col-9">
                                    <p class="lh-lg mt-2">
                                        <span class="fw-bold">운영의 편리성</span> <br />
                                        직관적이고 체계적인으로 구성되어 있는 통합관리시스템을 제공함으로써 모든 작업을 손쉽게 빠르게 처리할 수 있으므로 최소의 관리인원으로 최대의 효과 성취할 수 있습니다.
                                        또한 위자드 업무 프로세스를 지원함으로써 현 업무 수행후 다음 업무를 알려줍니다.
                                    </p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>



        </div>

    </stripes:layout-component>

    <stripes:layout-component name="javascript">
        <script type="text/javascript">

        </script>
    </stripes:layout-component>

</stripes:layout-render>