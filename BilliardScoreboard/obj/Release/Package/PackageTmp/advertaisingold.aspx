<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="advertaisingold.aspx.cs" Inherits="BilliardScoreboard.advertaising" %>

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
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css' />
    <%--<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>--%>
    <script src="/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/responsee.js"></script>
    <script type="text/javascript" src="js/custom.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="../js/Zoom.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]> 
    <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
    <![endif]-->
    <style>
        html {
            height: 100%;
        }

        body {
            min-height: 100%;
            background-color: black;
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

        .InfoPenalimg {
            height: 45px;
            width: auto;
            padding-top: 2%;
        }

        .English {
            color: deepskyblue;
            text-align: right;
        }

        /*.English img {
                float: right;
            }*/

        .Italian {
            /*float: left;*/
            color: forestgreen;
        }

        .InfoPenalimgItaly {
            /*height: 45px;
            width: auto;
            padding-top: 2%;
            margin-top: -50px;
            margin-left: 40px;*/
            height: 47px;
            width: auto;
            /*padding-top: 2%;*/
            margin-top: -35px;
            margin-left: 70px;
        }

        /*@media only screen and (max-width: 1025px) {
            .InfoPenalimgItaly {
                height: 50px;
                width: auto;
                padding-top: 2%;
                margin-top: 0px;
                margin-left: 45px;
            }
        }*/

        /*.Italian .column {
                float: left;
            }*/

        /*.myrow:after {
            content: "";
            display: table;
            clear: both;
        }*/
        /* Create two equal columns that sits next to each other */
        /*.column {
            float: left;
            width: 50%;
            padding: 10px;
            height: 300px; 
        }*/
        img#logo {
            width: 70%;
        }

        .imgEnglendspan {
            padding-right: 50px;
        }

        @media (max-width: 575.98px) {
            .icon_cloud {
                height: 25px;
                width: auto;
            }

            .icon_cancle {
                height: 18px;
                width: auto;
                padding-left: 5px;
            }
        }

        /*Small devices (landscape phones, 576px and up)*/
        @media (min-width: 576px) and (max-width: 767.98px) {
            .icon_cloud {
                height: 25px;
                width: auto;
            }

            .icon_cancle {
                height: 18px;
                width: auto;
                padding-left: 5px;
            }

            .imgEnglendspan {
                padding-right: 0px;
            }
        }

        /*Medium devices (tablets, 768px and up)*/
        @media (min-width: 768px) and (max-width: 991.98px) {
            .icon_cloud {
                height: 25px;
                width: auto;
            }

            .icon_cancle {
                height: 18px;
                width: auto;
                padding-left: 5px;
            }

        }

        @media (min-width: 768px) and (max-width: 1024px) {
            .icon_cloud {
                height: 25px;
                width: auto;
            }

            .icon_cancle {
                height: 18px;
                width: auto;
                padding-left: 5px;
            }

            .InfoPenalimgItaly {
                margin-top: 0px;
                margin-left: 0px;
            }
            .imgEnglendspan {
                padding-right: 0px;
            }
        }
        /*Large devices (desktops, 992px and up)*/
        @media (min-width: 992px) and (max-width: 1199.98px) {
            .icon_cloud {
                height: 55px;
                width: auto;
            }

            .icon_cancle {
                height: 35px;
                width: auto;
            }
        }

        /*Extra large devices (large desktops, 1200px and up)*/
        @media (min-width: 1200px) {
            .icon_cloud {
                height: 55px;
                width: auto;
            }

            .icon_cancle {
                height: 35px;
                width: auto;
            }

            .InfoPenalimgItaly {
                height: 47px;
                width: auto;
                /* padding-top: 2%; */
                margin-top: -47px;
                margin-left: 400px;
            }
        }
    </style>
</head>
<body class="size-1140">
    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
        <section>
            <div id="head">
                <div class="line">
                    <asp:Image ID="logo" runat="server" ImageUrl="~/img/logoTop.png" />
                    <h1>
                        <asp:Label ID="lblHeading" runat="server"></asp:Label></h1>
                </div>
                <hr />
            </div>
            <div id="content" class="left-align contact-page">
            </div>
        </section>
        <div class="row">
            <div class="col">
                <div class="column InfoPenal English">
                    <%--<div class="col-lg-6 col-md-3">
                        <img src="img/flag_uk.jpg" class="pull-right"/>
                    </div>--%>
                    <div class="col-12 pull-right">
                        <span class="pull-right English" style="text-align: right; font-size: 14px;">
                            Free publication image 1 at a time.<br />
                            You will receive 1 alerts email when it expires.<br />
                            Upload PNG or JPEG images 1920 x 1080px
                        </span>
                        <span class="pull-right imgEnglendspan" style="">
                            <img src="img/flag_uk.jpg" class="d-none d-md-block InfoPenalimg pull-right" />
                        </span>

                    </div>
                    <div class="col-12 d-block d-md-none text-center">
                        <img src="img/flag_uk.jpg" class="InfoPenalimg pull-right" />
                    </div>
                </div>
            </div>
            <div class="col-1" style="padding: 0px;">
                <div class="text-center">
                    <img src="img/cloud-icon.png" style="" class="icon_cloud" />
                </div>
                <div class="text-center">
                    <img src="img/cancle.png" style="" class="icon_cancle" />
                </div>
            </div>
            <div class="col">
                <div class="column InfoPenal Italian">
                    <div class="col-12">
                        <span style="text-align: left; font-size: 14px;">
                            Pubblicazione gratuita immagine 1 alla volta.<br />
                            Riceverai 1 mail che di allerta alla scadenza.<br />
                            Caricate immagini PNG o JPEG 1920 x 1080px 
                        </span>
                        <img src="img/flag_itly.png" class="d-none d-md-block InfoPenalimgItaly" style="" />
                    </div>
                    <div class="col-12 d-block d-md-none">
                        <img src="img/flag_itly.png" class="" style="height: 41px; width: auto;" />
                    </div>
                    <%--                    <div class="col-md-3" >
                        <img src="img/flag_itly.png" />
                    </div>--%>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-3" style="padding: 0px !important"></div>
            <div class="col-6 text-center" style="width: 50%; border: 1px solid white; margin-top: 2%; padding: 0px !important">
                <img src="img/sample_1920x1080.jpg" style="vertical-align: middle;" />
            </div>
            <div class="col-3" style="padding: 0px !important"></div>
        </div>
        <!-- FOOTER -->
        <%--<footer>
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
        </footer>--%>
    </form>
</body>
</html>
