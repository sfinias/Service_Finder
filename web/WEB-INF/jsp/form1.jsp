<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="login" class="col s12">
    <form:form class="col s12" method="post" action="/user/checkLogin.htm" modelAttribute="user">
        <div class="form-container">
            <h3 class="red-text">Hello</h3>
            <div class="row">
                <div class="input-field col s12">
                    <form:input path="email" id="emailLogin" type="email" class="validate" required="required"/>
                    <form:label path="email" for="email">Email</form:label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <form:input path="pass" id="passwordLogin" type="password" class="validate"
                                required="required"/>
                    <form:label path="pass" for="pass">Password</form:label>
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
                <a href="/user/forgotPassword.htm">Forgotten password?</a>
                <a href="/user/deleteUser.htm">Delete your account.</a>
            </center>
        </div>
    </form:form>
</div>