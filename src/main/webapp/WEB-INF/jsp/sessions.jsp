<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file="newHeader.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/profile.css">
</head>
<body style="background-image: url('${pageContext.request.contextPath}/dist/images/hero_1.jpg');" data-aos="fade"
      data-stellar-background-ratio="0.5">
<c:if test="${sessionScope.user.professionsEntity.id==1}">
    <%@include file="navbar.jsp" %>
</c:if>
<c:if test="${sessionScope.user.professionsEntity.id>1}">
    <%@include file="navbarProf.jsp" %>
</c:if>
<div class="site-wrap">
    <div class="row">
        <div class="col-md-6 mx-auto text-center mb-5 section-heading">
            <br>
            <h1 style=" color: azure">${message}</h1>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach items="${services}" var="item">
                <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="100">
                    <c:choose>
                    <c:when test="${professionId!=1}">
                    <a href="${pageContext.request.contextPath}/prof/servicesession.htm?sessionId=${item.id}"
                       class=" feature-item">
                        </c:when>
                        <c:otherwise>
                        <a href="${pageContext.request.contextPath}/user/servicesession.htm?sessionId=${item.id}"
                           class=" feature-item">
                            </c:otherwise>
                            </c:choose>
                            <div class="avatar-upload">
                                <div class="avatar-preview">
                                    <div id="imagePreview"
                                         style="background-image: url('https://www.agilysys.com/-/media/agilysys/Images/Product%20Pages/Professional%20Services/ProfServ-Hero.png?la=en');">
                                    </div>
                                </div>
                            </div>
                            <h2>${item.otherUser.userEntity.firstName} ${item.otherUser.userEntity.lastName}</h2>
                            <span class="counting">${item.startDate}</span>
                        </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <%@include file="footer.jsp" %>
</div>
</body>
</html>