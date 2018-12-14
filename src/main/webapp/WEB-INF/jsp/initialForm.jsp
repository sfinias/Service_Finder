<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file = "newHeader.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/register.css">
    <%--<meta charset="utf-8">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>

    <%--<link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700|Work+Sans:300,400,700" rel="stylesheet">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/fonts/icomoon/style.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/magnific-popup.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/jquery-ui.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/owl.carousel.min.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/owl.theme.default.min.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap-datepicker.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/animate.css">--%>
    <%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/fonts/flaticon/flaticon.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/aos.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/style.css">--%>
    <%--<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">--%>


</head>
<body>
<div class="site-wrap">
    <%@include file = "navbarLogin.jsp" %>
    <div class="login-center site-blocks-cover overlay"
         style="background-image: url('${pageContext.request.contextPath}/dist/images/hero_1.jpg');"
         data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12" data-aos="fade">
                    <div class="login" id="card" style="width: auto">
                        <div class="front signin_form">
                            <h4 class="white-text">Login to Your Account</h4>
                            <spring:form class="login-form " method="post" autocomplete="off"
                                       action="${pageContext.request.contextPath}/user/checkLogin.htm"
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
                            </spring:form>
                        </div>
                        <div class="back signup_form" style="opacity: 0;">
                            <h4 class="white-text">Sign Up for Your New Account</h4>
                            <spring:form class="login-form col s12" method="post" autocomplete="off"
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


    <%--<footer class="site-footer">--%>
        <%--<div class="container">--%>


            <%--<div class="row">--%>
                <%--<div class="col-md-4">--%>
                    <%--<h3 class="footer-heading mb-4 text-white">About</h3>--%>
                    <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat--%>
                        <%--amet.</p>--%>
                    <%--<p><a href="#" class="btn btn-primary pill text-white px-4">Read More</a></p>--%>
                <%--</div>--%>
                <%--<div class="col-md-6">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-md-6">--%>
                            <%--<h3 class="footer-heading mb-4 text-white">Quick Menu</h3>--%>
                            <%--<ul class="list-unstyled">--%>
                                <%--<li><a href="#">About</a></li>--%>
                                <%--<li><a href="#">Services</a></li>--%>
                                <%--<li><a href="#">Approach</a></li>--%>
                                <%--<li><a href="#">Sustainability</a></li>--%>
                                <%--<li><a href="#">News</a></li>--%>
                                <%--<li><a href="#">Careers</a></li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6">--%>
                            <%--<h3 class="footer-heading mb-4 text-white">Categories</h3>--%>
                            <%--<ul class="list-unstyled">--%>
                                <%--<li><a href="#">Full Time</a></li>--%>
                                <%--<li><a href="#">Freelance</a></li>--%>
                                <%--<li><a href="#">Temporary</a></li>--%>
                                <%--<li><a href="#">Internship</a></li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>


                <%--<div class="col-md-2">--%>
                    <%--<div class="col-md-12"><h3 class="footer-heading mb-4 text-white">Social Icons</h3></div>--%>
                    <%--<div class="col-md-12">--%>
                        <%--<p>--%>
                            <%--<a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>--%>
                            <%--<a href="#" class="p-2"><span class="icon-twitter"></span></a>--%>
                            <%--<a href="#" class="p-2"><span class="icon-instagram"></span></a>--%>
                            <%--<a href="#" class="p-2"><span class="icon-vimeo"></span></a>--%>

                        <%--</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row pt-5 mt-5 text-center">--%>
                <%--<div class="col-md-12">--%>
                    <%--<p>--%>
                        <%--<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->--%>
                        <%--Copyright &copy;--%>
                        <%--&lt;%&ndash;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<script>document.write(new Date().getFullYear());</script>&ndash;%&gt;--%>
                        <%--All Rights Reserved | This template is made with <i class="icon-heart text-warning"--%>
                                                                            <%--aria-hidden="true"></i> by <a--%>
                            <%--href="https://colorlib.com" target="_blank">Colorlib</a>--%>
                        <%--<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->--%>
                    <%--</p>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
    <%--</footer>--%>
</div>
<%@include file = "footer.jsp" %>
<%--<script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script>--%>
<%--<script src="https://terrylinooo.github.io/jquery.disableAutoFill/assets/js/jquery.disableAutoFill.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/dist/js/register.js" type="text/javascript" ></script>
<%--<script src="${pageContext.request.contextPath}/dist/js/jquery-3.3.1.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/jquery-migrate-3.0.1.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/jquery-ui.js"></script>--%>
<%--<script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script>--%>
<%--<script src="https://terrylinooo.github.io/jquery.disableAutoFill/assets/js/jquery.disableAutoFill.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/popper.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/owl.carousel.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/jquery.stellar.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/jquery.countdown.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/jquery.magnific-popup.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/bootstrap-datepicker.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/js/aos.js"></script>--%>


