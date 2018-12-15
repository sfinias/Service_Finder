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
            <span>Profile</span></p>
    </div>
</div>


<div class="site-section bg-light">
    <div class="container">
        <div class="row">

            <div id="login" class="col-md-12 col-lg-8 mb-5">

                <dl class="row p-5 bg-white">
              <dt class="col-sm-3">${selectedUser.getUserEntity().getFirstName()}</dt>
              <dd class="col-sm-9">${selectedUser.getUserEntity().getEmail()}</dd>

              <dt class="col-sm-3">Euismod</dt>
              <dd class="col-sm-9">
                <p>${selectedUser.getUserEntity().getFirstName()}</p>
                <p>${selectedUser.getUserEntity().getEmail()}</p>
              </dd>

              <dt class="col-sm-3">Malesuada porta</dt>
              <dd class="col-sm-9">Etiam porta sem malesuada magna mollis euismod.</dd>

              <dt class="col-sm-3 text-truncate">Truncated term is truncated</dt>
              <dd class="col-sm-9">Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>

              <dt class="col-sm-3">Nesting</dt>
              <dd class="col-sm-9">
                <dl class="row">
                  <dt class="col-sm-4">Nested definition list</dt>
                  <dd class="col-sm-8">Aenean posuere, tortor sed cursus feugiat, nunc augue blandit nunc.</dd>
                </dl>
              </dd>
            </dl>
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
            <input type="file" id="imageUpload" name="uploaded">
            <label for="imageUpload" ></label>
        </div>
        <div class="avatar-preview">
            <div id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
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

<%@include file = "footer.jsp" %>
<script src="${pageContext.request.contextPath}/dist/js/profile.js" type="text/javascript" ></script>
</body>
</html>
