<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file = "newHeader.jsp" %>
</head>
<body>
    <div class="site-wrap">
        <%@include file = "navbar.jsp" %>
        <div class="site-blocks-cover overlay" style="background-image: url('${pageContext.request.contextPath}/dist/images/hero_1.jpg');" data-aos="fade" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12" data-aos="fade">
                        <h1>Find Service</h1>
                        <form action="#">
                            <div class="row mb-3">
                                <form enctype="multipart/form-data">
                                <div class="col-md-9">
                                    <div class="row">
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <select class="mr-3 form-control border-0 px-4" id="pro" name="pro">
                                                <option selected>Choose Service...</option>
                                                <c:forEach items="${allProfessions}" var="item">
                                                    <option value="${item.id}">${item.profession}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-6 mb-3 mb-md-0">
                                            <div class="input-wrap">
                                                <a href="" class="icon icon-room" id="loc"></a>
                                                <input type="text" class="form-control form-control-block search-input  border-0 px-4" id="address" placeholder="city, province or region" required>
                                                <input type="number" class="d-none" name="long" id="long" required>
                                                <input type="number" class="d-none" name="lat" id="lat" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-search btn-primary btn-block" id="search">Search</button>
                                </div>
                                </form>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="small">or browse by category: <a href="#" class="category">Category #1</a> <a href="#" class="category">Category #2</a></p>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="site-section bg-light">
            <div class="container">
                <div class="row h-75">
                    <div class="col-md-5 mb-5 mb-md-0" data-aos="fade-up" data-aos-delay="100">
                        <h2 class="mb-5 h3">Available Professionals</h2>
                        <div class="rounded border jobs-wrap">

                        </div>
                        <div class="col-md-12 text-center mt-5">
                            <a href="#" class="btn btn-primary rounded py-3 px-5"><span class="icon-plus-circle"></span> Show More Jobs</a>
                        </div>
                    </div>
                    <div class="col-md-7 block-16" data-aos="fade-up" data-aos-delay="200">
                        <div class="d-flex mb-0">
                            <h2 class="mb-5 h3 mb-0">Map</h2>
                            <div class="ml-auto mt-1"><a href="#" class="owl-custom-prev">Prev</a> / <a href="#" class="owl-custom-next">Next</a></div>
                        </div>
                        <div id="googleMap"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file = "footer.jsp" %>
    <%@include file = "map.jsp" %>
</body>
</html>