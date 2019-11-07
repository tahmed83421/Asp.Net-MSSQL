<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="advertaising.aspx.cs" Inherits="BilliardScoreboard.advertaising" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>
<html xmlns="https://www.w3.org/1999/xhtml" ng-app="myApp">
<head runat="server">
    <title>Billiard Professional</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <%--<link rel="stylesheet" href="css/components.css" />--%>
    <%--<link rel="stylesheet" href="css/responsee.css" />--%>
    <%--<link rel="stylesheet" href="css/custom.css" />--%>
    <!-- CUSTOM STYLE -->
    <link rel="stylesheet" href="css/template-style.css" />
    <%--<link href="css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css' />
    <%--<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>--%>
    <script src="/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/responsee.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    
    <%--<script type="text/javascript" src="advertisement.js"></script>--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="../js/Zoom.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.7.5/angular.min.js"></script>
    <!--[if lt IE 9]> 
    <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
    
    <![endif]-->
    <style>
        @font-face {
            font-family: 'Arial Rounded MT Bold';
            font-style: normal;
            font-weight: normal;
            src: local('Arial Rounded MT Bold'), url('font/ARLRDBD_0.woff') format('woff');
        }
        #ImageText {
                /*font-size: 16px;*/
                /*font-family: Ariel Rounded MT Bold;*/
                font-size:30px;
                max-width:500px;
                animation: blinker 2s linear infinite;
                word-break:break-word;
            }
        #TotalAdv {
                width:100%;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
            #TotalVisitor {
                width:100%;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
            #TotalDisountReuest {
                width:100%;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
        .auto-style1 {
            border: 1px solid #000000;
        }

        .auto-style2 {
            text-align: center;
        }

        .auto-style9 {
            color: #FFFFFF;
        }

        .auto-style10 {
            border: 1px solid #666666;
            text-align: center;
        }

        .auto-style12 > h4, h5 {
            text-align: center;
            font-family: "Arial Unicode MS";
        }

        .auto-style14 {
            font-family: "Courier New";
            font-size: large;
        }

        .auto-style15 {
            border-width: 0px;
        }

        .auto-style18 {
            border: 1px solid #FF0000;
            text-align: center;
        }

        .auto-style20 {
            font-family: "Arial Unicode MS";
            font-size: small;
        }

        .auto-style21 {
            border: 1px solid #666666;
            text-align: center;
            font-size: small;
        }

        .auto-style22 {
            color: #FF0000;
            font-family: "Courier New";
            font-size: x-large;
        }

        .auto-style23 {
            color: #FFFFFF;
            font-family: "Arial Unicode MS";
            font-size: small;
        }

        .auto-style24 {
            border-width: 0;
        }

        .errormessage {
            color: black;
        }

        #loader {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        /* Add animation to "page content" */
        .animate-bottom {
            position: relative;
            -webkit-animation-name: animatebottom;
            -webkit-animation-duration: 1s;
            animation-name: animatebottom;
            animation-duration: 1s
        }

        @-webkit-keyframes animatebottom {
            from {
                bottom: -100px;
                opacity: 0
            }

            to {
                bottom: 0px;
                opacity: 1
            }
        }

        @keyframes animatebottom {
            from {
                bottom: -100px;
                opacity: 0
            }

            to {
                bottom: 0;
                opacity: 1
            }
        }

        html {
            height: 100%;
        }

        body {
            min-height: 100%;
            background-color: black;
            font-family: monospace;
            color: white;
            font-size: 14px;
        }

        hr {
            margin-top: 0px;
            margin-bottom: 23px;
            border: 0;
            border-top: 2px solid #8B8B8B;
        }

        .InfoPenal {
            font-family: monospace;
        }

        .icon_cloud {
            max-height: 45px;
            width: auto;
        }

        .icon_cancle {
            max-height: 30px;
            width: auto;
        }

        input[type=text], input[type=password] {
            height: calc(1.75rem + 2px);
        }

        @media (max-width: 575.98px) {
        }

        /*Small devices (landscape phones, 576px and up)*/
        @media (min-width: 576px) and (max-width: 767.98px) {
        }

        /*Medium devices (tablets, 768px and up)*/
        @media (min-width: 768px) and (max-width: 991.98px) {
        }

        @media (min-width: 768px) and (max-width: 1024px) {
        }
        /*Large devices (desktops, 992px and up)*/
        @media (min-width: 992px) and (max-width: 1199.98px) {
        }

        /*Extra large devices (large desktops, 1200px and up)*/
        @media (min-width: 1200px) {
        }

        #uploadimage {
            min-height: 250px;
            position: relative;
            vertical-align: middle;
            /*width: 80%;*/
            width: 800px;
            max-height: 100%;
            border: 1px solid white;
        }

        input[type=radio] {
            display: block !important;
            cursor: pointer;
        }

        .radioyellow:after {
            width: 15px;
            height: 15px;
            border-radius: 15px;
            top: -2px;
            left: -1px;
            position: relative;
            /*background-color: #FFFF00;*/
            background-color: black;
            content: '';
            display: inline-block;
            visibility: visible;
            border: 1px solid white;
        }

        .radiored:after {
            width: 15px;
            height: 15px;
            border-radius: 15px;
            top: -2px;
            left: -1px;
            position: relative;
            background-color: #FF0000;
            content: '';
            display: inline-block;
            visibility: visible;
            border: 1px solid white;
        }

        .radioblack:after {
            width: 15px;
            height: 15px;
            border-radius: 15px;
            top: -2px;
            left: -1px;
            position: relative;
            background-color: white;
            content: '';
            display: inline-block;
            visibility: visible;
            border: 1px solid white;
        }

        .radioblue:after {
            width: 15px;
            height: 15px;
            border-radius: 15px;
            top: -2px;
            left: -1px;
            position: relative;
            background-color: #00B0F0;
            content: '';
            display: inline-block;
            visibility: visible;
            border: 1px solid white;
        }
        /**/
        input[type='radio']:checked:after {
            width: 15px;
            height: 15px;
            border-radius: 15px;
            top: -2px;
            left: -1px;
            position: relative;
            content: '';
            display: inline-block;
            visibility: visible;
            border: 2px solid white;
        }

        .imgcontainer {
            position: relative;
            text-align: center;
            color: white;
        }

        @media screen and (min-width:1024px) {
            .centered {
               position: absolute;
                /*top: 50%;*/
                top: 10%;
                left: 50%;
                  /*color: yellow;*/
                color: black;
                transform: translate(-50%, -50%);
                line-height: 3.5rem;
                font-size: 32px;
                font-weight: 400;
            }
        }

        .accept_s {
            visibility: hidden;
        }

        .accept_l {
            visibility: visible;
        }

        @media screen and (max-width:1024px) {
            .centered {
                position: absolute;
                /*top: 50%;*/
                top: 10%;
                left: 50%;
                  /*color: yellow;*/
                color: black;
                transform: translate(-50%, -50%);
                line-height: 3.0rem;
                font-size: 20px;
                font-weight: 400;
            }
        }

        .Privacy {
            margin-top: 1%;
        }

        .divpvBtn {
            margin-top: 2%;
        }

        .acc_info {
            margin: 0% 10%;
        }

        @media screen and (max-width: 767px) {
            .accept_s {
                visibility: visible;
            }

            .accept_l {
                visibility: hidden;
            }

            .acc_info {
                margin: 0% 1%;
            }

            #uploadimage {
                width: 100%;
            }

            .canclepopup {
                max-height: 20px;
            }

            #loader {
                left: 54%;
            }

            .Privacy {
                margin-top: 5%;
            }

            .divpvBtn {
                margin-top: 5%;
            }

            .auto-style12 > h4, h5 {
                text-align: center;
                font-family: "Arial Unicode MS";
                font-size: 10px !important;
            }

            .textBlock > h5 {
                font-size: 10px !important;
            }

            #addtext {
                width: 70% !important;
                font-size: 16px !important;
            }

            .logintext {
                font-size: 8px;
            }

            #aForgotpw {
                font-size: 12px !important;
            }

            #aSignup {
                font-size: 12px !important;
            }

            #discount {
                width: 25px !important;
            }

            .loginheadtext {
                font-size: 14px !important;
            }

            .modal-content {
                width: 60% !important;
            }

            .centered {
                position: absolute;
                /*top: 50%;*/
                top: 10%;
                left: 50%;
                 /*color: yellow;*/
                color: black;
                transform: translate(-50%, -50%);
                line-height: 1.0rem;
                font-size: 8px;
                font-weight: 400;
            }
            #ImageText {
                font-size:14px;
            }
            #TotalAdv {
                width:25px;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
            #TotalVisitor {
                width:25px;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
            #TotalDisountReuest {
                width:25px;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
        }

        @media screen and (max-width: 425px) {
            .centered {
                 position: absolute;
                /*top: 50%;*/
                top: 10%;
                left: 50%;
                 /*color: yellow;*/
                color: black;
                transform: translate(-50%, -50%);
                line-height: 1.0rem;
                font-size: 8px;
                font-weight: 400;
            }
            #ImageText {
                font-size:14px;
            }
            #TotalAdv {
                width:25px;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
            #TotalVisitor {
                width:25px;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
            #TotalDisountReuest {
                width:25px;
                border-radius: .25rem;
                border: 1px solid #ced4da;
            }
        }

        input[type='radio']:checked:after {
            box-shadow: 0 0 5px 0px gray inset;
            border: 2px solid green;
        }

        @media screen and (max-width: 320px) {
            .centered {
                position: absolute;
                top: 50%;
                left: 50%;
                  /*color: yellow;*/
                color: black;
                transform: translate(-50%, -50%);
                line-height: 1.0rem;
                font-size: 8px;
                font-weight: 400;
            }
        }

        .modal-dialog {
            top: 50%;
        }

        @media screen and (orientation:portrait) {
            .modal-dialog {
                top: 50%;
            }

            input[type=radio] {
                /* Remove First */
                -webkit-appearance: none;
            }

            input[type='radio']:checked:after {
                box-shadow: 0 0 5px 0px gray inset;
                border: 2px solid green;
            }

            input[type='radio']:hover {
                box-shadow: 0 0 5px 0px orange inset;
            }
        }

        @media screen and (max-width: 992px) and (orientation:landscape) {
            .modal-dialog {
                top: 70% !important;
                left: 15%;
            }

            .tempspan {
                display: none !important;
            }

            .logintext {
                font-size: 12px;
            }

            .auto-style12 > h4, h5 {
                text-align: center;
                font-family: "Arial Unicode MS";
                font-size: 12px !important;
            }

            .textBlock > h5 {
                font-size: 12px !important;
            }

            #aForgotpw {
                font-size: 12px !important;
            }

            #aSignup {
                font-size: 12px !important;
            }

            .loginheadtext {
                font-size: 18px !important;
            }
            #ImageText {
                font-size:18px;
            }
        }

        @media screen and (max-width: 992px) and (orientation:portrait) {
            .modal-dialog {
                top: 60% !important;
                left: 20%;
            }
        }

        @media screen and (max-width: 992px) {
            #ImageText {
                font-size: 10px;
            }
        }
        
    </style>
