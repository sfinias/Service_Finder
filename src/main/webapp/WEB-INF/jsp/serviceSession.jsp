<html>
    <head>
        <title>Service Finder &mdash; DMNG team</title>
        <%@include file = "newHeader.jsp" %>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/profile.css">
    </head>
    <body>
    <c:if test="${sessionScope.user.professionsEntity.id==1}">
        <%@include file="navbar.jsp"%>
    </c:if>
    <c:if test="${sessionScope.user.professionsEntity.id>1}">
        <%@include file = "navbarProf.jsp" %>
    </c:if>
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
                                        <div style="background-image: url('http://localhost:8080/images/${sessionScope.user.getUserEntity().getProfilePicture()}');">
                                        </div>
                                    </div>
                                </div>
                                <h2>${sessionScope.user.userEntity.firstName} ${sessionScope.user.userEntity.lastName}</h2>
                                <h6><span class="icon-room" ></span> Location</h6>
                                <p class="mb-0">${sessionScope.user.addressEntity.address}</p>
                            </a>
                        </div>

                            <div class="col-md-4">
                                <div>
                                    <br>
                                    <h2>Starting Date</h2>
                                    <p class="mb-0">${service.startDate}</p>
                                    <br>
                                    <h2>Service Title</h2>
                                    <spring:form modelAttribute="service" method="post" action="${pageContext.request.contextPath}/prof/test">

                                    <p class="mb-4 h6 font-italic lineheight1-5">
                                        <spring:input class="f" path="topic"/>
                                    </p>
                                    <h2>Cost</h2>
                                    <span class="mb-4 h4 font-italic lineheight1-5">
                                            <spring:input class="f" path="cost"/>
                                    </span><span class="icon-monetization_on h6"></span>
                                        <input type="submit" id="subButton">
                                    </spring:form>

                                </div>
                            </div>

                        <div class="col-md-4">
                            <a href="#" class=" feature-item">
                                <div class="avatar-upload">
                                    <div class="avatar-preview">
                                        <div id="imagePreview" style="background-image: url('http://localhost:8080/images/${service.otherUser.userEntity.profilePicture}');">
                                        </div>
                                    </div>
                                </div>
                                <h2>${service.otherUser.userEntity.firstName} ${service.otherUser.userEntity.lastName}</h2>
                                <h6><span class="icon-room"></span> Location</h6>
                                <p class="mb-0">${service.otherUser.addressEntity.address}</p>
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
                                <input type="hidden" id="selected_rating" name="selected_rating" value="${service.rating}" >
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

                if("${sessionScope.user.professionsEntity.id}" == 1){
                    $('#subButton').addClass('d-none');
                    $('.f').prop('readonly', true);

            }

            });
        </script>
    </body>
</html>