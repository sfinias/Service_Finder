<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file = "newHeader.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/profile.css">
</head>
<body>
<%@include file = "navbar.jsp" %>
<div class="site-wrap">
<div class="unit-5 overlay" style="background-image: url('${pageContext.request.contextPath}/dist/images/woodWallpaper.jpg');">
    <div class="container text-center">
        <h2 class="mb-0">Profile</h2>
        <p class="mb-0 unit-6">
            <a href="${pageContext.request.contextPath}/home/initialForm.htm">Home</a>
            <span class="sep">></span> 
            <span>Profile</span></p>
    </div>
</div>


<div class="site-section bg-light">
    <div class="container">
        <div class="row">

            <div id="login" class="col-md-12 col-lg-8 mb-5">

                <spring:form action="p.htm" method="post" modelAttribute="editUser" class="p-5 bg-white">
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
                            <spring:label path="userEntity.lastName" class="font-weight-bold switch-disable" for="lastName">Last Name</spring:label>
                            <a id="switch-disable-ln" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <spring:input path="userEntity.lastName" type="text" id="lastName" class="form-control" placeholder="Last Name" disabled="true"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12">
                            <spring:label path="userEntity.email" class="font-weight-bold" for="email">Email</spring:label>
                            <a id="switch-disable-e" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <spring:input path="userEntity.email" type="email" id="email" class="form-control" placeholder="Email Address" disabled="true" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12">
                            <spring:label path="userEntity.passwordHash" class="font-weight-bold" for="password">Password</spring:label>
                            <a id="switch-disable-p" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <spring:input path="userEntity.passwordHash" type="password" id="password" class="form-control" placeholder="Password" disabled="true" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <spring:label path="phoneEntity.mobile" class="font-weight-bold" for="phone1">Mobile</spring:label>
                            <a id="switch-disable-m" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <spring:input path="phoneEntity.mobile" type="text" id="phone1" class="form-control" placeholder="Phone #" disabled="true"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-12 mb-3 mb-md-0">
                            <spring:label path="phoneEntity.landline" class="font-weight-bold" for="phone2">Landline</spring:label>
                            <a id="switch-disable-l" href="">
                                <span style="padding-left:15px" class="icon-edit">Edit</span>
                            </a>
                            <spring:input path="phoneEntity.landline" type="text" id="phone2" class="form-control" placeholder="Phone #" disabled="true"/>
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
              <h3 class="h5 text-black mb-3">Profile Image</h3>
              <form class="form" action="" method="post" id="registrationForm" enctype="multipart/data" >
    <div class="form-group">
                          
                          <div class="col-xs-12">
							   <div class="text-center">
    <div class="avatar-upload">
        <div class="avatar-edit" >
            <input type="file" id="imageUpload" name="uploaded" accept="image/png, image/jpeg">
            <label for="imageUpload" ></label>
        </div>
        <div class="avatar-preview">
            <div id="imagePreview" style="background-image: url('http://localhost:8080/images/${sessionScope.user.getUserEntity().getProfilePicture()}');">
            </div>
        </div>
    </div>
</div>
                              </div>
</div>
        </form>

            </div>
            
            <div class="p-4 mb-3 bg-white">
              <h3 class="h5 text-black mb-3">More Info</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa ad iure porro mollitia architecto hic consequuntur. Distinctio nisi perferendis dolore, ipsa consectetur? Fugiat quaerat eos qui, libero neque sed nulla.</p>
              <p><a href="#" class="btn btn-primary px-4 py-2 text-white pill">Learn More</a></p>
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
</div>

<%@include file = "footer.jsp" %>
<script src="${pageContext.request.contextPath}/dist/js/profile.js" type="text/javascript" ></script>
</body>
</html>
