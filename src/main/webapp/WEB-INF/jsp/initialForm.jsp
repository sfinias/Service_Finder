<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            background: #f5f5f5;
        }

        h5 {
            font-weight: 400;
        }

        .container {
            margin-top: 80px;
            width: 400px;
            height: 920px;
        }

        .tabs .active {
            background-color: red;
        }

        .form-container {
            padding: 40px;
            padding-top: 10px;
        }

        .home {
            background-color: red;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            border-color: red;
        }

        #homebutton {
            position: fixed;
            bottom: -4px;
            right: 10px;
        }

        a + a {
            margin-left: 30px;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</head>
<body>
<div class="container white z-depth-2">
    <ul class="tabs red">
        <li class="tab col s3"><a class="white-text active" href="#login" onclick="">login</a></li>
        <li class="tab col s3"><a class="white-text" href="#register">register</a></li>
    </ul>
    <div id="login" class="col s12">
        <spring:form class="col s12" method="post" action="${pageContext.request.contextPath}/user/checkLogin.htm" modelAttribute="user">
            <div class="form-container">
                <h3 class="red-text">Hello</h3>
                <div class="row">
                    <div class="input-field col s12">
                        <spring:input path="email" id="emailLogin" type="email" class="validate" required="required"/>
                        <spring:label path="email" for="emailLogin">Email</spring:label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <spring:input path="passwordConfirm" id="passwordLogin" type="password" class="validate"
                                    required="required"/>
                        <spring:label path="passwordConfirm" for="passwordLogin">Password</spring:label>
                    </div>
                </div>
                <br>
                <p>
                    <input type="checkbox" id="consent" onClick="EnableSubmit(this)"/>
                    <label for="consent">I consent to surrender all my personal data</label>
                </p>
                <center>
                    <button class="btn waves-effect waves-light red" type="submit" id="actionLogin" name="actionLogin"
                            disabled>Connect
                    </button>
                    <br>
                    <br>
                    <a href="${pageContext.request.contextPath}/user/forgotPassword.htm">Forgotten password?</a>
                </center>
            </div>
        </spring:form>
    </div>
    <div id="register" class="col s12">
        <spring:form class="col s12" method="post" action="${pageContext.request.contextPath}/user/checkRegister.htm" modelAttribute="user2"
                   accept-charset="UTF-8">
            <div class="form-container">
                <h3 class="red-text">Welcome</h3>
                <div class="row">
                    <div class="input-field col s6">
                        <spring:input path="userEntity.firstName" id="firstName" type="text" class="validate"
                                    required="required"
                                    onkeypress="return blockSpecialChar(event)"/>
                        <spring:label path="userEntity.firstName" for="firstName">First Name</spring:label>
                        <spring:errors path="userEntity.firstName"/>
                    </div>
                    <div class="input-field col s6">
                        <spring:input path="userEntity.lastName" id="lastName" type="text" class="validate"
                                    required="required"
                                    onkeypress="return blockSpecialChar(event)"/>
                        <spring:label path="userEntity.lastName" for="lastName">Last Name</spring:label>
                        <spring:errors path="userEntity.lastName"/>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <spring:input path="userEntity.email" id="email" type="email" class="validate"
                                    onkeyup='CheckEmail(); EnableSubmit2()' required="required"/>
                        <spring:label path="userEntity.email" for="email">Email</spring:label>
                        <span id='message3'></span>
                        <span id='message4'></span>
                        <spring:errors path="userEntity.email"/>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <spring:input path="userEntity.emailConfirm" id="emailConfirm" name="email-confirm" type="email"
                                    class="validate"
                                    onkeyup='CheckEmail(); EnableSubmit2()' required="required"/>
                        <spring:label path="userEntity.emailConfirm" for="emailConfirm">Email Confirmation</spring:label>
                        <span id='message1'></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <spring:input path="userEntity.passwordHash" id="pass" type="password" class="validate"
                                    onkeyup='CheckPassword(); EnableSubmit2();' required="required" pattern=".{8,50}"
                                    title="8 to 50 characters"/>
                        <spring:label path="userEntity.passwordHash" for="pass">Password</spring:label>
                        <spring:errors path="userEntity.passwordHash"/>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <spring:input path="userEntity.passwordConfirm" id="passwordConfirm" name="password-confirm"
                                    type="password"
                                    class="validate"
                                    onkeyup='CheckPassword(); EnableSubmit2();' required="required" pattern=".{8,50}"
                                    title="8 to 50 characters"/>
                        <spring:label path="userEntity.passwordConfirm"
                                    for="passwordConfirm">Password Confirmation</spring:label>
                        <span id='message2'></span>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <spring:input path="phoneEntity.mobile" id="phone1" name="phone1"
                                    class="validate"/>
                        <spring:label path="phoneEntity.mobile" for="phone1">Mobile</spring:label>
                        <spring:errors path="phoneEntity.mobile"/>
                    </div>
                    <div class="input-field col s6">
                        <spring:input path="phoneEntity.landline" id="phone2" name="phone2"
                                    class="validate"/>
                        <spring:label path="phoneEntity.landline" for="phone2">Landline</spring:label>
                        <spring:errors path="phoneEntity.landline"/>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <spring:input path="addressEntity.address" id="address" name="address"
                                    class="validate"/>
                        <spring:label path="addressEntity.address" for="address">Address</spring:label>
                    </div>
                </div>
                <center>
                    <button class="btn waves-effect waves-light red" type="submit" name="actionRegister"
                            id="actionRegister" disabled>Submit
                    </button>
                </center>
            </div>
        </spring:form>
    </div>
</div>
<div id="homebutton">
    <form action="${pageContext.request.contextPath}/user/initialForm.htm">
        <button class="home">Home</button>
    </form>
</div>
<script>
    EnableSubmit = function (val) {
        var sbmt = document.getElementById("actionLogin");

        if (val.checked === true) {
            sbmt.disabled = false;
        } else {
            sbmt.disabled = true;
        }
    };

    EnableSubmit2 = function () {
        var sbmt = document.getElementById("actionRegister");

        if (document.getElementById('email').value ===
            document.getElementById('emailConfirm').value &&
            document.getElementById('pass').value ===
            document.getElementById('passwordConfirm').value) {
            sbmt.disabled = false;
        } else {
            sbmt.disabled = true;
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

    function blockSpecialChar(e) {
        var k = e.charCode || e.keyCode;
        return ((k > 64 && k < 91) || ((k > 913 && k < 937) || ((k > 945 && k < 969) || (k > 96 && k < 123) || k === 8 || (k >= 48 && k <= 57))));
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
                    } else {
                        $.each(jsonobj, function (i, item) {
                            if (item === text) {
                                document.getElementById('message4').style.color = 'red';
                                document.getElementById('message4').innerHTML = 'E-mail already exists!!';
                            } else if (item !== text && count === jsonobj.length) {
                                document.getElementById('message4').style.color = 'green';
                                document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';
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
</body>
</html>