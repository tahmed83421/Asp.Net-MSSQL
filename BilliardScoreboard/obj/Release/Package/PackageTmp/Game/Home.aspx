<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BilliardScoreboard.Game.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">




<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>start</title>

    <style type="text/css">
        .style1 {
            border: 1px solid #000000;
        }

        .style2 {
            text-align: center;
        }

        .style3 {
            border-width: 0;
        }

        .auto-style1 {
            text-align: center;
            font-family: Consolas;
            font-size: small;
        }

        .auto-style18 {
            color: white;
            font-family: Consolas;
        }

        a {
            color: #FFFFFF;
        }

        .style77 {
            border-width: 0px;
        }
        .redbtn {
    bottom: 25px;
    position: absolute;
    right: 70px;
    top: unset;
}
        .btn.redBtnSmall {
    background: red none repeat scroll 0 0;
    padding: 2px 16px 2px 12px;
    cursor:pointer;
}
    </style>


    <script type="text/javascript">

        function BtnItalianButtonClick() {
            document.getElementById('audiotag1').play();
         
            <% Session["Game"] = "Italian"; %>
            window.location = "../Game/Setup.aspx?Game=Ita";

            
        }

        function BtnCaromButtonClick() {
            document.getElementById('audiotag1').play();
            <% Session["Game"] = "Carom"; %>
            window.location = "../Game/Setup.aspx?Game=Carom";
        }

        function BtnTeachingEBooks() {
            document.getElementById('audiotag1').play();
            document.getElementById('btnCarom').click();
        }
        function BtnShutDown() {

        }
    </script>

    <meta name="keywords" content="start" />


    <link rel="shortcut icon" href="../img/logoscore.png" type="../img/logoscore.png" />
    <%--<img src="../img/logoscore.png" />--%>
</head>

<body style="color: #FFFFFF; background-color: #000000">
     <audio id="audiotag1" src="../sounds/button-16.wav " preload="auto"></audio>
    <div id="style.1">
        <table style="width: 1000px; height: 500px; margin-top: -250px; margin-left: -500px; left: 50%; top: 50%; position: absolute;" class="style1">
            <tr>
                <td class="style2">
                    <map id="ImgMap0" name="ImgMap0">
                        <area alt="" coords="40, 137, 222, 180" href="http://score.biliardoprofessionale.it/Game/Setup.aspx?Game=Ita" shape="rect" />
                        <area alt="" coords="482, 137, 658, 178" href="http://score.biliardoprofessionale.it/Game/Setup.aspx?Game=Carom" shape="rect" />
                        <area alt="" coords="258, 276, 427, 315" href="sart.htm" shape="rect" />
                    </map>
                    <img alt="" class="style3" src="../img/1_logo x S.png" usemap="#ImgMap0" /></td>

            </tr>
            <tr>
                <td style="display: list-item; text-align: center;">
                    <button id="btnItalian" style="background-color: transparent; text-align: center; border: none; cursor: pointer;" onclick="BtnItalianButtonClick()" >
                        <a class="btn" style="font-size: x-large; align-content: center;color:green" >Italian 5 & 9 quills</a>
                    </button>

                </td>
            </tr>
            <tr>
                <td style="display: list-item; text-align: center;">
                    <button id="btnCarom" style="background-color: transparent; text-align: center; border: none; cursor: pointer;" >
                        <a class="btn" style="font-size: x-large; align-content: center;color:deepskyblue" >International 3 Cushion Carom</a>
                    </button>

                </td>
            </tr>
            <tr>
                <td style="display: list-item; text-align: center;">
                    <button style="background-color: transparent; text-align: center; border: none; cursor: pointer;">
                        <a class="btn" style="font-size: x-large; align-content: center;">Teaching & eBook</a>
                    </button>

                </td>
            </tr>
        </table>

        <div class="redbtn" onclick="BtnShutDown()">
                        <a class="btn redBtnSmall" style="font-size: x-large; align-content: center;">Off</a>
                    </div>
    </div>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-18997513-2']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
</body>

</html>
