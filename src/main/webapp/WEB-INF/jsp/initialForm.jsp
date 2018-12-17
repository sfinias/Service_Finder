<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file = "newHeader.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/register.css">
</head>
<body>
<div class="site-wrap">
    <%@include file = "navbarLogin.jsp" %>
    <div class="login-center site-blocks-cover overlay paddingExtra"
         style="background-image: url('${pageContext.request.contextPath}/dist/images/hero_1.jpg');"
         data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12" data-aos="fade">
                    <div class="login" id="card" style="width: auto">
                        <div class="front signin_form">
                            <h4 class="white-text">Login to Your Account</h4>
                            <spring:form class="login-form " method="post"
                                       action="${pageContext.request.contextPath}/home/checkLogin.htm"
                                       modelAttribute="user">

                                <div class="form-group">
                                    <div class="input-group">
                                        <spring:input path="email" id="emailLogin" type="email"
                                                    class="col-md-4 form-control placeHolderColor" required="required"
                                                    placeholder="Email"/>
                                        <span class="input-group-addon">
                                                <%--Icons--%>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <spring:input path="passwordConfirm" id="passwordLogin" type="password"
                                                      autocomplete="new-password"
                                                    class="col-md-4 form-control placeHolderColor" required="required"
                                                    placeholder="Password"/>
                                        <span class="input-group-addon">
                                                <%--Icons--%>
                                        </span>
                                    </div>
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox">Remember me next time.</label>
                                </div>

                                <div class="form-group sign-btn">
                                    <input type="submit" class="btn" value="Log in">
                                    <p><a href="${pageContext.request.contextPath}/home/forgotPassword.htm" class="forgot">Can't access your account?</a></p>
                                    <p><strong>New to ServiceFinder?</strong><br><a href="#" id="flip-btn"
                                                                                    class="signup signup_link light-green"
                                                                                    style="color: lawngreen">Sign
                                        up for a
                                        new account</a></p>
                                </div>
                            </spring:form>
                        </div>
                        <div class="back signup_form" style="opacity: 0;">
                            <h4 class="white-text">Sign Up for Your New Account</h4>
                            <spring:form class="login-form col s12" method="post" autocomplete="off"
                                       id="register-form"
                                       action="${pageContext.request.contextPath}/home/checkRegister.htm"
                                       modelAttribute="user2"
                                       accept-charset="UTF-8">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="text" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="First Name">--%>
                                                    <spring:input path="userEntity.firstName" id="firstName" type="text"
                                                                required="required"
                                                                class="form-control placeHolderColor"
                                                                placeholder="First Name"
                                                                name="firstName"
                                                                onkeypress="return blockSpecialChar(event)"/>
                                                        <%--<span class="input-group-addon">--%>
                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                                <spring:errors path="userEntity.firstName"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="text" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Last Name">--%>
                                                    <spring:input path="userEntity.lastName" id="lastName" type="text"
                                                                required="required"
                                                                class="form-control placeHolderColor"
                                                                placeholder="Last Name"
                                                                name="lastName"
                                                                onkeypress="return blockSpecialChar(event)"/>
                                                        <%--<span class="input-group-addon">--%>
                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                                <spring:errors path="userEntity.lastName"/>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="email" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Email">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <spring:input path="userEntity.email" id="email" type="email"
                                                                class="form-control placeHolderColor"
                                                                placeholder="Email"
                                                                name="email"
                                                                onkeyup='CheckEmail(); EnableEmail()'
                                                                required="required"/><br>
                                                    <spring:errors path="userEntity.email"/>

                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                            </div>
                                            <div id='message4'></div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="email" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Email Confirmation">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <spring:input path="userEntity.emailConfirm" id="emailConfirm"
                                                                name="email-confirm" type="email"
                                                                class="form-control placeHolderColor"
                                                                placeholder="Email Confirmation"
                                                                onkeyup='CheckEmail(); EnableEmail()'
                                                                required="required"/><br>

                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                                <div id='message1'></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="password" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Password">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <spring:input path="userEntity.passwordHash" id="pass" type="password"
                                                                class="form-control placeHolderColor password"
                                                                placeholder="Password"
                                                                name="password"
                                                                onkeyup='CheckPassword(); EnablePassword();'
                                                                required="required" pattern=".{8,50}"
                                                                title="8 to 50 characters"/><br>
                                                    <spring:errors path="userEntity.passwordHash"/>
                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="password" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Password Confirmation">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <spring:input path="userEntity.passwordConfirm" id="passwordConfirm"
                                                                name="password-confirm"
                                                                type="password"
                                                                class="form-control placeHolderColor password"
                                                                placeholder="Password Confirmation"
                                                                onkeyup='CheckPassword(); EnablePassword();'
                                                                required="required" pattern=".{8,50}"
                                                                title="8 to 50 characters"/><br>

                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                                <div id='message2'></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Mobile">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <spring:input path="phoneEntity.mobile" id="phone1" name="phone1"
                                                                class="form-control placeHolderColor" required="required"
                                                                pattern=".{10,16}" title="10 to 16 characters"
                                                                placeholder="Mobile" onkeypress="return blockSpecialCharForNumber(event)"/><br>
                                                    <spring:errors path="phoneEntity.mobile"/>
                                                        <%--Icons--%>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Landline">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <spring:input path="phoneEntity.landline" id="phone2" name="phone2"
                                                                class="form-control placeHolderColor"
                                                                pattern=".{10,16}" title="10 to 16 characters"
                                                                placeholder="Landline" onkeypress="return blockSpecialCharForNumber(event)"/><br>
                                                    <spring:errors path="phoneEntity.landline"/>
                                                        <%--Icons--%>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Address">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <spring:input path="addressEntity.address" id="address" name="address"
                                                                class="form-control placeHolderColor"
                                                                placeholder="Address"/>
                                                        <%--Icons--%>
                                                     <spring:input path="addressEntity.longit" id="long" name="lng" class="d-none" />
                                                     <spring:input path="addressEntity.latit" id="lat" name="lat" class="d-none" />
                                                            </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Address">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <h4 class="somePadding">I want to register as a        </h4>
                                                    <select class="form-control form-control-block" id="profselect" onchange="toggleField()" required>
                                                        <option value="User">User</option>
                                                        <option value="Professional">Professional</option>
                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Address">--%>
                                                        <%--<span class="input-group-addon">--%>
                                                    <h4 class="somePadding displayNone" >I am a(n)</h4>
                                                    <spring:select path="userEntity.professionId" id="professionId" class="form-control form-control-block displayNone"
                                                                 required="required">
                                                        <option class="options" id="defaultSelection" value="1" disabled hidden></option>
                                                        <c:forEach items="${allProfessions}" var="item">
                                                            <option class="options" value="${item.id}">${item.profession}</option>
                                                        </c:forEach>
                                                    </spring:select>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group sign-btn">
                                        <%--<input type="submit" class="btn" value="Sign up">--%>
                                    <center>
                                        <input type="submit" class="btn" name="actionRegister"
                                               id="actionRegister" onclick="checkBeforeSubmit(event) " value="Sign up">
                                        <div id='message5'></div>
                                        <br><br>
                                        <p>Do you already have an Account? <br>
                                            If so <a href="#" id="unflip-btn" class="signup light-green"
                                                     style="color: lawngreen">Log in</a>
                                        </p>
                                    </center>
                                </div>
                            </spring:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<%@include file = "footer.jsp" %>
<%@include file = "register.jsp" %>


<script src="${pageContext.request.contextPath}/dist/js/autocomplete.js" type="text/javascript" ></script>
</body>
</html>