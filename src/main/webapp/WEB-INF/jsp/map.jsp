<script>

    var marker = null;
    var defaultProp = {
        center: new google.maps.LatLng(37.98, 23.72),
        zoom: 7,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("googleMap"), defaultProp);

    var autocomplete = new google.maps.places.Autocomplete(document.getElementById('address'));
    autocomplete.bindTo('bounds', map);
    autocomplete.setTypes(['address']);
    autocomplete.addListener('place_changed', function() {
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            window.alert("No details available for input: '" + place.name + "'");
            return;
        }
        moveMark(place.geometry.location);
    });

    function moveMark(pos){
        document.getElementById('long').value=pos.lng();
        document.getElementById('lat').value=pos.lat();
        if (marker != null) marker.setMap(null);
        marker = new google.maps.Marker({
            position: pos,
            map: map
        });
        map.panTo(pos);
        map.setZoom(14);
    }

    var geocoder = new google.maps.Geocoder();
    google.maps.event.addListener(map, 'click', function(event) {
        pos = new google.maps.LatLng(parseFloat(event.latLng.lat()),parseFloat(event.latLng.lng()));
        moveMark(pos);
        getAddress(pos);
    });

    document.getElementById('loc').onclick = function (ev){
        ev.preventDefault();
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var pos = new google.maps.LatLng(parseFloat(position.coords.latitude),parseFloat(position.coords.longitude));
                moveMark(pos);
                getAddress(pos);
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
                    document.getElementById('address').value=results[0].formatted_address;
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
                        $profCard = $('<a href="${pageContext.request.contextPath}/user/viewselectedprof.htm?email='+item.userEntity.email+'" name="email" class="job-item d-block d-md-flex align-items-center  border-bottom fulltime">').append(
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