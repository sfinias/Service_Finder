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
                    <h2 class="mb-0 lettering">${thiscategory.getProfession()}s</h2>
                    <p class="mb-0 unit-6">
                        <a href="${pageContext.request.contextPath}/user/search.htm">Home</a> 

                        <br /></p>


                </div>
            </div>

            <div class="site-section site-block-feature bg-light">
                <div class="container">

                    <div class="text-center mb-5 section-heading">
                        <h2>Why Choose Us</h2>
                    </div>

                    <div class="d-block d-md-flex border-bottom">
                        <div class="text-center p-4 item border-right aos-init aos-animate" data-aos="fade">
                            <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <div id="imagePreview" style="background-image: url('https://www.agilysys.com/-/media/agilysys/Images/Product%20Pages/Professional%20Services/ProfServ-Hero.png?la=en');">
                                        </div>
                                    </div>
                                </div>
                            <h2 class="h4">More Jobs Every Day</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
                            <p><a href="${pageContext.request.contextPath}/user/viewselectedprof.htm">Read More <span class="icon-arrow-right small"></span></a></p>
                        </div>
                        <div class="text-center p-4 item aos-init aos-animate" data-aos="fade">
                            <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <div id="imagePreview" style="background-image: url('https://www.agilysys.com/-/media/agilysys/Images/Product%20Pages/Professional%20Services/ProfServ-Hero.png?la=en');">
                                        </div>
                                    </div>
                                </div>
                            <h2 class="h4">Creative Jobs</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
                            <p><a href="${pageContext.request.contextPath}/user/viewselectedprof.htm">Read More <span class="icon-arrow-right small"></span></a></p>
                        </div>
                    </div>
                    <div class="d-block d-md-flex">
                        <div class="text-center p-4 item border-right aos-init" data-aos="fade">
                            <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <div id="imagePreview" style="background-image: url('https://www.agilysys.com/-/media/agilysys/Images/Product%20Pages/Professional%20Services/ProfServ-Hero.png?la=en');">
                                        </div>
                                    </div>
                                </div>
                            <h2 class="h4">Healthcare</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
                            <p><a href="${pageContext.request.contextPath}/user/viewselectedprof.htm">Read More <span class="icon-arrow-right small"></span></a></p>
                        </div>
                        <div class="text-center p-4 item aos-init" data-aos="fade">
                            <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <div id="imagePreview" style="background-image: url('https://www.agilysys.com/-/media/agilysys/Images/Product%20Pages/Professional%20Services/ProfServ-Hero.png?la=en');">
                                        </div>
                                    </div>
                                </div>
                            <h2 class="h4">Finance &amp; Accounting</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati reprehenderit explicabo quos fugit vitae dolorum.</p>
                            <p><a href="${pageContext.request.contextPath}/user/viewselectedprof.htm">Read More <span class="icon-arrow-right small"></span></a></p>
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