<%--<script src="${pageContext.request.contextPath}/dist/js/mediaelement-and-player.min.js"></script>--%>

<%--<script src="${pageContext.request.contextPath}/dist/js/main.js"></script>--%>


<%--<script>--%>
    <%--// document.addEventListener('DOMContentLoaded', function () {--%>
    <%--//     var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;--%>
    <%--//--%>
    <%--//     for (var i = 0; i < total; i++) {--%>
    <%--//         new MediaElementPlayer(mediaElements[i], {--%>
    <%--//             pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',--%>
    <%--//             shimScriptAccess: 'always',--%>
    <%--//             success: function () {--%>
    <%--//                 var target = document.body.querySelectorAll('.player'), targetTotal = target.length;--%>
    <%--//                 for (var j = 0; j < targetTotal; j++) {--%>
    <%--//                     target[j].style.visibility = 'visible';--%>
    <%--//                 }--%>
    <%--//             }--%>
    <%--//         });--%>
    <%--//     }--%>
    <%--// });--%>

    <%--var ajaxEnabled = true;--%>
    <%--var emailEnabled = true;--%>
    <%--var passwordEnabled = true;--%>
    <%--var enabled = true;--%>

    <%--EnableSubmit = function (val) {--%>
        <%--var sbmt = document.getElementById("actionLogin");--%>

        <%--if (val.checked === true) {--%>
            <%--sbmt.disabled = false;--%>
        <%--} else {--%>
            <%--sbmt.disabled = true;--%>
        <%--}--%>
    <%--};--%>

    <%--EnableEmail = function () {--%>
        <%--document.getElementById('message5').innerHTML = '';--%>
        <%--if (document.getElementById('email').value ===--%>
            <%--document.getElementById('emailConfirm').value) {--%>
            <%--emailEnabled = true;--%>
        <%--} else {--%>
            <%--emailEnabled = false;--%>
        <%--}--%>
    <%--};--%>

    <%--EnablePassword = function () {--%>
        <%--document.getElementById('message5').innerHTML = '';--%>
        <%--if (document.getElementById('pass').value ===--%>
            <%--document.getElementById('passwordConfirm').value) {--%>
            <%--passwordEnabled = true;--%>
        <%--} else {--%>
            <%--passwordEnabled = false;--%>
        <%--}--%>
    <%--};--%>

    <%--CheckEmail = function () {--%>
        <%--if (document.getElementById('email').value ===--%>
            <%--document.getElementById('emailConfirm').value) {--%>
            <%--document.getElementById('message1').style.color = 'green';--%>
            <%--document.getElementById('message1').innerHTML = 'E-mails match';--%>
        <%--} else {--%>
            <%--document.getElementById('message1').style.color = 'red';--%>
            <%--document.getElementById('message1').innerHTML = 'E-mails do not match';--%>
        <%--}--%>
    <%--};--%>

    <%--CheckPassword = function () {--%>
        <%--if (document.getElementById('pass').value ===--%>
            <%--document.getElementById('passwordConfirm').value) {--%>
            <%--document.getElementById('message2').style.color = 'green';--%>
            <%--document.getElementById('message2').innerHTML = 'Passwords match';--%>
        <%--} else {--%>
            <%--document.getElementById('message2').style.color = 'red';--%>
            <%--document.getElementById('message2').innerHTML = 'Passwords do not match';--%>
        <%--}--%>
    <%--};--%>

    <%--// changeColour=function(e){--%>
    <%--//     alert("1st in");--%>
    <%--//     var a=document.getElementsByName("professionalSelection").item(0);--%>
    <%--//     if(a.value==="true"){--%>
    <%--//         alert("2nd in");--%>
    <%--//         $("#proftrue").css("color","greenyellow !important");--%>
    <%--//         $("#proffalse").css("color","white");--%>
    <%--//     }--%>
    <%--//     else if(a.value==="false"){--%>
    <%--//         alert("3rd in");--%>
    <%--//         $("#proftrue").css("color","white");--%>
    <%--//         $("#proffalse").css("color","greenyellow");--%>
    <%--//     }--%>
    <%--// };--%>

    <%--toggleField=function(){--%>
        <%--var a=$("#profselect").val();--%>
        <%--if(a==="User"){--%>
            <%--$("#address").removeAttr("required");--%>
            <%--$(".displayNone").hide();--%>
            <%--SelectElement("professionId",1);--%>
            <%--// alert($("#professionId").val());--%>
        <%--}--%>
        <%--else if(a==="Professional"){--%>
            <%--// alert($("#professionId").val());--%>
            <%--$("#address").attr("required","required");--%>
            <%--$(".displayNone").show();--%>
        <%--}--%>
    <%--};--%>



    <%--function SelectElement(id, valueToSelect)--%>
    <%--{--%>
        <%--var element = document.getElementById(id);--%>
        <%--element.value = valueToSelect;--%>
    <%--}--%>

    <%--// $('#register-form').disableAutoFill({--%>
    <%--//     passwordField: '.password',--%>
    <%--//     debugMode: false,--%>
    <%--//     randomizeInputName: true,--%>
    <%--//     html5FormValidate: true--%>
    <%--// });--%>

    <%--function blockSpecialChar(e) {--%>
        <%--var k = e.charCode || e.keyCode;--%>
        <%--return ((k > 64 && k < 91) || ((k > 903 && k < 975) || (k > 96 && k < 123) || k === 8 || k === 902));--%>
    <%--}--%>

    <%--function blockSpecialCharForNumber(e) {--%>
        <%--var k = e.charCode || e.keyCode;--%>
        <%--return ((k > 47 && k < 58) || k === 43);--%>
    <%--}--%>

    <%--function checkBeforeSubmit(event) {--%>
        <%--enabled2 = ((emailEnabled && passwordEnabled) && ajaxEnabled);--%>
        <%--if (enabled2 !== true) {--%>
            <%--event.preventDefault();--%>
            <%--document.getElementById('message5').style.color = 'red';--%>
            <%--document.getElementById('message5').innerHTML = 'Please check the data you submitted';--%>
        <%--}--%>
    <%--}--%>

    <%--$(document).ready(function () {--%>
        <%--$("#email").keyup(function () {--%>

            <%--var text = $(this).val();--%>
            <%--document.getElementById('message4').style.color = 'blue';--%>
            <%--document.getElementById('message4').innerHTML = 'Please allow some seconds to check the database';--%>
            <%--$.ajax({--%>
                <%--url: '${pageContext.request.contextPath}/usersREST.htm',--%>
                <%--contentType: 'application/json',--%>
                <%--success: function (result) {--%>
                    <%--var jsonobj = $.parseJSON(result);--%>
                    <%--count = 1;--%>
                    <%--if (jsonobj.length === 0) {--%>
                        <%--document.getElementById('message4').style.color = 'green';--%>
                        <%--document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';--%>
                        <%--ajaxEnabled = true;--%>
                    <%--} else {--%>
                        <%--$.each(jsonobj, function (i, item) {--%>
                            <%--if (item === text) {--%>
                                <%--document.getElementById('message4').style.color = 'red';--%>
                                <%--document.getElementById('message4').innerHTML = 'E-mail already exists!!';--%>
                                <%--ajaxEnabled = false;--%>
                            <%--} else if (item !== text && count === jsonobj.length) {--%>
                                <%--document.getElementById('message4').style.color = 'green';--%>
                                <%--document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';--%>
                                <%--ajaxEnabled = true;--%>
                            <%--} else if (item !== text && count < jsonobj.length) {--%>
                                <%--count = count + 1;--%>
                            <%--}--%>
                        <%--});--%>
                    <%--}--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>
<%--</script>--%>


<%--<script>--%>

    <%--$().ready(function () {--%>
        <%--$("#card").flip({--%>
            <%--trigger: 'manual'--%>
        <%--});--%>
    <%--});--%>


    <%--$(".signup_link").click(function () {--%>

        <%--$(".signin_form").css('opacity', '0');--%>
        <%--$(".signup_form").css('opacity', '100');--%>


        <%--$("#card").flip(true);--%>

        <%--return false;--%>
    <%--});--%>

    <%--$("#unflip-btn").click(function () {--%>

        <%--$(".signin_form").css('opacity', '100');--%>
        <%--$(".signup_form").css('opacity', '0');--%>

        <%--$("#card").flip(false);--%>

        <%--return false;--%>

    <%--});--%>
<%--</script>--%>

<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&libraries=places&callback=initAutocomplete"--%>
<%--async defer></script>--%>

</body>
</html>