<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div id="register" class="col s12">
    <form:form class="col s12" method="post" action="/user/checkRegister.htm" modelAttribute="user2"
               enctype="multipart/form-data">
        <div class="form-container">
            <h3 class="red-text">Welcome</h3>
            <div class="row">
                <div class="input-field col s6">
                    <form:input path="firstName" id="firstName" type="text" class="validate" required="required"
                                onkeypress="return blockSpecialChar(event)"/>
                    <form:label path="firstName" for="firstName">First Name</form:label>
                </div>
                <div class="input-field col s6">
                    <form:input path="lastName" id="lastName" type="text" class="validate" required="required"
                                onkeypress="return blockSpecialChar(event)"/>
                    <form:label path="lastName" for="lastName">Last Name</form:label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <form:input path="email" id="email" type="email" class="validate"
                                onkeyup='CheckEmail(); EnableSubmit2()' required="required"/>
                    <form:label path="email" for="email">Email</form:label>
                    <span id='message3'></span>
                    <span id='message4'></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <form:input path="emailConfirm" id="emailConfirm" name="email-confirm" type="email"
                                class="validate"
                                onkeyup='CheckEmail(); EnableSubmit2()' required="required"/>
                    <form:label path="emailConfirm" for="emailConfirm">Email Confirmation</form:label>
                    <span id='message1'></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <form:input path="pass" id="pass" type="password" class="validate"
                                onkeyup='CheckPassword(); EnableSubmit2();' required="required" pattern=".{8,50}"
                                title="8 to 50 characters"/>
                    <form:label path="pass" for="pass">Password</form:label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <form:input path="passwordConfirm" id="passwordConfirm" name="password-confirm" type="password"
                                class="validate"
                                onkeyup='CheckPassword(); EnableSubmit2();' required="required" pattern=".{8,50}"
                                title="8 to 50 characters"/>
                    <form:label path="passwordConfirm" for="passwordConfirm">Password Confirmation</form:label>
                    <span id='message2'></span>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <form:input path="address" id="address" name="address"
                                class="validate"/>
                    <form:label path="address" for="address">Address</form:label>
                </div>
                <div class="input-field col s6">
                    <form:input path="phone" id="phone" name="phone"
                                class="validate"/>
                    <form:label path="phone" for="phone">Phone</form:label>
                </div>
            </div>
            <div class="row">
                <form:label path="file" for="file">Upload photo</form:label>
                <div class="input-field col s12">
                    <form:input path="file" id="file" name="file" type="file" size="10" class="validate"/>
                </div>
            </div>
            <center>
                <button class="btn waves-effect waves-light red" type="submit" name="actionRegister"
                        id="actionRegister" disabled>Submit
                </button>
            </center>
        </div>
    </form:form>
</div>