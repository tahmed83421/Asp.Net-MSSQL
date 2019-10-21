<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StreamBoardNo.aspx.cs" Inherits="BilliardScoreboard.Game.StreamBoardNo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="stylesheet" href="../css/Game.css" />
    <link href='https://fonts.googleapis.com/css?family=Oswald:700' rel='stylesheet' type='text/css'/>
    <link href="../css/jquery.loader.css" rel="stylesheet" />
    <script src="../js/jquery-2.1.4.min.js"></script>
    <script src="../js/project/score.js"></script>
    <script src="../js/jquery.loader.js"></script>
          <style type="text/css">
        .mainTable {
            width: 100%;
            margin: 12px auto;
        }
        @font-face {
            font-family: "cenMT";
            src: url('../font/ufonts.com_bodoni_mt_condensed_bold_1_.eot');
            src: url('../font/ufonts.com_bodoni-mt-condensed-bold.woff')format("woff");
            src: url('../font/ufonts.com_bodoni-mt-condensed-bold.ttf')format("truetype");
            font-weight: normal;
            font-style: normal;
        }
        .button12 {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
/* Modal Content */
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            border: 1px solid #888;
            width: 80%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            -webkit-animation-name: animatetop;
            -webkit-animation-duration: 0.4s;
            animation-name: animatetop;
            animation-duration: 0.4s;
        }

/* Add Animation */
        @-webkit-keyframes animatetop {
            from {
                top: -300px;
                opacity: 0;
            }

            to {
                top: 0;
                opacity: 1;
            }
        }

        @keyframes animatetop {
            from {
                top: -300px;
                opacity: 0;
            }

            to {
                top: 0;
                opacity: 1;
            }
        }

