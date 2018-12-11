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
                                    <select class="mr-3 form-control border-0 px-4" id="pro">
                                        <option selected>Choose Service...</option>
                                        <c:forEach items="${allProfessions}" var="item">
                                            <option value="${item.id}">${item.profession}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <div class="input-wrap">
                                        <span class="icon icon-room"></span>
                                        <input type="text" class="form-control form-control-block search-input  border-0 px-4" id="autocomplete" placeholder="city, province or region">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-search btn-primary btn-block" id="search">Search</button>
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


<div class="site-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-5 mb-5 mb-md-0" data-aos="fade-up" data-aos-delay="100">
                <h2 class="mb-5 h3">Recent Jobs</h2>
                <div class="rounded border jobs-wrap">

                    <a href="${pageContext.request.contextPath}/WEB-INF/jsp/job-single.jsp" class="job-item d-block d-md-flex align-items-center  border-bottom fulltime">
                        <div class="company-logo blank-logo text-center text-md-left pl-3">
                            <img src="${pageContext.request.contextPath}/dist/images/company_logo_blank.png" alt="Image" class="img-fluid mx-auto">
                        </div>
                        <div class="job-details h-100">
                            <div class="p-3 align-self-center">
                                <h3>Restaurant Crew</h3>
                                <div class="d-block d-lg-flex">
                                    <div class="mr-3"><span class="icon-suitcase mr-1"></span> Resto Bar</div>
                                    <div class="mr-3"><span class="icon-room mr-1"></span> Florida</div>
                                    <div><span class="icon-money mr-1"></span> $55000 &mdash; 70000</div>
                                </div>
                            </div>
                        </div>
                        <div class="job-category align-self-center">
                            <div class="p-3">
                                <span class="text-info p-2 rounded border border-info">Full Time</span>
                            </div>
                        </div>
                    </a>

                    <a href="${pageContext.request.contextPath}/WEB-INF/jsp/job-single.jsp" class="job-item d-block d-md-flex align-items-center freelance">
                        <div class="company-logo blank-logo text-center text-md-left pl-3">
                            <img src="${pageContext.request.contextPath}/dist/images/logo_1.png" alt="Image" class="img-fluid mx-auto">
                        </div>
                        <div class="job-details h-100">
                            <div class="p-3 align-self-center">
                                <h3>JavaScript Fullstack Developer</h3>
                                <div class="d-block d-lg-flex">
                                    <div class="mr-3"><span class="icon-suitcase mr-1"></span> Cooper</div>
                                    <div class="mr-3"><span class="icon-room mr-1"></span> Anywhere</div>
                                    <div><span class="icon-money mr-1"></span> $55000 &mdash; 70000</div>
                                </div>
                            </div>
                        </div>
                        <div class="job-category align-self-center">
                            <div class="p-3">
                                <span class="text-warning p-2 rounded border border-warning">Freelance</span>
                            </div>
                        </div>
                    </a>


                    <a href="${pageContext.request.contextPath}/WEB-INF/jsp/job-single.jsp" class="job-item d-block d-md-flex align-items-center freelance">
                        <div class="company-logo blank-logo text-center text-md-left pl-3">
                            <img src="${pageContext.request.contextPath}/dist/images/logo_1.png" alt="Image" class="img-fluid mx-auto">
                        </div>
                        <div class="job-details h-100">
                            <div class="p-3 align-self-center">
                                <h3>ReactJS Fullstack Developer</h3>
                                <div class="d-block d-lg-flex">
                                    <div class="mr-3"><span class="icon-suitcase mr-1"></span> Cooper</div>
                                    <div class="mr-3"><span class="icon-room mr-1"></span> Anywhere</div>
                                    <div><span class="icon-money mr-1"></span> $55000 &mdash; 70000</div>
                                </div>
                            </div>
                        </div>
                        <div class="job-category align-self-center">
                            <div class="p-3">
                                <span class="text-warning p-2 rounded border border-warning">Freelance</span>
                            </div>
                        </div>
                    </a>


                    <a href="${pageContext.request.contextPath}/WEB-INF/jsp/job-single.jsp" class="job-item d-block d-md-flex align-items-center fulltime">
                        <div class="company-logo blank-logo text-center text-md-left pl-3">
                            <img src="${pageContext.request.contextPath}/dist/images/company_logo_blank.png" alt="Image" class="img-fluid mx-auto">
                        </div>
                        <div class="job-details h-100">
                            <div class="p-3 align-self-center">
                                <h3>Assistant Brooker, Real Estate</h3>
                                <div class="d-block d-lg-flex">
                                    <div class="mr-3"><span class="icon-suitcase mr-1"></span> RealState</div>
                                    <div class="mr-3"><span class="icon-room mr-1"></span> New York</div>
                                    <div><span class="icon-money mr-1"></span> $55000 &mdash; 70000</div>
                                </div>
                            </div>
                        </div>
                        <div class="job-category align-self-center">
                            <div class="p-3">
                                <span class="text-info p-2 rounded border border-info">Full Time</span>
                            </div>
                        </div>
                    </a>

                    <a href="${pageContext.request.contextPath}/WEB-INF/jsp/job-single.jsp" class="job-item d-block d-md-flex align-items-center partime">
                        <div class="company-logo blank-logo text-center text-md-left pl-3">
                            <img src="${pageContext.request.contextPath}/dist/images/logo_2.png" alt="Image" class="img-fluid mx-auto">
                        </div>
                        <div class="job-details h-100">
                            <div class="p-3 align-self-center">
                                <h3>Telecommunication Manager</h3>
                                <div class="d-block d-lg-flex">
                                    <div class="mr-3"><span class="icon-suitcase mr-1"></span> Think</div>
                                    <div class="mr-3"><span class="icon-room mr-1"></span> London</div>
                                </div>
                            </div>
                        </div>
                        <div class="job-category align-self-center">
                            <div class="p-3">
                                <span class="text-danger p-2 rounded border border-danger">Par Time</span>
                            </div>
                        </div>
                    </a>


                </div>

                <div class="col-md-12 text-center mt-5">
                    <a href="#" class="btn btn-primary rounded py-3 px-5"><span class="icon-plus-circle"></span> Show More Jobs</a>
                </div>
            </div>
            <div class="col-md-7 block-16" data-aos="fade-up" data-aos-delay="200">
                <div class="d-flex mb-0">
                    <h2 class="mb-5 h3 mb-0">Featured Jobs</h2>
                    <div class="ml-auto mt-1"><a href="#" class="owl-custom-prev">Prev</a> / <a href="#" class="owl-custom-next">Next</a></div>
                </div>
                <div id="googleMap"></div>



            </div>
        </div>
    </div>
