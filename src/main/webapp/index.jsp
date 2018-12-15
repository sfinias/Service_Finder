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
  <title>Welcome</title>
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
      background-color: red;
      color: white;
      padding: 10px 20px;
      border-radius: 4px;
      border-color: red;
    }

    #homebutton {
      position: fixed;
      bottom: 50%;
      left: 45%;
      width: 180px;
      height: 80px;
    }
  </style>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/css/materialize.min.css">
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.5/js/materialize.min.js"></script>
</head>
<body>
<div id="login" class="col s12">
  <div class="form-container">
    <div>
      <h3 class="red-text center ">
        Welcome!! Push Start to go to the Home menu.
      </h3>
      <a href="${pageContext.request.contextPath}/home/testing.htm">Testing Form</a>
      <form action="${pageContext.request.contextPath}/home/initialForm.htm">
        <button id="homebutton" class="home">Start</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>