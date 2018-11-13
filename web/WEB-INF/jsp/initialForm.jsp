<%--
  Created by IntelliJ IDEA.
  User: tsamo
  Date: 05-Nov-18
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <jsp:include page="form1.jsp"></jsp:include>
    <jsp:include page="form2.jsp"></jsp:include>
</div>
<div id="homebutton">
    <form action="/user/initialForm.htm">
        <button class="home">Home</button>
    </form>
</div>
<script>
    EnableSubmit = function (val) {
        var sbmt = document.getElementById("actionLogin");

        if (val.checked == true) {
            sbmt.disabled = false;
        }
        else {
            sbmt.disabled = true;
        }
    };

    EnableSubmit2 = function () {
        var sbmt = document.getElementById("actionRegister");

        if (document.getElementById('email').value ==
            document.getElementById('emailConfirm').value &&
            document.getElementById('pass').value ==
            document.getElementById('passwordConfirm').value) {
            sbmt.disabled = false;
        }
        else {
            sbmt.disabled = true;
        }
    };

    CheckEmail = function () {
        if (document.getElementById('email').value ==
            document.getElementById('emailConfirm').value) {
            document.getElementById('message1').style.color = 'green';
            document.getElementById('message1').innerHTML = 'E-mails match';
        } else {
            document.getElementById('message1').style.color = 'red';
            document.getElementById('message1').innerHTML = 'E-mails do not match';
        }
    };

    CheckPassword = function () {
        if (document.getElementById('pass').value ==
            document.getElementById('passwordConfirm').value) {
            document.getElementById('message2').style.color = 'green';
            document.getElementById('message2').innerHTML = 'Passwords match';
        } else {
            document.getElementById('message2').style.color = 'red';
            document.getElementById('message2').innerHTML = 'Passwords do not match';
        }
    };

    // function blockSpecialChar(e) {
    //     var k = e.keyCode;
    //     return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || (k >= 48 && k <= 57));
    // }
    //
    // $(document).ready(function () {
    //     $("#email").keyup(function () {
    //         var text = $(this).val();
    //         document.getElementById('message4').style.color = 'blue';
    //         document.getElementById('message4').innerHTML = 'Please allow some seconds to check the base';
    //         $.ajax({
    //             url: '/usersREST.htm',
    //             contentType: 'application/json',
    //             success: function (result) {
    //                 var jsonobj = $.parseJSON(result);
    //                 $.each(jsonobj, function (i, item) {
    //                     if (item == text) {
    //                         document.getElementById('message4').style.color = 'red';
    //                         document.getElementById('message4').innerHTML = 'E-mail already exists!!';
    //                     }
    //                     else {
    //                         document.getElementById('message4').style.color = 'green';
    //                         document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';
    //                     }
    //                 });
    //             }
    //         });
    //     });
    // });
</script>
</body>
</html>
