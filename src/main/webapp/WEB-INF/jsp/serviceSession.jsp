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
            <div class="py-5 quick-contact-info">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <a href="#" class=" feature-item">
                                <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <div id="imagePreview" style="background-image: url('https://www.confirmation.com/media/1118/audit-client.png?width=425&height=425');">
                                        </div>
                                    </div>
                                </div>
                                <h2>Client</h2>                                                           
                                <h6><span class="icon-room" ></span> Location</h6>
                                <p class="mb-0">New York - 2398 <br>  10 Hadson Carl Street</p>  
                            </a>
                        </div>

                        <div class="col-md-4">
                            <div>
                                <br>
                                <h2>Starting Date</h2>
                                <p class="mb-0">Wednesdays at 6:30PM</p>                                 
                                <br>
                                <h2></span>Service Discription</h2>
                                <p class="mb-4 h6 font-italic lineheight1-5">&ldquo;Lorem ipsum dolor sit amet, 
                                    consectetur adipisicing elit. Eaque, nisi Lorem ipsum dolor sit amet, 
                                    consectetur adipisicing elit. Odit nobis magni eaque velit eum, 
                                    id rem eveniet dolor possimus voluptas..&rdquo;</p>
                                <h2>Cost : <span class="mb-4 h4 font-italic lineheight1-5">1000</span><span class="icon-monetization_on h6"></span></h2>
                            </div>

                        </div>

                        <div class="col-md-4">
                            <a href="#" class=" feature-item">
                                <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <div id="imagePreview" style="background-image: url('https://www.agilysys.com/-/media/agilysys/Images/Product%20Pages/Professional%20Services/ProfServ-Hero.png?la=en');">
                                        </div>
                                    </div>
                                </div>
                                <h2>Servicer</h2>                                                           
                                <h6><span class="icon-room"></span> Location</h6>
                                <p class="mb-0">New York - 2398 <br>  10 Hadson Carl Street</p>                                                                                       
                            </a>
                        </div>

                    </div>
                    <div class="row">                        
                        <div class="col-md-4">                            
                        </div>
                        <div class="col-md-4" id="rating-ability-wrapper">       
                            <br>
                            <h2 style="">Rate Your Experience</h2>
                            <label class="control-label" for="selected_rating">
                                <input type="hidden" id="selected_rating" name="selected_rating" value="${rating}" >
                            </label>
                            <button type="button" class="btnrating btn btn-default btn-lg rating-dmng" data-attr="1" id="rating-star-1">
                                <i class="icon-star" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btnrating btn btn-default btn-lg rating-dmng" data-attr="2" id="rating-star-2">
                                <i class="icon-star" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btnrating btn btn-default btn-lg rating-dmng" data-attr="3" id="rating-star-3">
                                <i class="icon-star" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btnrating btn btn-default btn-lg rating-dmng" data-attr="4" id="rating-star-4">
                                <i class="icon-star" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btnrating btn btn-default btn-lg rating-dmng" data-attr="5" id="rating-star-5">
                                <i class="icon-star" aria-hidden="true"></i>
                            </button>
                        </div> 
                    </div>
                </div>
            </div>




            <%@include file = "footer.jsp" %>
        </div>
        <script>jQuery(document).ready(function ($) {


                for (ix = 1; ix <= $("#selected_rating").val(); ++ix) {
                    $("#rating-star-" + ix).toggleClass('btn-success');
                    $("#rating-star-" + ix).toggleClass('btn-default');
                }

            });
        </script>
    </body>
</html>