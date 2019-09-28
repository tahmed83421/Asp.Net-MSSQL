
function ValidateRequiredField() {
    var glvar;
    var status = true;
    var recipient = "";
    
    $("#divbody :text").each(function (index, item) {
        recipient = $(item).attr('data-val-required'); //For Mandatory TextBox
        Email = $(item).attr('data-Emailval-required'); //For Email

        if (recipient == "true") {
            if ($(item).attr("placeholder", "Value Required")) {
                if ($(item).val() == "") {
                    status = false;
                    $(item).focus();
                    var message = $(item).attr('message');
                    alert(message);
                    //alert("Please enter any value.");
                    glvar = "1";
                    return false;
                }
            };
        }
        else if (Email == "true") {
            if ($(item).val() != "") {
                var EmailAddress = $(item).val();
                if (IsEmail(EmailAddress) == false) {
                    $(item).focus();
                    alert("Please enter valid E-mail address.");
                    glvar = "1";
                    status = false;
                    return false;

                }
            }
            else if ($(item).val() == "") {
                status = false;
                $(item).focus();
                var message = $(item).attr('message');
                alert(message);
                glvar = "1";
                return false;
            }
        }
    });

    if (glvar != "1") {
        $('.required').each(function () {
            //debugger;
            var checked = $(this).find('input:radio:checked');
            if (checked.length == 0) {
                status = false;
                var message = $(this).attr('message');
                alert(message);
                return false;
            }
        });
    }
    if (status == false) {
        return false;
    }
    else {
        return true;
    }
}
function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!regex.test(email)) {
        return false;
    } else {
        return true;
    }
}







