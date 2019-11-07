//$(document).ready(function () {
//    resetdiv();
//    $(".subinfodiv").hide();
//    $(".textBlock").hide();
//    $(".previewdiv").hide();
//    $("#next2").hide();
//    $("#ImageText").hide();
//});
//function resetdiv() {
//    $("#divSignin").hide();
//    $("#divSignup").hide();
//    $("#divforgotpw").hide();
//}
//function EL(id) { return document.getElementById(id); } // Get el by ID helper function

//function readFile() {
//    if (this.files && this.files[0]) {
//        var FR = new FileReader();
//        FR.onload = function (e) {
//            EL("uploadimage").src = e.target.result;
//            $(".infodiv").hide();
//            $(".subinfodiv").show();
//        };
//        FR.readAsDataURL(this.files[0]);
//    }
//}
//EL("imgupload").addEventListener("change", readFile, false);
//$('.OpenImgUpload').click(function () { $('#imgupload').trigger('click'); });
//$('.ClearImage').click(function () {
//    EL("uploadimage").src = "img/defaultImage.jpg";
//    $(".infodiv").show();
//    $(".subinfodiv").hide();
//    $(".textBlock").hide();
//    $(".previewdiv").hide();
//    $("#next2").hide();
//    $("#next1").show();
//    $("#ImageText").hide();
//    resetdiv();
//});
//$('.next1').click(function () {
//    $(".textBlock").show();
//    $(".subinfodiv").hide();

//    $("#next1").hide();
//    $("#next2").show();
//});
//$('.next2').click(function () {
//    $(".subinfodiv").hide();
//    $(".textBlock").hide();
//    $(".previewdiv").show();
//    $("#next2").hide();
//    $("#ImageText").show();
//    $("#ImageText").html($("#addtext").val());
//    if ($('input[name="optradio"]:checked').val() == "black")
//        $(".centered").css("color", "black");
//    else if ($('input[name="optradio"]:checked').val() == "red")
//        $(".centered").css("color", "#FF0000");
//    else if ($('input[name="optradio"]:checked').val() == "yellow")
//        $(".centered").css("color", "#0FFFF00");
//    else if ($('input[name="optradio"]:checked').val() == "blue")
//        $(".centered").css("color", "#00B0F0");
//});
//$('.next3').click(function () {
//    $("#divSignin").show();
//    $(".subinfodiv").hide();
//    $(".textBlock").hide();
//    $(".previewdiv").hide();
//    $("#ImageText").hide();
//    $(".imgcontainer").hide();
//    //var tempdata = new Object();
//    //tempdata.Text = $("#addtext").val();
//    //tempdata.Color = $('input[name="optradio"]:checked').val();
//    //tempdata.Discount = $("#discount").val()
//    //tempdata.Img = $("#uploadimage").attr("src").split(",")[1];
//    //jQuery.ajax({
//    //    type: 'POST',
//    //    contentType: "application/json; charset=utf-8",
//    //    url: 'BilliardScoreboard.asmx/SaveAdvertisement',
//    //    data: "{'data':" + JSON.stringify(tempdata) + "}",
//    //    dataType: 'JSON',
//    //    success: function (response) {
//    //        alert(JSON.stringify(response));
//    //    },
//    //    error: function (err) {
//    //        alert("error : " + err);
//    //    }
//    //});
//});

//$('#aForgotpw').click(function () {
//    $("#divSignin").hide();
//    $("#divSignup").hide();
//    $("#divforgotpw").show();
//});

//$('#aSignup').click(function () {
//    $("#divSignin").hide();
//    $("#divSignup").show();
//    $("#divforgotpw").hide();
//});

//$('#btnforgotpw').click(function () {
//    $("#divSignin").show();
//    $("#divSignup").hide();
//    $("#divforgotpw").hide();
//});

//$('#aSignup').click(function () {
//    $("#divSignin").hide();
//    $("#divSignup").show();
//    $("#divforgotpw").hide();
//});

//$('#btnSignin').click(function () {
//    $("#divSignin").hide();
//    $("#divSignup").show();
//    $("#divforgotpw").hide();
//});

//$('#btnSignup').click(function () {
//    var tempdata = new Object();
//    tempdata.Text = $("#addtext").val();
//    tempdata.Color = $('input[name="optradio"]:checked').val();
//    tempdata.Discount = $("#discount").val()
//    tempdata.Img = $("#uploadimage").attr("src").split(",")[1];
//});

//$('#btnforgotpw').click(function () {
//    $("#divSignin").hide();
//    $("#divSignup").show();
//    $("#divforgotpw").hide();
//});

