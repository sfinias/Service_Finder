<%@ page import="model.RegisterEntity" %><%--
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
<%--<script src="${pageContext.request.contextPath}/dist/js/chatRoom.js"></script>--%>

<script>
    var CreateProxy = function (wsUri) {
        var websocket = null;
        var audio = null;
        var elements = null;

        var playSound = function () {
            if (audio == null) {
                audio = new Audio('/dist/sounds/sound_chat.wav');
            }

            audio.play();
        };

        var showMsgPanel = function () {
            elements.loginPanel.style.display = "none";
            elements.msgPanel.style.display = "block";
            elements.txtMsg.focus();
        };

        var hideMsgPanel = function () {
            elements.loginPanel.style.display = "block";
            elements.msgPanel.style.display = "none";
            elements.txtLogin.focus();
        };

        var displayMessage = function (msg) {
            if (elements.msgContainer.childNodes.length == 100) {
                elements.msgContainer.removeChild(elements.msgContainer.childNodes[0]);
            }

            var div = document.createElement('div');
            div.className = 'msgrow';
            var textnode = document.createTextNode(msg);
            div.appendChild(textnode);
            elements.msgContainer.appendChild(div);

            elements.msgContainer.scrollTop = elements.msgContainer.scrollHeight;
        };

        var clearMessage = function () {
            elements.msgContainer.innerHTML = '';
        };

        return {
            login: function () {
                elements.txtLogin.focus();

                // var name = elements.txtLogin.value.trim();
                <% String username=(String)session.getAttribute("user2Name");%>
                var name= '<%=username%>';
                if (name == '') {
                    return;
                }

                elements.txtLogin.value = '';

                // Initiate the socket and set up the events
                if (websocket == null) {
                    websocket = new WebSocket(wsUri);

                    websocket.onopen = function () {
                        var message = {messageType: 'LOGIN', data: name};
                        websocket.send(JSON.stringify(message));
                    };
                    websocket.onmessage = function (e) {
                        displayMessage(e.data);
                        showMsgPanel();
                        // playSound();
                    };
                    websocket.onerror = function (e) {
                    };
                    websocket.onclose = function (e) {
                        websocket = null;
                        clearMessage();
                        hideMsgPanel();
                    };
                }
            },
            sendMessage: function () {
                elements.txtMsg.focus();

                if (websocket != null && websocket.readyState == 1) {
                    var input = elements.txtMsg.value.trim();
                    if (input == '') {
                        return;
                    }

                    elements.txtMsg.value = '';

                    var message = {messageType: 'MESSAGE', data: input};

                    // Send a message through the web-socket
                    websocket.send(JSON.stringify(message));
                }
            },
            // login_keyup: function(e) { if (e.keyCode == 13) { this.login(); } },
            login_keyup: function(e) { if (e.keyCode == 13) { this.login(); } },
            sendMessage_keyup: function (e) {
                if (e.keyCode == 13) {
                    this.sendMessage();
                }
            },
            logout: function () {
                if (websocket != null && websocket.readyState == 1) {
                    websocket.close();
                }
            },
            initiate: function (e) {
                elements = e;
                elements.txtLogin.focus();
            }
        }
    };
</script>

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
