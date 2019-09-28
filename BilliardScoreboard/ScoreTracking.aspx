<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreTracking.aspx.cs" Inherits="BilliardScoreboard.Score_Tracking" %>

<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>biliardoprofessionale.it</title>
    <meta charset="utf-8" />
    <%--<meta http-equiv="refresh" content="5"/>--%>
    <meta name="viewport" content="width=1024" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/template-style.css" />

    <style>
        @font-face {
	            font-family: 'Arial Rounded MT Bold';
	            font-style: normal;
	            font-weight: normal;
	            src: local('Arial Rounded MT Bold'), url('font/ARLRDBD_0.woff') format('woff');
	        }
        ul.menu.menu-1 li select {
            border-radius: 4px;
            padding: 6px;
            width: 100%;
            text-align: center;
            display: block;
            text-align: center;
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
            padding: 0;
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



        @media screen and (max-width:1024px) {
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
        }

        @media screen and (max-width:768px) {
            .col-sm-5 {
    width: 36.666667%;
}
            .col-sm-3 {
    width: 22%;
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

        @media screen and (min-width:769px) {
            .vs-mobile {
                display: none;
            }
        }
    </style>
    <style>
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
	            #pContnet {
	            /*background-color:#D9D9D9;*/
	             font-family: Arial Rounded MT Bold;
	            font-size:10px;
	            max-width:500px;
	             animation: blinker 2s linear infinite;
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
	         .imgcontainer {
	            position: relative;
	            text-align: center;
	            color: white;
	        }
	    </style>
    <script type="text/javascript">
 var _gaq = _gaq || [];
 _gaq.push(['_setAccount', 'UA-18997513-2']);
 _gaq.push(['_trackPageview']);
 (function() {
 var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
 ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.googleanalytics.com/ga.js';
 var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
        function GetParameterValues(param) {
            var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < url.length; i++) {
            var urlparam = url[i].split('=');
                if (urlparam[0] == param) {
                    return urlparam[1];
                }
            }
        }        
</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body class="black-bg">
    <div id="boxes">
       <div style="top: 20%; left: 20%; display: none;" id="dialog" class="window">
           <div id="san" class="imgcontainer">
               <img src="" alt="loading" id="adImg" style="border:5px solid white;display:none;">
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
                   <h6 id="txtSuccess" class="tetx-center" style="color:green;display:none;">Request Submited </h6>
                   <input type="text" id="requestName" class="form-control" placeholder="Name" style="height: 20px;background-color:white!important;padding:15px;color:black;"/><br />
                   <input type="text" id="requestId" class="form-control" placeholder="Email" style="height: 20px;background-color:white!important;padding:15px;color:black;"/><br />
                   </div>
                   <div class="col-lg-1"></div>
               <div class="text-center" style="margin-bottom:5%;">
                   <span>
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

    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptmanager2" runat="server">
        </asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="header align-center">
                    <asp:Image ID="logo" runat="server" ImageUrl="~/img/logoTop.png" />
                </div>
                <div class="pt-200"></div>
                <br />

                <asp:Panel runat="server" ID="pnlselectScore">
                    <ul class="menu">
                        <li>Country</li>
                        <li>City</li>
                        <li>Club</li>
                        <li>Surname</li>
                        <li>Name</li>   
                    </ul>
                    <ul class="menu menu-1">
                        <li>
                            <asp:DropDownList ID="ddNation" runat="server" AutoPostBack="true" ForeColor="Black" OnSelectedIndexChanged="ddNation_SelectedIndexChanged">
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:DropDownList ID="ddCity" runat="server" AutoPostBack="true" ForeColor="Black" OnSelectedIndexChanged="ddCity_SelectedIndexChanged">
                                <asp:ListItem Value="" Text="Select" />
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:DropDownList ID="ddClub" runat="server" AutoPostBack="true" ForeColor="Black" OnSelectedIndexChanged="ddClub_SelectedIndexChanged">
                                <asp:ListItem Value="" Text="Select" />
                            </asp:DropDownList>
                        </li>
                        <li>
                            <asp:DropDownList ID="ddFname" runat="server" AutoPostBack="true" ForeColor="Black" OnSelectedIndexChanged="ddFname_SelectedIndexChanged">
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
                <p class="not-available">
                    <asp:Label ID="lblselectgame" runat="server" Text="Please select Game/Set to see all data & statistic"></asp:Label>
                    
                </p>
                <p class="not-available">
                    <asp:Label ID="lblwinner" runat="server" Text="Winner : " ForeColor="#32CD32" Visible="false" ></asp:Label>
                </p>
           
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="pnlgamelist" runat="server"></asp:Panel>
                            
                            <ul class="menu" style="margin-top: 50px;">
                                <li>
                                    <asp:Button ID="btnpre" Text=" back < " runat="server" Visible="false" BackColor="Black" OnClick="btnpre_Click" BorderStyle="None" />
                                </li>
                                <li>
                                    <asp:Label ID="lblbtnpage" Text=" page " runat="server" Visible="false" BackColor="Black"></asp:Label>
                                </li>
                                <li>
                                    <asp:Button ID="btnnext" Text=" > next " runat="server" Visible="false" BackColor="Black" OnClick="btnnext_Click" BorderStyle="None" />
                                </li>
                            </ul>

                        </ContentTemplate>


                    </asp:UpdatePanel>
            </div>



            <asp:Panel ID="pnlbodyimage" runat="server">
                <div class="container">
                    <div class="row">

                        <div class="col-md-3 col-sm-6 col-xs-6 ">
                            <div class="4-player">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <h5 style="color: #fff;">
                                        <asp:Label ID="lblp1" runat="server" Text="-"></asp:Label></h5>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picp1" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 number">
                                    <p>1</p>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picc1" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-6  ">
                            <div class="4-player">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <h5 style="color: #fff;">
                                        <asp:Label ID="lblp3" runat="server" Text="-"></asp:Label></h5>
                                </div>

                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picp3" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 number">
                                    <p>3</p>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picc3" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>
                            </div>

                        </div>

                        <div class="col-md-1 col-sm-12 col-xs-12  ">
                            <div class="vs">< VS ></div>
                        </div>

                        <div class="col-md-3 col-sm-6 col-xs-6  ">
                            <div class="4-player">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <h5 style="color: #D2691E;">
                                        <asp:Label ID="lblp2" runat="server" Text="-"></asp:Label></h5>
                                </div>

                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picc2" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 number">
                                    <p>2</p>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picp2" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>


                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-6  ">
                            <div class="4-player">
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <h5 style="color: #D2691E;">
                                        <asp:Label ID="lblp4" runat="server" Text="-"></asp:Label></h5>
                                </div>


                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picc4" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-2 number">
                                    <p>4</p>
                                </div>
                                <div class="col-md-5 col-sm-5 col-xs-5">
                                    <asp:Image ID="picp4" ImageUrl="~/public/Upload/Club/black.jpg" runat="server" class="reponsive" />
                                </div>

                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:UpdatePanel ID="hha" runat="server">
                            <ContentTemplate>
                                <div class="container">


                                    <div class="rownew">

                                        <asp:Timer runat="server" ID="tmnew" Enabled="true" Interval="4000"></asp:Timer>
                                        <asp:Panel ID="pnlresultset" runat="server"></asp:Panel>

                                    </div>

                                </div>
                                <br />
                                <br />
                                <div class="paragraph">
                                    <p>
                                        <strong>
                                            <asp:Label ID="lblstatistichead1" runat="server" ForeColor="White"></asp:Label></strong><br />
                                        <asp:Label ID="lblstatistic1" runat="server" ForeColor="White" Text=""></asp:Label>
                                    </p>

                                    <br />
                                    <br />
                                    <p>
                                        <strong>
                                            <asp:Label ID="lblstatistichead2" runat="server" ForeColor="#D2691E"></asp:Label></strong><br />
                                        <asp:Label ID="lblstatistic2" runat="server" ForeColor="#D2691E" Text=""></asp:Label>
                                    </p>
                                </div>
                            </ContentTemplate>


                        </asp:UpdatePanel>
                    </div>
                </div>

            </asp:Panel>
        </div>
    </form>

    <script>
        var ImageData = new Object();
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
                success: function(response) {
                    ImageData = response.d;
                    OpenImage();
                    $(".lblDiscount").text(ImageData.Discount);
                    $("#pContnet").text(ImageData.Text);
                    $("#adImg").show();
                    //imageonserver
                    //$("#adImg").attr("src", "/img/AdvImages/" + ImageData.Img);
                    $("#adImg").attr("src", ImageData.Img);
                    setTimeout(function () {
                    //$('#pContnet').css({ 'max-width': (($("#adImg").width()) - 30), 'overflow-wrap': 'break-word', 'top': $("#dialog").css('top')-10 });
                    $('#pContnet').css({ 'overflow-wrap': 'break-word', 'top': $("#dialog").css('top') - 10 });
                    }, 200);
                    timer = setTimeout(function () {
                    $("#AdSelect").show();
                    $("#san").hide();
                    }, 8000);
                },
                error: function(err) {
                alert("error : " + err);
                }
        });
        }
        var prms = GetParameterValues('PlayerId');
        if (prms != undefined)
        GetRendomeImg();
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
                SendNotification(ImageData.advEmail, "Request for discount", "We got request for discount of " + ImageData.Discount + "% for your advertisement no " + ImageData.AdvertisementId + " from " + $("#requestName").val() + ". Refrance email id is :-" + $("#requestId").val());
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
                success: function(response) {
                resetdiv();
                },
                error: function(err) {
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
                success: function(response) {
                },
                error: function(err) {
                }
          });
        }
        </script>
</body>
</html>
