<%--
  Created by IntelliJ IDEA.
  User: tsamo
  Date: 07-Nov-18
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        body {
            background: #f5f5f5;
        }

        h5 {
            font-weight: 400;
        }

        .form-container {
            padding: 40px;
            padding-top: 10px;
        }

        .home {
            background-color : red;
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

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</head>
<body>

<div id="login" class="col s12">
    <form:form class="col s12" method="post" action="${pageContext.request.contextPath}/user/resetPassword.htm" modelAttribute="user">
        <div class="form-container">
            <h3 class="red-text">Forgot password</h3>
            <h5 class="red-text">An email will be sent to your email, with a link to reset your password</h5>
            <div class="row">
                <div class="input-field col s12">
                    <form:input path="email" id="email" type="email" class="validate" required="required"/>
                    <form:label path="email" for="email">Email</form:label>
                </div>
            </div>
            <br>
            <center>
                <button class="btn waves-effect waves-light red" type="submit" id="actionLogin" name="actionLogin">
                    Submit
                </button>
                <br>
                <br>
            </center>
        </div>
    </form:form>
</div>
<div id="homebutton">
    <form action="${pageContext.request.contextPath}/user/initialForm.htm">
        <button class="home">Home</button>
    </form>
</div>
</body>
</html>