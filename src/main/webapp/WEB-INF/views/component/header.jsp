<%--
  Created by IntelliJ IDEA.
  User: zilet
  Date: 2022-04-03
  Time: 오후 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="border-bottom mb-4">

    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/fileUpload/assets/component/h1.png" class="d-block w-100 user-h" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="fw-bold lh-lg">학습효과극대화</h1>
                    <p class="h3">반복학습이 가능하며 학습 종료 후에도 일정기간동안 재학습이 가능합니다.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/fileUpload/assets/component/h2.png" class="d-block w-100 user-h" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="fw-bold lh-lg">강사학습극대화</h1>
                    <p class="h3">강사가 직접 저작도구를 활용하여 저작한 콘텐츠를 등록하고 관리할 수 있습니다.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/fileUpload/assets/component/h3.png" class="d-block w-100 user-h" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="fw-bold lh-lg">다양한교육방식</h1>
                    <p class="h3">온라인과정, 집합과정, 우편과정, 블랜디드과정, 패키지 과정 등의 다양한 과정 등을 운영 가능합니다.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="/fileUpload/assets/component/h4.png" class="d-block w-100 user-h" alt="...">
                <div class="carousel-caption d-none d-md-block">
                    <h1 class="fw-bold lh-lg">강렬한평가</h1>
                    <p class="h3">문제은행 방식을 채택하여 다양한 문제유형 지원 및 문제의 재사용이 용이합니다.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

</header>