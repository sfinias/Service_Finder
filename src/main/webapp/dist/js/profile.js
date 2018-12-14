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

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imagePreview').css('background-image', 'url(' + e.target.result + ')');
                $('#imagePreview').hide();
                $('#imagePreview').fadeIn(650);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }


    $("#imageUpload").change(function (e) { // ???? handler ??? input type
        //  alert("88888");
        //e.preventDefault();//??? ???? ?? ????? submit
        var form = document.forms[1];//???? ??? ????? ????
        var formData = new FormData(form);//html5 FormData
        var ajaxReq = $.ajax({
            url: 'fileUpload.htm',
            type:'POST',
            data: formData,
            cache: false,//mporei k na mi xreiazetai sto post
            //to documentation leei na mi cacharetai i selida
            contentType: false, // ???? ?? ??? ????? content-type ??? request
            //den jerw ti arxeio tha m steilei
            processData: false // ?? ??? ?? ????? string ??? ?? ?? ???????
            //Callback for creating the XMLHttpRequest object
        });readURL(this);

        // Called on success of file upload
        ajaxReq.done(function (msg) {
            //alert("done")
            $('#alertMsg').text(msg);//???????? ??? ??? controller
            $('#imageUpload').val('');

        });

        // Called on failure of file upload
        ajaxReq.fail(function (jqXHR) {
            $('#alertMsg').text(jqXHR.responseText + '(' + jqXHR.status +
                ' - ' + jqXHR.statusText + ')');
//                        $('#myfileuploading').prop('disabled', false);
        });
    });
});