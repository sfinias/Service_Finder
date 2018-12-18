var ajaxEnabled = true;
var emailEnabled = true;
var passwordEnabled = true;
var enabled = true;

EnableSubmit = function (val) {
    var sbmt = document.getElementById("actionLogin");

    if (val.checked === true) {
        sbmt.disabled = false;
    } else {
        sbmt.disabled = true;
    }
};

EnableEmail = function () {
    document.getElementById('message5').innerHTML = '';
    if (document.getElementById('email').value ===
        document.getElementById('emailConfirm').value) {
        emailEnabled = true;
    } else {
        emailEnabled = false;
    }
};

EnablePassword = function () {
    document.getElementById('message5').innerHTML = '';
    if (document.getElementById('pass').value ===
        document.getElementById('passwordConfirm').value) {
        passwordEnabled = true;
    } else {
        passwordEnabled = false;
    }
};

CheckEmail = function () {
    if (document.getElementById('email').value ===
        document.getElementById('emailConfirm').value) {
        document.getElementById('message1').style.color = 'green';
        document.getElementById('message1').innerHTML = 'E-mails match';
    } else {
        document.getElementById('message1').style.color = 'red';
        document.getElementById('message1').innerHTML = 'E-mails do not match';
    }
};

CheckPassword = function () {
    if (document.getElementById('pass').value ===
        document.getElementById('passwordConfirm').value) {
        document.getElementById('message2').style.color = 'green';
        document.getElementById('message2').innerHTML = 'Passwords match';
    } else {
        document.getElementById('message2').style.color = 'red';
        document.getElementById('message2').innerHTML = 'Passwords do not match';
    }
};

// changeColour=function(e){
//     alert("1st in");
//     var a=document.getElementsByName("professionalSelection").item(0);
//     if(a.value==="true"){
//         alert("2nd in");
//         $("#proftrue").css("color","greenyellow !important");
//         $("#proffalse").css("color","white");
//     }
//     else if(a.value==="false"){
//         alert("3rd in");
//         $("#proftrue").css("color","white");
//         $("#proffalse").css("color","greenyellow");
//     }
// };

toggleField=function(){
    var a=$("#profselect").val();
    if(a==="User"){
        $("#address").removeAttr("required");
        $(".displayNone").hide();
        SelectElement("professionId",1);
        alert($("#professionId").val());
    }
    else if(a==="Professional"){
        alert($("#professionId").val());
        $("#address").attr("required","required");
        $(".displayNone").show();
    }
};



function SelectElement(id, valueToSelect)
{
    var element = document.getElementById(id);
    element.value = valueToSelect;
}

// $('#register-form').disableAutoFill({
//     passwordField: '.password',
//     debugMode: false,
//     randomizeInputName: true,
//     html5FormValidate: true
// });

function blockSpecialChar(e) {
    var k = e.charCode || e.keyCode;
    return ((k > 64 && k < 91) || ((k > 903 && k < 975) || (k > 96 && k < 123) || k === 8 || k === 902));
}

function blockSpecialCharForNumber(e) {
    var k = e.charCode || e.keyCode;
    return ((k > 47 && k < 58) || k === 43);
}

function checkBeforeSubmit(event) {
    enabled2 = ((emailEnabled && passwordEnabled) && ajaxEnabled);
    if (enabled2 !== true) {
        event.preventDefault();
        document.getElementById('message5').style.color = 'red';
        document.getElementById('message5').innerHTML = 'Please check the data you submitted';
    }
}

$(document).ready(function () {
    $("#email").keyup(function () {

        var text = $(this).val();
        document.getElementById('message4').style.color = 'blue';
        document.getElementById('message4').innerHTML = 'Please allow some seconds to check the database';
        $.ajax({
            url: '${pageContext.request.contextPath}/usersREST.htm',
            contentType: 'application/json',
            success: function (result) {
                var jsonobj = $.parseJSON(result);
                alert(jsonobj);
                alert(jsonobj.Boolean);
                if (jsonobj.Boolean){
                    document.getElementById('message4').style.color = 'green';
                    document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';
                }else {
                    document.getElementById('message4').style.color = 'red';
                    document.getElementById('message4').innerHTML = 'E-mail already exists!!';
                }
                // count = 1;
                // if (jsonobj.length === 0) {
                //     document.getElementById('message4').style.color = 'green';
                //     document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';
                //     ajaxEnabled = true;
                // } else {
                //     $.each(jsonobj, function (i, item) {
                //         if (item === text) {
                //             document.getElementById('message4').style.color = 'red';
                //             document.getElementById('message4').innerHTML = 'E-mail already exists!!';
                //             ajaxEnabled = false;
                //         } else if (item !== text && count === jsonobj.length) {
                //             document.getElementById('message4').style.color = 'green';
                //             document.getElementById('message4').innerHTML = 'This e-mail is acceptable!!';
                //             ajaxEnabled = true;
                //         } else if (item !== text && count < jsonobj.length) {
                //             count = count + 1;
                //         }
                //     });
                // }
            }
        });
    });
});


$().ready(function () {
    $("#card").flip({
        trigger: 'manual'
    });
});


$(".signup_link").click(function () {

    $(".signin_form").css('opacity', '0');
    $(".signup_form").css('opacity', '100');


    $("#card").flip(true);

    return false;
});

$("#unflip-btn").click(function () {

    $(".signin_form").css('opacity', '100');
    $(".signup_form").css('opacity', '0');

    $("#card").flip(false);

    return false;

});