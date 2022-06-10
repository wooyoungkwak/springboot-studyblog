<%@ tag language="java" pageEncoding="UTF-8" body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ attribute name="searchName" type="java.lang.String" required="true"%>
<%@ attribute name="categories" type="java.lang.Object" required="true"%>
<%@ attribute name="sorts" type="java.lang.Object" required="true"%>
<%@ attribute name="categoryStr" type="java.lang.String" required="true"%>
<%@ attribute name="sortStr" type="java.lang.String" required="true"%>
<%@ attribute name="content" type="java.lang.String" required="true"%>
<%@ attribute name="isService" type="java.lang.Boolean" required="true"%>

<div class="row" id="link">
    <div class="col-2">
        <div class="input-group mb-3">
            <label class="input-group-text" for="category">필터</label>
            <select class="form-select category" aria-label="Default select example" id="category">
                <c:forEach varStatus="status" var="category" items="${categories}">
                    <option value="${category.key}" <c:if test="${categoryStr == category.key}">selected</c:if>>${category.value}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="col-2">
        <div class="input-group mb-3">
            <label class="input-group-text" for="sort">정렬</label>
            <select class="form-select sort" aria-label="Default select example" id="sort">
                <c:forEach varStatus="status" var="sort" items="${sorts}">
                    <option value="${sort.key}" <c:if test="${sortStr == sort.key}">selected</c:if>>${sort.value}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="col-8">
        <div class="input-group">
            <input class="form-control content" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="btnSearch" id="content" value="${content}"/>
            <button class="btn btn-primary search" id="btnSearch" type="button" searchName="${searchName}" >검색</button>
            <c:if test="${isService}">
                <a class="btn btn-primary register text-center ms-1 " id="btnRegister">등록</a>
            </c:if>
        </div>
    </div>
</div>