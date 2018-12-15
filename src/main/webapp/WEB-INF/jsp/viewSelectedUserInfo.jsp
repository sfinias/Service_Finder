<!DOCTYPE html>
<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file = "newHeader.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/profile.css">
    <link href="${pageContext.request.contextPath}/dist/css/custom-dMng.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@include file = "navbar.jsp" %>
<div class="site-wrap">
<div class="unit-5 overlay" style="background-image: url('${pageContext.request.contextPath}/dist/images/woodWallpaper.jpg');">
    <div class="container text-center">
        <h2 class="mb-0 lettering">${selectedUser.getUserEntity().getFirstName()} ${selectedUser.getUserEntity().getLastName()}</h2>
        <p class="mb-0 unit-6">
            <a href="${pageContext.request.contextPath}/user/initialForm.htm">Home</a> 
            <span class="sep">></span> 
            <span>${selectedUser.getProfessionsEntity().getProfession()}s</span></p>
    </div>
</div>


<div class="site-section bg-light">
    <div class="container">
        <div class="row">

            <div class="col-md-12 col-lg-8 mb-5">
                <div class="p-5 bg-white">
<h4 class="h4 text-black mb-3">Profile Info</h4>
                <dl class="row p-5">
              <dt class="col-sm-3">Fullname</dt>
              <dd class="col-sm-9 lettering"> ${selectedUser.getUserEntity().getLastName()} ${selectedUser.getUserEntity().getFirstName()} </dd>

              <dt class="col-sm-3">Job Title</dt>
              <dd class="col-sm-9 lettering">
                <p>${selectedUser.getProfessionsEntity().getProfession()}</p>
              </dd>

              <dt class="col-sm-3">Email</dt>
              <dd class="col-sm-9">
                  <p>${selectedUser.getUserEntity().getEmail()}</p>
                  
              </dd>
              
              <dt class="col-sm-3">Mobile</dt>
              <dd class="col-sm-9"><p><a href="tel: ${selectedUser.getPhoneEntity().getMobile()}" class="text-info p-2 rounded border border-info">${selectedUser.getPhoneEntity().getMobile()}</a></p></dd>
                  
                <dt class="col-sm-3">Landline</dt>
                <dd class="col-sm-9"><p><a href="tel:${selectedUser.getPhoneEntity().getLandline()}" class="text-info p-2 rounded border border-info">${selectedUser.getPhoneEntity().getLandline()}</a></p></dd>
            </dl>
            </div>
            </div>
              <div class="col-lg-4">
            <div class="p-4 mb-3 bg-white">
              
              
    <div class="form-group">
                          
                          <div class="col-xs-12">
							   <div class="text-center">
    <div class="avatar-upload">
        
        <div class="avatar-preview">
            <div id="imagePreview" style="background-image: url('http://localhost:8080/images/${selectedUser.getUserEntity().getProfilePicture()}');">
            </div>
        </div>
    </div>
</div>
                              </div>
</div>
       

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

<%@include file = "footer.jsp" %>
<script src="${pageContext.request.contextPath}/dist/js/profile.js" type="text/javascript" ></script>
</body>
</html>