</head>
<body ng-controller="AdvControler">
    <div id="loader" style="display: none;"></div>

    <div id="head">
        <div class="line">
            <asp:Image ID="logo" runat="server" ImageUrl="~/img/logotop.png" />
            <h1>
                <asp:Label ID="lblHeading" runat="server"></asp:Label></h1>
        </div>
        <hr />
    </div>

    <div class="container-fluid">
        <div id="InfoContent">
            <div class="row infodiv">
                <div class="col">
                    <div class="row justify-content-end">
                        <img src="img/english_Info1.png" style="" class="d-none d-md-block" />
                    </div>
                </div>
                <div class="col-1">
                    <div class="row justify-content-center">
                        <img src="img/cloud-icon.png" style="cursor: pointer;" class="OpenImgUpload icon_cloud d-none d-md-block" />
                    </div>
                    <div class="row justify-content-center">
                        <img src="img/cancle.png" style="cursor: pointer;" class="ClearImage icon_cancle d-none d-md-block" />
                    </div>
                </div>
                <div class="col">
                    <div class="row justify-content-start">
                        <img src="img/italy_info.png" style="margin-top:4px;" class="d-none d-md-block" />
                    </div>
                </div>
            </div>
            <div class="row justify-content-center infodiv">
                <div class="col-10 text-center" style="width: 100%; padding: 0px !important">
                    <img src="img/english_Info1.png" style="width: 100%; padding: 2%" class="d-block d-md-none text-center" />
                </div>
            </div>
            <div class="row justify-content-center infodiv">
                <div class="col-10 text-center" style="width: 100%; padding: 0px !important">
                    <img src="img/italy_info.png" style="width: 100%; padding: 2%" class="d-block d-md-none text-center" />
                </div>
            </div>
            <div class="row justify-content-center infodiv">
                <div class="col row justify-content-end infodiv">
                    <img src="img/cloud-icon.png" style="margin-top: 0px; margin-right: 5px; cursor: pointer;" class="OpenImgUpload icon_cloud d-block d-md-none">
                </div>
                <div class="col row justify-content-start infodiv">
                    <img src="img/cancle.png" style="margin-top: 10px; margin-left: 5px; cursor: pointer;" class="ClearImage icon_cancle d-block d-md-none">
                </div>
            </div>
            <div class="row justify-content-center subinfodiv">
                <div class="col row justify-content-end">
                    <img src="img/cloud-icon.png" style="margin-top: 0px; margin-right: 5px; cursor: pointer;" class="OpenImgUpload icon_cloud d-block d-md-none ">
                </div>
                <div class="col row justify-content-start">
                    <img src="img/cancle.png" style="margin-top: 10px; margin-left: 5px; cursor: pointer;" class="ClearImage icon_cancle d-block d-md-none">
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-10 text-center imgcontainer" style="width: 800px; margin-top: 2%; margin-bottom: 5%;  padding: 0px !important">

                    <input type="file" id="imgupload" style="display: none" />

                    <img src="img/defaultImage.jpg" runat="server" id="uploadimage" style="" />
                    <%--<div class="col-2"></div>--%>
                    <%--text bottom start--%>
                    <%--<div class="row justify-content-center centered">
                    <div id="ImageText" class="" style="margin-top:10px;word-break:break-word;max-width:800px;">

                    </div>
                    </div>--%>
                    <%--text bottom end--%>
                    <p class="centered" id="ImageText"> </p>
                    <%--<div class="col-2"></div>--%>
                    <div class="textBlock" style="margin-top: 1%;">
                        <div class="row justify-content-center auto-style12">
                            <h5>Display time 8s / unlimited times / 10 days </h5>
                        </div>
                        <div class="row justify-content-center auto-style12">
                            <h5>Receiving mail we provide the discount of 
                        <span>
                            <input type="number" id="discount" style="width: 50px;" value="" min="1" max="99"/>&nbsp;</span>
                                %</h5>
                        </div>
                        <div class="row justify-content-center auto-style12">
                            <h5>Please insert text &nbsp;
                        <span style="padding: 5px;">
                            <div class="form-check-inline">
                                <label class="form-check-label" for="radio1" style="font-size:10px;">
                                    <input type="radio" class="form-check-input radioblack" name="optradio" value="black" checked>
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label" for="radio2" style="font-size:10px;">
                                    <input type="radio" class="form-check-input radiored" name="optradio" value="red">
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label" for="radio1" style="font-size:10px;">
                                    <%--<input type="radio" class="form-check-input radioyellow" name="optradio" value="yellow">--%>
                                    <input type="radio" class="form-check-input radioyellow" name="optradio" value="yellow">
                                </label>
                            </div>
                            <div class="form-check-inline">
                                <label class="form-check-label" for="radio2" style="font-size:10px;">
                                    <input type="radio" class="form-check-input radioblue" name="optradio" value="blue">
                                </label>
                            </div>
                        </span>
                            </h5>
                        </div>
                        <div class="row justify-content-center">
                            <textarea class="form-control" style="width: 300px; background-color: black; border: 1px solid white; color: white;" cols="50" maxlength="50" rows="2" id="addtext"></textarea>
                        </div>
                    </div>

                    <br />
                    
                    <div class="row justify-content-center previewinitdiv">
                        <div class="col row justify-content-end">
                            <img src="img/cancle.png" id="cancle2" style="display:none;margin-top: 13px; margin-right: 2%; cursor: pointer;height:35px !important;" class="ClearImage">
                        </div>
                        <div class="col row justify-content-start divnext1" style="margin-right:2%;">
                            <img src="img/nexticon.png" class="next1" id="next1" style="height: 50px; cursor: pointer; margin-top: 1%;" />
                            <img src="img/nexticon.png" class="next2" id="next2" style="height: 50px; cursor: pointer; margin-top: 1%;" />
                        </div>
                    </div>
                    <div class="row justify-content-center previewdiv">

                        <div class="col row justify-content-end">
                            <img src="img/cancle.png" style="margin-top: 13px; margin-right: 2%; cursor: pointer;height:35px !important;" class="ClearImage">
                        </div>
                        <div class="col row justify-content-start">
                            <img src="img/nexticon.png" class="next3" id="next3" style="height: 50px; cursor: pointer; margin-top: 5px; margin-left: 2%;" />
                        </div>
                    </div>


                </div>
            </div>

            <%--signin start--%>
            <div class="row justify-content-center" id="divSignin" style="display: none;">
                <h5 class="col-12 row justify-content-center loginheadtext">Start free advertising 
                </h5>
                <div class="col-12 row justify-content-center">
                    <span class="col-12 row justify-content-center" id="SignInErrorMsg" style="color: red; display: none;">Email or password dose not meatch
                    </span>
                    <%--<span class="d-none d-md-block" style="margin-right: 20px;">
                        <h5>E-mail</h5>
                    </span>--%>
                    <span class="col-10 d-block d-md-none" style="margin-right: 2%;">
                        <h5>E-mail</h5>
                    </span>
                    <span>
                        <input type="text" name="email" placeholder="Email" class="form-control" style="width: 250px;" id="txtSignInEmail"/>
                    </span>
                </div>
                <div class="col-12 row justify-content-center" style="margin-top: 12px;">
                    <%--<span class="d-none d-md-block" style="margin-right: 45px">
                        <h5>PW</h5>
                    </span>--%>
                    <span class="col-10 d-block d-md-none" style="margin-right: 2%;margin-top:5px;">
                        <h5>PW</h5>
                    </span>
                    <span>
                       <input type="password" name="password" placeholder="Password" class="form-control" id="txtSignInPw" style="width: 250px;" />
                    </span>
                </div>
                <div class="col-12 row justify-content-center">
                    <a id="aForgotpw" style="cursor: pointer;">Forget PW? &nbsp;&nbsp;</a>
                    <a id="aSignup" style="cursor: pointer;">Register Now? </a>
                </div>
                
                <div class="col-12 row justify-content-center" style="margin-top:10px;">
                    <div class="col logintext" style="margin-right: 2%; text-align: right; color: #007bff;">
                        Number of publications<br />
                        you have made
                    </div>
                    <div class="col-1 row justify-content-center">
                        <input id="TotalAdv" type="text" class="" />
                    </div>
                    <div class="col logintext" style="margin-left: 2%; color: green;">
                        Numero delle pubblicazioni<br />
                        che hai fatto 
                        <span class="col-10 d-block d-md-none tempspan" style="color:black;"> &nbsp;</span>
                    </div>
                </div>
                <div class="col-12 row justify-content-center">
                    <div class="col logintext" style="margin-right: 2%; text-align: right; color: #007bff;">
                        Number of visitors who<br />
                        saw your advertising
                    </div>
                    <div class="col-1 row justify-content-center" style="margin-top: 5px;">
                        <input id="TotalVisitor" type="text" class="" />
                    </div>
                    <div class="col logintext" style="margin-left: 2%; color: green;">
                        Numero dei visitatori che<br />
                        hanno visto la pubblicità
                        <span class="col-10 d-block d-md-none tempspan" style="color:black;"> &nbsp;</span>
                    </div>
                </div>
                <div class="col-12 row justify-content-center" style="margin-top: 5px;">
                    <div class="col logintext" style="margin-right: 2%; text-align: right; color: #007bff;">
                        Number of visitors who<br />
                        asked for the discount
                    </div>
                    <div class="col-1 row justify-content-center" style="margin-top: 5px;">
                        <input id="TotalDisountReuest" type="text" class="" />
                    </div>
                    <div class="col logintext" style="margin-left: 2%; color: green;">
                        Numero di visitatori che <br />
                        hanno chiesto lo sconto
                        <span class="col-10 d-block d-md-none tempspan" style="color:black;"> &nbsp;</span>
                    </div>
                </div>
                <div class="col-12 row justify-content-center">
                    <button class="btn btn-sm btn-danger Privacy">Privacy</button>
                </div>
                <div class="col-12 row justify-content-center divpvBtn" style="margin-top: 1%;">
                    <button class="btn btn-sm submitbtn" style="width: 250px;" id="btnSignin">Signin</button>
                </div>
                <div class="col-12 row justify-content-center divpvBtn" style="margin-top: 1%;">
                    <button class="btn btn-sm submitbtn" style="width: 250px;visibility:hidden;" id="btnSubmit">Submit</button>
                </div>
            </div>
            <%--signin end--%>
            <%--signup start--%>
            <div class="row justify-content-center" id="divSignup" style="display: none;">
                <h5 class="col-12 row justify-content-center">Register Now !
                </h5>
                <div class="col-12 row justify-content-center">
                    <span class="col-1 d-none d-md-block" style="margin-right: 2%; text-align: right;">
                        <h5>E-mail</h5>
                    </span>
                    <span class="col-9 d-block d-md-none" style="margin-right: 2%;">
                        <h5>E-mail</h5>
                    </span>
                    <span>
                        <input type="text" class="form-control" id="txtSignupEmail" />
                    </span>
                </div>
                <div class="col-12 row justify-content-center">
                    <span class="col-1 d-none d-md-block" style="margin-right: 2%; text-align: right;">
                        <h5>PW</h5>
                    </span>
                    <span class="col-9 d-block d-md-none" style="margin-right: 2%;margin-top: 3%;">
                        <h5>PW</h5>
                    </span>
                    <span>
                        <input type="password" class="form-control" id="txtSignupPW" />
                    </span>
                </div>
                <div class="col-12 row justify-content-center">
                    <span class="col-1 d-none d-md-block" style="margin-right: 2%; text-align: right;">
                        <h5>Company </h5>
                    </span>
                    <span class="col-9 d-block d-md-none" style="margin-right: 2%;margin-top: 3%;"">
                        <h5>Company</h5>
                    </span>
                    <span>
                        <input type="text" class="form-control" id="txtSignupCompany" />
                    </span>
                </div>
                <div class="col-12 row justify-content-center">
                    <span class="col-1 d-none d-md-block" style="margin-right: 2%; text-align: right;">
                        <h5>Web site</h5>
                    </span>
                    <span class="col-9 d-block d-md-none" style="margin-right: 2%;margin-top: 3%;"">
                        <h5>Web site</h5>
                    </span>
                    <span>
                        <input type="text" class="form-control" id="txtSignupWebsite" />
                    </span>
                </div>
                <div class="col-12 row justify-content-center">
                    <span class="col-1 d-none d-md-block" style="margin-right: 2%; text-align: right;">
                        <h5>VAT-IVA</h5>
                    </span>
                    <span class="col-9 d-block d-md-none" style="margin-right: 2%;margin-top: 3%;"">
                        <h5>VAT-IVA</h5>
                    </span>
                    <span>
                        <input type="text" class="form-control" id="txtSignupVat" />
                    </span>
                </div>
                <div class="col-12 row justify-content-center">
                    <span class="col-1 d-none d-md-block" style="margin-right: 2%; text-align: right;">
                        <h5>E-mail for sale</h5>
                    </span>
                    <span class="col-9 d-block d-md-none" style="margin-right: 2%;margin-top: 3%;"">
                        <h5>E-mail for sale</h5>
                    </span>
                    <span>
                        <input type="text" class="form-control" id="txtSignupEmailForSale" />
                    </span>
                </div>
                <div class="col-12 row justify-content-center">
                    <button class="btn btn-sm btn-danger Privacy">Privacy</button>
                </div>
                <div class="col-12 row justify-content-center divpvBtn" style="margin-top: 1%;">
                    <button class="btn btn-sm submitbtn" style="width: 205px;" id="btnSignup">OK !</button>
                </div>
            </div>
            <%--signup end--%>
            <%--forgotpw start--%>
            <div class="row justify-content-center" id="divforgotpw" style="display: none;">
                <div id="forgotstp1">
                    <h5 class="col-12 row justify-content-center">Forget PW ? … please insert your email<br />
                        <br />
                    </h5>
                    <div class="col-12 row justify-content-center">
                        <span style="margin-right: 3%">
                            <h5>E-mail</h5>
                        </span>
                        <span>
                            <input type="text" class="form-control" style="width: 250px;" id="txtForgotEmail" />
                        </span>
                    </div>
                    <div class="col-12 row justify-content-center" style="margin-top: 1%;">
                        <br />
                        <button class="btn btn-sm" style="border-radius: 50%;" id="btnforgotpw">
                            <span style="font-size: 150%;">OK</span>
                        </button>
                    </div>
                </div>
                <div id="forgotstp2" class="row justify-content-center" style="padding: 3%; border: 1px solid white; border-radius: 3%; display: none; cursor: pointer;" onclick="$('#divSignin').show();$('#divSignup').hide();$('#divforgotpw').hide();">
                    <h5 class="justify-content-center" style="color: #007bff; width: 100%; text-align: center;">We sent you an email check<br />
                        your box please !<br />
                    </h5>
                    -
                <h5 style="color: green; width: 100%; width: 100%; text-align: center;">Ti abbiamo inviato una mail<br />
                    controlla la tua casella
                </h5>
                </div>
                <div id="forgotstp3" class="row justify-content-center" style="padding: 3%; border: 1px solid white; border-radius: 3%; display: none; cursor: pointer;" onclick="$('#divSignin').hide();$('#divSignup').show();$('#divforgotpw').hide();">
                    <h5 style="color: #007bff; width: 100%; text-align: center;">There are not registration<br />
                        with this mail … go to<br />
                        register now!<br />
                    </h5>
                    -<br />
                    <h5 style="color: green; width: 100%; text-align: center;">Non ci sono registrazioni con<br />
                        questa mail<br />
                        … registrati ora !
                    </h5>
                </div>
            </div>
            <%--forgotpw end--%>
        </div>
        <div class="text-center" id="privacyContent" style="display: none;">
            <h4 style="color: red;">Privacy</h4>
            <div class="row acc_info" style="">
                <div class="col">
                    <div class="justify-content-end">
                        <img src="img/flag_itly.png" style="height:30px;width:60px;" class="" />
                    </div>
                    <br />
                    <div class="row justify-content-start" style="text-align:left;">
                        Sotto la responsabilità del Sig. Sergio Todeschini 
                        tramite il sito, https://www.biliardoprofessionale.it/
                        utilizzerà i dati raccolti come previsto dalla Legge.
                        Informativa ex art. 13 D.lgs. 196/2003
                        Gentile Signore/a,
                        Desideriamo informarLa che il D.lgs. n. 196 del 30
                        giugno 2003 ("Codice in materia di protezione dei dati
                        personali") prevede la tutela delle persone e di altri
                        soggetti rispetto al trattamento dei dati personali.
                        Secondo la normativa indicata, tale trattamento sarà
                        improntato ai principi di correttezza, liceità e
                        trasparenza e di tutela della Sua riservatezza e dei
                        Suoi diritti.
                        Ai sensi dell'articolo 13 del D.lgs. n.196/2003,
                        pertanto, Le forniamo le seguenti informazioni.
                        I dati da Lei forniti verranno trattati per le seguenti
                        finalità:
                        A) utilizzo del nostro network .
                        B) utilizzo dei nostri segnapunti per il gioco del
                        biliardo nel nostro network.
                        C) informazione e aggiornamento dei servizi hardware
                        e software dei nostri prodotti.
                        D) informazione dei prezzi dei nostri prodotti e
                        accessori.
                        E) trasferimento della vostra mail ai produttori da Voi
                        selezionati per ottenere gli sconti proposti.
                        Luogo di trattamento dei dati:
                        I dati vengono trattenuti presso i Server di ARUBA.it
                        che è il provider utilizzato per il nostro web.
                        In ogni momento è possibile richiedere la
                        cancellazione dei dati tramite le pagine poste nel
                        nostro web oppure richiedere la cancellazione con
                        una semplice mail.
                        Consenso dell'interessato:
                        Il/la sottoscritto/a, acquisite le informazioni fornite
                        dal titolare del trattamento ai sensi dell'articolo 13
                        del D.Lgs. 196/2003, l'interessato: 
                    </div>
                </div>
                <div class="col-1">
                    <br />
                </div>
                <div class="col">
                    <div class="justify-content-end">
                        <img src="img/flag_uk.png" style="height:30px;" class="" />
                    </div>
                    <br />
                    <div class="row" style="text-align:left;">
                        Under the responsibility of Mr. Sergio Todeschini
                        through the site, https://www.biliardoprofessionale.it/
                        will use the data collected as required by the Law.
                        Information pursuant to art. 13 D.lgs. 196/2003
                        Dear Sir / Madam,
                        We wish to inform you that the D.lgs. n. 196 of 30
                        June 2003 ("Code regarding the protection of personal
                        data") provides for the protection of persons and
                        other subjects regarding the processing of personal
                        data.
                        According to the law, this treatment will be based on
                        principles of correctness, lawfulness and transparency
                        and protection of your privacy and your rights.
                        Pursuant to Article 13 of Legislative Decree n.196 /
                        2003, therefore, we provide you with the following
                        information.
                        The data you provide will be processed for the
                        following purposes:
                        A) use of our network.
                        B) use of our scoreboards for the game of billiards in
                        our network.
                        C) information and updating of the hardware and
                        software services of our products.
                        D) information on the prices of our products and
                        accessories.
                        E) transfer of your email to the producers selected by
                        you to get the discounts offered.
                        Place of data processing
                        The data will stored into servers of ARUBA.it which is
                        the provider used for our web.
                        At any time you can request the deletion of data
                        through the pages placed in the web or request
                        cancellation with a simple email.
                        Consent of the interested party:
                        The undersigned, having acquired the information
                        provided by the data controller pursuant to article 13
                        of Legislative Decree 196/2003, the interested party:
                    </div>
                </div>
            </div>
            <br />

            <div class="row accept_s" style="margin: 0% 15%;">
                <div class=""></div>
                <div class="col-5">
                    <div class="row" style="text-align:left;">
                       <b> Io accetto</b><br>
                       <b>Io non accetto</b>
                    </div>
                </div>
                <div class="col-2">
                        <input type="radio" class="btnAccept" name="t_c" value="accepted" style="margin: 5px;-webkit-appearance: radio;">
                        <input type="radio" class="btnDecline" name="t_c" value="decline" style="margin: 5px;-webkit-appearance: radio;">
                </div>
                <div class="col-5">
                    <div class="row" style="text-align:right;">
                       <b>&nbsp;&nbsp;&nbsp;I accept</b>
                       <b>I do not accept</b>
                    </div>
                </div>
                <div class=""></div>
                <div class="col-12 row justify-content-center" style="margin-top: 1%;margin-left:10px;">
                        <button class="btn btn-sm btnokPrivacy" style="border-radius: 50%;background-color:green;color:white;" >
                            <span style="font-size: 150%;">OK</span>
                        </button>
             </div>
            </div>

            <div class="row accept_l" style="margin: -2% 15% 1% 15%;">
                <table align="center">
                    <tr>
                        <td style="text-align:left;"><b > Io accetto</b></td>
                        <td> <input type="radio" class="btnAccept" name="t_c" value="accepted" style="margin: 0px 14px;"/></td>
                        <td style="text-align:right;"><b >I accept</b></td>
                    </tr>
                    <tr>
                        <td style="text-align:left;"><b > Io non accetto</b></td>
                        <td> <input type="radio" class="btnDecline" name="t_c" value="decline" style="margin: 0px 14px;"/></td>
                        <td style="text-align:right;"><b >I do not accept</b></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td> 
                            <button class="btn btn-sm btnokPrivacy" style="border-radius: 50%;background-color:green;color:white;margin-top:15px;" >
                                <span style="font-size: 150%;">OK</span>
                            </button>
                        </td>
                        <td></td>
                    </tr>
                </table>
                <%--<div class="col"></div>
                <div class="col-2">
                    <div class="row" style="text-align:left;">
                       <b > Io accetto</b><br />
                       <b >Io non accetto</b>
                    </div>
                </div>
                <div class="col-1">
                        <input type="radio" class="btnAccept" name="t_c" value="accepted" style="margin: 5px;"/>
                        <input type="radio" class="btnDecline" name="t_c" value="decline" style="margin: 5px;"/>
                </div>
                <div class="col-2">
                    <div class="row" style="text-align:right !important;">
                       <b >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I accept</b>
                       <b >I do not accept</b>
                    </div>
                </div>
                <div class="col"></div>--%>
                <%--<div class="col-12 row justify-content-center" style="margin-top: 1%;margin-left:-10px;">
                        <button class="btn btn-sm btnokPrivacy" style="border-radius: 50%;background-color:green;color:white;" >
                            <span style="font-size: 150%;">OK</span>
                        </button>
             </div>--%>
            </div>

            
             
            <%--<div class="col-12 row justify-content-center" style="margin-top: 1%;">
                <button class="btn btn-sm" style="width: 250px;" id="btnAccept">Accept</button>
            </div>--%>
        </div>
        <div class="modal fade" id="myModal" role="dialog" style="opacity: 1;">
            <div class="modal-dialog" style="margin-top: -8em;">
                <!-- Modal content-->
                <div class="modal-content" style="border-radius: 30px; background-color: black; color: white; border: 2px solid white;">
                    <%--<div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                         <h4 class="modal-title">Message</h4>
                    </div>--%>
                    <div class="modal-body" style="padding-bottom: 1%;">
                        <p id="msgnext1" class="auto-style12">
                            <%--<span  class="errormessage" style="color:white!important"></span>--%>
                        </p>
                    </div>
                    <div class="modal-footer justify-content-center" style="border: none;padding-top: 1%;">
                        <div class="row">
                            <a href="https://www.biliardoprofessionale.it/screen.html" ng-show="IsUploadImageSucessmsg">
                                <img src="img/cancle.png" style="cursor: pointer;" class="icon_cancle" /></a>
                            <a href="" ng-show="!IsUploadImageSucessmsg" data-dismiss="modal">
                                <img src="img/cancle.png" style="cursor: pointer;" class="canclepopup icon_cancle" /></a>
                        </div>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                    </div>
                </div>
            </div>
        </div>
      </div>
        <script>
            var app = angular.module('myApp', []);
            app.controller('AdvControler', function ($scope) {
                    $(document).ready(function () {
                        resetdiv();
                        $(".subinfodiv").hide();
                        $(".textBlock").hide();
                        $(".previewdiv").hide();
                        $(".previewinitdiv").show();
                        $("#next2").hide();
                        $("#ImageText").hide();
                        $(".divpvBtn").hide();
                        var prm = getParameterByName('Advid');
                        if (prm != null)
                            GetAdvById(prm);
                    });
                    function resetdiv() {
                        $("#divSignin").hide();
                        $("#divSignup").hide();
                        $("#divforgotpw").hide();
                        EL("uploadimage").src = "img/defaultImage.jpg";
                        $(".infodiv").show();
                        $(".subinfodiv").hide();
                        $(".textBlock").hide();
                        $(".previewinitdiv").show();
                        $(".previewinitdiv").hide();
                        $("#next2").hide();
                        $("#next3").hide();
                        $("#next1").show();
                        $("#ImageText").hide();
                        $(".imgcontainer").show();
                        $("#SignInErrorMsg").hide();
                    }
                    function EL(id) { return document.getElementById(id); } // Get el by ID helper function
                    var _URL = window.URL || window.webkitURL;
                    function readFile() {
                        var file, img,srcvalue;                                                                    
                        if (this.files && this.files[0]) {
                            var FR = new FileReader();
                            var img;
                            FR.onload = function (e) {
                                srcvalue = e.target.result;
                                //EL("uploadimage").src = e.target.result;
                                //$(".infodiv").hide();
                                //$(".subinfodiv").show();
                                //$("#cancle2").show();
                                //$(".divnext1").css({ 'margin-right': '-2%' });

                                //$("#uploadimage").css({ 'min-height': 'auto' })
                            };
                            FR.readAsDataURL(this.files[0]);
                        }
                        if ((file = this.files[0])) {
                            img = new Image();
                            img.onload = function () {
                                console.log(this.width + " - " + this.height);
                                if (this.width == 800 && this.height == 450) {
                                    EL("uploadimage").src = srcvalue;
                                    $(".infodiv").hide();
                                    //$(".subinfodiv").show();
                                    $("#cancle2").show();
                                    $(".divnext1").css({ 'margin-right': '-2%' });
                                    $("#uploadimage").css({ 'min-height': 'auto' })
                                }
                                else {
                                    ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>The Uploaded image does not have the recommended size of 800 x 450 px. </h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>L'immagine caricata non ha la dimensione raccomandata di 800 x 450 px.</h4>");
                                }
                            };
                            img.src = _URL.createObjectURL(file);
                        }
                    }
                    EL("imgupload").addEventListener("change", readFile, false);
                    $('.OpenImgUpload').click(function () { $('#imgupload').trigger('click'); });
                    $('.ClearImage').click(function () {
                        location.reload();
                        //resetdiv();
                    });
                    $('.next1').click(function () {
                        if ($("#uploadimage").attr("src") == "img/defaultImage.jpg")
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please upload image</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore caricate l’immagine</h4>");
                        else {
                            $(".textBlock").show();
                            $(".subinfodiv").hide();
                            $("#next1").hide();
                            $("#next2").show();
                        }
                    });
                    $('.next2').click(function () {
                        if ($("#discount").val() > 0 && ($("#addtext").val() != undefined && $("#addtext").val() != '')) {
                            $(".subinfodiv").hide();
                            $(".textBlock").hide();
                            $(".previewdiv").show();
                            $(".previewinitdiv").hide();
                            $("#next2").hide();
                            $("#next3").show();
                            $("#ImageText").show();
                            //text bottom
                            //$("#ImageText").html($("#addtext").val());
                            $("#ImageText").text($("#addtext").val());
                            if ($('input[name="optradio"]:checked').val() == "black")
                                $(".centered").css("color", "white");
                            else if ($('input[name="optradio"]:checked').val() == "red")
                                $(".centered").css("color", "#FF0000");
                            else if ($('input[name="optradio"]:checked').val() == "yellow") {
                                //$(".centered").css("color", "#0FFFF00");
                                $(".centered").css("color", "black");
                            }
                            else if ($('input[name="optradio"]:checked').val() == "blue")
                                $(".centered").css("color", "#00B0F0");
                        }
                        else {
                            if ($("#discount").val() == 0 || $("#discount").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please insert discount </h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>perfavore inserite lo sconto</h4>");
                            }
                            //else if ($('input[name="optradio"]:checked').val() == undefined) {
                            //    $("#msgnext1").text("Please select text color");
                            //}
                            else if ($("#addtext").val() == '' || $("#addtext").val() == undefined) {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please insert text</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore inserite il testo</h4>");
                            }
                        }
                    });
                    $('.next3').click(function () {
                        $("#divSignin").show();
                        $(".subinfodiv").hide();
                        $(".textBlock").hide();
                        $(".previewdiv").hide();
                        $(".previewinitdiv").show();
                        $("#ImageText").hide();
                        $(".imgcontainer").hide();
                    });

                    $('#aForgotpw').click(function () {
                        $("#divSignin").hide();
                        $("#divSignup").hide();
                        $("#divforgotpw").show();
                    });

                    var isRegisterClick = false;
                    $('#aSignup').click(function () {
                        $("#divSignin").hide();
                        $("#divSignup").show();
                        $("#divforgotpw").hide();
                        isRegisterClick = true;
                    });

                    //$('#btnforgotpw').click(function () {
                    //    $("#divSignin").show();
                    //    $("#divSignup").hide();
                    //    $("#divforgotpw").hide();
                    //});

                    $('#aSignup').click(function () {
                        $("#divSignin").hide();
                        $("#divSignup").show();
                        $("#divforgotpw").hide();
                    });
                    $('.Privacy').click(function () {
                        var isValid = true;
                        if (isRegisterClick) {
                            if ($("#txtSignupEmail").val() == undefined || $("#txtSignupEmail").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                            else if ($("#txtSignupPW").val() == undefined || $("#txtSignupPW").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                            else if ($("#txtSignupCompany").val() == undefined || $("#txtSignupCompany").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                            else if ($("#txtSignupWebsite").val() == undefined || $("#txtSignupWebsite").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                            else if ($("#txtSignupVat").val() == undefined || $("#txtSignupVat").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                            else if ($("#txtSignupEmailForSale").val() == undefined || $("#txtSignupEmailForSale").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                        }
                        if (!isRegisterClick) {
                            if ($("#txtSignInEmail").val() == undefined || $("#txtSignInEmail").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                            else if ($("#txtSignInPw").val() == undefined || $("#txtSignInPw").val() == '') {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                                isValid = false;
                            }
                        }
                        if (isValid) {
                            $("#privacyContent").show();
                            $("#InfoContent").hide();
                        }
                    });
                    //$('.btnAccept').change(function () {
                    //    $("#privacyContent").hide();
                    //    $("#InfoContent").show();
                    //    $(".divpvBtn").show();
                    //    //$('.Privacy').attr("style", "background-color: green;border: green;")
                    //    $('.Privacy').hide();
                    //    $('.submitbtn').attr("style", "background-color: green;border: green;width: 250px;color:white;")
                    //});
                    //$('.btnDecline').change(function () {
                    //    location.reload();
                    //});
                    $('.btnokPrivacy').click(function () {
                        var chval = $("input[name='t_c']:checked").val()
                        if (chval == 'accepted') {
                            $("#privacyContent").hide();
                            $("#InfoContent").show();
                            $(".divpvBtn").show();
                            //$('.Privacy').attr("style", "background-color: green;border: green;")
                            $('.Privacy').hide();
                            $('.submitbtn').attr("style", "background-color: green;border: green;width: 250px;color:white;")
                            $("#btnSubmit").hide();
                        }
                        else if (chval == 'decline') {
                            location.reload();
                        }
                    });
                    $('#btnSignin').click(function () {
                        $("#loader").show();
                        var tempData = Object();
                        tempData.Email = $("#txtSignInEmail").val();
                        tempData.Password = $("#txtSignInPw").val();
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'BilliardScoreboard.asmx/SignIn',
                            data: "{'data':" + JSON.stringify(tempData) + "}",
                            dataType: 'JSON',
                            success: function (response) {
                                advUser = response.d;
                                if (advUser.UserId != 0) {
                                    $("#TotalAdv").val(advUser.TotalPublication);
                                    $("#TotalVisitor").val(advUser.TotalVisitors);
                                    $("#TotalDisountReuest").val(advUser.TotalDiscount);
                                    //uploadImage();
                                    $("#btnSignin").hide();
                                    $("#btnSubmit").show();
                                    $("#loader").hide();
                                    $("#SignInErrorMsg").hide();
                                }
                                else {
                                    $("#SignInErrorMsg").show();
                                    $("#loader").hide();
                                }
                            },
                            error: function (err) {
                                alert("error : " + err);
                                $("#loader").hide();
                            }
                        });
                    });

                    $('#txtSignInEmail').blur(function () {
                        $("#loader").show();
                        var tempData = Object();
                        tempData.Email = $("#txtSignInEmail").val();
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'BilliardScoreboard.asmx/GetStestics',
                            data: "{'data':" + JSON.stringify(tempData) + "}",
                            dataType: 'JSON',
                            success: function (response) {
                                advUser = response.d;
                                if (advUser.UserId != 0) {
                                    $("#TotalAdv").val(advUser.TotalPublication);
                                    $("#TotalVisitor").val(advUser.TotalVisitors);
                                    $("#TotalDisountReuest").val(advUser.TotalDiscount);
                                    //uploadImage();
                                    //$("#btnSignin").hide();
                                    //$("#btnSubmit").show();
                                    $("#loader").hide();
                                }
                                else {
                                    //$("#SignInErrorMsg").show();
                                    $("#loader").hide();
                                }
                            },
                            error: function (err) {
                                //alert("error : " + err);
                                $("#loader").hide();
                            }
                        });
                    });


                    $('#btnSubmit').click(function () {
                        $("#loader").show();
                        uploadImage();
                    });


                    var advUser = new Object();
                    $('#btnSignup').click(function () {
                        $("#loader").show();
                        if ($("#txtSignupEmail").val() == undefined || $("#txtSignupEmail").val() == '')
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                        else if ($("#txtSignupPW").val() == undefined || $("#txtSignupPW").val() == '')
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                        else if ($("#txtSignupCompany").val() == undefined || $("#txtSignupCompany").val() == '')
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                        else if ($("#txtSignupWebsite").val() == undefined || $("#txtSignupWebsite").val() == '')
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                        else if ($("#txtSignupVat").val() == undefined || $("#txtSignupVat").val() == '')
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                        else if ($("#txtSignupEmailForSale").val() == undefined || $("#txtSignupEmailForSale").val() == '')
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                        else {
                            var tempData = Object();
                            tempData.Email = $("#txtSignupEmail").val();
                            tempData.Password = $("#txtSignupPW").val();
                            tempData.Company = $("#txtSignupCompany").val();
                            tempData.Website = $("#txtSignupWebsite").val();
                            tempData.Vat = $("#txtSignupVat").val();
                            tempData.EmailForSale = $("#txtSignupEmailForSale").val();
                            jQuery.ajax({
                                type: 'POST',
                                contentType: "application/json; charset=utf-8",
                                url: 'BilliardScoreboard.asmx/SignUpAdvertiser',
                                data: "{'data':" + JSON.stringify(tempData) + "}",
                                dataType: 'JSON',
                                success: function (response) {
                                    if (response.d != -1) {
                                        $("#loader").hide();
                                        uploadSignupImage(tempData.Email, response.d);
                                    }
                                    else
                                        ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please insert different mail or password</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore inserite una differente mail o password</h4>");
                                },
                                error: function (err) {
                                    alert("error : " + err);
                                    $("#loader").hide();
                                }
                            });
                        }
                        $("#loader").hide();
                    });

                    function uploadSignupImage(email, userid) {
                        $("#loader").show();
                        var tempData = new Object();
                        tempData.UserId = userid;
                        tempData.Text = $("#addtext").val();
                        tempData.Color = $('input[name="optradio"]:checked').val();
                        tempData.Discount = $("#discount").val()
                        //imageonserver
                        //tempData.Img = $("#uploadimage").attr("src").split(",")[1];
                        tempData.Img = $("#uploadimage").attr("src");
                        tempData.IsTempStorage = true;
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'BilliardScoreboard.asmx/SaveAdvertisement',
                            data: "{'data':" + JSON.stringify(tempData) + "}",
                            dataType: 'JSON',
                            success: function (response) {
                                SendNotification("Thank you for signup", "Thank you for signup with us.Please click on below link to confirm your uploaded image<a href='" + document.location.origin + "/advertaising.aspx?Advid=" + response.d + "'>Click Here</a>", email)
                                $("#divSignin").show();
                                $("#divSignup").hide();
                                $("#divforgotpw").hide();
                                //location.reload();
                                //resetdiv();
                                $("#loader").hide();
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>We sent you an email check your box please !</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>Ti abbiamo inviato una mail controlla la tua casella</h4>");
                            },
                            error: function (err) {
                                $("#loader").hide();
                            }
                        });
                    }

                    $('#btnforgotpw').click(function () {
                        if ($("#txtForgotEmail").val() == undefined || $("#txtForgotEmail").val() == '')
                            ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>please fill in all the fields</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>per favore compilare tutti i campi</h4>");
                        else {
                            $("#loader").show();
                            var tempData = Object();
                            tempData.Email = $("#txtForgotEmail").val();
                            jQuery.ajax({
                                type: 'POST',
                                contentType: "application/json; charset=utf-8",
                                url: 'BilliardScoreboard.asmx/ForgotPw',
                                data: "{'data':" + JSON.stringify(tempData) + "}",
                                dataType: 'JSON',
                                success: function (response) {
                                    advUser = response.d;
                                    $("#forgotstp1").hide();
                                    if (advUser.UserId != 0) {
                                        $("#forgotstp2").show();
                                    }
                                    else {
                                        $("#forgotstp3").show();
                                    }
                                    $("#loader").hide();
                                },
                                error: function (err) {
                                    alert("error : " + err);
                                    $("#loader").hide();
                                }
                            });
                        }
                        //$("#divSignin").hide();
                        //$("#divSignup").show();
                        //$("#divforgotpw").hide();
                        //$("#txtForgotEmail").val();
                    });
                    function SendAjaxRequest(method, tempdata) {
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'BilliardScoreboard.asmx/' + method,
                            data: "{'data':" + JSON.stringify(tempdata) + "}",
                            dataType: 'JSON',
                            success: function (response) {
                                return response;
                            },
                            error: function (err) {
                                alert("error : " + err);
                            }
                        });
                    }

                    function uploadImage() {
                        var tempData = new Object();
                        if (adInfo.AdvertisementId != undefined) {
                            tempData.IsTempStorage = false;
                            tempData.AdvertisementId = adInfo.AdvertisementId;
                        }
                        tempData.UserId = advUser.UserId;
                        tempData.Text = $("#addtext").val();
                        tempData.Color = $('input[name="optradio"]:checked').val();
                        //imageonserver
                        //tempData.Img = $("#uploadimage").attr("src").split(",")[1];
                        tempData.Img = $("#uploadimage").attr("src");
                        tempData.Discount = $("#discount").val()
                        var parms = JSON.stringify(tempData);
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; chasystem.webrset=utf-8",
                            url: 'BilliardScoreboard.asmx/SaveAdvertisement',
                            data: "{'data':" + parms + "}",
                            dataType: 'JSON',
                            success: function (response) {
                                //var msg = "<div>Thank you for using our free advertising platform! Your advertising will be published is published randomly during the selection of game data in these 2 links:<br /><a href='https://score.biliardoprofessionale.it/ScoreTracking.aspx'>https://score.biliardoprofessionale.it/ScoreTracking.aspx</a><br /><a href='https://score.biliardoprofessionale.it/Teachers.aspx'>https://score.biliardoprofessionale.it/Teachers.aspx</a><br />We invite you to pass these links to all possible interested parties, as well as did the other advertisers.</div><br/><div>Grazie per aver utilizzato la nostra piattaforma di pubblicità gratuita ! La vostra pubblicità verrà pubbliciata in modo casuale durante la selezione dei dati di gioco in questi 2 link :</div><div><a href='https://score.biliardoprofessionale.it/ScoreTracking.aspx'>https://score.biliardoprofessionale.it/ScoreTracking.aspx</a></div><div><a href='https://score.biliardoprofessionale.it/Teachers.aspx'>https://score.biliardoprofessionale.it/Teachers.aspx</a></div><div>Vi invitiamo al passare questi link a tutti i possibili interessati, cosi come hanno fatto gli altri inserzionisti. </div>";
                                var msg = "<div>Thank you for using our free advertising platform! Your advertising will be published is published randomly during the selection of game data in these 2 links:<br /><a href='https://score.biliardoprofessionale.it/ScoreTracking.aspx'>https://score.biliardoprofessionale.it/ScoreTracking.aspx</a><br />We invite you to pass these links to all possible interested parties, as well as did the other advertisers.</div><br/><div>Grazie per aver utilizzato la nostra piattaforma di pubblicità gratuita ! La vostra pubblicità verrà pubbliciata in modo casuale durante la selezione dei dati di gioco in questi 2 link :</div><div><a href='https://score.biliardoprofessionale.it/ScoreTracking.aspx'>https://score.biliardoprofessionale.it/ScoreTracking.aspx</a></div><div>Vi invitiamo al passare questi link a tutti i possibili interessati, cosi come hanno fatto gli altri inserzionisti. </div>";
                                SendNotification("Thank you for Advertise with us", msg, advUser.Email);
                                //location.reload();
                                //window.location = window.location.href.split("?")[0];
                                $scope.IsUploadImageSucessmsg = true;
                                $scope.$apply();
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>Thank you for uploading your advertising image <br/>... post another click here!</h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>Grazie per aver pubblicato la vostra immagine pubblicitaria ... pubblicatene un'altra click qui1</h4>");
                                $("#loader").hide();
                                setTimeout(function () {
                                    window.location = window.location.href.split("?")[0];
                                }, 10010);
                                //resetdiv();
                            },
                            error: function (err) {
                                $("#loader").hide();
                            }
                        });
                    }

                    function ShowMessage(msg) {
                        //$("#msgnext1").append("<div></div>");
                        $('#myModal').modal('show');
                        $("#msgnext1").html(msg);
                        setTimeout(function () {
                            $('#myModal').modal('hide');
                            if ($scope.IsUploadImageSucessmsg)
                                $scope.IsUploadImageSucessmsg = false;
                        }, 10000);
                    }

                    function SendNotification(subject, msg, toid) {
                        var tempdata = new Object();
                        tempdata.Subject = subject;
                        tempdata.To = toid;
                        tempdata.Message = msg;
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'BilliardScoreboard.asmx/SendEmailNotification',
                            data: "{'data':" + JSON.stringify(tempdata) + "}",
                            dataType: 'JSON',
                            success: function (response) {
                            },
                            error: function (err) {
                            }
                        });
                    }
                    function getip() {
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; chasystem.webrset=utf-8",
                            url: 'BilliardScoreboard.asmx/getip',
                            dataType: 'JSON',
                            success: function (response) {
                                alert(response.d)
                                //resetdiv();
                            },
                            error: function (err) {
                                $("#loader").hide();
                            }
                        });
                    }

                    var adInfo = new Object();
                    function GetAdvById(adid) {
                        $("#loader").show();
                        jQuery.ajax({
                            type: 'POST',
                            contentType: "application/json; charset=utf-8",
                            url: 'BilliardScoreboard.asmx/GetAdByIda',
                            data: "{'id':" + adid + "}",
                            dataType: 'JSON',
                            success: function (response) {
                                adInfo = response.d;
                                if (adInfo.IsTempStorage) {
                                    //$("#uploadimage").attr("src", "data:image/jpeg;base64," + adInfo.Img);
                                    $("#uploadimage").attr("src", adInfo.Img)
                                    $("#addtext").val(adInfo.Text);
                                    $('input[name="optradio"]:checked').val(adInfo.Color);
                                    $("#discount").val(adInfo.Discount);
                                    $('.next1').trigger('click');
                                    $(".infodiv").hide();
                                    $("#loader").hide();
                                }
                                else {
                                    window.location = window.location.href.split("?")[0];
                                }
                            },
                            error: function (err) {
                                $("#loader").hide();
                            }
                        });
                    }

                    $(function () {
                        $("#discount").keydown(function () {
                            // Save old value.
                            if (!$(this).val() || (parseInt($(this).val()) <= 99 && parseInt($(this).val()) >= 0)) {
                                $(this).data("old", $(this).val());
                            }
                        });
                        $("#discount").keyup(function () {
                            // Check correct, else revert back to old value.
                            if (!$(this).val() || (parseInt($(this).val()) <= 99 && parseInt($(this).val()) >= 0))
                                ;
                            else {
                                ShowMessage("<h4 style='color:#00B0F0;text-align: center;'>Discount cannot be more than 99 </h4><h4 style='color:white;text-align: center;'>-</h4><h4 style='color:#00B050;text-align: center;'>Lo sconto non può essere superiore a 99</h4>");
                                $(this).val($(this).data("old"));
                            }
                        });
                    });

                    function getParameterByName(name, url) {
                        if (!url) url = window.location.href;
                        name = name.replace(/[\[\]]/g, "\\$&");
                        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                            results = regex.exec(url);
                        if (!results) return null;
                        if (!results[2]) return '';
                        return decodeURIComponent(results[2].replace(/\+/g, " "));
                    }
                });
        </script>
</body>
</html>
