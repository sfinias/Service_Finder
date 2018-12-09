<%@include file = "header.jsp" %>


<div class="site-blocks-cover overlay" style="background-image: url('../../dist/images/hero_1.jpg');" data-aos="fade"
     data-stellar-background-ratio="0.5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12" data-aos="fade">
                <h1>Find Service</h1>
                <form action="#">
                    <div class="row mb-3">
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6 mb-3 mb-md-0">                                       
                                    <select class="form-control form-control-block search-input  border-0 px-4" id="inputGroupSelect02" placeholder="city, province or region" onFocus="geolocate()">
                                        <option selected>Choose Service...</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>                                   
                                </div>
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <div class="input-wrap">
                                        <span class="icon icon-room"></span>                        
                                        <select class="form-control form-control-block search-input  border-0 px-4" id="inputGroupSelect02" placeholder="city, province or region" onFocus="geolocate()">
                                            <option selected>Choose Location...</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <input type="submit" class="btn btn-search btn-primary btn-block" value="Search">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%@include file = "footer.jsp" %>
