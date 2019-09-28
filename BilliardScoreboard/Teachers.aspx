<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs" Inherits="BilliardScoreboard.Teachers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billiard Professional</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/responsee.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <!-- CUSTOM STYLE -->
    <link rel="stylesheet" href="css/template-style.css" />
    <style type="text/css">
        @font-face {
            font-family: 'Arial Rounded MT Bold';
            font-style: normal;
            font-weight: normal;
            src: local('Arial Rounded MT Bold'), url('font/ARLRDBD_0.woff') format('woff');
        }
        #fuPlayerPicturee {
            border: 0 hidden #e0e0e0 !important;
            height: 36px !important;
            padding-bottom: 0 !important;
            padding-left: 0.5px;
            padding-right: 0 !important;
            padding-top: 0 !important;
        }
    </style>
    <style type="text/css">
        #asd2123 {
            /*background-image: url("img/imgw.png");
            height: 600px !important;
            width: auto;*/
        }
        /* Base style */
        html {
            font-size: 24px;
        }

        body {
            margin: 0 0 40px;
            font-family: 'Helvetica Neue', 'Helvetica', 'Arial', sans-serif;
            font-weight: 200;
            color: #666666;
            background-color: #FFFFFF;
            word-break: break-word;
        }

        a, a:visited, a:hover, a:link {
            color: inherit;
            outline: 0;
        }

        small {
            font-weight: 100;
        }

        p {
            font-size: 1rem;
            line-height: 1.4rem;
        }

        button, .button {
            margin: 0;
            padding: 3px 6px;
            border-radius: 6px;
            border: 1px solid currentColor;
            color: inherit;
            background-color: rgba(0,0,0,0);
            font-size: 0.6rem;
            font-weight: 300;
            text-decoration: none;
            cursor: pointer;
            outline: 0;
        }

            button.active, .button.active {
                background-color: currentColor;
            }

                button.active span, .button.active span {
                    color: #FFFFFF;
                }

        i {
            background-color: rgba(0, 0, 0, 0.05);
            border-radius: 4px;
        }

        svg * {
            fill: none;
            stroke: currentColor;
        }

        /* Common components */
        .bloc {
            color: #f9f9f9;
            padding: 1px 0 30px;
            clear: both;
        }

        .content {
            margin: auto;
            max-width: 960px;
            padding: 0 20px;
        }

        .col3 {
            width: 33.33%;
            float: left;
            text-align: center;
            border-bottom-color: currentColor;
            border-bottom-style: solid;
        }

        .col-container {
            padding: 0 12px;
        }

        .col3 p {
            font-size: 0.75rem;
            line-height: 1.05rem;
        }

        /* Text */
        .bigger {
            font-size: 1rem;
            font-weight: 100;
            line-height: 1.4rem;
        }

        .center {
            text-align: center;
        }

        .clearer {
            clear: both;
        }

        .striked {
            text-decoration: line-through;
        }

        .italic {
            font-style: italic;
        }

        /* Blocs */
        .bloc-head {
            color: #5aa8c5;
            padding: 30px;
        }

        .bloc-demo {
            color: #FF495F;
        }

        .bloc-timing {
            color: #F7A800;
        }

        .bloc-scenario {
            color: #4fe084;
        }

        .bloc-doc {
            color: #69B0CA;
        }

        /* Custom */
        #hi-there {
            width: 100%;
            stroke-width: 4;
        }

        .intro-links {
            text-align: right;
        }

        .example-description {
            margin-left: 440px;
        }

        .timing-description {
            min-height: 200px;
            margin-right: 240px;
        }

        .obturateur {
            stroke-width: 3;
            stroke-miterlimit: 10;
        }

        #polaroid {
            float: left;
            width: 400px;
            height: 320px;
            stroke: #f9f9f9;
            stroke-width: 3;
            stroke-linecap: round;
            stroke-linejoin: round;
            stroke-miterlimit: 10;
        }

        #timing-example {
            float: right;
            width: 175px;
            height: 175px;
        }

        .goodbye-head {
            font-size: 1.5rem;
            text-align: center;
            margin-bottom: 0;
        }

        .goodbye-sub {
            font-size: 0.875rem;
            text-align: center;
            margin: 0 0 20px;
        }

        #obturateur3 {
            /*border: 1px solid red;*/
            position: relative;
            top: -570px;
            left: 41px;
            width: 523px;
            height: 950px;
        }
        /* Media queries */
        @media (max-width: 960px) {
            .button-group {
                display: block;
                line-height: 1.8em;
            }
        }

        @media (min-width: 768px) {
            .col3 {
                border-bottom: none;
            }
        }

        @media (max-width: 767px) {
            #polaroid {
                width: 100%;
                max-height: 300px;
            }

            .example-description {
                margin-left: 0;
            }

            .timing-description {
                margin-right: 0;
            }

            #timing-example {
                float: none;
                width: 100%;
            }

            .col3 {
                width: 100%;
                float: none;
                margin-bottom: 25px;
                padding-bottom: 25px;
                border-bottom-width: 1px;
                min-height: 200px;
            }

                .col3:last-child {
                    margin-bottom: 0;
                    padding-bottom: 0;
                    border-bottom-width: 0px;
                }
        }

        @media (min-width: 481px) and (max-width: 767px) {
            #polaroid {
                width: 100%;
                max-height: 300px;
            }

            .example-description {
                margin-left: 0;
            }

            .timing-description {
                margin-right: 0;
            }

            .col3:nth-child(2n) svg {
                width: 200px;
                float: right;
            }

            .col3:nth-child(2n) .col-container {
                text-align: right;
                margin-right: 200px;
            }

            .col3:nth-child(2n+1) svg {
                width: 200px;
                float: left;
            }

            .col3:nth-child(2n+1) .col-container {
                text-align: left;
                margin-left: 200px;
            }
        }

        @media (max-width: 480px) {
            .col-container {
                padding: 0px;
            }

            #polaroid {
                width: 100%;
                max-height: 260px;
            }
        }
    </style>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css' />
    <%--<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>--%>
    <script src="/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/responsee.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="../js/Zoom.js"></script>
    <script src="/js/vivus.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]> 
    <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
    <![endif]-->
    <style>
        ul.menu.menu-1 li select {
            border-radius: 4px;
            padding: 6px;
            width: 100%;
            text-align: center;
            display: block;
            text-align: center;
        }

        .realtime {
            color: red !important;
            border: 1px solid red !important;
            background-color: transparent !important;
            border-radius: 5px !important;
            width: 75% !important;
            height: 28px !important;
            padding: 4px !important;
            cursor: pointer !important;
            margin-top: 20px !important;
        }

        .select {
            border-radius: 4px;
            padding: 6px;
            display: block;
            width: 100%;
        }

        .text-css {
            border-radius: 4px !important;
            padding: 6px !important;
            width: 100%;
            text-align: center;
            display: block;
            text-align: center;
        }

        .reponsive {
            width: 100% !important;
            height: 15% !important;
        }

        body {
            width: 100%;
            height: 100%;
        }

        .rownew {
            margin-left: -80px;
            margin-right: -80px;
        }

        * {
            padding: 0;
            margin: 0;
        }

        .black-bg {
            background: black;
        }

        .align-center {
            text-align: center;
        }

        .main-heading {
            color: #fff;
            border-bottom: 1px solid #bdb0b0;
            padding-bottom: 17px;
        }

        ul.menu li {
            list-style-type: none;
            display: inline-block;
            padding: 0 5px;
            width: 16%;
            font-size: 26px;
            color: #fff;
        }

        ul.menu {
            padding: 5px;
            text-align: center;
        }

        a.menu-button {
            color: #000;
            display: block;
            background: #fff;
            text-decoration: none !important;
            padding: 7px 18px;
            font-size: 24px;
        }

        ul.abc {
            position: absolute;
            width: 180px;
            left: 0;
            top: 100%;
            margin-left: -999em;
        }

        p.available a {
            text-decoration: none;
            color: #1aab1a;
        }


        p.available {
            /*color: #1aab1a;*/
            text-align: center;
            font-size: 30px;
            margin: 27px 0;
        }

        p.not-available a {
            text-decoration: none;
            color: white;
        }


        p.not-available {
            color: white;
            text-align: center;
            font-size: 28px;
            margin: 27px 0;
        }

        .team td {
            padding-left: 10px;
            color: white;
            font-size: 23px;
        }

        .vs {
            margin: 55px -18px 10px 0px;
            font-size: 22px;
            color: yellow;
        }

        ul.result {
            padding: 0;
        }

            ul.result li {
                color: white !important;
                list-style-type: none !important;
                font-size: 20px;
                display: block;
                margin-bottom: 5px;
            }

                ul.result li a {
                    text-decoration: none;
                    color: white;
                }

                ul.result li:hover {
                    background: red;
                }

        h5.result {
            color: white;
            font-size: 30px;
        }

        .paragraph {
            color: white;
            font-size: 20px;
        }

        .header img {
            text-align: center;
            margin: 20px 0 0 0;
        }

        .pt-20 {
            padding-top: 20px;
        }

        .pb-20 {
            padding-bottom: 20px;
        }

        .header.align-center {
            border-bottom: 2px solid gray;
            padding: 0 0 10px 0;
        }

        table.team img {
            width: 80%;
        }

        div#pnlresultset {
            margin: 15px 0px 0px 50px;
        }

        .number p {
            background: white;
            padding: 2px 19px 3px 8px;
            text-align: center;
            margin: 38px 0 0 0px;
            border-radius: 6px;
        }

        .player-headin {
            color: #fff !important;
            font-size: 23px !important;
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
        #pContnet {
            /*background-color:#D9D9D9;*/
            font-family: Arial Rounded MT Bold;
            font-size:30px;
            max-width:500px;
             animation: blinker 2s linear infinite;
        }
        @keyframes blinker {
            50% {
                opacity: 0;
            }
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

            ul.menu li {
                width: 13%;
                font-size: 19px;
            }

            p.available {
                font-size: 25px;
            }

            p.not-available {
                font-size: 25px;
            }

            .4-player .col-md-12 h5 {
                font-size: 20px !important;
            }


            .player-headin {
                color: #fff !important;
                font-size: 18px !important;
            }

            .reponsive {
                width: 100% !important;
                height: auto !important;
            }


            .number p {
                background: white;
                padding: 2px 16px 2px 8px;
                text-align: left;
                margin: 22px 0 0 0px;
            }
        }



        @media (min-width: 992px) {
            .col-md-3 {
                width: 22.91%;
            }
            #pContnet {
            /*background-color:#D9D9D9;*/
             font-family: Arial Rounded MT Bold;
            font-size:10px;
            max-width:500px;
             animation: blinker 2s linear infinite;
        }
        }

        @media screen and (max-width:768px) {
            .col-sm-5 {
                width: 36.666667%;
            }

            .col-sm-3 {
                width: 22%;
            }

            #pContnet {
            /*background-color:#D9D9D9;*/
             font-family: Arial Rounded MT Bold;
            font-size:10px;
            max-width:500px;
             animation: blinker 2s linear infinite;
        }
            .paragraph {
                color: white;
                font-size: 8px;
            }

            h5.result {
                color: white;
                font-size: 8px;
            }

            ul.result li {
                color: white !important;
                list-style-type: none !important;
                font-size: 4px;
                display: block;
                margin-bottom: 5px;
            }

            h5, .h5 {
                font-size: 8px;
            }

            ul.menu li {
                font-size: 12px;
                margin: 0px 0px 0px 10px;
            }

            a.menu-button {
                padding: 7px 7px;
                font-size: 14px;
            }

            .number p {
                display: inline-block;
                margin: 5px 0px 0px -7px;
                PADDING: 0px 2px 0px 2px;
            }

            .4-player {
                margin-bottom: 20px !important;
                clear: both;
            }

            .header.align-center img {
                width: 100%;
            }

            .vs-mobile p {
                font-size: 58px;
                text-align: center;
                color: yellow;
            }

            .vs {
                /* display: none; */
                margin: 3% -10px 0px 50%;
                font-size: 8px;
            }
        }


        @media screen and (max-width: 767px) {
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

            .number p {
                font-size: 8px;
                padding: 2px 6px;
                margin: 15px 0px 0px -9px;
            }

            .header.align-center img {
                width: 100%;
            }

            .player-headin {
                font-size: 33px !important;
            }

            ul.result li {
                width: auto;
            }

            .vs-mobile {
                display: block;
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

            a.menu-button {
                padding: 7px 2px;
                font-size: 8px;
            }

            ul.menu.menu-1 li select {
                font-size: 16px;
            }
        }

        @media screen and (max-width: 375px) {


            .player-headin {
                font-size: 20px !important;
            }

            .number p {
                font-size: 8px;
                padding: 0px 5px 0px 5px;
                margin: 11px 0px 0px 0px;
            }
        }

        @media screen and (max-width: 320px) {

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

            .header.align-center img {
                width: 100%;
            }

            ul.menu li {
                padding: 0 2px;
                margin: 0px 0px 0px 10px;
            }

            a.menu-button {
                padding: 7px 0px;
                font-size: 7px;
            }

            ul.menu li {
                font-size: 10px;
            }

            .number p {
                font-size: 8px;
                padding: 0px 3px;
                margin: 5px 0 0px -15px;
            }
        }

        .logo_icon {
            width: 50px;
        }

        @media screen and (min-width:769px) {
            .vs-mobile {
                display: none;
            }
        }

        #mask {
            position: absolute;
            left: 0;
            top: 0;
            z-index: 9000;
            background-color: #26262c;
            display: none;
        }

        #boxes .window {
            position: absolute;
            left: 0;
            top: 0;
            width: 440px;
            height: 850px;
            display: none;
            z-index: 9999;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }

        #boxes #dialog {
            width: 80%;
            height: auto;
            padding: 5px 5px 5px 5px;
            /*background-color: black;*/
            font-size: 15pt;
        }

        .agree:hover {
            background-color: #D1D1D1;
        }

        .popupoption:hover {
            background-color: #D1D1D1;
            color: green;
        }

        .popupoption2:hover {
            color: red;
        }
    </style>
    <style>
        .imgcontainer {
            position: relative;
            text-align: center;
            color: white;
        }
    </style>
    
