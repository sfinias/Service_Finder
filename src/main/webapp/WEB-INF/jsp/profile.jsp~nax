<%@include file = "header.jsp" %>

<div class="unit-5 overlay" style="background-image: url('${pageContext.request.contextPath}/dist/images/woodWallpaper1.jpg');">
    <div class="container text-center">
        <h2 class="mb-0">Profile</h2>
        <p class="mb-0 unit-6">
            <a href="${pageContext.request.contextPath}/user/initialForm.htm">Home</a> 
            <span class="sep">></span> 
            <span>Profile</span></p>
    </div>
</div>


<div class="site-section bg-light">
    <div class="container">
        <div class="row">

            <div id="login" class="col-md-12 col-lg-8 mb-5">

                <spring:form action="p.htm" method="post" modelAttribute="user" class="p-5 bg-white">
                    <h4 class="h4 text-black mb-3">Edit profile</h4>

                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <spring:label path="userEntity.firstName" class="font-weight-bold" for="firstName">First Name</spring:label>
                            <a id="switch-disable-fn" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <spring:input path="userEntity.firstName" type="text" id="firstName" class="form-control" disabled="true"/>                            
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="font-weight-bold switch-disable" for="lastName">Last Name</label>
                            <a id="switch-disable-ln" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <input type="text" id="lastName" class="form-control" placeholder="Last Name" disabled>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12">
                            <label class="font-weight-bold" for="email">Email</label>
                            <a id="switch-disable-e" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <input type="email" id="email" class="form-control" placeholder="Email Address" disabled>
                        </div>
                    </div>                   
                    <div class="row form-group">
                        <div class="col-md-12">
                            <label class="font-weight-bold" for="password">Password</label>
                            <a id="switch-disable-p" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <input type="password" id="password" class="form-control" placeholder="Password" disabled>
                        </div>
                    </div>                  
                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="font-weight-bold" for="phone1">Mobile</label>
                            <a id="switch-disable-m" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <input type="text" id="phone1" class="form-control" placeholder="Phone #" disabled>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <label class="font-weight-bold" for="phone2">Landline</label>
                            <a id="switch-disable-l" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <input type="text" id="phone2" class="form-control" placeholder="Phone #" disabled>
                        </div>
                    </div>                      
                    <div class="row form-group">
                        <div class="col-md-12">
                            <input type="submit" value="Comfirm Changes" class="btn btn-primary pill px-4 py-2">
                        </div>
                    </div>


                </spring:form>
            </div>

            <div class="col-lg-4">
                <div class="p-4 mb-3 bg-white">
                    <form  class="p-5 bg-white">
                        <input type="file" class="btn btn-primary pill px-4 py-2">
                        <hr>
                        <input type="submit" value="Upload File" id="uploadAjax" class="btn btn-primary pill px-4 py-2">
                    </form> 
                </div>

                <div class="p-4 mb-3 bg-white">
                    <h3 class="h5 text-black mb-3">Contact Info</h3>
                    <p class="mb-0 font-weight-bold">Address</p>
                    <p class="mb-4">203 Fake St. Mountain View, San Francisco, California, USA</p>

                    <p class="mb-0 font-weight-bold">Phone</p>
                    <p class="mb-4"><a href="#">+1 232 3235 324</a></p>

                    <p class="mb-0 font-weight-bold">Email Address</p>
                    <p class="mb-0"><a href="#">youremail@domain.com</a></p>

                </div>               
            </div>
        </div>
    </div>
</div>

<div class="py-5 quick-contact-info">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div>
                    <h2><span class="icon-room"></span> Location</h2>
                    <p class="mb-0">New York - 2398 <br>  10 Hadson Carl Street</p>
                </div>
            </div>
            <div class="col-md-4">
                <div>
                    <h2><span class="icon-clock-o"></span> Service Times</h2>
                    <p class="mb-0">Wednesdays at 6:30PM - 7:30PM <br>
                        Fridays at Sunset - 7:30PM <br>
                        Saturdays at 8:00AM - Sunset</p>
                </div>
            </div>
            <div class="col-md-4">
                <h2><span class="icon-comments"></span> Get In Touch</h2>
                <p class="mb-0">Email: info@yoursite.com <br>
                    Phone: (123) 3240-345-9348 </p>
            </div>
        </div>
    </div>
</div>




<%@include file = "footer.jsp" %>
