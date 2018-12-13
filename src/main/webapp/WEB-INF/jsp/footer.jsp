<footer class="site-footer">
    <div class="container">


        <div class="row">
            <div class="col-md-4">
                <h3 class="footer-heading mb-4 text-white">About</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat amet.</p>
                <p><a href="#" class="btn btn-primary pill text-white px-4">Read More</a></p>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <h3 class="footer-heading mb-4 text-white">Quick Menu</h3>
                        <ul class="list-unstyled">
                            <li><a href="#">About</a></li>
                            <li><a href="#">Services</a></li>
                            <li><a href="#">Approach</a></li>
                            <li><a href="#">Sustainability</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Careers</a></li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h3 class="footer-heading mb-4 text-white">Categories</h3>
                        <ul class="list-unstyled">
                            <li><a href="#">Full Time</a></li>
                            <li><a href="#">Freelance</a></li>
                            <li><a href="#">Temporary</a></li>
                            <li><a href="#">Internship</a></li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="col-md-2">
                <div class="col-md-12"><h3 class="footer-heading mb-4 text-white">Social Icons</h3></div>
                <div class="col-md-12">
                    <p>
                        <a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>
                        <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                        <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                        <a href="#" class="p-2"><span class="icon-vimeo"></span></a>

                    </p>
                </div>
            </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
            <div class="col-md-12">
                <p>

                    Copyright &copy; <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All Rights Reserved | This template is made with <i class="icon-heart text-warning" aria-hidden="true"></i> by <a href="#" target="_blank" >DMNG</a>

                </p>
            </div>

        </div>
    </div>
</footer>
</div>

<script src="${pageContext.request.contextPath}/dist/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jquery.countdown.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/js/aos.js"></script>


<script src="${pageContext.request.contextPath}/dist/js/mediaelement-and-player.min.js"></script>

<script src="${pageContext.request.contextPath}/dist/js/main.js"></script>

<script type="text/javascript">
                        $(document).ready(function () {
                            if ($("#switch-disable-fn")) {
                                $("#switch-disable-fn").click(function (e) {
                                    e.preventDefault();
                                    if ($("#firstName").attr("disabled")) {
                                        $("#firstName").prop("disabled", false);
                                    } else {
                                        $("#firstName").prop("disabled", true);
                                    }
                                });
                            }
                            if ($("#switch-disable-ln")) {
                                $("#switch-disable-ln").click(function (e) {
                                    e.preventDefault();
                                    if ($("#lastName").attr("disabled")) {
                                        $("#lastName").prop("disabled", false);
                                    } else {
                                        $("#lastName").prop("disabled", true);
                                    }
                                });
                            }
                            if ($("#switch-disable-e")) {
                                $("#switch-disable-e").click(function (e) {
                                    e.preventDefault();
                                    if ($("#email").attr("disabled")) {
                                        $("#email").prop("disabled", false);
                                    } else {
                                        $("#email").prop("disabled", true);
                                    }
                                });
                            }
                            if ($("#switch-disable-p")) {
                                $("#switch-disable-p").click(function (e) {
                                    e.preventDefault();
                                    if ($("#password").attr("disabled")) {
                                        $("#password").prop("disabled", false);
                                    } else {
                                        $("#password").prop("disabled", true);
                                    }
                                });
                            }
                            if ($("#switch-disable-m")) {
                                $("#switch-disable-m").click(function (e) {
                                    e.preventDefault();
                                    if ($("#phone1").attr("disabled")) {
                                        $("#phone1").prop("disabled", false);
                                    } else {
                                        $("#phone1").prop("disabled", true);
                                    }
                                });
                            }
                            if ($("#switch-disable-l")) {
                                $("#switch-disable-l").click(function (e) {
                                    e.preventDefault();
                                    if ($("#phone2").attr("disabled")) {
                                        $("#phone2").prop("disabled", false);
                                    } else {
                                        $("#phone2").prop("disabled", true);
                                    }
                                });
                            }


                        });
