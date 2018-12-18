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
                    <h1>Forgot Password</h1>
                    <h3 class="text-white">An email will be sent to your email, with a link to reset your password</h3>
                    <form action="#">
                        <spring:form method="post" action="${pageContext.request.contextPath}/home/resetPassword.htm" modelAttribute="user">
                            <div class="row mb-3">
                                <div class="col-md-9">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <spring:input path="email" id="email" type="email" class="mr-3 form-control border-0 px-4" required="required"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-search btn-primary btn-block">Activate</button>
                                </div>
                            </div>
                        </spring:form>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file = "footer.jsp" %>
</body>
</html>


<%--<form:form class="col s12" method="post" action="${pageContext.request.contextPath}/user/resetPassword.htm" modelAttribute="user">--%>
    <%--<div class="form-container">--%>
        <%--<h3 class="red-text">Forgot password</h3>--%>
        <%--<h5 class="red-text">An email will be sent to your email, with a link to reset your password</h5>--%>
        <%--<div class="row">--%>
            <%--<div class="input-field col s12">--%>
                <%--<form:input path="email" id="email" type="email" class="validate" required="required"/>--%>
                <%--<form:label path="email" for="email">Email</form:label>--%>
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