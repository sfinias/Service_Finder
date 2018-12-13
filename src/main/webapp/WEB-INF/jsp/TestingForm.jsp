<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Service Finder &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700|Work+Sans:300,400,700" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fonts/flaticon/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">


    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:400,900,700,500,300,100);
        @import url(https://fonts.googleapis.com/css?family=Raleway:400,500);
        @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css);

        html, body {
            height: 100%;
            width: 100%;
        }

        body {
            font-family: 'Raleway', sans-serif;
            position: relative;
            /*background: rgba(0, 0, 0, 0) url("../img/ptn.png") repeat scroll 0 0;*/
        }

        a {
            color: green;
        }

        a:hover, a:focus {
            color: green;
        }

        .btn-green {
            background-color: green;
            color: #fff;
        }

        .btn-green:hover {
            color: #fff;
            opacity: 0.9;
        }

        .form-control:focus {
            border-color: green;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(24, 204, 162, 0.6);
            outline: 0 none;
        }

        .min-height {
            min-height: 380px;
        }

        .login-center {
            text-align: left;
        }

        .login {
            width: 320px;
            color: #fff;
        }

        .login .login-form {
            text-align: left;
        }

        .login label {
            color: #fff;
        }

        .login-form .input-group .form-control {
            background: none;
            height: 44px;
            color: #ddd;
        }

        .login-form .input-group .input-group-addon {
            background: none;
        }

        .login-form .input-group .input-group-addon .glyphicon {
            color: green;
        }

        .login-form .input-group .form-control::-moz-placeholder {
            color: #fff;
            opacity: 0.3;
        }

        .login .sign-btn input.btn {
            background: green;
            border-color: green;
            color: #fff;
            width: 180px;
        }

        .login .sign-btn a {
            text-decoration: none;
        }

        .login .checkbox {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .login .forgot {
            display: inline-block;
            margin: 20px 0;
        }

        .placeHolderColor::-webkit-input-placeholder {
            color: #d4d0d2;
        }

        .placeHolderColor:-moz-placeholder {
            color: #d4d0d2;

        }

        .placeHolderColor::-moz-placeholder {
            color: #d4d0d2;

        }

        .placeHolderColor:-moz-placeholder {
            color: #d4d0d2;
        }

        .white-text {
            color: white !important;
            color: white !important;
        }

        .light-green {
            color: greenyellow;
        }

        .halfOpacity {
            opacity: 0.4 !important;
        }

        h4 {
            color: white;
        }

        .somePadding {
            padding-top: 5px;
            padding-right: 40px;
        }

        .displayNone{
            display: none;
        }

    </style>
</head>
<body>
<div class="site-wrap">

    <div class="site-mobile-menu">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->


    <div class="site-navbar-wrap js-site-navbar bg-white">

        <div class="container">
            <div class="site-navbar bg-light">
                <div class="py-1">
                    <div class="row align-items-center">
                        <div class="col-2">
                            <h2 class="mb-0 site-logo"><a href="index.html">Service<strong
                                    class="font-weight-bold">Finder</strong> </a></h2>
                        </div>
                        <div class="col-10">
                            <nav class="site-navigation text-right" role="navigation">
                                <div class="container">
                                    <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#"
                                                                                                  class="site-menu-toggle js-menu-toggle text-black"><span
                                            class="icon-menu h3"></span></a></div>

                                    <ul class="site-menu js-clone-nav d-none d-lg-block">
                                        <li><a href="categories.html">For Candidates</a></li>
                                        <li class="has-children">
                                            <a href="category.html">For Employees</a>
                                            <ul class="dropdown arrow-top">
                                                <li><a href="category.html">Category</a></li>
                                                <li><a href="#">Browse Candidates</a></li>
                                                <li><a href="new-post.html">Post a Job</a></li>
                                                <li><a href="#">Employeer Profile</a></li>
                                                <li class="has-children">
                                                    <a href="#">More Links</a>
                                                    <ul class="dropdown">
                                                        <li><a href="#">Browse Candidates</a></li>
                                                        <li><a href="#">Post a Job</a></li>
                                                        <li><a href="#">Employeer Profile</a></li>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </li>
                                        <li class="active"><a href="contact.html">Contact</a></li>
                                        <li><a href="new-post.html"><span
                                                class="bg-primary text-white py-3 px-4 rounded"><span
                                                class="icon-plus mr-3"></span>Post New Job</span></a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="height: 113px;"></div>

    <%--<div class="unit-5 overlay" style="background-image: url('${pageContext.request.contextPath}/resources/images/hero_1.jpg');">--%>
    <%--<div class="container text-center">--%>
    <%--</div>--%>
    <%--</div>--%>

    <div class="login-center site-blocks-cover overlay"
         style="background-image: url('${pageContext.request.contextPath}/resources/images/hero_1.jpg');"
         data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12" data-aos="fade">
                    <div class="login" id="card" style="width: auto">
                        <div class="front signin_form">
                            <h4 class="white-text">Login to Your Account</h4>
                            <form:form class="login-form " method="post" autocomplete="off"
                                       action="${pageContext.request.contextPath}/user/checkLogin.htm"
                                       modelAttribute="user">

                                <div class="form-group">
                                    <div class="input-group">
                                        <form:input path="email" id="emailLogin" type="email"
                                                    class="col-md-4 form-control placeHolderColor" required="required"
                                                    placeholder="Email"/>
                                        <span class="input-group-addon">
                                                <%--Icons--%>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <form:input path="passwordConfirm" id="passwordLogin" type="password"
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
                                    <p><a href="#" class="forgot">Can't access your account?</a></p>
                                    <p><strong>New to ServiceFinder?</strong><br><a href="#" id="flip-btn"
                                                                                    class="signup signup_link light-green"
                                                                                    style="color: lawngreen">Sign
                                        up for a
                                        new account</a></p>
                                </div>
                            </form:form>
                        </div>
                        <div class="back signup_form" style="opacity: 0;">
                            <h4 class="white-text">Sign Up for Your New Account</h4>
                            <form:form class="login-form col s12" method="post" autocomplete="off"
                                       id="register-form"
                                       action="${pageContext.request.contextPath}/user/checkRegister.htm"
                                       modelAttribute="user2"
                                       accept-charset="UTF-8">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="text" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="First Name">--%>
                                                    <form:input path="userEntity.firstName" id="firstName" type="text"
                                                                required="required"
                                                                class="form-control placeHolderColor"
                                                                placeholder="First Name"
                                                                name="firstName"
                                                                onkeypress="return blockSpecialChar(event)"/>
                                                        <%--<span class="input-group-addon">--%>
                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                                <form:errors path="userEntity.firstName"/>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="input-group">
                                                        <%--<input type="text" class="form-control placeHolderColor"--%>
                                                        <%--placeholder="Last Name">--%>
                                                    <form:input path="userEntity.lastName" id="lastName" type="text"
                                                                required="required"
                                                                class="form-control placeHolderColor"
                                                                placeholder="Last Name"
                                                                name="lastName"
                                                                onkeypress="return blockSpecialChar(event)"/>
                                                        <%--<span class="input-group-addon">--%>
                                                        <%--Icons--%>
                                                        <%--</span>--%>
                                                </div>
                                                <form:errors path="userEntity.lastName"/>
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
                                                    <form:input path="userEntity.email" id="email" type="email"
                                                                class="form-control placeHolderColor"
                                                                placeholder="Email"
                                                                name="email"
                                                                onkeyup='CheckEmail(); EnableEmail()'
                                                                required="required"/><br>
                                                    <form:errors path="userEntity.email"/>

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
                                                    <form:input path="userEntity.emailConfirm" id="emailConfirm"
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
                                                    <form:input path="userEntity.passwordHash" id="pass" type="password"
                                                                class="form-control placeHolderColor password"
                                                                placeholder="Password"
                                                                name="password"
                                                                onkeyup='CheckPassword(); EnablePassword();'
                                                                required="required" pattern=".{8,50}"
                                                                title="8 to 50 characters"/><br>
                                                    <form:errors path="userEntity.passwordHash"/>
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
                                                    <form:input path="userEntity.passwordConfirm" id="passwordConfirm"
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
                                                    <form:input path="phoneEntity.mobile" id="phone1" name="phone1"
                                                                class="form-control placeHolderColor" required="required"
                                                                pattern=".{10,16}" title="10 to 16 characters"
                                                                placeholder="Mobile" onkeypress="return blockSpecialCharForNumber(event)"/><br>
                                                    <form:errors path="phoneEntity.mobile"/>
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
                                                    <form:input path="phoneEntity.landline" id="phone2" name="phone2"
                                                                class="form-control placeHolderColor"
                                                                pattern=".{10,16}" title="10 to 16 characters"
                                                                placeholder="Landline" onkeypress="return blockSpecialCharForNumber(event)"/><br>
                                                    <form:errors path="phoneEntity.landline"/>
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
                                                    <form:input path="addressEntity.address" id="address" name="address"
                                                                class="form-control placeHolderColor"
                                                                placeholder="Address"/>
                                                        <%--Icons--%>
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
                                                    <form:select path="userEntity.professionId" id="professionId" class="form-control form-control-block displayNone"
                                                                 required="required">
                                                        <option class="options" id="defaultSelection" value="1" hidden></option>
                                                        <c:forEach items="${allProfessions}" var="item">
                                                            <option class="options" value="${item.id}">${item.profession}</option>
                                                        </c:forEach>
                                                    </form:select>

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
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer class="site-footer">
        <div class="container">


            <div class="row">
                <div class="col-md-4">
                    <h3 class="footer-heading mb-4 text-white">About</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat
                        amet.</p>
                    <p><a href="#" class="btn btn-primary pill text-white px-4">Read More</a></p>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="footer-heading mb-4 text-white">Quick Menu</h3>
                            <ul class="list-unstyled">
                                <li><a href="#">About</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Approach</a></li>
                                <li><a href="#">Sustainability</a></li>
                                <li><a href="#">News</a></li>
                                <li><a href="#">Careers</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h3 class="footer-heading mb-4 text-white">Categories</h3>
                            <ul class="list-unstyled">
                                <li><a href="#">Full Time</a></li>
                                <li><a href="#">Freelance</a></li>
                                <li><a href="#">Temporary</a></li>
                                <li><a href="#">Internship</a></li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="col-md-2">
                    <div class="col-md-12"><h3 class="footer-heading mb-4 text-white">Social Icons</h3></div>
                    <div class="col-md-12">
                        <p>
                            <a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>
                            <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                            <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                            <a href="#" class="p-2"><span class="icon-vimeo"></span></a>

                        </p>
                    </div>
                </div>
            </div>
            <div class="row pt-5 mt-5 text-center">
                <div class="col-md-12">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <%--<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>--%>
                        <%--<script>document.write(new Date().getFullYear());</script>--%>
                        All Rights Reserved | This template is made with <i class="icon-heart text-warning"
                                                                            aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>

            </div>
        </div>
    </footer>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script>
<script src="https://terrylinooo.github.io/jquery.disableAutoFill/assets/js/jquery.disableAutoFill.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>


<script src="${pageContext.request.contextPath}/resources/js/mediaelement-and-player.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


<script>
    // document.addEventListener('DOMContentLoaded', function () {
    //     var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;
    //
    //     for (var i = 0; i < total; i++) {
    //         new MediaElementPlayer(mediaElements[i], {
    //             pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
    //             shimScriptAccess: 'always',
    //             success: function () {
    //                 var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
    //                 for (var j = 0; j < targetTotal; j++) {
    //                     target[j].style.visibility = 'visible';
    //                 }
    //             }
    //         });
    //     }
    // });

    var ajaxEnabled = true;
    var emailEnabled = true;
    var passwordEnabled = true;
    var enabled = true;

    EnableSubmit = function (val) {
        var sbmt = document.getElementById("actionLogin");

        if (val.checked === true) {
            sbmt.disabled = false;
        } else {
            sbmt.disabled = true;
        }
    };

    EnableEmail = function () {
        document.getElementById('message5').innerHTML = '';
        if (document.getElementById('email').value ===
            document.getElementById('emailConfirm').value) {
            emailEnabled = true;
        } else {
            emailEnabled = false;
        }
    };

    EnablePassword = function () {
        document.getElementById('message5').innerHTML = '';
        if (document.getElementById('pass').value ===
            document.getElementById('passwordConfirm').value) {
            passwordEnabled = true;
        } else {
            passwordEnabled = false;
        }
    };

    CheckEmail = function () {
        if (document.getElementById('email').value ===
            document.getElementById('emailConfirm').value) {
            document.getElementById('message1').style.color = 'green';
            document.getElementById('message1').innerHTML = 'E-mails match';
        } else {
            document.getElementById('message1').style.color = 'red';
            document.getElementById('message1').innerHTML = 'E-mails do not match';
        }
    };

    CheckPassword = function () {
        if (document.getElementById('pass').value ===
            document.getElementById('passwordConfirm').value) {
            document.getElementById('message2').style.color = 'green';
            document.getElementById('message2').innerHTML = 'Passwords match';
        } else {
            document.getElementById('message2').style.color = 'red';
            document.getElementById('message2').innerHTML = 'Passwords do not match';
        }
    };

    // changeColour=function(e){
    //     alert("1st in");
    //     var a=document.getElementsByName("professionalSelection").item(0);
    //     if(a.value==="true"){
    //         alert("2nd in");
    //         $("#proftrue").css("color","greenyellow !important");
    //         $("#proffalse").css("color","white");
    //     }
    //     else if(a.value==="false"){
    //         alert("3rd in");
    //         $("#proftrue").css("color","white");
    //         $("#proffalse").css("color","greenyellow");
    //     }
    // };

    toggleField=function(){
        var a=$("#profselect").val();
        if(a==="User"){
            $("#address").removeAttr("required");
            $(".displayNone").hide();
            SelectElement("professionId",1);
            // alert($("#professionId").val());
        }
        else if(a==="Professional"){
            // alert($("#professionId").val());
            $("#address").attr("required","required");
            $(".displayNone").show();
        }
    };



    function SelectElement(id, valueToSelect)
    {
        var element = document.getElementById(id);
        element.value = valueToSelect;
    }

    // $('#register-form').disableAutoFill({
    //     passwordField: '.password',
    //     debugMode: false,
    //     randomizeInputName: true,
    //     html5FormValidate: true
    // });

    function blockSpecialChar(e) {
        var k = e.charCode || e.keyCode;
        return ((k > 64 && k < 91) || ((k > 903 && k < 975) || (k > 96 && k < 123) || k === 8 || k === 902));
    }

    function blockSpecialCharForNumber(e) {
        var k = e.charCode || e.keyCode;
        return ((k > 47 && k < 58) || k === 43);
    }

    function checkBeforeSubmit(event) {
        enabled2 = ((emailEnabled && passwordEnabled) && ajaxEnabled);
        if (enabled2 !== true) {
            event.preventDefault();
            document.getElementById('message5').style.color = 'red';
            document.getElementById('message5').innerHTML = 'Please check the data you submitted';
        }
    }

    $(document).ready(function () {
        $("#email").keyup(function () {

            var text = $(this).val();
            document.getElementById('message4').style.color = 'blue';
            document.getElementById('message4').innerHTML = 'Please allow some seconds to check the database';
            $.ajax({
                url: '${pageContext.request.contextPath}/usersREST.htm',
                contentType: 'application/json',
                success: function (result) {
                    var jsonobj = $.parseJSON(result);
                    count = 1;
                    if (jsonobj.length === 0) {
                        document.getElementById('message4').style.color = 'green';
                        document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';
                        ajaxEnabled = true;
                    } else {
                        $.each(jsonobj, function (i, item) {
                            if (item === text) {
                                document.getElementById('message4').style.color = 'red';
                                document.getElementById('message4').innerHTML = 'E-mail already exists!!';
                                ajaxEnabled = false;
                            } else if (item !== text && count === jsonobj.length) {
                                document.getElementById('message4').style.color = 'green';
                                document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';
                                ajaxEnabled = true;
                            } else if (item !== text && count < jsonobj.length) {
                                count = count + 1;
                            }
                        });
                    }
                }
            });
        });
    });
</script>


<script>
    // This example displays an address form, using the autocomplete feature
    // of the Google Places API to help users fill in the information.

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

    var placeSearch, autocomplete;
    var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
    };

    // function initAutocomplete() {
    //     // Create the autocomplete object, restricting the search to geographical
    //     // location types.
    //     autocomplete = new google.maps.places.Autocomplete(
    //         /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
    //         {types: ['geocode']});
    //
    //     // When the user selects an address from the dropdown, populate the address
    //     // fields in the form.
    //     autocomplete.addListener('place_changed', fillInAddress);
    // }

    function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
            document.getElementById(component).value = '';
            document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
            var addressType = place.address_components[i].types[0];
            if (componentForm[addressType]) {
                var val = place.address_components[i][componentForm[addressType]];
                document.getElementById(addressType).value = val;
            }
        }
    }

    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    function geolocate() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var geolocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var circle = new google.maps.Circle({
                    center: geolocation,
                    radius: position.coords.accuracy
                });
                autocomplete.setBounds(circle.getBounds());
            });
        }
    }


    $().ready(function () {
        $("#card").flip({
            trigger: 'manual'
        });
    });


    $(".signup_link").click(function () {

        $(".signin_form").css('opacity', '0');
        $(".signup_form").css('opacity', '100');


        $("#card").flip(true);

        return false;
    });

    $("#unflip-btn").click(function () {

        $(".signin_form").css('opacity', '100');
        $(".signup_form").css('opacity', '0');

        $("#card").flip(false);

        return false;

    });
</script>

<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&libraries=places&callback=initAutocomplete"--%>
<%--async defer></script>--%>

</body>
</html>