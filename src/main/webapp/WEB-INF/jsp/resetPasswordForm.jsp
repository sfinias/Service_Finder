<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file = "newHeader.jsp" %>
</head>
<body>
<div class="site-wrap">
    <%@include file = "navbarLogin.jsp" %>
    <div class="site-blocks-cover overlay" style="background-image: url('${pageContext.request.contextPath}/dist/images/hero_1.jpg');" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12" data-aos="fade">
                    <h1>Find Service</h1>
                    <form action="#">
                        <spring:form method="post" action="${pageContext.request.contextPath}/home/changePassword.htm" modelAttribute="user">
                            <div class="row mb-3">
                                <div class="col-md-9">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <%--<select class="mr-3 form-control border-0 px-4" id="pro" name="pro">--%>
                                                <%--<option selected>Choose Service...</option>--%>
                                                <%--<c:forEach items="${allProfessions}" var="item">--%>
                                                    <%--<option value="${item.id}">${item.profession}</option>--%>
                                                <%--</c:forEach>--%>
                                            <%--</select>--%>
                                            <spring:input path="email" id="email" type="email" class="mr-3 form-control border-0 px-4" required="required"/>
                                            <spring:label path="email" for="email">Email</spring:label>
                                        </div>
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <div class="input-wrap">
                                                <a href="" class="icon icon-room" id="loc"></a>
                                                <%--<input type="text" class="form-control form-control-block search-input  border-0 px-4" id="address" placeholder="city, province or region" required>--%>
                                                <%--<input type="number" class="d-none" name="long" id="long" required>--%>
                                                <%--<input type="number" class="d-none" name="lat" id="lat" required>--%>
                                                <spring:input path="passwordConfirm" id="password" type="password" class="form-control form-control-block search-input  border-0 px-4" required="required" pattern=".{8,50}" title="8 to 50 characters"/>
                                                <spring:label path="passwordConfirm" for="password">New password</spring:label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-search btn-primary btn-block" id="search">Confirm</button>
                                </div>
                            </div>
                        </spring:form>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%@include file = "footer.jsp" %>
</body>
</html>






<%--<form:form class="col s12" method="post" action="${pageContext.request.contextPath}/user/changePassword.htm" modelAttribute="user">--%>
    <%--<div class="form-container">--%>
        <%--<h3 class="red-text">Reset Password</h3>--%>
        <%--<div class="row">--%>
            <%--<div class="input-field col s12">--%>
                <%--<form:input path="email" id="email" type="email" class="validate" required="required"/>--%>
                <%--<form:label path="email" for="email">Email</form:label>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<div class="input-field col s12">--%>
                <%--<form:input path="passwordConfirm" id="password" type="password" class="validate" required="required" pattern=".{8,50}" title="8 to 50 characters"/>--%>
                <%--<form:label path="passwordConfirm" for="password">New password</form:label>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<br>--%>
        <%--<center>--%>
            <%--<button class="btn waves-effect waves-light red" type="submit" id="actionLogin" name="actionLogin">--%>
                <%--Submit--%>
            <%--</button>--%>
            <%--<br>--%>
            <%--<br>--%>
        <%--</center>--%>
    <%--</div>--%>
<%--</form:form>--%>