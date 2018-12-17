<%--
  Created by IntelliJ IDEA.
  User: tsamo
  Date: 14-Dec-18
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TestingWEBSocket</title>
</head>
<body>
<div id="container">
    <div id="loginPanel">
        <div id="infoLabel">Type a name to join the room</div>
        <div style="padding: 10px;">
            <input id="txtLogin" type="text" class="loginInput"

                   onkeyup="proxy.login_keyup(event)" />
            <button type="button" class="loginInput" onclick="proxy.login()">Login</button>
        </div>
    </div>
    <div id="msgPanel" style="display: none">
        <div id="msgContainer" style="overflow: auto;"></div>
        <div id="msgController">
            <textarea id="txtMsg"

                      title="Enter to send message"

                      onkeyup="proxy.sendMessage_keyup(event)"

                      style="height: 20px; width: 100%"></textarea>
            <button style="height: 30px; width: 100px" type="button"

                    onclick="proxy.logout()">Logout</button>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/dist/js/chatRoom.js"></script>
<script>

    var proxy = CreateProxy("ws://localhost:8080/dmngMaven2_war_exploded/chat");

    document.addEventListener("DOMContentLoaded", function(event) {
        console.log(document.getElementById('loginPanel'));
        proxy.initiate({
            loginPanel: document.getElementById('loginPanel'),
            msgPanel: document.getElementById('msgPanel'),
            txtMsg: document.getElementById('txtMsg'),
            txtLogin: document.getElementById('txtLogin'),
            msgContainer: document.getElementById('msgContainer')
        });
    });
</script>
</body>
</html>