</div>

<script>
    var marker = null;
    var defaultProp = {
        center: new google.maps.LatLng(37.98, 23.72),
        zoom: 7,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("googleMap"), defaultProp);
    // google.maps.event.addListener(map, 'click', codeLatLngfromclick);


    var autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
    autocomplete.bindTo('bounds', map);
    autocomplete.setTypes(['address']);
    // Set the data fields to return when the user selects a place.
    // autocomplete.setFields(['address_components', 'geometry', 'icon', 'name']);
    autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
        }
        moveMark(place.geometry.location);
    });

    function moveMark(p){
        if (marker != null) marker.setMap(null);
        marker = new google.maps.Marker({
            position: p,
            map: map
        });
        // map.panTo(latlng);
    }

    var geocoder = new google.maps.Geocoder();
    google.maps.event.addListener(map, 'click', function(event) {
        pos = new google.maps.LatLng(parseFloat(event.latLng.lat()),parseFloat(event.latLng.lng()));
        moveMark(pos);
        geocoder.geocode({
            'latLng': pos
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    document.getElementById('autocomplete').value=results[0].formatted_address;
                }
            }
        });
    });

    document.getElementById('search').onclick = function (ev) {
        ev.preventDefault();
        alert()
    };

</script>
<%@include file = "footer.jsp" %>