</head>
<body class="size-1140" style="height: 100% !important;">


    <form id="form1" runat="server">
        <div id="boxes">
            <div style="top: 20%; left: 20%; display: none;" id="dialog" class="window">
                <div id="san" class="imgcontainer">
                    <%--<img src="img/loading2.gif" id="adImgLoading" height="25" style="border:5px solid white;">--%>
                    <img src="" alt="loading" id="adImg" style="border:5px solid white;display:none;max-width:1024px;">
                    <p class="centered" id="pContnet"> </p>
                </div>

                <div id="AdSelect" class="imgcontainer text-center" style="display:none;padding:5% 0% 5% 0%;background-color:black;">
                    <div class="" style="padding:3%;">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3 text-center" style="margin-bottom:5%;padding:1%;border:1px solid cornflowerblue;border-radius:2%;">
                        <h5 style="color:#009BAA;">
                            Ask to seller the discount of<br />
                                <span class="lblDiscount"></span> % insert your mail<br />
                                presss green icon
                        </h5>
                    </div>
                    <div class="col-lg-4 text-center">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10">
                        <br />
                        <h6 id="txtSuccess" class="tetx-center" style="color:green;display:none;">Request Submited </h6>
                        <input type="text" id="requestName" class="form-control" placeholder="Name" style="height: 20px;background-color:white!important;padding:15px;color:black;"/><br />
                        <input type="text" id="requestId" class="form-control" placeholder="Email" style="height: 20px;background-color:white!important;padding:15px;color:black;"/><br />
                        </div>
                        <div class="col-lg-1"></div>
                    <div class="text-center" style="margin-bottom:5%;">
                        <span >
                            <img src="img/nexticon.png" id="requestEmail" style="height:45px;width:auto;cursor:pointer;">
                        </span>
                        <span>
                            <img src="img/cancle.png" id="close" class="" style="height: 30px; width: auto;cursor:pointer;" />
                        </span>
                    </div>
                </div>
                    <div class="col-lg-3 text-center" style="padding:1%;color:cornflowerblue;border:1px solid #009445;border-radius:2%;">
                        <h5 style="color:#009445;">
                            Chiedi al venditore lo<br />
                            sconto di <span class="lblDiscount"></span> % inserisci la<br />
                            tua mail e pigia icona verde 
                        </h5>
                    </div>
                    <div class="col-lg-1"></div>
                    </div>
                    <div class="row text-center">
                    
                    
                    </div>
                </div>
            </div>
            
            <div style="width: 2478px; font-size: 32pt; color: white; height: 1202px; display: none; opacity: 0.4;" id="mask">
                
            </div>
        </div>

        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
        <section>
            <div id="head">
                <div class="line">
                    <asp:Image ID="logo" runat="server" ImageUrl="~/img/logoTop.png" />
                    <h1>
                        <asp:Label ID="lblHeading" runat="server"></asp:Label></h1>
                </div>
            </div>
            <div id="content" class="left-align contact-page">

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="line">
                            <asp:Panel runat="server" ID="pnlselectScore">
                                <ul class="menu">
                                    <li>Surname</li>
                                    <li>Name</li>
                                </ul>

                                <ul class="menu menu-1">
                                    <li>
                                        <asp:DropDownList ID="ddSurname" runat="server" AutoPostBack="true" ForeColor="Black" OnSelectedIndexChanged="ddSurname_SelectedIndexChanged">
                                            <asp:ListItem Value="" Text="Select" />
                                        </asp:DropDownList>
                                    </li>
                                    <li>
                                        <asp:DropDownList ID="ddName" runat="server" AutoPostBack="true" ForeColor="Black" OnSelectedIndexChanged="ddName_SelectedIndexChanged">
                                            <asp:ListItem Value="" Text="Select" />
                                        </asp:DropDownList>
                                    </li>
                                </ul>
                            </asp:Panel>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="row">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="UserDetailBlock" runat="server" Visible="false">

                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-1"></div>
                                        <div style="padding: 0% 0% 5px 9%;">
                                            &nbsp;
                                         <asp:Label ID="lblProfile" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-3">
                                            <%--<asp:Label ID="lblProfileName" Text="<%=this.TeacherDetail.Name%>" runat="server" />--%>

                                            <asp:Image ID="impProfPic" runat="server" CssClass="squreimage" />
                                        </div>
                                        <div class="col-md-5">
                                            <asp:Image ID="Image1" runat="server" CssClass="logo_icon" ImageUrl="~/img/logoscorenew.png" />
                                        </div>
                                    </div>
                                    <div class="row" style="margin-top: 2%;">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-11">
                                            <div class="text-center" style="border: 1px solid white; margin: 0% 0% 5px 0%; color: #A9A8A9;">
                                                <asp:Label ID="ShotTitle" runat="server" Text="Shot Name" />
                                            </div>
                                            <div style="border: 1px solid white; margin: 0% 0% 5px 0%; min-height: 200px; color: #A9A8A9;">
                                                <asp:Label ID="ShotDescription" runat="server" Text="Description" />
                                            </div>
                                            <div>
                                                <asp:DropDownList ID="ddShotList" runat="server" CssClass="select" AutoPostBack="true" ForeColor="Black" OnSelectedIndexChanged="ddShotList_SelectedIndexChanged">
                                                    <asp:ListItem Value="" Text="Select shot" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <asp:Button ID="btnRealtime" runat="server" Text="Real Time" CssClass="realtime" />
                                    <br />
                                    <button type="button" class="submitbutton" onclick="obt3.reset().play();" style="background-color: #009445 !important;">Replay</button>
                                    <br />
                                    <asp:Button ID="btnCancle" runat="server" Text="Cancle" CssClass="submitbutton" Style="background-color: #009445 !important;" />
                                    <br />
                                    <asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="submitbutton" Style="background-color: #009445 !important;" />
                                </div>

                                <div class="col-md-4" id="asd2123">
                                    <img src="img/imgw.png" style="height: 600px !important; width: 430px;" />
                                    <svg id="obturateur3" class="obturateur" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" enable-background="new 0 0 200 200" onclick="obt3.reset().play();" style="color: #E5E4E5;">
                                         <%--<line x1="175" y1="99" x2="349" y2="357" />
                                    <line x1="348" y1="357" x2="259" y2="542" />
                                    <line x1="259" y1="542" x2="0" y2="270" />--%>
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <circle id="greycircle" fill="none" stroke="#727272" stroke-width="2" stroke-miterlimit="10" cx='<%# Eval("X1") %>' cy='<%# Eval("Y1") %>' r="2" />
                                                <line x1='<%# Eval("X1") %>' y1='<%# Eval("Y1") %>' x2='<%# Eval("X2") %>' y2='<%# Eval("Y2") %>' />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </svg>

                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <asp:Panel runat="server">
                    <div class="row">
                        <div class="col-md-6" style="color: #009BAA;">
                            <div class="col-md-6"></div>
                            <div class="col-md-1">
                                <img src="img/flag_uk.jpg" />
                            </div>
                            <div class="col-md-5">
                                Please select Surname and Name of Teacher/Player.<br />
                                -<br />
                                Cannot you find the teacher?
                        contact us.
                            </div>
                        </div>
                        <div class="col-md-6" style="color: #009445;">
                            <div class="col-md-4" style="padding: 0px;">
                                Selezionate il Cognome e Nome dell’Insegnante /Giocatore<br />
                                -<br />
                                Non trovate l'insegnante ?
                        contattateci.
                            </div>
                            <div class="col-md-1">
                                <img src="img/flag_itly.png" />
                            </div>
                            <div class="col-md-6"></div>
                        </div>
                    </div>
                </asp:Panel>
            </div>


            <script type="text/javascript">
                var obt3;
                function setsvg() {
                    obt3 = new Vivus('obturateur3', { type: 'oneByOne', duration: 550, start: 'manual', dashGap: 5 });
                    obt3.play();
                }
	        </script>
        </section>
        <!-- FOOTER -->
        <footer>
            <div class="line">
                <div class="s-12 l-4">
                    <p>
                        &nbsp;
              
                    </p>
                </div>
                <div class="s-12 l-4">
                    <asp:Image ID="footer" runat="server" ImageUrl="~/img/et.eBottom.png" />
                </div>
                <div class="s-12 l-4">
                    <p class="right">
                    </p>
                </div>
            </div>
        </footer>
    </form>
    <script type="text/javascript">
                $(function () {
                    $("#fuPlayerPicture").on("change", function () {
                        var files = !!this.files ? this.files : [];
                        if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support

                        if (/^image/.test(files[0].type)) { // only image file
                            var reader = new FileReader(); // instance of the FileReader
                            reader.readAsDataURL(files[0]); // read the local file

                            reader.onloadend = function () { // set image data as background of div

                                $("#impProfPic").attr('src', this.result);
                            }
                        }
                    });
                });

                var ImageData =new Object();
                var timer;
                function GetRendomeImg() {
                  
                    var tempData = new Object();
                    tempData.Email = $("#txtSignInEmail").val();
                    tempData.Password = $("#txtSignInPw").val();
                    jQuery.ajax({
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        url: 'BilliardScoreboard.asmx/GetRendomeImg',
                        data: "{'data':" + JSON.stringify(tempData) + "}",
                        dataType: 'JSON',
                        success: function (response) {
                            ImageData = response.d;
                            OpenImage();
                            $(".lblDiscount").text(ImageData.Discount);
                            $("#pContnet").text(ImageData.Text);
                            //$("#adImgLoading").hide();
                            $("#adImg").show();
                            //imageonserver
                            //$("#adImg").attr("src", "/img/AdvImages/" + ImageData.Img);
                            $("#adImg").attr("src", ImageData.Img);
                            setTimeout(function () {
                                //$('#pContnet').css({ 'max-width': (($("#adImg").width()) - 30), 'overflow-wrap': 'break-word', 'top': $("#dialog").css('top') - 10 });
                                $('#pContnet').css({ 'overflow-wrap': 'break-word', 'top': $("#dialog").css('top') - 10 });
                            }, 200);
                            timer = setTimeout(function () {
                                $("#AdSelect").show();
                                $("#san").hide();
                            }, 5000);       
                        },
                        error: function (err) {
                            alert("error : " + err);
                        }
                    });
                }
                
                function OpenImage() {
                    if (ImageData.Color == "black")
                        $(".centered").css("color", "white");
                    else if (ImageData.Color == "red")
                        $(".centered").css("color", "#FF0000");
                    else if (ImageData.Color == "yellow") {
                        $(".centered").css("color", "black");
                        //$(".centered").css("color", "#0FFFF00");
                    }
                    else if (ImageData.Color == "blue")
                        $(".centered").css("color", "#00B0F0");
                    var id = '#dialog';
                    var maskHeight = $(document).height();
                    var maskWidth = $(window).width();
                    $('#adImg').css({ 'max-width': $("#dialog").width() });
                    $('#mask').css({ 'width': maskWidth, 'height': maskHeight });
                    $('#mask').fadeIn(500);
                    $('#mask').fadeTo("slow", 0.9);
                    var winH = $(window).height();
                    var winW = $(window).width();
                    //$(id).css('top', winH / 2 - $(id).height() / 2);
                    $(id).css('left', winW / 2 - $(id).width() / 2);
                    $(id).fadeIn(2000);
                    $('#close').click(function (e) {
                        e.preventDefault();
                        $('#mask').hide();
                        $('.window').hide();
                    });
                    $('#mask').click(function () {
                        $(this).hide();
                        $('.window').hide();
                    });
                    
                    $('.window').click(function () {
                        //clearTimeout(timer);
                    });
                    $('#requestEmail').click(function () {
                        //SendNotification($("#requestId").val(), "Thank you for request", "Dear, " + $("#requestName").val() + "<br/> Thank you for request for discount of " + ImageData.Discount + "% for advertisement no " + ImageData.AdvertisementId );
                        var msgeng = "<div>Dear, " + $("#requestName").val() + "<br/> Thank you for request for discount of " + ImageData.Discount + "% for advertisement no " + ImageData.AdvertisementId + " we will contact you as soon as possible !</div>";
                        var msgitl = "<div>Caro, " + $("#requestName").val() + "<br/> Grazie per la richiesta dello sconto de " + ImageData.Discount + "%  n° " + ImageData.AdvertisementId + " vi contatteremo al più presto possible !</div>";
                        SendNotification($("#requestId").val(), "Thank you for request", msgeng + "<div>-</div>" + msgitl);
                        SendNotification(ImageData.advEmail, "Request for discount", "We got request for discount of " + ImageData.Discount + "% for your advertisement no " + ImageData.AdvertisementId + " from " + $("#requestName").val()+". Refrance email id is :-" + $("#requestId").val());
                        var DiscountData = new Object();
                        DiscountData.Name = $("#requestName").val();
                        DiscountData.AdvertisementId = ImageData.AdvertisementId
                        DiscountData.Email = $("#requestId").val();
                        DiscountData.AdvEmail = ImageData.advEmail;
                        SaveDiscountRequest(DiscountData);
                        $("#txtSuccess").show();
                        setTimeout(function () {
                            $('#mask').hide();
                            $('.window').hide();
                            $("#txtSuccess").hide();
                        }, 3000);
                       
                    });

                }

                $(document).ready(function () {
                    //GetRendomeImg();
                });
                function SendNotification(Toemail, subject, msg) {
                    var tempdata = new Object();
                    tempdata.Subject = subject;
                    tempdata.To = Toemail;
                    tempdata.Message = msg;
                    jQuery.ajax({
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        url: 'BilliardScoreboard.asmx/SendEmailNotification',
                        data: "{'data':" + JSON.stringify(tempdata) + "}",
                        dataType: 'JSON',
                        success: function (response) {
                            resetdiv();
                        },
                        error: function (err) {

                        }
                    });
                }

                function SaveDiscountRequest(Tdata) {
                    jQuery.ajax({
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        url: 'BilliardScoreboard.asmx/SaveDiscountRequest',
                        data: "{'data':" + JSON.stringify(Tdata) + "}",
                        dataType: 'JSON',
                        success: function (response) {
                        },
                        error: function (err) {

                        }
                    });
                }
    </script>
</body>
</html>
