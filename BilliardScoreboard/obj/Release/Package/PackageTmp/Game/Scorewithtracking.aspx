<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Scorewithtracking.aspx.cs" Inherits="BilliardScoreboard.Game.Scorewithtracking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Game Score</title>
    <link rel="stylesheet" href="../css/Game.css" />
    <link href='https://fonts.googleapis.com/css?family=Oswald:700' rel='stylesheet' type='text/css'>
    <script src="../js/jquery-2.1.4.min.js"></script>

    <style type="text/css">
        .mainTable {
            width: 100%;
            margin: 12px auto;
        }
            .WhitePointTable{
            width: 455px;
            height: 301px;
            border-collapse: collapse;
            margin: 0px auto;
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
            margin: 0px auto;
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
            background-color:transparent; color:white; overflow:hidden; position:relative; width:240px; font-family: 'Oswald', sans-serif;
        }
            .countdown{
                z-index:1;
                height:475px;
                width:100%;
                position:absolute;
                background:blue;
                left:0px;
                top:100%;
            }
            .countdown2{
                z-index:2;
                height:475px;
                width:100%;
                position:absolute;
                background:red;
                left:0px;
                top:100%;
            }
            .content{
                z-index:9;
                position:relative;
                font-size:60px;
                font-family: 'Oswald', sans-serif;
            }
            .circle{
                width:20px;
                height:20px;
                border-radius:50px;
                font-size:20px;
                color:#fff;
                line-height:100px;
                text-align:center;
                background:#f00;
                margin:0px auto;
            }
        #firstboard {
        position: absolute;
        height: 950px;
        }
        #secondboard {
        position: absolute;
        height: 950px;
        }
        
        .loader{
          width: 175px;
          height: 800px;
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
          height:250px;
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
        /*
 *  STYLE 3
 */

    #popup::-webkit-scrollbar-track
    {
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	    background-color: #000000;
    }

    #popup::-webkit-scrollbar
    {
	    width: 6px;
	    background-color: #FF0000;
    }

    #popup::-webkit-scrollbar-thumb
    {
	    background-color: #FF0000;
    }
    #resultpopup::-webkit-scrollbar-track
    {
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	    background-color: #000000;
    }

    #resultpopup::-webkit-scrollbar
    {
	    width: 6px;
	    background-color: #FF0000;
    }

    #resultpopup::-webkit-scrollbar-thumb
    {
	    background-color: #FF0000;
    }
    </style>
    <script type="text/javascript">
        var spc = '';
        var cal = '';
        var enteredvalue = '';
        var startgame = '';
        var gamewin = '';
        var passboard = '';
        var pl1 = 0;
        var pl2 = 0;
        var cnt = 0;
        var caromcheck = '';
        var memory = new Array;
        function ScoreCalculation1(board) {
            if (startgame == 'start') {
                enteredvalue = lblTeamScore1.innerHTML;
                caromcheck = lblTeamScore1.innerHTML;
                if (selectedaction != '') {
                    var prev = lblPrev1.innerHTML.substring(0, lblPrev1.innerHTML.length - 1);
                     lblTeamScore2.innerHTML = eval(lblTeamScore2.innerHTML + selectedaction + lblTeamScore1.innerHTML);
                     lblTeamScore1.innerHTML = prev;
                     selectedaction = '';
                }
                else {
                    var totalcal1 = lblPrev1.innerHTML + lblTeamScore1.innerHTML;
                    lblTeamScore1.innerHTML = eval(totalcal1);
                }
                var point = '<%= Session["Point"] %>';
                lblp1.innerHTML = "p" + (eval(point - lblTeamScore1.innerHTML));

                if (parseInt(lblTeamScore1.innerHTML) > parseInt(point)) {
                    var set = lbls1.innerHTML;
                    var resultset = set.substr(1, 1);
                    lbls1.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                    lbls2.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                }

                var tick = lblt1.innerHTML;
                var result = tick.substr(1);
                if ('<%= Session["Game"] %>' == 'Italian') {
                    lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
                }
                else if ('<%= Session["Game"] %>' == 'Carom') {
                    lblt1.innerHTML = "i" + (eval(parseInt(result) + 1));
                }
                cnt = cnt + 1;
                memory.push(cal + '&nbsp;' + enteredvalue + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');
                lblPrev1.innerHTML = '';

                if ('<%= Session["Game"] %>' == 'Italian') {
                    document.getElementById('secondboard').style.width = '0px';
                    document.getElementById('firstboard').style.width = '900px';
                    document.getElementById('firstboard').style.backgroundColor = '#000000';
                    document.getElementById('firstboard').style.opacity = '0.4';

                    time2 = parseInt('<%= Session["Timer2"] %>');
                    time1 = parseInt('<%= Session["Timer1"] %>');
                    document.getElementById('mainloader').style.display = 'none';
                    $('.progress-bar').animate({ top: '100%' }, 1);
                    time = 0;
                    var spc = '';
                    timerStart(board);
                }
                else if ('<%= Session["Game"] %>' == 'Carom') {
                    if (parseInt(caromcheck) == 0) {
                        document.getElementById('secondboard').style.width = '0px';
                        document.getElementById('firstboard').style.width = '900px';
                        document.getElementById('firstboard').style.backgroundColor = '#000000';
                        document.getElementById('firstboard').style.opacity = '0.4';

                        time2 = parseInt('<%= Session["Timer2"] %>');
                        time1 = parseInt('<%= Session["Timer1"] %>');
                        document.getElementById('mainloader').style.display = 'none';
                        $('.progress-bar').animate({ top: '100%' }, 1);
                        time = 0;
                        var spc = '';
                        timerStart(board);
                    }
                }

                
                if (parseInt(lblTeamScore1.innerHTML) > parseInt(point)) {
                    lblWoS.innerHTML = 'Winner of Set';
                    lblName.innerHTML = lblPlayer1.innerHTML;
                    lblPoint.innerHTML = 'Point ' + lblTeamScore1.innerHTML + ' to ' + (parseInt('<%= Session["Timer1"] %>') + parseInt('<%= Session["Timer2"] %>'));
                    stopprogress();
                    
                    if (parseInt('<%= Session["Set"] %>') > 0) {
                        pl1 = pl1 + 1;
                        if (parseInt('<%= Session["Set"] %>') / 2 < pl1) {
                            stopprogress();
                            $("#resultclose").html('Setup Page');
                            lblWoS.innerHTML = 'Winner of the Game';
                            lblName.innerHTML = lblPlayer1.innerHTML;
                            lblPoint.innerHTML = pl1 + ' Sets to ' + pl2 + ' Set';
                            lblSet.innerHTML = 'last Set ' + lblTeamScore1.innerHTML + ' to ' + lblTeamScore2.innerHTML + ' points'
                            $("#resultclose").click(function () { window.location = "SetUp.aspx"; });
                        }
                        else {
                            stopprogress();
                            $("#resultclose").html('Next Set');
                            passboard = 'second';
                            if ('<%= Session["Game"] %>' == 'Italian') {
                                lblt1.innerHTML = 't0';
                                lblt2.innerHTML = 't0';
                                lblp1.innerHTML = "p" + '<%= Session["Point"] %>';
                                lblp2.innerHTML = "p" + '<%= Session["Point"] %>';
                            }
                            else if ('<%= Session["Game"] %>' == 'Carom') {
                                lblt1.innerHTML = 'i0';
                                lblt2.innerHTML = 'i0';
                                lblp1.innerHTML = "c" + '<%= Session["Point"] %>';
                                lblp2.innerHTML = "c" + '<%= Session["Point"] %>';
                            }
                            lblTeamScore1.innerHTML = '0';
                            lblTeamScore2.innerHTML = '0';
                            if (pl1 == pl2) {
                                document.getElementById('firstboard').style.width = '0px';
                                document.getElementById('secondboard').style.width = '0px';
                                lblStageStat.innerHTML = "Referee must start the last set";
                            }
                        }
                    }
                    else {
                        $("#resultclose").html('New Set');
                    }

                    $("#resulthover").fadeIn();
                    $("#resultpopup").fadeIn();
                    $("#resultclose").fadeIn();
                }
            }
        }

        function ScoreCalculation2(board) {
            if (startgame == 'start') {
                enteredvalue = lblTeamScore2.innerHTML;
                caromcheck = lblTeamScore2.innerHTML;
                if (selectedaction != '') {
                    var prev = lblPrev2.innerHTML.substring(0, lblPrev2.innerHTML.length - 1);
                     lblTeamScore1.innerHTML = eval(lblTeamScore1.innerHTML + selectedaction + lblTeamScore2.innerHTML);
                     lblTeamScore2.innerHTML = prev;
                     selectedaction = '';
                }
                else {
                    var totalcal2 = lblPrev2.innerHTML + lblTeamScore2.innerHTML;
                    lblTeamScore2.innerHTML = eval(totalcal2);
                }
                var point = '<%= Session["Point"] %>';
                lblp2.innerHTML = "p" + (eval(point - lblTeamScore2.innerHTML));

                if (parseInt(lblTeamScore2.innerHTML) > parseInt(point)) {
                    var set = lbls2.innerHTML;
                    var resultset = set.substr(1, 1);
                    lbls2.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                    lbls1.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                }

                var tick = lblt2.innerHTML;
                var result = tick.substr(1);
                lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                cnt = cnt + 1;
                memory.push(cal + '&nbsp;' + enteredvalue + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');
                lblPrev2.innerHTML = '';

                if ('<%= Session["Game"] %>' == 'Italian') {
                    document.getElementById('firstboard').style.width = '0px';
                    document.getElementById('secondboard').style.width = '900px';
                    document.getElementById('secondboard').style.backgroundColor = '#000000';
                    document.getElementById('secondboard').style.opacity = '0.4';

                    CCOUNT = parseInt('<%= Session["Timer1"] %>');
                    count = parseInt('<%= Session["Timer1"] %>');
                    document.getElementById('mainloader').style.display = 'none';
                    $('.progress-bar').animate({ top: '100%' }, 1);
                    time = 0;
                    var spc = '';
                    timerStart(board);
                }
                else if ('<%= Session["Game"] %>' == 'Carom') {
                    if (parseInt(caromcheck) == 0) {
                        document.getElementById('firstboard').style.width = '0px';
                        document.getElementById('secondboard').style.width = '900px';
                        document.getElementById('secondboard').style.backgroundColor = '#000000';
                        document.getElementById('secondboard').style.opacity = '0.4';

                        CCOUNT = parseInt('<%= Session["Timer1"] %>');
                        count = parseInt('<%= Session["Timer1"] %>');
                        document.getElementById('mainloader').style.display = 'none';
                        $('.progress-bar').animate({ top: '100%' }, 1);
                        time = 0;
                        var spc = '';
                        timerStart(board);
                    }
                }

                
                if (parseInt(lblTeamScore2.innerHTML) > parseInt(point)) {
                    lblWoS.innerHTML = 'Winner of Set';
                    lblName.innerHTML = lblPlayer3.innerHTML;
                    lblPoint.innerHTML = 'Point ' + lblTeamScore2.innerHTML + ' to ' + (parseInt('<%= Session["Timer1"] %>') + parseInt('<%= Session["Timer2"] %>'));
                    stopprogress();

                    if (parseInt('<%= Session["Set"] %>') > 0) {
                        pl2 = pl2 + 1;
                        if (parseInt('<%= Session["Set"] %>') / 2 < pl2) {
                            stopprogress();
                            $("#resultclose").html('Setup Page');
                            lblWoS.innerHTML = 'Winner of the Game';
                            lblName.innerHTML = lblPlayer3.innerHTML;
                            lblPoint.innerHTML = pl2 + ' Sets to ' + pl1 + ' Set';
                            lblSet.innerHTML = 'last Set ' + lblTeamScore2.innerHTML + ' to ' + lblTeamScore1.innerHTML + ' points'
                            $("#resultclose").click(function () { window.location = "SetUp.aspx"; });
                        }
                        else {
                            stopprogress();
                            $("#resultclose").html('Next Set');
                            passboard = 'first';
                            if ('<%= Session["Game"] %>' == 'Italian') {
                                lblt1.innerHTML = 't0';
                                lblt2.innerHTML = 't0';
                                lblp1.innerHTML = "p" + '<%= Session["Point"] %>';
                                lblp2.innerHTML = "p" + '<%= Session["Point"] %>';
                            }
                            else if ('<%= Session["Game"] %>' == 'Carom') {
                                lblt1.innerHTML = 'i0';
                                lblt2.innerHTML = 'i0';
                                lblp1.innerHTML = "c" + '<%= Session["Point"] %>';
                                lblp2.innerHTML = "c" + '<%= Session["Point"] %>';
                            }
                            lblTeamScore1.innerHTML = '0';
                            lblTeamScore2.innerHTML = '0';
                            if (pl1 == pl2) {
                                document.getElementById('firstboard').style.width = '0px';
                                document.getElementById('secondboard').style.width = '0px';
                                lblStageStat.innerHTML = "Referee must start the last set";
                            }
                        }
                    }
                    else {
                        $("#resultclose").html('New Set');
                    }

                    $("#resulthover").fadeIn();
                    $("#resultpopup").fadeIn();
                    $("#resultclose").fadeIn();
                }
            }
        }
        function reset1() {
            location.reload();
        }
        function resetscore1() {
            var str = document.getElementById('lblTeamScore1').innerHTML;
            if (str.length > 0) {
                document.getElementById('lblTeamScore1').innerHTML = str.substring(0, str.length - 1);
            }
        }
        function resetscore2() {
            var str = document.getElementById('lblTeamScore2').innerHTML;
            if (str.length > 0) {
                document.getElementById('lblTeamScore2').innerHTML = str.substring(0, str.length - 1);
            }
        }

        var keyboard;
        var time=0;
        var CCOUNT = parseInt('<%= Session["Timer1"] %>');
        var t, total1 = 0, total2 = 0;
        var count = parseInt('<%= Session["Timer1"] %>');
        function cddisplay() {
            // displays time in span
            if (count >= 0) {
                document.getElementById('lblTimeRemaining').innerHTML = count + '"';
            }
        };
        function countdown() {
            // starts countdown
            cddisplay();
            if (count < 0) {
                // First time is up 
                if (time == 0) {
                    time++;
                    secondtimerStart();
                }
            }
            else {
                count--;
                t = setTimeout("countdown()", 1000);
            }
        };

        function timerStart(board) {
            lblStageStat.innerHTML = "";
            startgame = 'start';
            keyboard = board;
            time2 = parseInt('<%= Session["Timer2"] %>');
            time1 = parseInt('<%= Session["Timer1"] %>');
            document.getElementById('<%=imgLogo.ClientID%>').style.display = 'none';
            countdownstart('blue');
            document.getElementById('mainloader').style.display = 'block';
            if (board == "first") {
                //document.getElementById('firstboard').style.width = '0px';
                //document.getElementById('secondboard').style.width = '500px';
                //document.getElementById('secondboard').style.backgroundColor = '#000000';
                //document.getElementById('secondboard').style.opacity = '0.4';
                if ('<%= Session["Game"] %>' == 'Italian') {
                    document.getElementById('firstboard').style.width = '0px';
                    document.getElementById('secondboard').style.width = '900px';
                    document.getElementById('secondboard').style.backgroundColor = '#000000';
                    document.getElementById('secondboard').style.opacity = '0.4';
                }
                else if ('<%= Session["Game"] %>' == 'Carom') {
                    if (parseInt(caromcheck) == 0) {
                        document.getElementById('firstboard').style.width = '0px';
                        document.getElementById('secondboard').style.width = '900px';
                        document.getElementById('secondboard').style.backgroundColor = '#000000';
                        document.getElementById('secondboard').style.opacity = '0.4';
                    }
                }
            }
            if (board == "second") {
                //document.getElementById('secondboard').style.width = '0px';
                //document.getElementById('firstboard').style.width = '500px';
                //document.getElementById('firstboard').style.backgroundColor = '#000000';
                //document.getElementById('firstboard').style.opacity = '0.4';
                if ('<%= Session["Game"] %>' == 'Italian') {
                    document.getElementById('secondboard').style.width = '0px';
                    document.getElementById('firstboard').style.width = '900px';
                    document.getElementById('firstboard').style.backgroundColor = '#000000';
                    document.getElementById('firstboard').style.opacity = '0.4';
                }
                else if ('<%= Session["Game"] %>' == 'Carom') {
                    if (parseInt(caromcheck) == 0) {
                        document.getElementById('secondboard').style.width = '0px';
                        document.getElementById('firstboard').style.width = '900px';
                        document.getElementById('firstboard').style.backgroundColor = '#000000';
                        document.getElementById('firstboard').style.opacity = '0.4';
                    }
                }
            }
        }
        function secondtimerStart() {
            CCOUNT = parseInt('<%= Session["Timer2"] %>');
            count = parseInt('<%= Session["Timer2"] %>');
            countdown();
            document.getElementById('countdown').style.top = '100%';
            document.getElementById('countdown').style.display = 'none';
            $('.countdown2').animate({ top: '0' }, (parseInt('<%= Session["Timer2"] %>') * 1000));
        }

        $(document).ready(function () {
            $('#tosetup1').click(function (e) {
                window.location = "SetUp.aspx";
            });
            $('#tosetup2').click(function (e) {
                window.location = "SetUp.aspx";
            });
        });

        function pointadd(type, pnts) {
            if (startgame == 'start') {
                if (pnts == '+' || pnts == '-') {
                    spc = '1';
                    cal = pnts;
                    stopprogress();
                }
                if (type == "first") {
                    var points = document.getElementById('<%=lblTeamScore1.ClientID%>').innerHTML;
                    var Prev1 = document.getElementById('<%=lblPrev1.ClientID%>').innerHTML;

                    if ((points.indexOf('+') != -1) || (points.indexOf('-') != -1)) {
                        lblTeamScore1.innerHTML = points + pnts;
                    }
                    else if (points == '0') {
                        if (spc == '1') {
                            lblTeamScore1.innerHTML = '';
                            lblPrev1.innerHTML = pnts;
                        }
                    }
                    else {
                        if (spc == '1') {
                            lblPrev1.innerHTML = lblTeamScore1.innerHTML + pnts;
                            lblTeamScore1.innerHTML = '';
                        }
                        else {
                            if ((Prev1.indexOf('+') != -1) || (Prev1.indexOf('-') != -1)) {
                                lblTeamScore1.innerHTML = points + pnts;
                            }
                        }
                    }
                }
                if (type == "second") {
                    if (pnts == '+' || pnts == '-') {
                        spc = '1';
                        stopprogress();
                    }
                    var points2 = document.getElementById('<%=lblTeamScore2.ClientID%>').innerHTML;
                    var Prev2 = document.getElementById('<%=lblPrev2.ClientID%>').innerHTML;

                    if ((points2.indexOf('+') != -1) || (points2.indexOf('-') != -1)) {
                        lblTeamScore2.innerHTML = points2 + pnts;
                    }
                    else if (points2 == '0') {
                        if (spc == '1') {
                            lblTeamScore2.innerHTML = '';
                            lblPrev2.innerHTML = pnts;
                        }
                    }
                    else {
                        if (spc == '1') {
                            lblPrev2.innerHTML = lblTeamScore2.innerHTML + pnts;
                            lblTeamScore2.innerHTML = '';
                        }
                        else {
                            if ((Prev2.indexOf('+') != -1) || (Prev2.indexOf('-') != -1)) {
                                lblTeamScore2.innerHTML = points2 + pnts;
                            }
                        }
                    }
                }
                spc = '';
            }
        }
    </script>
    <script type="text/javascript">
        /* SET RANDOM LOADER COLORS FOR DEMO PURPOSES */
        var demoColorArray = ['red', 'blue', 'green', 'yellow', 'purple', 'gray'];
        var colorIndex = Math.floor(Math.random() * demoColorArray.length);
        //setSkin('red');

        // Stripes interval
        var stripesAnim;
        var calcPercent;

        var time2 = parseInt('<%= Session["Timer2"] %>');
        var time1 = parseInt('<%= Session["Timer1"] %>');
        var time = 0;
        $progress = $('.progress-bar');
        $percent = $('.percentage');
        $stripes = $('.progress-stripes');
        $stripes.text('-------------------------------');
        var ctype = '';
        function countdownstart(col) {
            if (col == "red") {
                ctype = "red";
            }
            if ((parseInt(time1) > 0) && (parseInt(time2) > 0)) {
                loaded = true;
                setSkin(col);
                $('.progress-bar').animate({ top: '0%' }, (parseInt(time1) * 1000));
                countdown();
                //// Call function to animate stripes
                stripesAnimate();
            }
        }
        function countdown() {
            // starts countdown
            if (time1 < 0) {
                // First time is up 
                if (time == 0) {
                    time++;
                    time1 = time2;
                    $('.progress-bar').animate({ top: '100%' }, 1);
                    countdownstart('red');
                }
                if ($(".percentage").text() == '0"') {
                    if (ctype == "red") {
                        $(".progress-bar").unbind("click");
                        $('.progress-bar').click(function () {
                            resettimer();
                        });
                    }
                }
            }
            else {
                $('.percentage').text(time1 + '"');
                time1--;
                t = setTimeout("countdown()", 1000);
            }
        };
        /* STRIPES ANIMATION */
        function stripesAnimate() {
            animating();
            stripesAnim = setInterval(animating, 100);
        }

        function animating() {
            $('.progress-stripes').animate({
                marginTop: "-=30px"
            }, 250, "linear").append('-');
        }

        function setSkin(skin) {
            document.getElementById("mainloader").className = "loader " + skin;
        }
        function stopprogress() {
            $('.progress-bar').stop();
            $('.percentage').text(time1 + '"');
            $('.progress-stripes').stop();
            clearTimeout(t);
        }

        var keytab = '';
        function showhistory(tab) {
            keytab = tab;
            stopprogress();
            $("#popup").find('span').remove();
            $("#popup").find('br').remove();
            for (var i = 0; i < memory.length; i++) {
                var color = memory[i].split('||');
                if (color[1] == 'white') {
                    $('<span style="color:while">' + color[0] + '</span></br>').appendTo('#popup');
                }
                else if (color[1] == 'darkorange') {
                    $('<span style="color:darkorange">' + color[0] + '</span></br>').appendTo('#popup');
                }
            }
            $("#hover").fadeIn();
            $("#popup").fadeIn();
            $("#close").fadeIn();
        }

        $(document).ready(function () {

            $("#hover").attr('style','display:none');
            $("#popup").attr('style', 'display:none');
            $("#close").attr('style', 'display:none');
            $("#resulthover").attr('style', 'display:none');
            $("#resultpopup").attr('style', 'display:none');
            $("#resultclose").attr('style', 'display:none');
            
            //chiusura al click sulla parte scura
            $("#hover").click(function () {
                $(this).fadeOut();
                $("#popup").fadeOut();
                timerStart(keytab);
                //location.reload();
            });

            //chiusura al click sul pulsante
            $("#close").click(function () {
                $("#hover").fadeOut();
                $("#popup").fadeOut();
                timerStart(keytab);
                //location.reload();
            });
            
            $("#resultclose").click(function () {
                var sets='<%= Session["Set"] %>';
                if (sets == '') {
                    location.reload();
                }
                else {
                    $("#resulthover").fadeOut();
                    $("#resultpopup").fadeOut();
                    time2 = parseInt('<%= Session["Timer2"] %>');
                    time1 = parseInt('<%= Session["Timer1"] %>');
                    document.getElementById('mainloader').style.display = 'none';
                    $('.progress-bar').animate({ top: '100%' }, 1);
                    time = 0;
                    var spc = '';
                    if (pl1 == pl2) {
                        document.getElementById('firstboard').style.width = '0px';
                        document.getElementById('secondboard').style.width = '0px';
                        stopprogress();
                    }
                    else {
                        timerStart(passboard);
                    }
                }
            });

        });

        var selectedaction = '';
        function oppcalculation(key) {
            if (key == 'first') {
                if ((lblPrev2.innerHTML.indexOf("+") > -1) || (lblPrev2.innerHTML.indexOf("-") > -1)) {
                    selectedaction = lblPrev2.innerHTML.substr(lblPrev2.innerHTML.length - 1);
                }
            }
            if (key == 'second') {
                if ((lblPrev1.innerHTML.indexOf("+") > -1) || (lblPrev1.innerHTML.indexOf("-") > -1)) {
                    selectedaction = lblPrev1.innerHTML.substr(lblPrev1.innerHTML.length - 1);
                }
            }
        }
        function resettimer() {
            document.getElementById('mainloader').style.display = 'none';
            $('.progress-bar').animate({ top: '100%' }, 1);
            time = 0;
            var spc = '';
            time2 = parseInt('<%= Session["Timer2"] %>');
            time1 = parseInt('<%= Session["Timer1"] %>');
            document.getElementById('mainloader').style.display = 'block';
            $(".progress-bar").unbind("click");
            countdownstart('blue');
        }
    </script>

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-18997513-2']);
        _gaq.push(['_trackPageview']);
        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="bg">
            <table cellpadding="0" cellspacing="0" class="mainTable">
                <tr>
                    <td class="White center" style="width:800px">
                        <table style="margin:0px auto; text-align:left; font:18pt Arial; width:760px;">
                            <tr>
                                <td style="width:380px;">
                                    <asp:Label ID="lblPlayer1" runat="server" Text="Peppoin Beni"></asp:Label> - 
                                    <asp:Label ID="lblClub1" runat="server" Text="Club Stessi"></asp:Label>
                                </td>
                                <td style="vertical-align:bottom; width:20px;"></td>
                                <td style="width:380px;">
                                    <asp:Label ID="lblPlayer2" runat="server" Text="Bettin Luigi"></asp:Label> - 
                                    <asp:Label ID="lblClub2" runat="server" Text="Club Ireddo"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="imgPlayer1" runat="server" ImageUrl="~/img/logoscore.png" CssClass="profileimage" style="float:left;" />
                                    <div style="width: 28px; background-color: white; border-radius: 5px; height: 28px; text-align: center; vertical-align: bottom; float: left; color: black; margin: 50px 22px 0px; font-size:24px;">1</div>
                                    <asp:Image ID="imgClub1" runat="server" ImageUrl="~/img/logoscore.png" CssClass="clubimage" />
                                    
                                </td>
                                <td style="vertical-align:bottom; width:20px;"></td>
                                <td>
                                    <asp:Image ID="imgPlayer2" runat="server" ImageUrl="~/img/logoscore.png" CssClass="profileimage" style="float:left;" />
                                    <div style="width: 28px; background-color: white; border-radius: 5px; height: 28px; text-align: center; vertical-align: bottom; float: left; color: black; margin: 50px 22px 0px; font-size:24px;">3</div>
                                    <asp:Image ID="imgClub2" runat="server" ImageUrl="~/img/logoscore.png" CssClass="clubimage" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="center" style="width:320px; vertical-align:bottom; padding-bottom:3px;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <asp:Label ID="lblGameType" runat="server" Text="Italian Game" ForeColor="#00cc00" Font-Size="24pt" Font-Bold="true" Font-Names="Arial"></asp:Label><br />
                            <asp:Label ID="lblTime" runat="server" Text="00:00:00" ForeColor="#FFFFFF" Font-Size="24pt"></asp:Label>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Timer1" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                    <td class="Yellow center" style="width:800px">
                        <table style="margin:0px auto; text-align:right; font:18pt Arial; width:760px;">
                            <tr>
                                <td style="width:380px;">
                                    <asp:Label ID="lblClub3" runat="server" Text="Club Stessi"></asp:Label> - 
                                    <asp:Label ID="lblPlayer3" runat="server" Text="Bssorlin Bexi"></asp:Label>
                                    
                                </td>
                                <td style="vertical-align:bottom; width:20px;"></td>
                                <td style="width:380px;">
                                    <asp:Label ID="lblClub4" runat="server" Text="Club Stecca"></asp:Label> -
                                    <asp:Label ID="lblPlayer4" runat="server" Text="Bettdn Liuigi"></asp:Label>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="imgPlayer3" runat="server" ImageUrl="~/img/logoscore.png" CssClass="profileimage" style="float:right;" />
                                    <div style="width: 28px; background-color: white; border-radius: 5px; height: 28px; text-align: center; vertical-align: bottom; float: right; color: black; margin: 50px 22px 0px; font-size:24px;">2</div>
                                    <asp:Image ID="imgClub3" runat="server" ImageUrl="~/img/logoscore.png" CssClass="clubimage" />
                                </td>
                                <td style="vertical-align:bottom; width:20px;"></td>
                                <td>
                                    <asp:Image ID="imgPlayer4" runat="server" ImageUrl="~/img/logoscore.png" CssClass="profileimage" style="float:right;" />
                                    <div style="width: 28px; background-color: white; border-radius: 5px; height: 28px; text-align: center; vertical-align: bottom; float: right; color: black; margin: 50px 22px 0px; font-size:24px;">4</div>
                                    <asp:Image ID="imgClub4" runat="server" ImageUrl="~/img/logoscore.png" CssClass="clubimage" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height:550px;">
                    <td class="White center" style="vertical-align:top; height:100px;">
                        <div id="firstboard"></div>
                        <asp:Label ID="lblPrev1" runat="server" Text="" Font-Size="48pt" style="font-family: Arial; line-height:120px;"></asp:Label><br />
                        <asp:Label ID="lblTeamScore1" runat="server" Text="0" Font-Size="420pt" style="font-family: 'Arial Narrow'; line-height:400px;"></asp:Label>
                    </td>
                    <td id='counter' rowspan="3" style="text-align:center;">
                        <div class="content">
                            <span id="lblTimeRemaining" class="count"></span>
                        </div>                        
                        <!-- actual preloader -->
	                    <div id="mainloader" class="loader">
                            <div class="percentage">0"</div>
		                    <div class="progress-bar"><div class="progress-stripes"></div></div>
	                    </div>
                        <span id="countdown" class="countdown"></span>
                        <span id="countdown2" class="countdown2"></span>              
                        <asp:Image ID="imgLogo" runat="server" ImageUrl="~/img/logoscorenew.png" Width="150px" style="margin:760px auto 0px;" />
                        <asp:Label ID="lblStageStat" runat="server" Text="" Font-Size="25px" ForeColor="#ff0000"></asp:Label>
                        <asp:Label ID="lblSite" runat="server" Text="biliardoprofessionale.it" Font-Names="Arial" Font-Size="24pt" ForeColor="#00ff00"></asp:Label>
                    </td>
                    <td class="Yellow center" style="vertical-align:top;">                        
                        <div id="secondboard"></div>
                        <asp:Label ID="lblPrev2" runat="server" Text="" Font-Size="48pt" style="font-family: Arial; line-height:120px;"></asp:Label><br />
                        <asp:Label ID="lblTeamScore2" runat="server" Text="0" Font-Size="420pt" style="font-family: 'Arial Narrow'; line-height:400px;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="White center" style="height:60px;">
                        <asp:Label ID="lblt1" runat="server" Text="t0" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lblp1" runat="server" Text="p000" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lbls1" runat="server" Text="s0/0" Font-Size="55pt" style="font-family: Arial;"></asp:Label>
                    </td>
                    <td class="Yellow center">
                        <asp:Label ID="lblt2" runat="server" Text="t0" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lblp2" runat="server" Text="p000" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lbls2" runat="server" Text="s0/0" Font-Size="55pt" style="font-family: Arial;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="center">
                        <table class="WhitePointTable">
                            <tr>
                                <td><input type="button" value="G" onClick="timerStart('first');" class="BtnCalculator"></td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="1" onClick="pointadd('first', '1');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="2" onClick="pointadd('first', '2');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="3" onClick="pointadd('first', '3');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" value="S" onClick="reset1();" class="BtnCalculator">
                                </td>
                                <td style="width:26px;"></td>
                                <td>
                                    <input type="button" value="4" onClick="pointadd('first', '4');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="5" onClick="pointadd('first', '5');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="6" onClick="pointadd('first', '6');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="↑" onclick="oppcalculation('second')" class="BtnCalculator">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" value="M" onclick="showhistory('first');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;"></td>
                                <td>
                                    <input type="button" value="7" onClick="pointadd('first', '7');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="8" onClick="pointadd('first', '8');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="9" onClick="pointadd('first', '9');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="=" onClick="ScoreCalculation1('second');" class="BtnCalculator">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="tosetup1" style="width:69px; height:40px; padding-top:20px"><div class="circle"></div></div>
                                </td>
                                <td style="width:26px;"></td>
                                <td>
                                    <input type="button" value="-" onClick="pointadd('first', '-');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="0" onClick="pointadd('first', '0');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="+" onClick="pointadd('first', '+');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="C" onClick="resetscore1()" class="BtnCalculator">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="center">
                        <table class="YellowPointTable">
                            <tr>
                                <td><input type="button" value="G" onClick="timerStart('second');" class="BtnCalculator"></td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="1" onClick="pointadd('second', '1');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="2" onClick="pointadd('second', '2');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="3" onClick="pointadd('second', '3');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" value="S" onClick="reset1();" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="4" onClick="pointadd('second', '4');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="5" onClick="pointadd('second', '5');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="6" onClick="pointadd('second', '6');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="↑" onclick="oppcalculation('first')" class="BtnCalculator">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" value="M" onclick="showhistory('second');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="7" onClick="pointadd('second', '7');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="8" onClick="pointadd('second', '8');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="9" onClick="pointadd('second', '9');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="=" onClick="ScoreCalculation2('first');" class="BtnCalculator">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="tosetup2" style="width:69px; height:40px; padding-top:20px;"><div class="circle"></div></div>
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="-" onClick="pointadd('second', '-');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="0" onClick="pointadd('second', '0');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="+" onClick="pointadd('second', '+');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="C" onClick="resetscore2()" class="BtnCalculator">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>        
        </div>
          <div id="hover"></div>

  <div id="popup">
    <div id="close">X</div>
    <p style="font-size: 24px; margin: 16px;">Memory details</p>
  </div>
        <div id="resulthover"></div>
    <div id="resultpopup">
    <p style="font-size: 24px; margin: 16px;line-height: 40px;">
        <asp:Label ID="lblWoS" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblName" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblPoint" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblSet" runat="server" Text=""></asp:Label>
    </p>
    <div id="resultclose">NEW SET</div>
  </div>
    </form>
</body>
</html>
