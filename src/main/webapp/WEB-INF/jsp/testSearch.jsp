<%@include file = "header.jsp" %>


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
                                        <input type="text" class="form-control form-control-block search-input  border-0 px-4" id="autocomplete" placeholder="city, province or region">
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
        map.panTo(p);
    }

    var geocoder = new google.maps.Geocoder();
    google.maps.event.addListener(map, 'click', function(event) {
        pos = new google.maps.LatLng(parseFloat(event.latLng.lat()),parseFloat(event.latLng.lng()));
        moveMark(pos);
        getAddress(pos);
        // geocoder.geocode({
        //     'latLng': pos
        // }, function(results, status) {
        //     if (status == google.maps.GeocoderStatus.OK) {
        //         if (results[0]) {
        //             document.getElementById('autocomplete').value=results[0].formatted_address;
        //         }
        //     }
        // });
    });

    document.getElementById('loc').onclick = function (ev){
        ev.preventDefault();
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                moveMark(pos);
                getAddress(pos);
                // geocoder.geocode({
                //     'latLng': pos
                // }, function(results, status) {
                //     if (status == google.maps.GeocoderStatus.OK) {
                //         if (results[0]) {
                //             document.getElementById('autocomplete').value=results[0].formatted_address;
                //         }
                //     }
                // });
            }, function() {handleLocationError(true);
            });
        } else {
            handleLocationError(false);
        }
    };

    function getAddress(pos) {
        geocoder.geocode({
            'latLng': pos
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    document.getElementById('autocomplete').value=results[0].formatted_address;
                }
            }
        });
    }

    function handleLocationError(browserHasGeolocation) {
        alert(browserHasGeolocation ?
            'Error: The Geolocation service failed.' :
            'Error: Your browser doesn\'t support geolocation.');
    }

    document.getElementById('search').onclick = function (ev) {
        ev.preventDefault();
    };

</script>
<%@include file = "footer.jsp" %>
