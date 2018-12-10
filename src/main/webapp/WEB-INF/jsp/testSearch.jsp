<%@include file = "header.jsp" %>


<div class="site-blocks-cover overlay" style="background-image: url('${pageContext.request.contextPath}/dist/images/hero_1.jpg');" data-aos="fade" data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12" data-aos="fade">
                <h1>Find Job</h1>
                <form action="#">
                    <div class="row mb-3">
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <select class="mr-3 form-control border-0 px-4">
                                        <option selected>Choose Service...</option>
                                        <c:forEach items="${allProfessions}" var="item">
                                            <option value="${item.id}">${item.profession}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <div class="input-wrap">
                                        <span class="icon icon-room"></span>
                                        <input type="text" class="form-control form-control-block search-input  border-0 px-4" id="autocomplete" placeholder="city, province or region" onFocus="geolocate()">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <input type="submit" class="btn btn-search btn-primary btn-block" value="Search">
                        </div>
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


<div class="site-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto text-center mb-5 section-heading">
                <h2 class="mb-5">Popular Categories</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="100">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-calculator mb-3 text-primary"></span>
                    <h2>Accounting / Finanace</h2>
                    <span class="counting">10,391</span>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="200">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-wrench mb-3 text-primary"></span>
                    <h2>Automotive Jobs</h2>
                    <span class="counting">192</span>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="300">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-worker mb-3 text-primary"></span>
                    <h2>Construction / Facilities</h2>
                    <span class="counting">1,021</span>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="400">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-telecommunications mb-3 text-primary"></span>
                    <h2>Telecommunications</h2>
                    <span class="counting">1,219</span>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="500">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-stethoscope mb-3 text-primary"></span>
                    <h2>Healthcare</h2>
                    <span class="counting">482</span>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="600">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-computer-graphic mb-3 text-primary"></span>
                    <h2>Design, Art &amp; Multimedia</h2>
                    <span class="counting">5,409</span>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="700">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-trolley mb-3 text-primary"></span>
                    <h2>Transportation &amp; Logistics</h2>
                    <span class="counting">291</span>
                </a>
            </div>
            <div class="col-sm-6 col-md-4 col-lg-3 mb-3" data-aos="fade-up" data-aos-delay="800">
                <a href="#" class="h-100 feature-item">
                    <span class="d-block icon flaticon-restaurant mb-3 text-primary"></span>
                    <h2>Restaurant / Food Service</h2>
                    <span class="counting">329</span>
                </a>
            </div>
        </div>

    </div>
</div>


<%@include file = "footer.jsp" %>
