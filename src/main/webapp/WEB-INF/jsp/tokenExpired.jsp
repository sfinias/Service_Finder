<%--
  Created by IntelliJ IDEA.
  User: tsamo
  Date: 07-Nov-18
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Token expired</title>
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
    <div class="form-container">
        <h3 class="red-text center" >Your link has expired or no longer exists</h3>
        <p>If you would like us to send you a new link to activate your account, please click the following link</p>
        <a href="${pageContext.request.contextPath}/verification/newActivationLink.htm">I want a new activation link</a>
    </div>
</div>
<div id="homebutton">
    <form action="${pageContext.request.contextPath}/user/initialForm.htm">
        <button class="home">Home</button>
    </form>
</div>
</body>
</html>

