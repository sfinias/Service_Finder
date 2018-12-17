<html>
<head>
    <title>Service Finder &mdash; DMNG team</title>
    <%@include file = "newHeader.jsp" %>
    <style>
        #distance{
            background-color:rgba(0,0,0,0) !important;
            border:none !important;
        }
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type="number"] {
            -moz-appearance: textfield;
        }
    </style>
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
                            <form enctype="multipart/form-data">
                            <div class="row mb-3">
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
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <label class="text-white" for="distance">Searched distance in kilometers:</label>
                                    <input type="number" id="distance" name="distance" class="text-white" readonly>
                                </div>
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <div id="slider"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="small">or browse by category: 
                                        <c:forEach items="${allProfessions}" var="item"> 
                                            <a href="${pageContext.request.contextPath}/user/viewselectedcategoryofprof.htm?categoryidofprof=${item.id}" name="categoryidofprof" class="category">${item.profession}</a>
                                        </c:forEach>
                                    </p>
                                </div>
                            </div>
                            </form>

                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="site-section bg-light d-none" id="searchResults">
            <div class="container">
                <div class="row h-75">
                    <div class="col-md-5 mb-5 mb-md-0" data-aos="fade-up" data-aos-delay="100">
                        <h2 class="mb-5 h3">Available Professionals</h2>
                        <div class="rounded border jobs-wrap">
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