/* The Close Button */
        .close {
            color: white;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        .modal-header {
            padding: 2px 16px;
            background-color: red;
            color: white;
        }

.modal-body {padding: 2px 16px;}

        .modal-footer {
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }
      
            .WhitePointTable{
              width: 455px;
            height: 301px;
            border-collapse: collapse;
            margin: -45px auto 0;
        }
            .WhitePointTable td {
            border: 5px solid #000000;
            background-color:#FFFFFF;
            border-radius: 9px;
            background-clip: padding-box;
            text-align: center;
            font-weight: bold;
            font-size: 18px !important;
            }
            .WhitePointTable td:nth-child(2) {background-color:transparent}
            .WhitePointTable td:nth-child(6) {background-color:transparent}

            .YellowPointTable{
           width: 455px;
            height: 301px;
            border-collapse: collapse;
            margin: -45px auto 0;
        }
            .YellowPointTable td {
            border: 5px solid #000000;
            background-color:#ff6a00;
            border-radius: 9px;
            background-clip: padding-box;
            text-align: center;
            font-weight: bold;
            font-size: 18px !important;
            }
            .YellowPointTable td:nth-child(2) {background-color:transparent}
            .YellowPointTable td:nth-child(6) {background-color:transparent}

        #counter {
            background-color: transparent;
            color: white;
            overflow: hidden;
            position: relative;
            width: 240px;
            font-family: 'Oswald', sans-serif;
        }
        .ex1 {
            margin-left: 40cm;
        }
        .countdown {
            z-index: 1;
            height: 475px;
            width: 100%;
            position: absolute;
            background: blue;
            left: 0px;
            top: 100%;
        }
        .countdown2 {
            z-index: 2;
            height: 475px;
            width: 100%;
            position: absolute;
            background: red;
            left: 0px;
            top: 100%;
        }
        .content {
            z-index: 9;
            position: relative;
            font-size: 60px;
            font-family: 'Oswald', sans-serif;
        }
        .circle {
            width: 20px;
            height: 20px;
            border-radius: 50px;
            font-size: 20px;
            color: #fff;
            line-height: 100px;
            text-align: center;
            background: #f00;
            margin: 0px auto;
        }
        #firstboard {
            position: absolute;
            height: 990px;
        }
        #secondboard {
        position: absolute;
        height: 990px;
        }
        .loader{
          width: 175px;
          height: 762px;
          border-radius: 6px;
          border: 1px solid #999;
          background-color: transparent;
          overflow: hidden;
          position: relative;
          display:none;
          margin:100px auto 0px auto;
        }
        .loader.gray{
          background: #999;
        }
        .progress-bar{
          height: 100%;
          width: 100%;
          top:100%;
          border-radius: inherit;
          position: absolute;
          overflow: hidden;
        }
        .progress-stripes{
          width: inherit;
          height: inherit;
          font-size: 200px;
          font-weight: bold;
          letter-spacing: -28px;
        }
        .percentage{
            position:relative;
            top:80%;
         text-align:center;
          font-size: 60pt;
          width:100%;
          z-index:1;
          font-family:Arial;
        }
        /***************************************/
        /* BELOW HERE IS SOLELY FOR AESTHETICS */
        /*_____________________________________*/
        /*** COLOR SCHEMES ***/
        /* RED */
        .red .progress-bar{
          background: #e74c3c;
        }
        .red .progress-stripes{
          color: #c0392b;
        }
        .red .percentage{
          color: #eee;
        }
        /* BLUE */
        .blue .progress-bar{
          background: #3498db;
        }
        .blue .progress-stripes{
          color: #2980b9;
        }
        .blue .percentage{
          color: #eee;
        }
        /*** LOADED ***/
        span.loaded.red{
          color: #c0392b;
        }
        span.loaded.blue{
          color: #2980b9;
        }
        /*** History details ***/
        #hover{
          position:fixed;
          background:#1F3948;
          width:100%;
          height:100%;
          opacity: .8;
        }
        #popup{
          position:relative;
          width:300px;
          height:400px;
          background:#000;
          color:#FFFFFF;
          top:300px;
          border-radius:5px;
          padding:5px 0;
          margin:0px auto; /* height/2 + padding-top */
          text-align:center;
          box-shadow:0 0 10px 0 #000;
          overflow-y:scroll;
        }
        #nnnew{
            top: 0;
             font-size:68px;
        }
        #close{
          position:absolute;
          background:red;
          color:white;
          right:0px;
          top:0px;
          border-radius:50%;
          width:30px;
          height:30px;
          line-height:30px;
          text-align:center;
          font-size:8px;
          font-weight:bold;
          font-family:'Arial Black', Arial, sans-serif;
          cursor:pointer;
          box-shadow:0 0 10px 0 #F00;
        }
        #resulthover{
          position:fixed;
          background:#1F3948;
          width:100%;
          height:100%;
          opacity: .8;
        }
        #resultpopup{
          position:relative;
          width:300px;
          height:260px;
          background:#000;
          color:#FFFFFF;
          top:300px;
          border-radius:5px;
          padding:5px 0;
          margin:0px auto; /* height/2 + padding-top */
          text-align:center;
          box-shadow:0 0 10px 0 #000;
          overflow-y:scroll;
          z-index:1;
        }
        #resultclose{
          position:relative;
          background:red;
          color:white;
          margin:0px auto;
          bottom:0px;
          width:100px;
          height:30px;
          line-height:30px;
          text-align:center;
          font-size:14px;
          font-family:'Arial Black', Arial, sans-serif;
          cursor:pointer;
        }
        #myProgress {
            position: absolute;
            width: 750px;
            height: 200px;
            border: outset;
            border-color: gray;
            background-color: #000;
            -webkit-transform: rotate(-90deg); /* Chrome, Safari, Opera */
            transform: rotate(-90deg);
        }
        #myBar {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: #4CAF50;
        }
        #label {
            text-align: center;
            line-height: 100px;
            color: white;
            font-size: 50px;
            -webkit-transform: rotate(90deg); /* Chrome, Safari, Opera */
            transform: rotate(90deg);
        }
        /*
        *  STYLE 3
        */
        #popup::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #000000;
        }
        #popup::-webkit-scrollbar {
            width: 6px;
            background-color: #FF0000;
        }
        #popup::-webkit-scrollbar-thumb {
            background-color: #FF0000;
        }
        #resultpopup::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            background-color: #000000;
        }
        #resultpopup::-webkit-scrollbar {
            width: 6px;
            background-color: #FF0000;
        }
        #resultpopup::-webkit-scrollbar-thumb {
            background-color: #FF0000;
        }
              .auto-style46 {
                  width: 663px;
                  height: 47px;
              }
              .auto-style47 {
                  height: 37px;
                  width: 663px;
              }
              .auto-style48 {
                  overflow: auto;
                  height: 128px;
                  width: 665px;
              }
              </style>
 
    </head>
<body>
    <form id="form1" runat="server">





       
          
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Button ID="Button2" runat="server" Text="22"  style="border-radius:50%; width:140px; height:140px; background-image:url('../img/black.jpg'); border-color:darkgray;border-style:solid; text-align:center;color:white; border-width:8px; font-size:80px;"   />
            
           
       
            
           &nbsp;<asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
       
      
    </form>
</body>
</html>