</script>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;

        for (var i = 0; i < total; i++) {
            new MediaElementPlayer(mediaElements[i], {
                pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                shimScriptAccess: 'always',
                success: function () {
                    var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
                    for (var j = 0; j < targetTotal; j++) {
                        target[j].style.visibility = 'visible';
                    }
                }
            });
        }
    });
</script>


<script>
    // This example displays an address form, using the autocomplete feature
    // of the Google Places API to help users fill in the information.

    // This example requires the Places library. Include the libraries=places
    // parameter when you first load the API. For example:
    // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

    var placeSearch, autocomplete;
    var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
    };

    function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
                /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
                {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
    }

    function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
            document.getElementById(component).value = '';
            document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
            var addressType = place.address_components[i].types[0];
            if (componentForm[addressType]) {
                var val = place.address_components[i][componentForm[addressType]];
                document.getElementById(addressType).value = val;
            }
        }
    }

    // Bias the autocomplete object to the user's geographical location,
    // as supplied by the browser's 'navigator.geolocation' object.
    function geolocate() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var geolocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var circle = new google.maps.Circle({
                    center: geolocation,
                    radius: position.coords.accuracy
                });
                autocomplete.setBounds(circle.getBounds());
            });
        }
    }

    var profMarkers = null;

    function clearMarkers() {
        if (profMarkers){
            for (let i=0; i<profMarkers.length;i++){
                profMarkers[i].setMap(null);
            }
            profMarkers = null;
        }
    }

    $("#search").click(function (e) {
        e.preventDefault();
        clearMarkers();
        $('.jobs-wrap').html('');
        // var id = $('#pro').val();
        // alert(id);
        var form = document.forms[0];
        //FormData makes all the files from the form in a name/value object
        var formData = new FormData(form);
        alert('ajax');
        $.ajax({
            url: '${pageContext.request.contextPath}/profsREST.htm',
            contentType: false,
            data: formData,
            type: 'POST',
            processData: false,
            success: function (result) {
                alert('Received');
                var jsonobj = $.parseJSON(result);
                alert(jsonobj);
                profMarkers = [];
                if (!jsonobj) {
                    alert('There are no profs of this kind');
                } else {
                    $.each(jsonobj, function (i, item) {
                        $profCard = $('<a href="${pageContext.request.contextPath}/WEB-INF/jsp/job-single.jsp" class="job-item d-block d-md-flex align-items-center  border-bottom fulltime">').append(
                            $('<div class="company-logo blank-logo text-center text-md-left pl-3">').append(
                                $('<img src="${pageContext.request.contextPath}/dist/images/person_1.jpg" alt="Image" class="img-fluid mx-auto">')),
                            $('<div class="job-details">').append(
                                $('<div class="p-3 align-self-center">').append(
                                    $('<h3>').append(item.userEntity.firstName + ' ' + item.userEntity.lastName),
                                    $('<div class="d-block d-lg-flex">').append(
                                        $('<div class="row">').append(
                                            $('<div class="mr-3">')).append(
                                            $('<span class="icon-room mr-1">'),(item.addressEntity.address))))),
                            $('<div class="job-category align-self-center">').append(
                                $('<div class="p-3">').append(
                                    $('<a href="tel:' + item.phoneEntity.mobile + '" class="text-info p-2 rounded border border-info">').append(
                                        $('<span class="icon-phone2">')))));
                        $('.jobs-wrap').append($profCard);
                        var m = new google.maps.Marker({
                            position: new google.maps.LatLng(parseFloat(item.addressEntity.latit),parseFloat(item.addressEntity.longit)) ,
                            map: map
                        });
                        profMarkers.push(m);
                    });
                }
            }
        });
    });


</script>
<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBpNb7KwtNgmsphG-7u8AhPPZ_h_4ZkG5Y&libraries=places&callback=initMap"></script>--%>
<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&libraries=places&callback=initAutocomplete"--%>
<%--async defer></script>--%>
</body>

</html>