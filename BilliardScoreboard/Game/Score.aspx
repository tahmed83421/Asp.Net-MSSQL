<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Score.aspx.cs" Inherits="BilliardScoreboard.Game.Score" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Game Score</title>
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
    </style>
    <script type="text/javascript">
        var glo= 0;
        var spc = '';
        var cal = '';
        var enteredvalue = '';
        var startgame = '';
        var gamewin = '';
        var passboard = '';
        var passboard0 = '';
        var pl1 = 0;
        var pl2 = 0;
        var cnt = 0;
        var myVar;
        var myVar1;
        var exchang;
        var ppoint1;
        var ppoint2;
        var sb = 1;
        var pasb = '';
        var hand = 0;
        var handp = 0 ; 
        var handcal= ""; 
        var flgzro = 0;
        var balmark = 0;
        var extr = 0;
        var extrW = 0 ; 
        var extrY = 0 ;
        var extraboard = "";
        var red = 0 ;
        var flash = 0 ; 
        var sp = 0;
        var sp1 = 0 ;
        var sp2 = 0 ;
        var jog = 0;
        var jog1 = 0;
        var plus = 0 ; 
        var minus = 0 ;
        var exchch = 0;
        '<%Session["exchange"] = "' + 0 + '"; %>';
        var caromcheck = '';
        var memory = new Array;
        var store1 = new Array;
        var store2 = new Array;
        var store3 = new Array;
        var memoryflash = new Array;
        var x;
/*
        $(document).ready(function () {      // Wait for the HTML to finish loading.
            var resize = function () {
                var height = $(window).height();  // Get the height of the browser window area.
                var element = $("body");          // Find the element to resize.
                element.height(height);           // Set the element's height.
            }
            resize();
            $(window).bind("resize", resize);
        });*/
        function myFunc1() {
            document.getElementById('hidDiv').style.display = 'none';
            document.getElementById('lblSite').style.display = 'block';
       
        }
        function CallLoader() {
            stopprogress();
            document.getElementById('lblSite').style.display = 'none';
            document.getElementById('mainloader').style.display = 'none';
            document.getElementById('hidDiv').style.display = 'block';
            setTimeout(myFunc1, 2000);
        }
        function zoom() {
            document.body.style.zoom = "100%" 
        }
        function stateChange(board) {
            document.getElementById('audiotag1').play();
            if (startgame == 'start') {
                 exchang = document.getElementById("exarrow").value;

                if (exchang == '0') {
                    exchang = 2;
                    document.getElementById("exarrow").value = 2;
                    x = 500;

                    if (board == 'first') {
                        document.getElementById("uparrow1").style.backgroundColor = "green";
                        $("#uparrow1").fadeIn(x).fadeOut(x).fadeIn(x).fadeOut(x).fadeIn(x).fadeOut(x).fadeIn(x).fadeOut(x).fadeIn(x);
                        myVar = setTimeout(function () {
                            if (exchang == 2) {
                                
                                document.getElementById("uparrow1").style.backgroundColor = "#FFFFFF";

                                arrowcalculation('first');

                                document.getElementById("exarrow").value = 0;
                            }
                        }, 5000);

                    }
                    else if (board == 'second') {
                        document.getElementById("uparrow2").style.backgroundColor = "green";
                        $("#uparrow2").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
                        myVar1 = setTimeout(function () {
                            if (exchang == 2) {
                                document.getElementById("uparrow2").style.backgroundColor = "#FF6A00";

                                arrowcalculation('second');
                                document.getElementById("exarrow").value = 0;
                            }
                        }, 5000);
                    }
                }
                else if (exchang == 2) {
                    exchang = 0;
                    if (board == 'first') {
                        clearTimeout(myVar);
                        $(this).find("uparrow1").stop(true, true).fadeOut();
                        document.getElementById("uparrow1").style.backgroundColor = "#FFFFFF";
                        document.getElementById("exarrow").value = 0;
                    }
                    else if (board == 'second') {
                        clearTimeout(myVar1);
                        document.getElementById("uparrow2").style.backgroundColor = "#FF6A00";
                        document.getElementById("exarrow").value = 0;
                    } 
                }
            }
        }
        function handiicapp(type,pnts){

                    if (startgame != 'start') {
                       
   
                        var modal = document.getElementById('myModal');
                        var span = document.getElementsByClassName("close")[0];
                        var btnn = document.getElementById('yesb');
                        var btnnob = document.getElementById('nob');
                        modal.style.display = "block";

                        btnn.onclick = function () {
                             handcal = cal;
                             hand = 1;
                             handp = enteredvalue;
                        

                            memory.push(cal + '&nbsp;' + enteredvalue + '%' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + 0 + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');


                            store2.push('<font  color=#000000>' + cal + '&nbsp;' + enteredvalue + cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '%' + '</font>');
                            modal.style.display = "none";
                            document.getElementById("SbtnW").disabled = true;
                            document.getElementById("CbtnW").disabled = true;
                            document.getElementById("SbtnY").disabled = true;
                            document.getElementById("CbtnY").disabled = true;
                            document.getElementById("W0").disabled = true;
                            document.getElementById("W1").disabled = true;
                            document.getElementById("W2").disabled = true;
                            document.getElementById("W3").disabled = true;
                            document.getElementById("W4").disabled = true;
                            document.getElementById("W5").disabled = true;
                            document.getElementById("W6").disabled = true;
                            document.getElementById("W7").disabled = true;
                            document.getElementById("W8").disabled = true;
                            document.getElementById("W9").disabled = true;


                        }
                        btnnob.onclick = function () {
                                var pooint = '<%= Session["Point"] %>';
                            modal.style.display = "none";
                            lblTeamScore1.innerHTML = '0';
                            lblp1.innerHTML = pooint;
                      
                            document.getElementById("pl1plusbtn").disabled = false; 
                            document.getElementById("pl2plusbtn").disabled = false;
                            document.getElementById("pl1minusbtn").disabled = false;
                            document.getElementById("pl2minusbtn").disabled = false;

                        }
                    }
        }

        function ScoreCalculation1(board) {
            
            red = 0 ;
            balmark = 0 ;
            flgzro = 0;
            passboard1 = 'first';
            
           
            
           
    
          
            if (startgame == 'start' || startgameinit == 'init' || startgameinit2 == 'init')
            {
                document.getElementById("uparrow1").disabled = false; 
                document.getElementById("uparrow2").disabled = false;
                document.getElementById("calcbtn1").disabled = true;
                document.getElementById("calcbtn2").disabled = true;
                document.getElementById("CbtnW").disabled = true;
                
                
                
                var exch = document.getElementById("exchangestate").value;
                if (exch == 0) {
                   
  
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
                    ppoint1 = eval(point - lblTeamScore1.innerHTML);
                    lblp1.innerHTML = "p" + (eval(point - lblTeamScore1.innerHTML));

                    if (parseInt(lblTeamScore1.innerHTML) >= parseInt(point)) {
                        var set = lbls1.innerHTML;
                        var resultset = set.substr(1, 1);
                        lbls1.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                       
                    }

                    var tick = lblt1.innerHTML;
                    var result = tick.substr(1);
                    if ('<%= Session["Game"] %>' == 'Italian') {
                        if(startgame=='start')
                        lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
                    }
                    else if ('<%= Session["Game"] %>' == 'Carom') {
                        lblt1.innerHTML = "i" + (eval(parseInt(result) + 1));
                    }

                    if (startgame != 'start') {
                       
   
                        var modal = document.getElementById('myModal');
                        var span = document.getElementsByClassName("close")[0];
                        var btnn = document.getElementById('yesb');
                        var btnnob = document.getElementById('nob');
                        modal.style.display = "block";

                        btnn.onclick = function () {
                             handcal = cal;
                             hand = 1;
                             handp = enteredvalue;

                            memory.push(cal + '&nbsp;' + enteredvalue + '%' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + 0 + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');


                            store2.push('<font  color=#000000>' + cal + '&nbsp;' + enteredvalue + cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '%' + '</font>');
                            modal.style.display = "none";
                            document.getElementById("SbtnW").disabled = true;
                            document.getElementById("CbtnW").disabled = true;
                            document.getElementById("SbtnY").disabled = true;
                            document.getElementById("CbtnY").disabled = true;
                            document.getElementById("W0").disabled = true;
                            document.getElementById("W1").disabled = true;
                            document.getElementById("W2").disabled = true;
                            document.getElementById("W3").disabled = true;
                            document.getElementById("W4").disabled = true;
                            document.getElementById("W5").disabled = true;
                            document.getElementById("W6").disabled = true;
                            document.getElementById("W7").disabled = true;
                            document.getElementById("W8").disabled = true;
                            document.getElementById("W9").disabled = true;


                        }
                        btnnob.onclick = function () {
                                var pooint = '<%= Session["Point"] %>';
                            modal.style.display = "none";
                            lblTeamScore1.innerHTML = '0';
                            lblp1.innerHTML = pooint;
                      
                            document.getElementById("pl1plusbtn").disabled = false; 
                            document.getElementById("pl2plusbtn").disabled = false;
                            document.getElementById("pl1minusbtn").disabled = false;
                            document.getElementById("pl2minusbtn").disabled = false;

                        }
                    }
                    else {
                        cnt = cnt + 1;
                        memory.push(cal + '&nbsp;' + enteredvalue + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');

                        store2.push('<font  color=#000000>' + cal + '&nbsp;' + enteredvalue + cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '</font>');
                    }
                    store1.push(enteredvalue);
                    lblPrev1.innerHTML = '';
                 

                 

                    if ('<%= Session["Game"] %>' == 'Italian') {
                        if (startgame=='start') {
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
                            if(board == 'first')
                                passboard1 = 'second';
                            else if(board == 'second')
                                passboard1 = 'first';
                     
                        }
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
                            document.getElementById('lblSite').style.display = 'none';
                            $('.progress-bar').animate({ top: '100%' }, 1);
                            time = 0;
                            var spc = '';
                            timerStart(board);
                        }
                    }
                    startgameinit = 'end';
                    if (startgameinit == 'end' && startgame != 'start')
                    {
                        document.getElementById("pl1plusbtn").disabled = true;
                        document.getElementById("pl1minusbtn").disabled = true;
                        document.getElementById("pl2plusbtn").disabled = true;
                        document.getElementById("pl2minusbtn").disabled = true;
                        document.getElementById("calcbtn2").disabled = true;
                    }
                        

                    if (parseInt(lblTeamScore1.innerHTML) >= parseInt(point)) {
                        lblWoS.innerHTML = 'Winner of Set';
                        lblName.innerHTML = lblPlayer1.innerHTML;
                        lblName1.innerHTML = lblPlayer2.innerHTML;
                        lblPoint.innerHTML = 'Point ' + lblTeamScore1.innerHTML + ' to ' + lblTeamScore2.innerHTML;
                        stopprogress();
                        
                    
                        

                        if (parseInt('<%= Session["Set"] %>') > 0) {
                            pl1 = pl1 + 1;
                            if (parseInt('<%= Session["Set"] %>') / 2 < pl1) {
                                var winpnt = document.getElementById("lblTeamScore1").innerHTML;
                                var losepnt = document.getElementById("lblTeamScore2").innerHTML;
                                var ttim = document.getElementById("lblTime").innerHTML;
                                stopprogress();
                                $("#resultclose").html('Setup Page');
                                lblWoS.innerHTML = 'Winner of the Game';
                                lblName.innerHTML = lblPlayer1.innerHTML;
                                lblName1.innerHTML = lblPlayer2.innerHTML;
                                lblPoint.innerHTML = pl1 + ' Sets to ' + pl2 + ' Set';
                                lblSet.innerHTML = 'last Set ' + lblTeamScore1.innerHTML + ' to ' + lblTeamScore2.innerHTML + ' points'
                                $("#resultclose").click(function () {
                                    var str2 = "<u>Result set 1</u><br>";
                                    var str1 = "<u>ResultSet 1</u><br>";
 
                                    for (var i in store2) {
                                        var clr = store2[i].substring(0, 21);
                                        var frst = store2[i].substring(21, 22);
                                        var news = store2[i].substring(28, store2[i].length);
                                        var scr = news.substring(0, news.indexOf('p') - 1);
                                        var plyr = news.substring(news.indexOf('p') - 1, news.indexOf('p'));
                                        var sett = news.substring(news.indexOf('s'), news.length);
                                        var end = news.substring(news.indexOf('p'), news.indexOf('s'));

                                        var ne = news.substring(news.indexOf('s') + 1, news.indexOf('/'));
                                        var ner = news.substring(news.indexOf('p') + 1, news.indexOf('p') + 2);



                                        str1 = str1 + clr + frst + scr + "&nbsp;&nbsp;&nbsp;&nbsp;" + " t" + plyr + "&nbsp;&nbsp;&nbsp;&nbsp; " + end + "&nbsp;&nbsp;&nbsp;&nbsp;" + sett + '<br>';

                                        if (ner == '-') {
                                            sb = sb + 1;
                                       
                                            if(parseInt('<%= Session["Set"] %>') != eval(parseInt(sb) - 1))
                                            {
                                             
                                                str1 = str1 + "<br><u>Result set" + sb + "</u><br>";}

                                        }

                                    }

                                    //  alert(str1);
                                    stopprogress();
                                    document.getElementById('mainloader').style.display = 'none';
                                    document.getElementById('lblSite').style.display = 'none';
                                    CallLoader();
                                    var sets = '<%= Session["Set"] %>';
                                    var losepl1 = lblPlayer3.innerHTML;
                                    var losepl2 = lblPlayer4.innerHTML;
                               
                                 

                                    PageMethods.SomeMethod(str1, point,sets, lblName.innerHTML, lblName1.innerHTML,losepl1,losepl2,winpnt,losepnt,ttim, OnSuccess);
                                    window.location = "SetUp.aspx";
                                    function OnSuccess(res) {
    
                                        alert("pw os "+res);
                                            
                                        }
                            
                                });
                            }
                            else {
                                stopprogress();
                                $("#resultclose").html('Next Set');
                                
                                 
                           
                               // passboard = 'first';
                                if ('<%= Session["Game"] %>' == 'Italian') {
                                    // lblt1.innerHTML = 't0';
                                   // lblt2.innerHTML = 't0';
                                   // lblp1.innerHTML = "p" + '<%= Session["Point"] %>';
                                   // lblp2.innerHTML = "p" + '<%= Session["Point"] %>';
                                }
                                else if ('<%= Session["Game"] %>' == 'Carom') {
                                    lblt1.innerHTML = 'i0';
                                    lblt2.innerHTML = 'i0';
                                    lblp1.innerHTML = "c" + '<%= Session["Point"] %>';
                                    lblp2.innerHTML = "c" + '<%= Session["Point"] %>';
                                }
                               // lblTeamScore1.innerHTML = '0';
                                //lblTeamScore2.innerHTML = '0';
                                var sets = '<%= Session["Set"] %>';
                                var set1 = lbls1.innerHTML;
                                var resultset1 = set.substr(1, 1);
                                var set2 = lbls2.innerHTML;
                                var resultset2 = set.substr(1, 1);

                                if (sets == '3')
                                {
                                    if (pl1 == '1' && pl2 == '1') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                       
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                      
                                    }
                                }
                                else if (sets == '5') {
                                    if (pl1 == '2' && pl2 == '2') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                    
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                        
                                    }
                                }
                                else if (sets == '9') {
                                    if (pl1 == '4' && pl2 == '4') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                  
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                       
                                    }
                                }
                                else if (sets == '7') {
                                    if (pl1 == '3' && pl2 == '3') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                       
                                    }
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
                else if (exch == 1)
                {
                    document.getElementById('pl1arrow').style.backgroundColor = '#FFFFFF';
                    document.getElementById("exchangestate").value = 0;
                    exchangepoints('first');
                }
               
                    
            }
        }
     

        function ScoreCalculation2(board) {
            balmark = 0 ;
            flgzro = 0;
            red = 0 ;
          
            passboard1 = 'second';
            if (startgame == 'start' || startgameinit == 'init' || startgameinit2 == 'init') {
                document.getElementById("uparrow1").disabled = false;
                document.getElementById("uparrow2").disabled = false;

                document.getElementById("calcbtn1").disabled = true;
                document.getElementById("calcbtn2").disabled = true;
                document.getElementById("CbtnY").disabled = true;

                


                var exch = document.getElementById("exchangestate").value;
                if (exch == 0) {
                    lastv2 = lblTeamScore2.innerHTML;
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
                    ppoint2 = eval(point - lblTeamScore2.innerHTML);
                  
                    lblp2.innerHTML = "p" + (eval(point - lblTeamScore2.innerHTML));
                   

                    if (parseInt(lblTeamScore2.innerHTML) >= parseInt(point)) {
                        var set = lbls2.innerHTML;
                        var resultset = set.substr(1, 1);
                        lbls2.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                        
                    }

                    var tick = lblt2.innerHTML;
                    var result = tick.substr(1);
                    if (startgame == 'start')
                    lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                    if (startgame != 'start') {
                       
                             // alert("Please Now Press G White or Yellow for staring Game ");
                        var modal = document.getElementById('myModal');
                        var span = document.getElementsByClassName("close")[0];
                        var btnn = document.getElementById('yesb');
                        var btnnob = document.getElementById('nob');
                        modal.style.display = "block";

                        btnn.onclick = function () {
hand = 1;
                            memory.push(cal + '&nbsp;' + enteredvalue + '%' + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + 0 + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');
                            store2.push('<font  color=#D2691E>' + cal + '&nbsp;' + enteredvalue + cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + "%" + '</font>');
                            PageMethods.InsertLiveScoreData();
                          
                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                            modal.style.display = "none";
                            document.getElementById("SbtnW").disabled = true;
                            document.getElementById("CbtnW").disabled = true;
                            document.getElementById("SbtnY").disabled = true;
                            document.getElementById("CbtnY").disabled = true;
                            document.getElementById("Y0").disabled = true;
                            document.getElementById("Y1").disabled = true;
                            document.getElementById("Y2").disabled = true;
                            document.getElementById("Y3").disabled = true;
                            document.getElementById("Y4").disabled = true;
                            document.getElementById("Y5").disabled = true;
                            document.getElementById("Y6").disabled = true;
                            document.getElementById("Y7").disabled = true;
                            document.getElementById("Y8").disabled = true;
                            document.getElementById("Y9").disabled = true;

                        }
                        btnnob.onclick = function () {
                                var pooint = '<%= Session["Point"] %>';
                            modal.style.display = "none";
                            lblTeamScore2.innerHTML = '0';
                            lblp2.innerHTML = pooint;
                            document.getElementById("pl2plusbtn").disabled = false;
                            document.getElementById("pl1plusbtn").disabled = false;
                            document.getElementById("pl2minusbtn").disabled = false;
                            document.getElementById("pl1minusbtn").disabled = false;

                        }          





              
                   
                    }
                    else {
                        cnt = cnt + 1;
                        memory.push(cal + '&nbsp;' + enteredvalue + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');
                        store2.push('<font  color=#D2691E>' + cal + '&nbsp;' + enteredvalue + cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + '</font>');
                        PageMethods.InsertLiveScoreData();

                        function OnSuccess(res) {

                            alert("Success Tanvir");
                        }
                    }

                  
                    store3.push(enteredvalue);
                    lblPrev2.innerHTML = '';
                   

                    if ('<%= Session["Game"] %>' == 'Italian') {
                        if (startgame=='start')
                        {
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
                            if(board == 'first')
                                passboard1 = 'second';
                            else if(board == 'second')
                                passboard1 = 'first';
                

                        }
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

                    startgameinit2 = 'end';
                    if (startgameinit2 == 'end' && startgame != 'start') {
                        document.getElementById("pl2plusbtn").disabled = true;
                        document.getElementById("pl2minusbtn").disabled = true;
                        document.getElementById("pl1plusbtn").disabled = true;
                        document.getElementById("pl1minusbtn").disabled = true;
                        document.getElementById("calcbtn2").disabled = true;

                    }

                    if (parseInt(lblTeamScore2.innerHTML) >= parseInt(point)) {
                        lblWoS.innerHTML = 'Winner of Set';
                        lblName.innerHTML = lblPlayer3.innerHTML;
                        lblName1.innerHTML = lblPlayer4.innerHTML;
                        lblPoint.innerHTML = 'Point ' + lblTeamScore2.innerHTML + ' to ' + lblTeamScore1.innerHTML;
                        stopprogress();

                        if (parseInt('<%= Session["Set"] %>') > 0) {
                            pl2 = pl2 + 1;
                            if (parseInt('<%= Session["Set"] %>') / 2 < pl2) {
                                var winpnt = document.getElementById("lblTeamScore1").innerHTML;
                                var losepnt = document.getElementById("lblTeamScore2").innerHTML;
                                var ttim = document.getElementById("lblTime").innerHTML;
                                stopprogress();
                                $("#resultclose").html('Setup Page');
                                lblWoS.innerHTML = 'Winner of the Game';
                                lblName.innerHTML = lblPlayer3.innerHTML;
                                lblPoint.innerHTML = pl2 + ' Sets to ' + pl1 + ' Set';
                                lblSet.innerHTML = 'last Set ' + lblTeamScore2.innerHTML + ' to ' + lblTeamScore1.innerHTML + ' points'
                                $("#resultclose").click(function () {
                                    var str2 = "<u>Result set 1</u><br>";
                                    var str1 = "ResultSet 1<br>";

                                    for (var i in store2) {
                                        var clr = store2[i].substring(0, 21);
                                        var frst = store2[i].substring(21, 22);
                                        var news = store2[i].substring(28, store2[i].length);
                                        var scr = news.substring(0, news.indexOf('p') - 1);
                                        var plyr = news.substring(news.indexOf('p') - 1, news.indexOf('p'));
                                        var sett = news.substring(news.indexOf('s'), news.length);
                                        var end = news.substring(news.indexOf('p'), news.indexOf('s'));

                                        var ne = news.substring(news.indexOf('s') + 1, news.indexOf('/'));
                                        var ner = news.substring(news.indexOf('p') + 1, news.indexOf('p') + 2);


                                        str1 = str1 + clr  + frst + scr + "&nbsp;&nbsp;&nbsp;&nbsp;" + " t" + plyr + "&nbsp;&nbsp;&nbsp;&nbsp;" + end + "&nbsp;&nbsp;&nbsp;&nbsp;" + sett + '<br>';



                                        if (ner == '-') {
                                            sb = sb + 1;
                                             if(parseInt('<%= Session["Set"] %>') != eval(parseInt(sb) - 1))
                                            {
                                              
                                                str1 = str1 + "<br><u>Result set" + sb + "</u><br>";}

                                       

                                        }

                                    }
                                    stopprogress();
                                    document.getElementById('mainloader').style.display = 'none';
                                    document.getElementById('lblSite').style.display = 'none';
                                    CallLoader();
                                    var sets = '<%= Session["Set"] %>';
                                    var losepl1 = lblPlayer3.innerHTML;
                                    var losepl2 = lblPlayer4.innerHTML;
                                    var ple = lblPlayer1.innerHTML;
                           
                               

                                  //  alert(ner);
                                    PageMethods.SomeMethod(str1, point,sets ,ple, lblName1.innerHTML,losepl1,losepl2,winpnt,losepnt,ttim, OnSuccess);
                                    window.location = "SetUp.aspx";
                                    function OnSuccess(res) {

                                    }
                             
                                });
                            }
                            else {
                                stopprogress();
                                $("#resultclose").html('Next Set');
                               // passboard = 'first';
                                if ('<%= Session["Game"] %>' == 'Italian') {
                                  //  lblt1.innerHTML = 't0';
                                    //lblt2.innerHTML = 't0';
                                    //lblp1.innerHTML = "p" + '<%= Session["Point"] %>';
                                    //lblp2.innerHTML = "p" + '<%= Session["Point"] %>';
                                }
                                else if ('<%= Session["Game"] %>' == 'Carom') {
                                    lblt1.innerHTML = 'i0';
                                    lblt2.innerHTML = 'i0';
                                    lblp1.innerHTML = "c" + '<%= Session["Point"] %>';
                                    lblp2.innerHTML = "c" + '<%= Session["Point"] %>';
                                }
                               // lblTeamScore1.innerHTML = '0';
                               // lblTeamScore2.innerHTML = '0';
                                 var sets = '<%= Session["Set"] %>';
                                var set1 = lbls1.innerHTML;
                                var resultset1 = set.substr(1, 1);
                                var set2 = lbls2.innerHTML;
                                var resultset2 = set.substr(1, 1);

                                if (sets == '3')
                                {
                                    if (pl1 == '1' && pl2 == '1') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                       
                                    }
                                }
                                else if (sets == '5') {
                                    if (pl1 == '2' && pl2 == '2') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                      
                                    }
                                }
                                else if (sets == '9') {
                                    if (pl1 == '4' && pl2 == '4') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';

                                        lblStageStat.innerHTML = "Referee must start the last set";
                                  
                                    }
                                }
                                else if (sets == '7') {
                                    if (pl1 == '3' && pl2 == '3') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                       
                                    }
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
                else {
                    document.getElementById('pl2arrow').style.backgroundColor = 'darkorange';
                    document.getElementById("exchangestate").value = 0;
                    exchangepoints('second');
                }
            }
        }
        function reset1() {
            document.getElementById('audiotag1').play();
             location.reload();

            /*
            startgame = '';
            memory.length = '0';
        
            stopprogress();
           document.getElementById('imgLogo').style.display = '<%=imgLogo.ClientID%>';
            /*
            timerstart('first');
            timerstart('second');
           
            document.getElementById('firstboard').style.width = '0px';
            document.getElementById('secondboard').style.width = '0px';
            document.getElementById("pl2plusbtn").disabled = false;
            document.getElementById("pl2minusbtn").disabled = false;
            document.getElementById("pl1plusbtn").disabled = false;
            document.getElementById("pl1minusbtn").disabled = false;
            document.getElementById("memorybtn1").disabled = true;
            document.getElementById("memorybtn2").disabled = true;
            lblTeamScore1.innerHTML = '0';
            lblTeamScore2.innerHTML = '0';
            lblt1.innerHTML = 't0';

            lblt2.innerHTML = 't0'; */
   

        }
        function resetscore1() {
            document.getElementById('audiotag1').play();
           
            var str = document.getElementById('lblTeamScore1').innerHTML;
            if (str.length > 0 && str!='0') {
                document.getElementById('lblTeamScore1').innerHTML = str.substring(0, str.length - 1);
               // $("#ffl").stop(true, true).fadeIn();
                clearTimeout(timeoutt);
                clearTimeout(timeoutt1);
               
                pointadd('first','');
              //  timeoutt = setTimeout(myFunc, 5000);

            }
        
            
        }
        function resetscore2() {
            document.getElementById('audiotag1').play();
            var str = document.getElementById('lblTeamScore2').innerHTML;
            if (str.length > 0 && str != '0') {
                document.getElementById('lblTeamScore2').innerHTML = str.substring(0, str.length - 1);
                clearTimeout(timeoutt);
                clearTimeout(timeoutt1);
               
                pointadd('second','');
            }
        }
        var startgameinit = 'init';
        var startgameinit2 = 'init';
        var exchange = 0;
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

        function initTimer(board)
        {
            pause = 0;
            document.getElementById('calcbtn1').disabled = false;
            document.getElementById('calcbtn2').disabled = false;
            document.getElementById('rfreestart').style.display = 'none';

            document.getElementById('audiotag1').play();
            enableall();
            hand = 0;

            var team1val=lblTeamScore1.innerHTML;
            var team2val=lblTeamScore2.innerHTML;
            document.getElementById("handicapval1").value=team1val;
            document.getElementById("handicapval2").value=team2val;
            
            if (board == 'first') { passboard = 'second'; passboard1 = 'second';}
            else if (board == 'second') { passboard = 'first'; passboard1 = 'first'; }

            var modal1 = document.getElementById('myModal1');
      

            if (pl1 < 1 || pl2  < 1  ){
                modal1.style.display= 'block';
                setTimeout(myFunc, 2000);
                function myFunc() {
                    modal1.style.display= 'none';
                }
            }
      
           
            //if(startgameinit=='end' && startgameinit2=='end')
            //{
            document.getElementById("GW").disabled = true;
            document.getElementById("GY").disabled = true;
            document.getElementById("pl1arrow").disabled = false;
            document.getElementById("pl2arrow").disabled = false;
            document.getElementById("uparrow1").disabled = true;
            document.getElementById("uparrow2").disabled = true;

            document.getElementById("SbtnW").disabled = false;
         
            document.getElementById("SbtnY").disabled = false;
     
            document.getElementById("W0").disabled = false;
            document.getElementById("W1").disabled = false;
            document.getElementById("W2").disabled = false;
            document.getElementById("W3").disabled = false;
            document.getElementById("W4").disabled = false;
            document.getElementById("W5").disabled = false;
            document.getElementById("W6").disabled = false;
            document.getElementById("W7").disabled = false;
            document.getElementById("W8").disabled = false;
            document.getElementById("W9").disabled = false;
            document.getElementById("Y0").disabled = false;
            document.getElementById("Y1").disabled = false;
            document.getElementById("Y2").disabled = false;
            document.getElementById("Y3").disabled = false;
            document.getElementById("Y4").disabled = false;
            document.getElementById("Y5").disabled = false;
            document.getElementById("Y6").disabled = false;
            document.getElementById("Y7").disabled = false;
            document.getElementById("Y8").disabled = false;
            document.getElementById("Y9").disabled = false;

            
            if(pl1 == 0 || pl2 == 0 ) {
            
                function myFunc2() {
                    timerStart(board);     if(board == 'first')
                        passboard1 = 'second';
                    else if(board == 'second')
                        passboard1 = 'first';
          
                }
             
                setTimeout(myFunc2, 2000);}
            else {timerStart(board);      if(board == 'first')
                passboard1 = 'second';
            else if(board == 'second')
                passboard1 = 'first';     
              
        
            }
            //if(board == 'first ') passboard
            

            //}
        }
        var v = parseInt( document.getElementById("ZZ").value);
        var pena = parseInt( document.getElementById("PP").value);
        function Zeroo(){
        
            if(passboard1 == 'second')  {
                if(lblTeamScore1.innerHTML == '0')flgzro = 1;
                document.getElementById("uparrow2").disabled = false;
                var tick = lblt1.innerHTML;
                var result = tick.substr(1);
            
                lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
              
                cnt = cnt + 1;

                        
                memory.push('@T1'+'+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');


                store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '0' + lblt1.innerHTML.substr(1) + lblp1.innerHTML + lbls1.innerHTML + "W" + '@T1' + '</font>');
                PageMethods.InsertLiveScoreData();

                function OnSuccess(res) {

                    alert("Success Tanvir");
                }
                store1.push (0);
                timerStart('second');

            }
            else if (passboard1 == 'first')  {
                       
                if(lblTeamScore2.innerHTML == '0'){flgzro = 1; balmark =1;   }
                document.getElementById("uparrow1").disabled = false;
                var tick = lblt2.innerHTML;
                var result = tick.substr(1);
                lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                       

                cnt = cnt + 1;
                

                memory.push('@T1'+'+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '0' + lblt2.innerHTML.substr(1) + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@T1' + '</font>');
                PageMethods.InsertLiveScoreData();

                function OnSuccess(res) {

                    alert("Success Tanvir");
                }
                flgzro = 2;
                store3.push (0);
                timerStart('first');

            }
            
        }
        
        var twotime = 0;
        function penaltyy(one){
            var padd =  lblTeamScore2.innerHTML;
            var padd1 =  lblTeamScore1.innerHTML;
          
            if(one == 0)
            {
                
                 protimer = parseInt('<%= Session["Timer2"] %>');
                    offk = 1;
                    
                    clearInterval(id);
                    if(stop != 1)
                    {
                        move();
                        stop = 1;
                    } 
                            
                    red = 1;
                    document.getElementById("myBar").style.backgroundColor = '#D8000C';
             
                           
                if(passboard1 == "second")
                {
                    
                   // var result = lblt2.innerHTML.substr(1);
                       
                    lblTeamScore2.innerHTML = eval(parseInt(2) + parseInt(padd));
                    jog1 = parseInt(lblTeamScore2.innerHTML);
                    lblp2.innerHTML ="p"+ eval(parseInt('<%= Session["point"] %>') - parseInt(lblTeamScore2.innerHTML));
                  
                   
                    if(extrW == 1)
                   {
                       
                        if( twotime == 0)
                        {      
                            twotime = 1 ;
                            memory.push('@2T2X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');
                          
                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + 't'+cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T2X' + '</font>');
                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T2X' + '</font>');
                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                        else
                        {
                            twotime = 0;
                            memory.push('@2T1X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');
                          
                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2'+ 't'+cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T1X' + '</font>');
                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T1X' + '</font>');
                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                        
                   
                    }
                    else 
                    {
                        if( twotime == 0)
                        {  
                            twotime = 1 ;
                            memory.push('@2T2'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');

                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + 't'+cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T2' + '</font>');
                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T2' + '</font>');
                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                        else
                        {
                          //  store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + lblt1.innerHTML + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T1' + '</font>');
                            twotime = 0;
                            memory.push('@2T1'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');

                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + 't'+cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T1' + '</font>');
                            store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T1' + '</font>');

                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                    }


                  
                      
                     
                }
                else if (passboard1 == "first")
                {
                   
                  
                    lblTeamScore1.innerHTML = eval(parseInt(2) + parseInt(padd1));
                    jog = parseInt(lblTeamScore1.innerHTML);
                    lblp1.innerHTML ="p"+ eval(parseInt('<%= Session["point"] %>') - parseInt(lblTeamScore1.innerHTML));
                   

                            
                    if(extrY == 1)
                    {
                        if( twotime == 0)
                        {   twotime = 1 ;
                            memory.push('@2T2X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');

                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + 't'+cnt +lblp2.innerHTML + lbls2.innerHTML + "Y" + '@2T2X' + '</font>');
                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T2X' + '</font>');

                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                        else
                        {
                            twotime = 0;
                            memory.push('@2T1X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');

                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2'  + 't'+cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + '@2T1X' + '</font>');
                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T1X' + '</font>');

                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                    }   
                            
                    else 
                    {
                        if( twotime == 0)
                        {   twotime = 1 ;
                            memory.push('@2T2'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');

                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + 't'+cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + '@2T2' + '</font>');
                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T2' + '</font>');

                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                        else
                        {
                            twotime = 0;
                            memory.push('@2T1'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');

                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2'  + 't'+cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + '@2T1' + '</font>');
                            store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T1' + '</font>');

                            PageMethods.InsertLiveScoreData();

                            function OnSuccess(res) {

                                alert("Success Tanvir");
                            }
                        }
                    }
                   

                
                      
                }
               
            }

        }
         
        function redclick(){
            if(parseInt(document.getElementById("myBar").style.width) == parseInt(100)){                         
                if(passboard1 == 'second')  
                {
                               
                               
                    var tick = lblt1.innerHTML;
                    var result = tick.substr(1);
            
                    lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
              
                    cnt = cnt + 1;

                        
                    memory.push('+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');


                    store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '0' + lblt1.innerHTML.substr(1) + lblp1.innerHTML + lbls1.innerHTML + "W"  + '</font>');
                    PageMethods.InsertLiveScoreData();

                    function OnSuccess(res) {

                        alert("Success Tanvir");
                    }
                    passboard1 = 'first';
                    clearInterval(id);
                    move();
                    timerStart('second');
                               
                }
                else if (passboard1 == 'first')  {
                       
                             
                              
                    var tick = lblt2.innerHTML;
                    var result = tick.substr(1);
                    lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                       

                    cnt = cnt + 1 ;
                

                    memory.push('+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                    store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '0' + lblt1.innerHTML.substr(1) + lblp1.innerHTML + lbls1.innerHTML + "Y"  + '</font>');

                    PageMethods.InsertLiveScoreData();

                    function OnSuccess(res) {

                        alert("Success Tanvir");
                    }

                    passboard1 = 'second';
                    clearInterval(id);
                    move();
                    timerStart('first');
                               

                }

                         
                           
                           
            }   
                            
                        }

        var stop = 0;
         var offk = 0;
         var protimer = parseInt('<%= Session["Timer1"] %>');
        var id ;
       
        function move() {
            clearInterval(id);
            if(offk == 0)

            document.getElementById("myBar").style.backgroundColor = '#4CAF50';
            var elem = document.getElementById("myBar");   
            var width = 0;
            
            id = setInterval(frame, 1000);
            function frame() {
                if(pause == 0){
                    if (width >= 100) {  
                  
                        if( red == 1)alert("Raferee must press the red timer"); 

                        if(parseInt( document.getElementById("PP").value) == 1)
                        {penaltyy(0);
                       
                        
                        }
                   
                   
                        
                        if(offk == 0)
                        {

                            if(parseInt( document.getElementById("ZZ").value) == 1)
                            {Zeroo();clearInterval(id);move();}

                      
                       
                            else
                            {
                            
                                clearInterval(id);
                                protimer = parseInt('<%= Session["Timer2"] %>');
                                offk = 1;
                                red = 1;
                            
                                document.getElementById("myBar").style.backgroundColor = '#D8000C';
                                move();
                            }
                        }
                        else  clearInterval(id);
                    
                    } 
                    else 
                    {
                        width = width + (100 /protimer  );
                        elem.style.width = width + '%'; 
                        document.getElementById("label").innerHTML = width /(100 /protimer  )  + '"';
                    }
            }
            }
        }


        function timerStart(board) {
            
            document.getElementById("myProgress").style.display = 'block';
            protimer = parseInt('<%= Session["Timer1"] %>');
            document.getElementById("disturb").style.display = 'block';
            document.getElementById("Label1fu").style.display = 'none';
            document.getElementById("CbtnY").disabled = true;
            document.getElementById("CbtnW").disabled = true;
           
            offk = 0;
            stop =0;
            move();
            red =0;
            document.getElementById("pl1minusbtn").disabled = true;
            document.getElementById("pl2minusbtn").disabled = true;
            document.getElementById("pl1arrow").disabled = false;
            document.getElementById("pl2arrow").disabled = false;
            document.getElementById("memorybtn1").disabled = false;
            document.getElementById("memorybtn2").disabled = false;

            lblStageStat.innerHTML = "";
            startgame = 'start';
            keyboard = board;
            time2 = parseInt('<%= Session["Timer2"] %>');
            time1 = parseInt('<%= Session["Timer1"] %>');
            document.getElementById('<%=imgLogo.ClientID%>').style.display = 'none';
      
           // countdownstart('blue'); red = 0 ;
            
            document.getElementById('mainloader').style.display = 'block';
            if (board == "first") {
                same1 = 0;
                passboard1 = 'second';
                document.getElementById("pl1plusbtn").disabled = true;;
                //document.getElementById('firstboard').style.width = '0px';
                //document.getElementById('secondboard').style.width = '500px';
                //document.getElementById('secondboard').style.backgroundColor = '#000000';
                //document.getElementById('secondboard').style.opacity = '0.4';
                if ('<%= Session["Game"] %>' == 'Italian') {
                    document.getElementById('firstboard').style.width = '0px';

                    document.getElementById('secondboard').style.backgroundColor = '#000000';
                    document.getElementById('ylw').style.backgroundColor = '#000000';
                    document.getElementById('secondboard').style.opacity = '0.4';
                    document.getElementById('ylw').style.opacity = '0.6';
                    document.getElementById('secondboard').style.width = '990px';
                    document.getElementById('whte').style.opacity = '1.0';
                  
                   

                }
                else if ('<%= Session["Game"] %>' == 'Carom') {
                    if (parseInt(caromcheck) == 0) {
                        document.getElementById('firstboard').style.width = '0px';
                        document.getElementById('secondboard').style.width = '900px';
                        document.getElementById('secondboard').style.backgroundColor = '#000000';
                        document.getElementById('secondboard').style.opacity = '0.4';
                        document.getElementById('whte').style.opacity = '1.0';
                    }
                }
            }
            if (board == "second") {
                same3 = 0;
                document.getElementById("pl2plusbtn").disabled = true;
                passboard1 = 'first';
                //document.getElementById('secondboard').style.width = '0px';
                //document.getElementById('firstboard').style.width = '500px';
                //document.getElementById('firstboard').style.backgroundColor = '#000000';
                //document.getElementById('firstboard').style.opacity = '0.4';
                if ('<%= Session["Game"] %>' == 'Italian') {
                    document.getElementById('secondboard').style.width = '0px';
                    document.getElementById('firstboard').style.width = '790px';
                    document.getElementById('firstboard').style.height = '990px';
                    document.getElementById('ylw').style.backgroundColor = '#000000';
                    document.getElementById('ylw').style.opacity = '1.0';
                    
                 
                    document.getElementById('whte').style.backgroundColor = '#000000';
                    document.getElementById('whte').style.opacity = '0.6';
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
                var losepl1 = lblPlayer3.innerHTML;
                var losepl2 = lblPlayer4.innerHTML;
                var losepl3 = lblPlayer1.innerHTML;
                var losepl4 = lblPlayer2.innerHTML;
                PageMethods.SomeMethod1(losepl1,losepl2,losepl3,losepl4,OnSuccess);
                function OnSuccess(res) {
                                            
                }
               
            });
          
            $('#tosetup2').click(function (e) {
               
                var losepl1 = lblPlayer3.innerHTML;
                var losepl2 = lblPlayer4.innerHTML;
                var losepl3 = lblPlayer1.innerHTML;
                var losepl4 = lblPlayer2.innerHTML;
                PageMethods.SomeMethod1(losepl1,losepl2,losepl3,losepl4,OnSuccess);
                function OnSuccess(res) {

                               
                    window.location = "SetUp.aspx";
                                               
                                            
                }
            });
        });

        function tosetupp(){{
               
            var losepl1 = lblPlayer3.innerHTML;
            var losepl2 = lblPlayer4.innerHTML;
            var losepl3 = lblPlayer1.innerHTML;
            var losepl4 = lblPlayer2.innerHTML;
            PageMethods.SomeMethod1(losepl1,losepl2,losepl3,losepl4,OnSuccess);
            function OnSuccess(res) {

                               
                window.location = "SetUp.aspx";
                                               
                                            
            }
        }}



        function exchangestart(board)
        {
            document.getElementById('audiotag1').play();
            
            if (startgame == 'start') {
                var exchange = document.getElementById("exchangestate").value;
                
                if (exchange == '0') {
                    document.getElementById("pl2minusbtn").disabled = true;
                    document.getElementById("pl1minusbtn").disabled = true;
                    exchange = 1;
                    document.getElementById("exchangestate").value = 1;
                    if (board == 'first')
                        document.getElementById('pl1arrow').style.backgroundColor = '#338DFF';
                    else if (board == 'second')
                        document.getElementById('pl2arrow').style.backgroundColor = '#338DFF';

                }

                else if (exchange == 1) {
                    document.getElementById("pl2minusbtn").disabled = false;
                    document.getElementById("pl1minusbtn").disabled = false;

                    exchange = 0;
                    $("#ffl").stop(true, true).fadeIn();
                    $("#ff2").stop(true, true).fadeIn();

                    if (board == 'first')
                        document.getElementById('pl1arrow').style.backgroundColor = '#FFFFFF';
                    else if (board == 'second')
                        document.getElementById('pl2arrow').style.backgroundColor = 'darkorange';
                    document.getElementById("exchangestate").value = 0;
                }
            }
        }

        function arrowcalculation(board) {
            var state = memory[memory.length - 1].substring(0,1);
            var nnew = lblp2.innerHTML;

    
       
            //alert(state);
            /*
            if (state == '&' && board == 'first') {

                alert("exchange");
                var leng = store3.length;
                var leng2 = store1.length;
                lblTeamScore2.innerHTML = "prev";
                lblTeamScore1.innerHTML = "prev";

            }*/
           
            if (board == 'first') {
                red = 0 ; 
               
                document.getElementById("uparrow2").disabled = true;
             
              
                    
            
                if(balmark == 1 ){
         
                    stopprogress();
                    balmark = 0;
                    var tick = lblt2.innerHTML;

                    var result = tick.substr(1);
                    passboard1 = 'first';
                     
                    time2 = parseInt('<%= Session["Timer2"] %>');
                    time1 = parseInt('<%= Session["Timer1"] %>');
                    document.getElementById('mainloader').style.display = 'none';
                    $('.progress-bar').animate({ top: '100%' }, 1);
                    time = 0;
                    spc = '';
                    timerStart('second');
                    var total = '<%= Session["Point"] %>';
                    memory.pop();
                    store2.pop();
                    cnt = cnt - 1;
                    lblt2.innerHTML = "t" + (eval(parseInt(result) - 1));
                    lblp2.innerHTML = "p" + total; 
                    
                    }
                else {

      
               

                    if (state == '&')
                    {
                        var leng = store3.length;
                        var leng2 = store1.length;

                        // alert("Store3:\n" + store3);
                        //  alert("Store1:\n" + store1);
                        stopprogress();
                        document.getElementById('mainloader').style.display = 'none';
                        $('.progress-bar').animate({ top: '100%' }, 1);
                        time = 0;

                        timerStart('second');
                        var total = '<%= Session["Point"] %>';
                        memory.pop();
                        store2.pop();
                        cnt = cnt - 1;

                        if (leng2 == 0) {
                            //alert("Error");
                            lblTeamScore1.innerHTML = "0";
                            lblTeamScore2.innerHTML = "0";
                            lblt1.innerHTML = "t0";
                            lblt2.innerHTML = "t0";
                            lblp1.innerHTML = "p" + total;
                            lblp2.innerHTML = "p" + total;
                        }
                        else {
                            //                lblTeamScore2.innerHTML = eval(lblTeamScore2.innerHTML + '+' + store1[leng2 - 1]);
                            if(uparrowminus == 1) alert("uparrow");
                            else
                            lblTeamScore1.innerHTML = eval(lblTeamScore1.innerHTML + '-' +store1[leng2 - 1]);
                            //alert("done" + store3[leng - 1] + "\n" + store1[leng2 - 1]);
                            var lblpoint1 = eval(total - lblTeamScore1.innerHTML);
                            lblp1.innerHTML = "p" + lblpoint1;
                            var lblpoint2 = eval(total - parseInt(lblTeamScore2.innerHTML));
                      
                            lblp2.innerHTML = "p" + lblpoint2;
                          
                            var tick = lblt2.innerHTML;
                            var result = tick.substr(1);
                            if ('<%= Session["Game"] %>' == 'Italian') {
                                lblt2.innerHTML = "t" + (eval(parseInt(result) - 1));
                            }

                        }
                        //alert(store3);
                    }
                  

                    else if (startgame == 'start') {
                        var leng2 = store1.length;
                        var leng = store3.length;
                        //  alert("second if");
                        if(exchch == 1) { lblTeamScore1.innerHTML = eval(parseInt(lblTeamScore1.innerHTML) - parseInt(store3[leng - 1])); exchch = 0;}

                        else if(uparrowminus == 1) {lblTeamScore2.innerHTML= eval(parseInt(lblTeamScore2.innerHTML) + parseInt(store3[leng - 1])); uparrowminus = 0;}
                        else
                            lblTeamScore2.innerHTML = eval(lblTeamScore2.innerHTML - store3[leng - 1]);
                        //var yy = eval(ppoint1 + store1[leng - 1]);
                        board = 'second';

                        var point3 = store3[leng - 1];
                        var baa = eval(parseInt(ppoint2) + parseInt(point3));
                        var point = '<%= Session["Point"] %>';
                        lblp1.innerHTML = "p" + eval(parseInt(point) - parseInt(lblTeamScore1.innerHTML));
                        lblp2.innerHTML = "p" + eval(parseInt(point) - parseInt(lblTeamScore2.innerHTML));
                        ppoint2 = baa;

                        jog1 = parseInt(lblTeamScore2.innerHTML);

                        var tick = lblt2.innerHTML;
                        var result = tick.substr(1);
                        if ('<%= Session["Game"] %>' == 'Italian') {
                            lblt2.innerHTML = "t" + (eval(parseInt(result) - 1));
                        }
                        else if ('<%= Session["Game"] %>' == 'Carom') {
                            lblt2.innerHTML = "i" + (eval(parseInt(result) + 1));
                        }
                        cnt = cnt - 1;
                        memory.pop();
                        store3.pop();
                        store2.pop();
                        //memory.push('&nbsp;' + "@" + lblTeamScore2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'darkorange');
                        //lblPrev2.innerHTML = '';
                        // store1.push(lblTeamScore2.innerHTML);
                  

                        if ('<%= Session["Game"] %>' == 'Italian') {
                            document.getElementById('secondboard').style.width = '0px';
                            document.getElementById('firstboard').style.width = '900px';
                            document.getElementById('firstboard').style.backgroundColor = '#000000';
                            document.getElementById('firstboard').style.opacity = '0.4';

                            time2 = parseInt('<%= Session["Timer2"] %>');
                            time1 = parseInt('<%= Session["Timer1"] %>');
                            stopprogress();
                    
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


                    }


                }

                }
          
            else if (board == 'second') {
                red = 0 ;

                  var total = '<%= Session["Point"] %>';

                    document.getElementById("uparrow1").disabled = true;
                    //alert("second board");

                    if (flgzro == 1){
        
                        stopprogress();

                        var tick = lblt1.innerHTML;

                        var result = tick.substr(1);
                        passboard1 = 'second';
                     
                        time2 = parseInt('<%= Session["Timer2"] %>');
                            time1 = parseInt('<%= Session["Timer1"] %>');
                            document.getElementById('mainloader').style.display = 'none';
                            $('.progress-bar').animate({ top: '100%' }, 1);
                            time = 0;
                            spc = '';
                            timerStart('first');
                            var total = '<%= Session["Point"] %>';
                            memory.pop();
                            store2.pop();
                            cnt = cnt - 1;
                            lblt1.innerHTML = "t" + (eval(parseInt(result) - 1));
                            lblp1.innerHTML = "p" + total; flgzro = 0;}
                    else {




                        if (state == '&') {
                            var leng = store3.length;
                            var leng2 = store1.length;
                        
                            time2 = parseInt('<%= Session["Timer2"] %>');
                            time1 = parseInt('<%= Session["Timer1"] %>');
                            document.getElementById('mainloader').style.display = 'none';
                            $('.progress-bar').animate({ top: '100%' }, 1);
                            time = 0;
                            spc = '';
                            timerStart('first');
                            var total = '<%= Session["Point"] %>';
                            memory.pop();
                            store2.pop();
                            cnt = cnt - 1;

                            if (leng == 0) {
                                //alert("Error");
                                lblTeamScore1.innerHTML = "0";
                                lblTeamScore2.innerHTML = "0";
                                lblt1.innerHTML = "t0";
                                lblt2.innerHTML = "t0";
                                lblp1.innerHTML = "p" + total;
                                lblp2.innerHTML = "p" + total;
                            }
                            else {
                                // lblTeamScore1.innerHTML = eval(lblTeamScore1.innerHTML + '+' + store3[leng - 1]);
                                lblTeamScore2.innerHTML = eval(lblTeamScore2.innerHTML + '-' +store3[leng - 1]);
                                //alert("done" + store3[leng - 1] + "\n" + store1[leng2 - 1]);
                                //alert(store3);
                                var lblpoint1 = eval(parseInt(total) - parseInt(lblTeamScore1.innerHTML));
                                lblp1.innerHTML = "p" + lblpoint1;
                                var lblpoint2 = eval(parseInt(total) - parseInt(lblTeamScore2.innerHTML));
                                lblp2.innerHTML = "p" + lblpoint2;
                                var tick = lblt1.innerHTML;

                                var result = tick.substr(1);
                    
                                lblt1.innerHTML = "t" + (eval(parseInt(result) - 1));

                            }
                        }
                        else if (startgame == 'start') {
                            var leng = store1.length;
                            if (exchch == 1)
                            {lblTeamScore2.innerHTML= eval(parseInt(lblTeamScore2.innerHTML) - parseInt(store1[leng - 1])); exchch = 0;}

                           else  if(uparrowminus == 1) {lblTeamScore1.innerHTML= eval(parseInt(lblTeamScore1.innerHTML) + parseInt(store1[leng - 1])); uparrowminus = 0;}
                            else
                            lblTeamScore1.innerHTML = eval(lblTeamScore1.innerHTML - store1[leng - 1]);
                  
                            board = 'first';

                            var point = store1[leng - 1];
                            var baa = eval(parseInt(point) + parseInt(ppoint1));
                            lblp1.innerHTML = "p" + eval(total - parseInt(lblTeamScore1.innerHTML));
                            lblp2.innerHTML = "p" + eval(total - parseInt(lblTeamScore2.innerHTML));
                            ppoint1 = baa;

                            var tick = lblt1.innerHTML;
                            var result = tick.substr(1);
                            if ('<%= Session["Game"] %>' == 'Italian') {
                    
                                lblt1.innerHTML = "t" + (eval(parseInt(result) - 1));

                            }
                            else if ('<%= Session["Game"] %>' == 'Carom') {
                                lblt1.innerHTML = "i" + (eval(parseInt(result) + 1));
                            }
                            jog = parseInt(lblTeamScore1.innerHTML);
                            cnt = cnt - 1;
                            memory.pop();
                            store1.pop();
                            store2.pop();
                  

                            if ('<%= Session["Game"] %>' == 'Italian') {
                                document.getElementById('secondboard').style.width = '0px';
                                document.getElementById('firstboard').style.width = '900px';
                                document.getElementById('firstboard').style.backgroundColor = '#000000';
                                document.getElementById('firstboard').style.opacity = '0.4';

                                time2 = parseInt('<%= Session["Timer2"] %>');
                                time1 = parseInt('<%= Session["Timer1"] %>');
                    
                                stopprogress();
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


                        }




                    }
                }
            
        }


        function exchangepoints(board)
        {
            var prevpoints1 = lblTeamScore1.innerHTML;
            var prevpoints2 = lblTeamScore2.innerHTML;
        
            if (board == 'second')
            {
              
                var x = lblp2.innerHTML;
                red = 0 ;


                lblTeamScore1.innerHTML = eval(lblTeamScore1.innerHTML + "+" + lblTeamScore2.innerHTML);
                // alert(prevPoints2);
               // if (lblPrev2.innerHTML == '+' || lblPrev2.innerHTML == '-')
                 //   lblTeamScore2.innerHTML = '0';
//                lblTeamScore2.innerHTML = lblPrev2.innerHTML.substring(0, prevpoints2.length - 1);
                // store1.push(lblTeamScore1.innerHTML);
              
              
                
                board = 'first';
                if (startgame == 'start') {
                  lastv =  lblTeamScore2.innerHTML;
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

                    //alert(totalcal1);
                }
                var point = '<%= Session["Point"] %>';
                    ppoint1 = eval(point - lblTeamScore1.innerHTML);
                    lblp1.innerHTML = "p" + (eval(point - lblTeamScore1.innerHTML));
                    
                

                if (parseInt(lblTeamScore1.innerHTML) >= parseInt(point)) {
                    var set = lbls1.innerHTML;
                    var resultset = set.substr(1, 1);
                    lbls1.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                   
                }

                var tick = lblt2.innerHTML;
                var result = tick.substr(1);
                if ('<%= Session["Game"] %>' == 'Italian') {
                    lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                }
                else if ('<%= Session["Game"] %>' == 'Carom') {
                    lblt2.innerHTML = "i" + (eval(parseInt(result) + 1));
                }
                cnt = cnt + 1;
                memory.push('&nbsp;' + "@" + lblTeamScore2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'darkorange');
               
                store1.push(lblTeamScore2.innerHTML);
                lblPrev1.innerHTML = '';
                store2.push('<font  color=#D2691E>' + cal + '&nbsp;' + enteredvalue + cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + '@' + '</font>');

                    PageMethods.InsertLiveScoreData();

                    function OnSuccess(res) {

                        alert("Success Tanvir");
                    }


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

                
                if (parseInt(lblTeamScore1.innerHTML) >= parseInt(point)) {
                    lblWoS.innerHTML = 'Winner of Set';
                    lblName.innerHTML = lblPlayer1.innerHTML;
                    lblName1.innerHTML = lblPlayer2.innerHTML;
                    lblPoint.innerHTML = 'Point ' + lblTeamScore1.innerHTML + ' to ' + lblTeamScore2.innerHTML;
                    stopprogress();
                    
                    if (parseInt('<%= Session["Set"] %>') > 0) {
                        pl1 = pl1 + 1;
                        if (parseInt('<%= Session["Set"] %>') / 2 < pl1) {
                            var winpnt = document.getElementById("lblTeamScore1").innerHTML;
                            var losepnt = document.getElementById("lblTeamScore2").innerHTML;
                            var ttim = document.getElementById("lblTime").innerHTML;
                            stopprogress();
                            $("#resultclose").html('Setup Page');
                            lblWoS.innerHTML = 'Winner of the Game';
                            lblName.innerHTML = lblPlayer1.innerHTML;
                            lblPoint.innerHTML = pl1 + ' Sets to ' + pl2 + ' Set';
                            lblSet.innerHTML = 'last Set ' + lblTeamScore1.innerHTML + ' to ' + lblTeamScore2.innerHTML + ' points'
                            $("#resultclose").click(function () {         var str2 = "<u>Result set 1</u><br>";
                                    var str1 = "<u>ResultSet 1</u><br>";

                                    for (var i in store2) {
                                        var clr = store2[i].substring(0, 21);
                                        var frst = store2[i].substring(21, 22);
                                        var news = store2[i].substring(28, store2[i].length);
                                        var scr = news.substring(0, news.indexOf('p') - 1);
                                        var plyr = news.substring(news.indexOf('p') - 1, news.indexOf('p'));
                                        var sett = news.substring(news.indexOf('s'), news.length);
                                        var end = news.substring(news.indexOf('p'), news.indexOf('s'));

                                        var ne = news.substring(news.indexOf('s') + 1, news.indexOf('/'));
                                        var ner = news.substring(news.indexOf('p') + 1, news.indexOf('p') + 2);



                                        str1 = str1 + clr + frst + scr + "&nbsp;&nbsp;&nbsp;&nbsp;" + " t" + plyr + "&nbsp;&nbsp;&nbsp;&nbsp;" + end + "&nbsp;&nbsp;&nbsp;&nbsp;" + sett + '<br>';

                                        if (ner == '-') {
                                            sb = sb + 1;
                                               if(parseInt('<%= Session["Set"] %>') != eval(parseInt(sb) - 1))
                                            str1 = str1 + "<br><u>Result set" + sb + "</u><br>";


                                        }

                                    }

                                //  alert(str1);
                                    stopprogress();
                                    document.getElementById('mainloader').style.display = 'none';
                                    document.getElementById('lblSite').style.display = 'none';
                                    CallLoader();
                                    var sets = '<%= Session["Set"] %>';
                                    var losepl1 = lblPlayer3.innerHTML;
                                    var losepl2 = lblPlayer4.innerHTML;
                               
                                 
                                   // PageMethods.SomeMethod(str1, point, sets, lblName.innerHTML, lblName1.innerHTML, losepl1, losepl2, winpnt, losepnt, ttim, OnSuccess);
                                    PageMethods.SomeMethod(str1, point,sets, lblName.innerHTML, lblName1.innerHTML,losepl1,losepl2,winpnt,losepnt,ttim, OnSuccess);
                                   
                                    window.location = "SetUp.aspx";
                                    function OnSuccess(res) {

                                    }
 });
                        }
                        else {
                            stopprogress();
                            $("#resultclose").html('Next Set');
                          //  passboard = 'first';
                            if ('<%= Session["Game"] %>' == 'Italian') {
                         
                            }
                            else if ('<%= Session["Game"] %>' == 'Carom') {
                                lblt1.innerHTML = 'i0';
                                lblt2.innerHTML = 'i0';
                                lblp1.innerHTML = "c" + '<%= Session["Point"] %>';
                                lblp2.innerHTML = "c" + '<%= Session["Point"] %>';
                            }
                  
                            var sets = '<%= Session["Set"] %>';
                                var set1 = lbls1.innerHTML;
                                var resultset1 = set.substr(1, 1);
                                var set2 = lbls2.innerHTML;
                                var resultset2 = set.substr(1, 1);

                                if (sets == '3')
                                {
                                    if (pl1 == '1' && pl2 == '1') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                      
                                    }
                                }
                                else if (sets == '5') {
                                    if (pl1 == '2' && pl2 == '2') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                   
                                    }
                                }
                                else if (sets == '9') {
                                    if (pl1 == '4' && pl2 == '4') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                       
                                    }
                                }
                                else if (sets == '7') {
                                    if (pl1 == '3' && pl2 == '3') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                      
                                    }
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




                //      ScoreCalculation1('first');
               
                var  point = '<%= Session["Point"] %>';
                var x = lblp2.innerHTML.substring(1, lblp2.innerHTML.length);
              

                //                ScoreCalculation2('second');
              //  lblp2.innerHTML = "p" + eval(x + "+" + lblTeamScore2.innerHTML);
             
               
         
             
      
                var prevpoint = lblPrev2.innerHTML;
                if (prevpoint == '+' || prevpoint == '-')
                    lblTeamScore2.innerHTML = '0';
                else
                lblTeamScore2.innerHTML = prevpoint.substring(0, prevpoint.length - 1);

                lblp2.innerHTML = "p" + (eval(point - lblTeamScore2.innerHTML));

                ppoint2 = lblp2.innerHTML;

           
               // lblTeamScore2.innerHTML = lblPrev2.innerHTML.substring(0,lblPrev2.innerHTML.length-1);
                lblPrev2.innerHTML = '';
            }
            else if(board=='first')
            {
                red = 0 ;
                enteredvalue = lblTeamScore2.innerHTML;
                lblTeamScore2.innerHTML = eval(lblTeamScore2.innerHTML + "+" + lblTeamScore1.innerHTML);

                board = 'second';
                if (startgame == 'start') {
                    lastv = lblTeamScore2.innerHTML;
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
               point = '<%= Session["Point"] %>';
                    ppoint2 = eval(parseInt(point) - parseInt(lblTeamScore2.innerHTML));
                    lblp2.innerHTML = "p" + (eval(point - lblTeamScore2.innerHTML));

                   

                if (parseInt(lblTeamScore2.innerHTML) >= parseInt(point)) {
                    var set = lbls2.innerHTML;
                    var resultset = set.substr(1, 1);
                    lbls2.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                   // lbls1.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                }

                var tick = lblt1.innerHTML;
                var result = tick.substr(1);
                lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
                cnt = cnt + 1;
                memory.push('&nbsp;' +"@"+ lblTeamScore1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'white');
               
                store2.push('<font  color=#000000>' + cal + '&nbsp;' + enteredvalue + cnt + lblp1.innerHTML + lbls1.innerHTML + "W" +'@'+ '</font>');
                    store3.push(lblTeamScore1.innerHTML);
                    PageMethods.InsertLiveScoreData();

                    function OnSuccess(res) {

                        alert("Success Tanvir");
                    }

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

                
                if (parseInt(lblTeamScore2.innerHTML) >= parseInt(point)) {
                    lblWoS.innerHTML = 'Winner of Set';
                    lblName.innerHTML = lblPlayer3.innerHTML;
                    lblName1.innerHTML = lblPlayer4.innerHTML;
                    lblPoint.innerHTML = 'Point ' + lblTeamScore2.innerHTML + ' to ' + lblTeamScore1.innerHTML;
                    stopprogress();

                    if (parseInt('<%= Session["Set"] %>') > 0) {
                        pl2 = pl2 + 1;
                        if (parseInt('<%= Session["Set"] %>') / 2 < pl2) {
                            var winpnt = document.getElementById("lblTeamScore1").innerHTML;
                            var losepnt = document.getElementById("lblTeamScore2").innerHTML;
                            var ttim = document.getElementById("lblTime").innerHTML;
                            stopprogress();
                            $("#resultclose").html('Setup Page');
                            lblWoS.innerHTML = 'Winner of the Game';
                            lblName.innerHTML = lblPlayer3.innerHTML;
                            lblPoint.innerHTML = pl2 + ' Sets to ' + pl1 + ' Set';
                            lblSet.innerHTML = 'last Set ' + lblTeamScore2.innerHTML + ' to ' + lblTeamScore1.innerHTML + ' points'
                            $("#resultclose").click(function () { var str2 = "<u>Result set 1</u><br>";
                                    var str1 = "ResultSet0<br>";

                                    for (var i in store2) {
                                        var clr = store2[i].substring(0, 21);
                                        var frst = store2[i].substring(21, 22);
                                        var news = store2[i].substring(28, store2[i].length);
                                        var scr = news.substring(0, news.indexOf('p') - 1);
                                        var plyr = news.substring(news.indexOf('p') - 1, news.indexOf('p'));
                                        var sett = news.substring(news.indexOf('s'), news.length);
                                        var end = news.substring(news.indexOf('p'), news.indexOf('s'));

                                        var ne = news.substring(news.indexOf('s') + 1, news.indexOf('/'));
                                        var ner = news.substring(news.indexOf('p') + 1, news.indexOf('p') + 2);


                                        str1 = str1 + clr  + frst + scr + "&nbsp;&nbsp;&nbsp;&nbsp;" + " t" + plyr + "&nbsp;&nbsp;&nbsp;&nbsp;"+ end + "&nbsp;&nbsp;&nbsp;&nbsp;" + sett + '<br>';



                                        if (ner == '-') {
                                            sb = sb + 1;
                      if(parseInt('<%= Session["Set"] %>') != eval(parseInt(sb) - 1))
                                            str1 = str1 + "<br><u>Result set" + sb + "</u><br>";

                                        }

                                    }
                                    stopprogress();
                                    document.getElementById('mainloader').style.display = 'none';
                                    document.getElementById('lblSite').style.display = 'none';
                                    CallLoader();
                                    var sets = '<%= Session["Set"] %>';
                                    var losepl1 = lblPlayer3.innerHTML;
                                    var losepl2 = lblPlayer4.innerHTML;
                                    var ple = lblPlayer1.innerHTML;
                           


                                  //  alert(ner);
                                    PageMethods.SomeMethod(str1, point,sets ,ple, lblName1.innerHTML,losepl1,losepl2,winpnt,losepnt,ttim, OnSuccess);

                                    window.location = "SetUp.aspx";

                                    function OnSuccess(res) {
                                    }
                              });
                        }
                        else {
                            stopprogress();
                            $("#resultclose").html('Next Set');
                           
                          //  passboard = 'first';
                            if ('<%= Session["Game"] %>' == 'Italian') {
                          
                            }
                            else if ('<%= Session["Game"] %>' == 'Carom') {
                                lblt1.innerHTML = 'i0';
                                lblt2.innerHTML = 'i0';
                                lblp1.innerHTML = "c" + '<%= Session["Point"] %>';
                                lblp2.innerHTML = "c" + '<%= Session["Point"] %>';
                            }
                 
                            var sets = '<%= Session["Set"] %>';
                                var set1 = lbls1.innerHTML;
                                var resultset1 = set.substr(1, 1);
                                var set2 = lbls2.innerHTML;
                                var resultset2 = set.substr(1, 1);

                                if (sets == '3')
                                {
                                    if (pl1 == '1' && pl2 == '1') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                      
                                    }
                                }
                                else if (sets == '5') {
                                    if (pl1 == '2' && pl2 == '2') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                                 
                                    }
                                }
                                else if (sets == '9') {
                                    if (pl1 == '4' && pl2 == '4') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                     
                                    }
                                }
                                else if (sets == '7') {
                                    if (pl1 == '3' && pl2 == '3') {
                                        document.getElementById('firstboard').style.width = '0px';
                                        document.getElementById('secondboard').style.width = '0px';
                                        lblStageStat.innerHTML = "Referee must start the last set";
                             
                                    }
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



                var  point = '<%= Session["Point"] %>';
                var x = lblp1.innerHTML.substring(1, lblp1.innerHTML.length);
              

                //                ScoreCalculation2('second');
               // lblp1.innerHTML = "p" + eval(x + "+" + lblTeamScore1.innerHTML);

                var prevpoint = lblPrev1.innerHTML;

                if (prevpoint == '+' || prevpoint == '-')
                    lblTeamScore1.innerHTML = '0';
                else
                lblTeamScore1.innerHTML = prevpoint.substring(0, prevpoint.length - 1);
               // lblTeamScore1.innerHTML = eval(lblPrev1.innerHTML + "-" + lblTeamScore1.innerHTML);
             
                  
             
                lblp1.innerHTML = "p" + (eval(point - lblTeamScore1.innerHTML));

                ppoint1 = lblp1.innerHTML;
               
                lblPrev1.innerHTML = '';
             }
        }

        function flashh(pnts) 
        {
            alert("okk");
          var  point = '<%= Session["Point"] %>';
            var pointss = document.getElementById('<%=lblTeamScore1.ClientID%>').innerHTML;
            var tick = lblt1.innerHTML;
            var result = tick.substr(1);
        
                        
                 
                           spc = '1';
                
                    var points = document.getElementById('<%=lblTeamScore1.ClientID%>').innerHTML;
                    var Prev1 = document.getElementById('<%=lblPrev1.ClientID%>').innerHTML;
                 

                    if ((points.indexOf('+') != -1) || (points.indexOf('-') != -1)) {
                        lblPrev1.innerHTML = points+pnts;
                        lblTeamScore1.innerHTML = '';
                        //lblTeamScore1.innerHTML =  pnts;
                    }
                    else if (points == '0') {
                        if (spc == '1') {
                            lblTeamScore1.innerHTML = '';
                            lblPrev1.innerHTML = pnts;
                            $("#ffl").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
                        }
                    }
                    else {
                        
                        if (spc == '1') {
                            lblPrev1.innerHTML = lblTeamScore1.innerHTML + pnts;
                            lblTeamScore1.innerHTML = '';
                        }
                        else {
                            if ((Prev1.indexOf('+') != -1) || (Prev1.indexOf('-') != -1)) {
                                if (points.length < 3)
                                {
                                    lblTeamScore1.innerHTML = points + pnts;
                                    document.getElementById("calcbtn1").disabled = false;
                                    $("#ffl").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);

                                }
                               
                            }
                        }
                    }
                
        
          
                
          
         /*  
            if (pointss != 0 )
            {


         


                lblTeamScore1.innerHTML =lblTeamScore1.innerHTML+ pnts;
                setTimeout(myFunc, 1000);
                function myFunc() {

                   
                        lblPrev1.innerHTML = lblTeamScore1.innerHTML + pnts;
                        lblTeamScore1.innerHTML = '';
                    
                    $("#ffl").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
                    setTimeout(myFunc1, 5000);
                    function myFunc1() {
                        lblTeamScore1.innerHTML = eval(parseInt(pointss) + parseInt(pnts));
                        lblp1.innerHTML = "p" + (eval(parseInt(point) - parseInt(lblTeamScore1.innerHTML)));
                        lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
                       
                        stopprogress();
                        $('.progress-bar').animate({ top: '100%' }, 1);
                        time = 0;
                        var spc = '';
                        timerStart(passboard1);
                        document.getElementById('mainloader').style.display = 'block';
                     
                      
                       
                    
                    }
                
                }

               
               
            }

           
            else if (pointss == 0 )
            {
                lblTeamScore1.innerHTML = pnts;
                setTimeout(myFunc, 1000);

                function myFunc() {
                    $("#ffl").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
                
                    setTimeout(myFunc1, 5000);
                    function myFunc1() {
                        lblTeamScore1.innerHTML = eval(parseInt(pointss) + parseInt(pnts));
                        lblp1.innerHTML = "p" + (eval(parseInt(point) - parseInt(lblTeamScore1.innerHTML)));
                        lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
                        stopprogress();
                        $('.progress-bar').animate({ top: '100%' }, 1);
                        time = 0;
                        var spc = '';
                        timerStart(passboard1);
                        document.getElementById('mainloader').style.display = 'block';
                        
                    }

                }


                
            }*/
                
                
                
           

        }



        function enableall(){
            document.getElementById("SbtnW").disabled = false;
            document.getElementById("CbtnW").disabled = false;
            document.getElementById("SbtnY").disabled = false;
            document.getElementById("CbtnY").disabled = false;
            document.getElementById("W0").disabled = false;
            document.getElementById("W1").disabled = false;
            document.getElementById("W2").disabled = false;
            document.getElementById("W3").disabled = false;
            document.getElementById("W4").disabled = false;
            document.getElementById("W5").disabled = false;
            document.getElementById("W6").disabled = false;
            document.getElementById("W7").disabled = false;
            document.getElementById("W8").disabled = false;
            document.getElementById("W9").disabled = false;
            document.getElementById("SbtnW").disabled = false;
            document.getElementById("CbtnW").disabled = false;
            document.getElementById("SbtnY").disabled = false;
            document.getElementById("CbtnY").disabled = false;
            document.getElementById("Y0").disabled = false;
            document.getElementById("Y1").disabled = false;
            document.getElementById("Y2").disabled = false;
            document.getElementById("Y3").disabled = false;
            document.getElementById("Y4").disabled = false;
            document.getElementById("Y5").disabled = false;
            document.getElementById("Y6").disabled = false;
            document.getElementById("Y7").disabled = false;
            document.getElementById("Y8").disabled = false;
            document.getElementById("Y9").disabled = false;

        }

        function disableall(){

            document.getElementById("pl1plusbtn").disabled = true;
            document.getElementById("pl2plusbtn").disabled = true;
            document.getElementById("pl2minusbtn").disabled = true;
            document.getElementById("pl1minusbtn").disabled = true;

            document.getElementById("SbtnW").disabled = true;
            document.getElementById("CbtnW").disabled = true;
            document.getElementById("SbtnY").disabled = true;
            document.getElementById("CbtnY").disabled = true;
            document.getElementById("W0").disabled = true;
            document.getElementById("W1").disabled = true;
            document.getElementById("W2").disabled = true;
            document.getElementById("W3").disabled = true;
            document.getElementById("W4").disabled = true;
            document.getElementById("W5").disabled = true;
            document.getElementById("W6").disabled = true;
            document.getElementById("W7").disabled = true;
            document.getElementById("W8").disabled = true;
            document.getElementById("W9").disabled = true;
            document.getElementById("SbtnW").disabled = true;
            document.getElementById("CbtnW").disabled = true;
            document.getElementById("SbtnY").disabled = true;
            document.getElementById("CbtnY").disabled = true;
            document.getElementById("Y0").disabled = true;
            document.getElementById("Y1").disabled = true;
            document.getElementById("Y2").disabled = true;
            document.getElementById("Y3").disabled = true;
            document.getElementById("Y4").disabled = true;
            document.getElementById("Y5").disabled = true;
            document.getElementById("Y6").disabled = true;
            document.getElementById("Y7").disabled = true;
            document.getElementById("Y8").disabled = true;
            document.getElementById("Y9").disabled = true;
        }
        var handpo2 = 0 ;
        var handpo1 = '';
        var handpo = 0;
        var same1 = 0;
        var same2 = 0;
        var same3 = 0 ;
        var same4 = 0;
        var uparrowminus = 0;
        var Hs = 0;
        var timeoutt = 0;
        var timeoutt1 = 0;
        function pointadd(type, pnts) 
        {
            
            document.getElementById("CbtnY").disabled = false;
            document.getElementById("CbtnW").disabled = false;
            clearInterval(id);
            document.getElementById('audiotag1').play();
          
            if(pnts == "H") Hs = 1;
          
            if (startgame != 'start')

                
            {
                handpo = pnts;
                handpo1 = type;
        
                var modal = document.getElementById('myModal');
                var span = document.getElementsByClassName("close")[0];
                var btnn = document.getElementById('yesb');
                var btnnob = document.getElementById('nob');
                if(handpo2 !=1 && Hs == 1)
                {
                    modal.style.display = "block";
                    handpo2 = 1;
                }

                btnn.onclick = function () {
                    startgame = 'start';
                    document.getElementById("pl1minusbtn").disabled = true;
                    document.getElementById("pl2minusbtn").disabled = true;
                    var type = handpo1;
                    var pnts = handpo;
                   
                    hand = 1;
                    modal.style.display = "none";

                    if(pnts != "H" && Hs == 1 )
                    pointadd(type,pnts);
                  
           
                }
                btnnob.onclick = function () {
                   
                    modal.style.display = "none";
                   
                  
           
                }
            }



            else if (startgame == 'start' || startgameinit=='init' || startgameinit2=='init') 
            {
                
                
                // if(type == "first" && pnts == 0 )timerStart("second");
              
            
                var exch = document.getElementById("exchangestate").value;
                if(exch == 1)
                {
                    

                    if(type == "first")type = "second";
                    else
                        type = "first";
                }
              
             
           
               


                if (pnts == '+' || pnts == '-') 
                {
            
                    spc = '1';
                    cal = pnts;
                    stopprogress();
                }
                if (type == "first") 
                {
                    document.getElementById("pl1plusbtn").disabled = false;
                
                    clearTimeout(timeoutt);
                    clearTimeout(timeoutt1);

                    if (pnts == '+')plus = 1;
                    else if (pnts == '-'){minus = 1 ;uparrowminus = 1;}
                    if (sp1 == 0 ){lblTeamScore1.innerHTML = ""; sp1 = 1 ;}
                    var  pointmain = '<%= Session["Point"] %>';
                    var points1st = document.getElementById('<%=lblTeamScore1.ClientID%>').innerHTML;
                    var tick = lblt1.innerHTML;
                    var result = tick.substr(1);
                    var tick2 = lblt2.innerHTML;
                    var result2 = tick2.substr(1);
                    
                  timeoutt = setTimeout(myFunc, 5000);
              
                   function myFunc() {
                      
                           if(same1 != lblTeamScore1.innerHTML)
                           {
                               same2 = lblTeamScore1.innerHTML;
                               if((plus == 0 && minus == 0) || (plus == 1 && minus == 0 ) )
                               { lblTeamScore1.innerHTML = eval(parseInt(lblTeamScore1.innerHTML)+ jog); cal="+"; 
                                   uparrowminus = 0;
                            
                               }
                               else 
                               {lblTeamScore1.innerHTML = eval(jog + parseInt(lblTeamScore1.innerHTML)); cal = ""; }

                         
                               lblp1.innerHTML = "p" + (eval(parseInt(pointmain) - parseInt(lblTeamScore1.innerHTML)));
                            
                               if(exch == 1) lblt2.innerHTML = "t" + (eval(parseInt(result2) + 1));

                               else if(hand != 1 && exch !=1) lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
                         
                           }
                       if(same1 != lblTeamScore1.innerHTML)
                       {
                           same1 = lblTeamScore1.innerHTML;
                           if(hand !=1) cnt = cnt + 1;

                           if(exch == 1){
                               memory.push("@"+cal + '&nbsp;' + same2 + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');

                               store2.push('<font  color=#000000>' + cal + '&nbsp;' + same2 + cnt + lblp1.innerHTML + lbls1.innerHTML + "W" +"@"+ '</font>');
                        
                               store3.push(same2);

                               PageMethods.InsertLiveScoreData();

                               function OnSuccess(res) {

                                   alert("Success Tanvir");
                               }

                               exchch = 1;

                           }
                           
                           if(hand == 1 && exch != 1){
                               memory.push("%"+cal + '&nbsp;' + same2 + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');

                               store2.push('<font  color=#000000>' + cal + '&nbsp;' + same2 + cnt + lblp1.innerHTML + lbls1.innerHTML + "W" +"%"+ '</font>');
                           
                               store1.push(same2);
                           }
                           else if(exch != 1 && hand != 1)
                           {
                               memory.push(cal + '&nbsp;' + same2 + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');

                               store2.push('<font  color=#000000>' + cal + '&nbsp;' + same2 + cnt + lblp1.innerHTML + lbls1.innerHTML + "W" + '</font>');
                               store1.push(same2);
                           }
                           jog = 0;
                           jog1 = 0;
                           red = 0 ;
                           balmark = 0 ;
                           flgzro = 0;
                           passboard1 = 'first';

                           if (parseInt(lblTeamScore1.innerHTML) >= parseInt(pointmain)) {
                               var set = lbls1.innerHTML;
                               var resultset = set.substr(1, 1);
                               lbls1.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';
                           }


                           if (parseInt(lblTeamScore1.innerHTML) >= parseInt(pointmain)) {
                              
                          
                                   

                               lblWoS.innerHTML = 'Winner of Set';
                               lblName.innerHTML = lblPlayer1.innerHTML;
                               lblName.innerHTML = lblPlayer1.innerHTML;
                               lblName1.innerHTML = lblPlayer2.innerHTML;
                               lblPoint.innerHTML = 'Point ' + lblTeamScore1.innerHTML + ' to ' + lblTeamScore2.innerHTML;
                               stopprogress();
                        
                    
                        

                               if (parseInt('<%= Session["Set"] %>') > 0) {
                                   pl1 = pl1 + 1;
                                   if (parseInt('<%= Session["Set"] %>') / 2 < pl1) {
                                       var winpnt = document.getElementById("lblTeamScore1").innerHTML;
                                       var losepnt = document.getElementById("lblTeamScore2").innerHTML;
                                       var ttim = document.getElementById("lblTime").innerHTML;
                                       stopprogress();
                                       $("#resultclose").html('Setup Page');

                                     
                             
                                           

                                       lblWoS.innerHTML = 'Winner of the Game';
                                       lblName.innerHTML = lblPlayer1.innerHTML;
                                       lblName1.innerHTML = lblPlayer2.innerHTML;
                                       lblPoint.innerHTML = pl1 + ' Sets to ' + pl2 + ' Set';
                                       lblSet.innerHTML = 'last Set ' + lblTeamScore1.innerHTML + ' to ' + lblTeamScore2.innerHTML + ' points'
                                       $("#resultclose").click(function () {
                                           var str2 = "<u>Result set 1</u><br>";
                                           var str1 = "<u>ResultSet 1</u><br>";
 
                                           for (var i in store2) {
                                               var clr = store2[i].substring(0, 21);
                                               var frst = store2[i].substring(21, 22);
                                               var news = store2[i].substring(28, store2[i].length);
                                               var scr = news.substring(0, news.indexOf('p') - 1);
                                               var plyr = news.substring(news.indexOf('p') - 1, news.indexOf('p'));
                                               var sett = news.substring(news.indexOf('s'), news.length);
                                               var end = news.substring(news.indexOf('p'), news.indexOf('s'));

                                               var ne = news.substring(news.indexOf('s') + 1, news.indexOf('/'));
                                               var ner = news.substring(news.indexOf('p') + 1, news.indexOf('p') + 2);



                                               str1 = str1 + clr + frst + scr + "&nbsp;&nbsp;&nbsp;&nbsp;" + " t" + plyr + "&nbsp;&nbsp;&nbsp;&nbsp; " + end + "&nbsp;&nbsp;&nbsp;&nbsp;" + sett + '<br>';

                                               if (ner == '-') {
                                                   sb = sb + 1;
                                       
                                                   if(parseInt('<%= Session["Set"] %>') != eval(parseInt(sb) - 1))
                                                   {
                                             
                                                       str1 = str1 + "<br><u>Result set" + sb + "</u><br>";}

                                               }

                                           }

                                           //  alert(str1);
                                           stopprogress();
                                           document.getElementById('mainloader').style.display = 'none';
                                           document.getElementById('lblSite').style.display = 'none';
                                           CallLoader();
                                           var sets = '<%= Session["Set"] %>';
                                           var losepl1 = lblPlayer3.innerHTML;
                                           var losepl2 = lblPlayer4.innerHTML;
                               
                                 
                                           //PageMethods.SomeMethod1(lblName.innerHTML, lblName1.innerHTML,losepl1,losepl2,OnSuccess);
                                           PageMethods.SomeMethod(str1, pointmain,sets, lblName.innerHTML, lblName1.innerHTML,losepl1,losepl2,winpnt,losepnt,ttim, OnSuccess);
                                         
                                           function OnSuccess(res) {

                                               window.location = "SetUp.aspx";
                                            
                                           }
                              
                        
                                       });
                                   }
                                   else {
                                       stopprogress();
                                       $("#resultclose").html('Next Set');
                                
                                 
                           
                         
                                        
                                       
                                       var sets = '<%= Session["Set"] %>';
                                       var set1 = lbls1.innerHTML;
                                       var resultset1 = set.substr(1, 1);
                                       var set2 = lbls2.innerHTML;
                                       var resultset2 = set.substr(1, 1);

                                      
                                      
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

                       plus = 0 ;
                       minus = 0 ;
                       sp1 = 0;
                       
                        
                       lblPrev1.innerHTML = "";
                       if (hand == 1 ) disableall();
                       else{
                           stopprogress();
                           $('.progress-bar').animate({ top: '100%' }, 1);
                           time = 0;
                           var spc = '';
                           if(exch == 1)
                               timerStart("first");
                           else
                               timerStart("second");
                        
                           document.getElementById('mainloader').style.display = 'block';
                           if (exch ==1)
                               document.getElementById("uparrow1").disabled = false;
                           else
                               document.getElementById("uparrow2").disabled = false;

                           if(exch == 1){

                               document.getElementById('pl2arrow').style.backgroundColor = 'darkorange';
                               document.getElementById("exchangestate").value = 0;
                               exch = 0 ;
                           }
                       }
                    
                   
                    }
                    timeoutt1 =setTimeout(myFunc1, 6000);
                    function myFunc1() {
                        
                        jog1 = parseInt(lblTeamScore2.innerHTML);
                        jog = parseInt(lblTeamScore1.innerHTML);

                       
                        
                    }

                    if ((pnts == '+' || pnts == '-') ) 
                    {
                        document.getElementById("CbtnW").disabled = false;
                    }
                        // FLASHHHHH START
                    else if((pnts != '+' || pnts != '-') )
                    { 
                        
                        var points = document.getElementById('<%=lblTeamScore1.ClientID%>').innerHTML;

                        if (points == '0' && pnts != 'out') {
                      
                            lblTeamScore1.innerHTML = pnts; 
                            sp = 1;
                            $("#ffl").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
                        }

                        else
                        {
                          
                            if (sp == 1 && pnts != 'out' ) 
                            {
                                if(lblTeamScore1.innerHTML.length <3)
                                lblTeamScore1.innerHTML = points + pnts;
                            }
                            else
                            {
                                if(pnts != 'out')
                                lblTeamScore1.innerHTML = pnts; 
                                sp = 1;
                            }
                            $("#ffl").stop(true, true).fadeOut();
                            $("#ffl").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);

                        }}

                    // FLAH END
                
                    var points = document.getElementById('<%=lblTeamScore1.ClientID%>').innerHTML;
                    var Prev1 = document.getElementById('<%=lblPrev1.ClientID%>').innerHTML;
                 

                    if ((points.indexOf('+') != -1) || (points.indexOf('-') != -1)) {
                        lblPrev1.innerHTML = points+pnts;
                        lblTeamScore1.innerHTML = '';
                        //lblTeamScore1.innerHTML =  pnts;
                    }
                    else if (points == '0') 
                    {
                        if (spc == '1') {
                            lblTeamScore1.innerHTML = '';
                            lblPrev1.innerHTML = pnts;
                           
                        }
                    }
                    else {
                        
                        if (spc == '1') {
                            lblTeamScore1.innerHTML = "-" + lblTeamScore1.innerHTML;
                            // lblTeamScore1.innerHTML = '';
                           
                        }
                        else {
                            if ((Prev1.indexOf('+') != -1) || (Prev1.indexOf('-') != -1)) {
                                if (points.length < 3)
                                {
                                    // lblTeamScore1.innerHTML = points + pnts;
                                    document.getElementById("calcbtn1").disabled = false;
                                   

                                }
                               
                            }
                        }
                    }
                   
                }
                if (type == "second") {
                    clearTimeout(timeoutt);
                    clearTimeout(timeoutt1);

                    document.getElementById("pl2plusbtn").disabled = false;
                    if (pnts == '+')plus = 1;
                    else if (pnts == '-'){minus = 1 ;uparrowminus =1;}
                    if (sp2 == 0 ){lblTeamScore2.innerHTML = ""; sp2 = 1 ;}
                    var  pointmain = '<%= Session["Point"] %>';
                    var points1st = document.getElementById('<%=lblTeamScore2.ClientID%>').innerHTML;
                    var tick = lblt2.innerHTML;
                    var result = tick.substr(1);
                    var tick1 = lblt1.innerHTML;
                    var result1 = tick1.substr(1);
                  

                    timeoutt = setTimeout(myFunc, 5000);
                     
                    function myFunc() 
                    {
                        if(same3 != lblTeamScore2.innerHTML)
                        {
                            same2 = lblTeamScore2.innerHTML;
                            if((plus == 0 && minus == 0) || (plus == 1 && minus == 0 ) )
                            { lblTeamScore2.innerHTML = eval(parseInt(lblTeamScore2.innerHTML)+ jog1); cal = "+";
                            uparrowminus = 0;
                            }
                            else 
                            { lblTeamScore2.innerHTML = eval(jog1 + parseInt(lblTeamScore2.innerHTML)); cal = "";}


                            lblp2.innerHTML = "p" + (eval(parseInt(pointmain) - parseInt(lblTeamScore2.innerHTML)));
                          
                            if(exch == 1) lblt1.innerHTML = "t" + (eval(parseInt(result1) + 1));

                           else if(hand != 1 && exch != 1 ) lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                         
                        }
                        
                        if(same3 != lblTeamScore2.innerHTML)
                        {
                            same3 = lblTeamScore2.innerHTML;
                            if(hand != 1) cnt = cnt + 1;

                            if(exch == 1)
                            { memory.push("@"+cal + '&nbsp;' + same2 + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');
                                store2.push('<font  color=#D2691E>' + cal + '&nbsp;' + same2 + cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" +"@"+ '</font>');
                                store1.push(same2);
                                exchch =1;
                            }

                           else if(hand == 1 && exch != 1){ memory.push("%"+cal + '&nbsp;' + same2 + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');
                                store2.push('<font  color=#D2691E>' + cal + '&nbsp;' + same2 + cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + '</font>');
                                store3.push(same2);}
                            else 
                            {
                                memory.push(cal + '&nbsp;' + same2 + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');
                                store2.push('<font  color=#D2691E>' + cal + '&nbsp;' + same2 + cnt + lblp2.innerHTML + lbls2.innerHTML + "Y" + '</font>');
                                store3.push(same2);
                            }
                            if (parseInt(lblTeamScore2.innerHTML) >= parseInt(pointmain)) {
                                var set = lbls2.innerHTML;
                                var resultset = set.substr(1, 1);
                                lbls2.innerHTML = "s" + (eval(parseInt(resultset) + 1)) + "/" + '<%= Session["Set"] %>';

                                if (parseInt(lblTeamScore2.innerHTML) >= parseInt(pointmain)) {
                                    lblWoS.innerHTML = 'Winner of Set';
                                    lblName.innerHTML = lblPlayer3.innerHTML;
                                    lblName1.innerHTML = lblPlayer4.innerHTML;
                                    lblPoint.innerHTML = 'Point ' + lblTeamScore2.innerHTML + ' to ' + lblTeamScore1.innerHTML;
                                    stopprogress();

                                    if (parseInt('<%= Session["Set"] %>') > 0) {
                                        pl2 = pl2 + 1;
                                        if (parseInt('<%= Session["Set"] %>') / 2 < pl2) {
                                            var winpnt = document.getElementById("lblTeamScore1").innerHTML;
                                            var losepnt = document.getElementById("lblTeamScore2").innerHTML;
                                            var ttim = document.getElementById("lblTime").innerHTML;
                                            stopprogress();
                                            $("#resultclose").html('Setup Page');
                                            lblWoS.innerHTML = 'Winner of the Game';
                                            lblName.innerHTML = lblPlayer3.innerHTML;
                                            lblPoint.innerHTML = pl2 + ' Sets to ' + pl1 + ' Set';
                                            lblSet.innerHTML = 'last Set ' + lblTeamScore2.innerHTML + ' to ' + lblTeamScore1.innerHTML + ' points'
                                            $("#resultclose").click(function () {
                                                var str2 = "<u>Result set 1</u><br>";
                                                var str1 = "ResultSet 1<br>";

                                                for (var i in store2) {
                                                    var clr = store2[i].substring(0, 21);
                                                    var frst = store2[i].substring(21, 22);
                                                    var news = store2[i].substring(28, store2[i].length);
                                                    var scr = news.substring(0, news.indexOf('p') - 1);
                                                    var plyr = news.substring(news.indexOf('p') - 1, news.indexOf('p'));
                                                    var sett = news.substring(news.indexOf('s'), news.length);
                                                    var end = news.substring(news.indexOf('p'), news.indexOf('s'));

                                                    var ne = news.substring(news.indexOf('s') + 1, news.indexOf('/'));
                                                    var ner = news.substring(news.indexOf('p') + 1, news.indexOf('p') + 2);

                                                

                                                    str1 = str1 + clr  + frst + scr + "&nbsp;&nbsp;&nbsp;&nbsp;" + " t" + plyr + "&nbsp;&nbsp;&nbsp;&nbsp;" + end + "&nbsp;&nbsp;&nbsp;&nbsp;" + sett + '<br>';



                                                    if (ner == '-') {
                                                       
                                                        sb = sb + 1;
                                                        if(parseInt('<%= Session["Set"] %>') != eval(parseInt(sb) - 1))
                                                        {
                                              
                                                            str1 = str1 + "<br><u>Result set" + sb + "</u><br>";}

                                       

                                                    }

                                                }
                                                stopprogress();
                                                document.getElementById('mainloader').style.display = 'none';
                                                document.getElementById('lblSite').style.display = 'none';
                                                CallLoader();
                                                var sets = '<%= Session["Set"] %>';
                                                var losepl1 = lblPlayer3.innerHTML;
                                                var losepl2 = lblPlayer4.innerHTML;
                                                var ple = lblPlayer1.innerHTML;
                           
                               

                                                //  alert(ner);
                                                PageMethods.SomeMethod(str1, pointmain,sets ,ple, lblName1.innerHTML,losepl1,losepl2,winpnt,losepnt,ttim, OnSuccess);
                                                window.location = "SetUp.aspx";
                                                function OnSuccess(res) {
                                        
                                                }
                             
                                            });
                                        }
                                        else {
                                            stopprogress();
                                            $("#resultclose").html('Next Set');
                                            // passboard = 'first';
                                            if ('<%= Session["Game"] %>' == 'Italian') {
                                                //  lblt1.innerHTML = 't0';
                                                //lblt2.innerHTML = 't0';
                                                //lblp1.innerHTML = "p" + '<%= Session["Point"] %>';
                                                //lblp2.innerHTML = "p" + '<%= Session["Point"] %>';
                                            }
                                            else if ('<%= Session["Game"] %>' == 'Carom') {
                                                lblt1.innerHTML = 'i0';
                                                lblt2.innerHTML = 'i0';
                                                lblp1.innerHTML = "c" + '<%= Session["Point"] %>';
                                                lblp2.innerHTML = "c" + '<%= Session["Point"] %>';
                                            }
                         
                                            var sets = '<%= Session["Set"] %>';
                                            var set1 = lbls1.innerHTML;
                                            var resultset1 = set.substr(1, 1);
                                            var set2 = lbls2.innerHTML;
                                            var resultset2 = set.substr(1, 1);

                                         
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
                      
                        plus = 0 ;
                        minus = 0 ;
                        sp2 = 0;
                        jog = 0;
                        jog1 = 0;
                        lblPrev2.innerHTML = "";
                        passboard1 = 'second';
                        
                        stopprogress();
                        if(hand == 1)disableall();
                        else
                        {
                            document.getElementById('mainloader').style.display = 'none';
                            $('.progress-bar').animate({ top: '100%' }, 1);
                            time = 0;
                            var spc = '';

                            if(exch == 1) 
                                timerStart("second");
                            else
                                timerStart("first");

                            if(exch == 1)
                                document.getElementById("uparrow2").disabled = false;
                            else
                                document.getElementById("uparrow1").disabled = false;

                            document.getElementById('mainloader').style.display = 'block';
                            if(exch == 1){

                                document.getElementById('pl1arrow').style.backgroundColor = '#FFFFFF';
                                document.getElementById("exchangestate").value = 0;
                                exch = 0 ;
                            }
                         
                        }
                  
                    }
                    timeoutt1= setTimeout(myFunc1, 6000);
                    function myFunc1() {
                        jog = parseInt(lblTeamScore1.innerHTML);
                        jog1 = parseInt(lblTeamScore2.innerHTML);
                    }
                    
                  
                    if (pnts == '+' || pnts == '-') {
                        document.getElementById("CbtnY").disabled = false;
                        spc = '1';
                        stopprogress();
                    }
                        // FLASHHHHH START
                    else if((pnts != '+' || pnts != '-') )
                    { 
                        var points2 = document.getElementById('<%=lblTeamScore2.ClientID%>').innerHTML;

                        if (points2 == '0') 
                        {
                            lblTeamScore2.innerHTML = pnts; 
                            sp = 1;
                            $("#ff2").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);
                        }                     
                        else
                        {
                            if (sp == 1 )
                            {
                                if(lblTeamScore2.innerHTML.length <3)
                                lblTeamScore2.innerHTML = points2 + pnts;
                            }
                            else
                            {
                                lblTeamScore2.innerHTML = pnts; 
                                sp = 1;
                            }
                            $("#ff2").stop(true, true).fadeOut();
                            $("#ff2").fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500);

                        }}

                    // FLAH END
                    var points2 = document.getElementById('<%=lblTeamScore2.ClientID%>').innerHTML;
                    var Prev2 = document.getElementById('<%=lblPrev2.ClientID%>').innerHTML;

                    if ((points2.indexOf('+') != -1) || (points2.indexOf('-') != -1)) {
                        lblPrev2.innerHTML = points2 + pnts;
                        //lblTeamScore2.innerHTML = '';
                    }
                    else if (points2 == '0') {
                        if (spc == '1') {
                            lblTeamScore2.innerHTML = '';
                            lblPrev2.innerHTML = pnts;
                           
                        }
                    }
                    else {
                        if (spc == '1') {
                            lblTeamScore2.innerHTML = "-" + lblTeamScore2.innerHTML;
                            //lblTeamScore2.innerHTML = '';
                        }
                        else {

                            if ((Prev2.indexOf('+') != -1) || (Prev2.indexOf('-') != -1)) {
                                if (points2.length < 3)
                                {
                                    //lblTeamScore2.innerHTML = points2 + pnts;
                                    document.getElementById("calcbtn2").disabled = false;
                                }
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
         
           
                $(".progress-bar").unbind("click");
                $('.progress-bar').click(function () {
                    extra();
                });
            
                
            if (col == "red"  ) {
                
               
                ctype = "red";
                red =  1 ;
            }
            if ((parseInt(time1) > 0) && (parseInt(time2) > 0)) {
               // time2 = parseInt('<%= Session["Timer2"] %>');
                        
                loaded = true;
                setSkin(col);
              
                $('.progress-bar').animate({ top: '0%' }, (time1 * 1000));
                countdown();
                //// Call function to animate stripes
                stripesAnimate();
            }
        }
        function countdown() {
            var v = parseInt( document.getElementById("ZZ").value);
            var pena = parseInt( document.getElementById("PP").value);

     
           
            // starts countdown
            if (time1 < 0) {
                // First time is up 

                // Penalty Function 
                if(startgame == 'start' && pena == 1 && v == 0)
                {
                    if (time != 0)
                    {
                        var padd =  lblTeamScore2.innerHTML;
                        var padd1 =  lblTeamScore1.innerHTML;
                        if(passboard1 == "second")
                        {
                            document.getElementById("pl1minusbtn").disabled = true;
                            document.getElementById("pl1plusbtn").disabled = true;
                            document.getElementById("uparrow2").disabled = false;
                            lblTeamScore2.innerHTML = eval(parseInt(2) + parseInt(padd));
                            jog1 = parseInt(lblTeamScore2.innerHTML);

                            if(extrW == 1)
                            {
                                memory.push('@2T2X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');
                          

                                store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T2X' + '</font>');
                            
                            }
                            else 
                            {

                                memory.push('@2T2'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');
                          

                                store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T2' + '</font>');
                            
                            }
                          
                       
                     
                     
                        }
                        else if(passboard1 == "first")
                        {
                            document.getElementById("pl2minusbtn").disabled = true;
                            document.getElementById("pl2plusbtn").disabled = true;
                            document.getElementById("uparrow2").disabled = false;
                            lblTeamScore1.innerHTML = eval(parseInt(2) + parseInt(padd1));
                            jog = parseInt(lblTeamScore1.innerHTML);

                            if(extrY == 1)
                            {
                                memory.push('@2T2X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                                store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T2X' + '</font>');
                            }
                        
                            
                            else 
                            {

                                memory.push('@2T2'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                                store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T1' + '</font>');
                            }
                        
                     
                        }
                    }


                   else  if(time == 0 )
                    {
                        var padd =  lblTeamScore2.innerHTML;
                        var padd1 =  lblTeamScore1.innerHTML;

                        if(passboard1 == "second")
                        {
                       
                       
                            lblTeamScore2.innerHTML = eval(parseInt(2) + parseInt(padd));
                            jog1 = parseInt(lblTeamScore2.innerHTML);

                            cnt = cnt + 1;

                            if(extrW == 1)
                            {
                                memory.push('@2T1X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');
                          

                                store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T1X' + '</font>');
                            
                            }
                            else 
                            {
                                memory.push('@2T1'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');


                                store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@2T1' + '</font>');
                            }


                            time++;
                            time1 = time2;
                            $('.progress-bar').animate({ top: '100%' }, 1);

                         //   countdownstart('red');
                      
                     
                        }
                        else if (passboard1 == "first")
                        {
                            lblTeamScore1.innerHTML = eval(parseInt(2) + parseInt(padd1));
                            jog = parseInt(lblTeamScore1.innerHTML);

                            cnt = cnt + 1;

                            
                            if(extrY == 1)
                            {
                                memory.push('@2T1X'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                                store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T1X' + '</font>');
                            }
                        
                            
                            else 
                            {

                                memory.push('@2T1'+'+' + '&nbsp;' + '2'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                                store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '2' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@2T1' + '</font>');
                            }
                            time++;
                            time1 = time2;
                            $('.progress-bar').animate({ top: '100%' }, 1);

                           // countdownstart('red');
                      
                        }
                   }

                 

                  

                }

                else if (time == 0 && v == 1 && pena == 1) {
                    alert("Zero and Penalty can't Activated same time");
                    time++;
                    time1 = time2;
                    $('.progress-bar').animate({ top: '100%' }, 1);

                  //  countdownstart('red');
                }


                
                    // Zero Function .....
             
                else if (time == 0 && v == 0 && pena == 0) {
                   
                    time++;
                    time1 = time2;
                    $('.progress-bar').animate({ top: '100%' }, 1);

                  //  countdownstart('red');
                }
                else if(time == 0 && v == 1 && pena == 0) {
                    // resettimer();
                   
                    if(passboard1 == 'second')  {
                        if(lblTeamScore1.innerHTML == '0')flgzro = 1;
                        document.getElementById("uparrow2").disabled = false;
                        var tick = lblt1.innerHTML;
                        var result = tick.substr(1);
            
                        lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
              
                        cnt = cnt + 1;

                        
                        memory.push('@T1'+'+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');


                        store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '0' + result + lblp1.innerHTML + lbls1.innerHTML + "W" + '@T1' + '</font>');
                   
                        store1.push (0);

                    }

                    else if (passboard1 == 'first')  {
                       
                        if(lblTeamScore2.innerHTML == '0'){flgzro = 1; balmark =1;   }
                        document.getElementById("uparrow1").disabled = false;
                        var tick = lblt2.innerHTML;
                        var result = tick.substr(1);
                        lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                       

                        cnt = cnt + 1;
                

                        memory.push('@T1'+'+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                        store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '0' + result + lblp1.innerHTML + lbls1.innerHTML + "Y" + '@T1' + '</font>');

                        PageMethods.InsertLiveScoreData();

                        function OnSuccess(res) {

                            alert("Success Tanvir");
                        }
                        flgzro = 2;
                        store3.push (0);


                    }

                    

                    if (startgame=='start') {
                     

                        time2 = parseInt('<%= Session["Timer2"] %>');
                        time1 = parseInt('<%= Session["Timer1"] %>');
                        document.getElementById('mainloader').style.display = 'none';
                        $('.progress-bar').animate({ top: '100%' }, 1);
                        time = 0;
                        var spc = '';
                        timerStart(passboard1);
                        if(passboard1 == 'first')
                            passboard1 = 'second';
                        else if(passboard1 == 'second')
                            passboard1 = 'first';
                    }
                  
                   


                }
            
          
           

                if ($(".percentage").text() == '0"') {
                    var pnlt = parseInt( document.getElementById("PP").value);

                    red = 0;
                    alert("Referee must press Timer2/RED");
                    
                    if (ctype == "red") {
                        $(".progress-bar").unbind("click");
                        $('.progress-bar').click(function () {
                         
                            if(passboard1 == 'second')  {
                               
                            
                                var tick = lblt1.innerHTML;
                                var result = tick.substr(1);
            
                                lblt1.innerHTML = "t" + (eval(parseInt(result) + 1));
              
                                if(pnlt != 1) cnt = cnt + 1 ;

                        
                                memory.push('+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp1.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls1.innerHTML + '||' + 'white');


                                store2.push('<font  color=#000000>' + '+' + '&nbsp;' + '0' + result + lblp1.innerHTML + lbls1.innerHTML + "W"  + '</font>');

                                PageMethods.InsertLiveScoreData();

                                function OnSuccess(res) {

                                    alert("Success Tanvir");
                                }
                           

                            }
                            else if (passboard1 == 'first')  {
                       
                             
                              
                                var tick = lblt2.innerHTML;
                                var result = tick.substr(1);
                                lblt2.innerHTML = "t" + (eval(parseInt(result) + 1));
                       

                                if(pnlt != 1) cnt = cnt + 1 ;
                

                                memory.push('+' + '&nbsp;' + '0'  + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t' + cnt + '&nbsp;&nbsp;&nbsp;&nbsp;' + lblp2.innerHTML + '&nbsp;&nbsp;&nbsp;&nbsp;' + lbls2.innerHTML + '||' + 'darkorange');


                                store2.push('<font  color=#D2691E>' + '+' + '&nbsp;' + '0' + result + lblp1.innerHTML + lbls1.innerHTML + "Y"  + '</font>');
                         
                                PageMethods.InsertLiveScoreData();

                                function OnSuccess(res) {

                                    alert("Success Tanvir");
                                }

                            }

                         
                            time2 = parseInt('<%= Session["Timer2"] %>');
                            time1 = parseInt('<%= Session["Timer1"] %>');
                            document.getElementById('mainloader').style.display = 'none';
                            $('.progress-bar').animate({ top: '100%' }, 1);
                            time = 0;
                            var spc = '';
                    
                            timerStart(passboard1);
                            if(passboard1 == 'first')
                                passboard1 = 'second';
                            else if(passboard1 == 'second')
                                passboard1 = 'first';
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
        var pause = 0;
        var keytab = '';
        function showhistory(tab) {
            pause = 1;
            document.getElementById('audiotag1').play();
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
           
            document.getElementById("CbtnY").disabled = true;
            document.getElementById("CbtnW").disabled = true;
            document.getElementById("pl1plusbtn").disabled = true;
            document.getElementById("pl2plusbtn").disabled = true;
            document.getElementById('rfreestart').style.display = 'none';
            var idpw = document.getElementById("II").value;
            if(idpw == 0 )
            {
                lblPlayer1.innerHTML = "WHITE";
                lblPlayer2.innerHTML = "WHITE";
                lblPlayer3.innerHTML = "YELLOW";
                lblPlayer4.innerHTML = "YELLOW";
                
                

            }
            

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
                pause = 0;
                $("#hover").fadeOut();
                $("#popup").fadeOut();
                /*
                if(red != 1)
                    countdownstart("blue");
                else if(red == 1)
                    countdownstart("red");
                */
                //location.reload();
            });
            
          
            $("#resultclose").click(function () {
                stopprogress();
                extr = 0;
               
                extrW = 0 ;
                extrY = 0 ;
                red = 0 ;
                var sets='<%= Session["Set"] %>';
                if (sets == '') {
                    location.reload();
                }
                else {
                    $("#resulthover").fadeOut();
                    $("#resultpopup").fadeOut();

//if (hand ==1 ){  lblTeamScore1.innerHTML = parseInt(handp);}
                    //else{lblTeamScore1.innerHTML = '0';}
                    //alert("here");
var pp = '<%= Session["Point"] %>';
                    lblTeamScore1.innerHTML=document.getElementById("handicapval1").value*(1);
                    lblTeamScore2.innerHTML=document.getElementById("handicapval2").value*(1);
                   // lblTeamScore2.innerHTML = '0';
                     lblt1.innerHTML = 't0';
                      lblt2.innerHTML = 't0';
                     lblp1.innerHTML = "p" + eval(parseInt(pp) - parseInt(lblTeamScore1.innerHTML));
                    lblp2.innerHTML = "p" + eval(parseInt(pp) - parseInt(lblTeamScore2.innerHTML));
                    memory.length = '0';
                    time2 = parseInt('<%= Session["Timer2"] %>');
                    time1 = parseInt('<%= Session["Timer1"] %>');
                    document.getElementById('mainloader').style.display = 'none';
                    $('.progress-bar').animate({ top: '100%' }, 1);
                    time = 0;
                    var spc = '';
                    var sets = '<%= Session["Set"] %>';
                    jog = parseInt(lblTeamScore1.innerHTML);
                    jog1 =  parseInt(lblTeamScore2.innerHTML);

                    if (sets == '3' && pl1 == '1' && pl2 == '1') {
                        pause = 1;
                        stopprogress();
                        document.getElementById('rfreestart').style.display = 'block';
                        document.getElementById('firstboard').style.width = '0px';
                       document.getElementById('secondboard').style.width = '0px';
                        document.getElementById('myProgress').style.display = 'none';
                        //document.getElementById('Label1fu').style.display = 'block';
                        document.getElementById('ylw').style.opacity= '1.0';
                        document.getElementById('whte').style.opacity= '1.0';
                        document.getElementById("GW").disabled = false;
                        document.getElementById("GY").disabled = false;
                        alert("Referee Must start the last set ");
                    }
                    else if (sets == '5' && pl1 == '2' && pl2 == '2') {
                        pause = 1;
                        stopprogress();
                        document.getElementById('firstboard').style.width = '0px';
                        document.getElementById('secondboard').style.width = '0px';
                        document.getElementById('myProgress').style.display = 'none';
                        document.getElementById('rfreestart').style.display = 'block';
                        lblStageStat.innerHTML = "Referee must start the last set";
                        document.getElementById('ylw').style.opacity= '1.0';
                        document.getElementById('whte').style.opacity= '1.0';
                        document.getElementById("GW").disabled = false;
                        document.getElementById("GY").disabled = false;
                        alert("Referee Must start the last set ");
                    }
                    else if (sets == '7' && pl1 == '3' && pl2 == '3') {
                        pause = 1;
                        document.getElementById('myProgress').style.display = 'none';
                        stopprogress();
                        document.getElementById('firstboard').style.width = '0px';
                        document.getElementById('secondboard').style.width = '0px';
                        lblStageStat.innerHTML = "Referee must start the last set";
                        document.getElementById('ylw').style.opacity= '1.0';
                        document.getElementById('whte').style.opacity= '1.0';
                        document.getElementById('rfreestart').style.display = 'block';
                        document.getElementById("GW").disabled = false;
                        document.getElementById("GY").disabled = false;
                        alert("Referee Must start the last set ");
                    }
                    else if (sets == '9' && pl1 == '4' && pl2 == '4') {
                        pause = 1;
                        document.getElementById('myProgress').style.display = 'none';
                        stopprogress();
                        document.getElementById('rfreestart').style.display = 'block';
                        document.getElementById('firstboard').style.width = '0px';
                        document.getElementById('ylw').style.opacity= '1.0';
                        document.getElementById('whte').style.opacity= '1.0';
                        document.getElementById('secondboard').style.width = '0px';
                        lblStageStat.innerHTML = "Referee must start the last set";
                        document.getElementById("GW").disabled = false;
                        document.getElementById("GY").disabled = false;
                        alert("Referee Must start the last set ");
                    }

                    else {
                        
                   
                        timerStart(passboard);
                        if (passboard == 'first') { passboard = 'second';}
                        else if (passboard == 'second') { passboard = 'first';}
                    }
          
                 
                      
                  

                 

                     
                    
                    
                }
            });

        });

        var selectedaction = '';
        function extra(){

       
            
            stopprogress();
            var modal = document.getElementById('myModal2');
            var modal3 = document.getElementById('myModal3');
            var btnokbex = document.getElementById('okbex');
            var btnn = document.getElementById('yesbex');
            var btnnob = document.getElementById('nobex');
            if(red != 0){modal3.style.display = "block"; }
           
           
            if(extrW == 0 && passboard1 == "second" && red != 1 ) modal.style.display = "block";
            else if (extrY == 0 && passboard1 == "first" && red != 1) modal.style.display = "block";

           if(extr != 0)
           {
              
              
               stopprogress();
               if(extrW == 1 && passboard1 == "second")
               {alert("red 0 na");modal3.style.display = "block";}
               else if(extrY == 1 && passboard1 == "first")
               { modal3.style.display = "block";}
            
           }

           btnokbex.onclick = function(){
               if ( time != 0  && red != 0 ){  //countdownstart('red');
                   modal3.style.display = "none";}
               else 
               {
                   modal3.style.display = "none";
                   
                   red = 0 ;
               }
               
            }

            btnn.onclick = function () 
            {
                
                    if(passboard1 == "second")extrW = 1 ;
                    else  if(passboard1 == "first")extrY = 1 ;
                    extr = 1 ;
                    stopprogress();
                    clearInterval(id);
                    move();
                    time = 0;
                    var spc = '';
                   
                    modal.style.display = "none";
                 
                
                
             
            }
        
                btnnob.onclick = function () {
                    modal.style.display = "none";
                   // countdownstart('blue');
                    red = 0 ;
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
            red = 0 ;
        }

        function change1() {
            stopprogress();

                    $('.progress-bar').animate({ top: '100%' }, 1);
                    time = 0;
                    var spc = '';
                    time2 = parseInt('<%= Session["Timer2"] %>');
                    time1 = parseInt('<%= Session["Timer1"] %>');
                  
            timerStart("second"); red = 0 ;
            passboard1 ="first";
                 document.getElementById('mainloader').style.display = 'block';
        }
        function change2() {
            stopprogress();

                    $('.progress-bar').animate({ top: '100%' }, 1);
                    time = 0;
                    var spc = '';
                    time2 = parseInt('<%= Session["Timer2"] %>');
                    time1 = parseInt('<%= Session["Timer1"] %>');
                  
            timerStart("first"); red = 0 ;
            passboard1 ="second";
                    document.getElementById('mainloader').style.display = 'block';
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
<body  class="body" onload="zoom()" >
    <form id="form1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods = "true">
</asp:ScriptManager>
        <div id="bg">
            <table cellpadding="0" cellspacing="0" class="mainTable">
                <tr>
                    <td class="White center" style="width:800px">
                              <div id ="whtepl">
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
                                     <input type="button" id="extratime" value="S" onClick="change1();" class="BtnCalculator">
                                    
                                </td>
                                <td style="vertical-align:bottom; width:20px;"></td>
                                <td>
                                    <asp:Image ID="imgPlayer2" runat="server" ImageUrl="~/img/logoscore.png" CssClass="profileimage" style="float:left;" />
                                    <div style="width: 28px; background-color: white; border-radius: 5px; height: 28px; text-align: center; vertical-align: bottom; float: left; color: black; margin: 50px 22px 0px; font-size:24px;">3</div>
                                    <asp:Image ID="imgClub2" runat="server" ImageUrl="~/img/logoscore.png" CssClass="clubimage" />
                                </td>
                              
                            </tr>
                        </table>
                                  </div>
                    </td>
                    <td class="center" style="width:390px; vertical-align:bottom; padding-bottom:3px;">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                            <asp:Label ID="lblGameType" runat="server" Text="Italian Game" ForeColor="#00CC00" Font-Size="20pt" Font-Bold="True" Font-Names="Arial" Width="100%"></asp:Label><br />
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
                                   <input type="button" id="extratime" value="S" onClick="change2();" class="BtnCalculator">
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
                
                <tr style="height:550px; ">
                    <td class="White center" style="vertical-align:top; height:100px; position: relative; bottom: 62px;">
                     
                        <asp:Label ID="lblPrev1" runat="server" Text="" Font-Size="48pt" style="font-family: Arial; line-height:120px;"></asp:Label><br />
                         <div id="firstboard"></div>
                        <div id ="ffl"><asp:Label ID="lblTeamScore1"   runat="server" Text="0" Font-Size="340pt" style="font-family:cenMT;   line-height:400px;"></asp:Label></div>
                    </td>
                     
                    <td id='counter' rowspan="3" style="text-align:center; ">
                      
                        <div style = "margin: -95px auto 0;">   
                        <div class="content">
                            <span id="lblTimeRemaining" class="count"></span>
                        </div>      
                       
                        <!-- actual preloader -->'
                        <div runat="server" id="hidDiv" style=" display: none; width:100%; float: left; position: absolute; z-index: 1; color: black;">
         <img src="../img/loading2.gif"   style=" left:20%; position: absolute;top: 50px; bottom:50px; width: 210px;"/></div>
	                   
                            
                                 <div id="mainloader"   >
                               
                             
		                    <div class="progress-bar"><div class="progress-stripes"></div></div>
	                
                        <span id="countdown" class="countdown"></span>
                        <span id="countdown2" class="countdown2"></span> 
<div id="clickable">
                        <div  id ="myProgress" style = "margin: 0px auto 0px; margin-left:-200px; display:none; margin-top: 410px;">
                           <div id="myBar"   onclick='redclick();'>
                                   <div id="label">0%</div>
                           </div>
                     
                        </div>  </div>  
                        <asp:Image ID="imgLogo" runat="server"   ImageUrl="~/img/logoscorenew.png"  Width="150px" style="margin:750px auto 0px;" />
                        <asp:Label ID="lblStageStat" runat="server" Text="" Font-Size="25px" ForeColor="#ff0000"></asp:Label>
                        <asp:Label ID="Label1fu"  runat="server"  Text="biliardoprofessionale.it" Font-Names="Arial" Font-Size="25pt"  ForeColor="#00ff00"></asp:Label>
                            </div>

                           <div id ="reftie"> <asp:Label  ID="rfreestart" runat="server" Text="Referee must start the last set" Font-Size="25px"  ForeColor="#ff0000"></asp:Label></div> 
                          <div  id="disturb" style =" margin-top: 890px; display:none;"><asp:Label  ID="lblSite"  runat="server"   Text="biliardoprofessionale.it" Font-Names="Arial" Font-Size="25pt"  ForeColor="#00ff00"></asp:Label>
                             
                            
                     
                            </div>  
                    </td>
                    <td class="Yellow center" style="vertical-align:top;position: relative; bottom: 62px;">                        
                    
                        <asp:Label ID="lblPrev2" runat="server" Text="" Font-Size="48pt" style="font-family: Arial; line-height:120px;"></asp:Label><br />
                            <div id="secondboard"></div>
                       <div id ="ff2"> <asp:Label ID="lblTeamScore2" runat="server" Text="0" Font-Size="340pt" style="font-family:'cenMT'; line-height:400px;"></asp:Label></div>
                    </td>
                </tr>
                <tr>
                    <td class="White center" style="height: 60px; position: relative; bottom: 82px;">
                        <div id ="whte">
                        <asp:Label ID="lblt1" runat="server" Text="t0" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lblp1" runat="server" Text="p000" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lbls1" runat="server" Text="s0/0" Font-Size="55pt" style="font-family: Arial;"></asp:Label>
                   </div>
                             </td>
                    <td class="Yellow center" style="position: relative; bottom: 82px;height: 60px;">
                         <div id ="ylw">
                        <asp:Label ID="lblt2" runat="server" Text="t0" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lblp2" runat="server" Text="p000" Font-Size="55pt" style="font-family: Arial;"></asp:Label> &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="lbls2" runat="server" Text="s0/0" Font-Size="55pt" style="font-family: Arial;"></asp:Label>
                      </div>
                             </td>
                </tr>
                <tr>
                    <td class="center">
                             <audio id="audiotag1" src="../Game/sounds/button-16.wav " preload="auto"></audio>
                                             <table class="WhitePointTable">
                            <tr>
                                <td><input type="button" id="GW" value="G" onClick="initTimer('first');" class="BtnCalculator"></td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" id="W1" value="1" onClick="pointadd('first', '1');" class="BtnCalculator"/>
                                </td>
                                <td>
                                    <input type="button" id="W2" value="2" onClick="pointadd('first', '2');" class="BtnCalculator"/>
                                </td>
                                <td>
                                    <input type="button" id="W3" value="3" onClick="pointadd('first', '3');" class="BtnCalculator"/>
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td><input type="button" id="pl1arrow" value="→" onClick="exchangestart('first')" disabled="disabled" class="BtnCalculator"></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" id="SbtnW" value="S" onClick="reset1();" class="BtnCalculator">
                                </td>
                                <td style="width:26px;"></td>
                                <td>
                                    <input type="button" id="W4" value="4" onClick="pointadd('first', '4');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id="W5" value="5" onClick="pointadd('first', '5');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id="W6" value="6" onclick="pointadd('first', '6');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <div>
                                    <input type="button" id="uparrow1" value="↑" onclick="stateChange('first');" disabled="disabled" class="BtnCalculator">
                                </div>
                                        </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" value="M"  onclick="showhistory('first');" id="memorybtn1" disabled="disabled" class="BtnCalculator">
                                </td>
                                <td style="width:26px;"></td>
                                <td>
                                    <input type="button" id="W7" value="7" onClick="pointadd('first', '7');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id="W8" value="8" onClick="pointadd('first', '8');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id="W9" value="9" onClick="pointadd('first', '9');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="E" onClick="extra();" id="calcbtn1" disabled="disabled" class="BtnCalculator">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="tosetup1"  onclick="tosetupp();" style="width:69px; height:40px; padding-top:20px"><div class="circle"></div></div>
                                   
                                </td>
                                <td style="width:26px;"></td>
                                <td>
                                    <input type="button" value="H" id="pl1minusbtn" onClick="pointadd('first', 'H');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id="W0" value="0" onClick="pointadd('first', '0');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="-"  id="pl1plusbtn" onClick="pointadd('first', '-');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" id ="CbtnW" value="C" onClick="resetscore1()" class="BtnCalculator">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="center">
                        <table class="YellowPointTable">
                            <tr>
                                <td><input type="button"  id="GY"  value="G" onClick="initTimer('second');" class="BtnCalculator"></td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" id ="Y1" value="1" onClick="pointadd('second', '1');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id ="Y2" value="2" onClick="pointadd('second', '2');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id ="Y3" value="3" onClick="pointadd('second', '3');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td><input type="button" value="←" id="pl2arrow" onClick="exchangestart('second')" disabled="disabled" class="BtnCalculator"></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" id="SbtnY" value="S" onClick="reset1();" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button"id ="Y4" value="4" onClick="pointadd('second', '4');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id ="Y5" value="5" onClick="pointadd('second', '5');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id ="Y6" value="6" onClick="pointadd('second', '6');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" id="uparrow2" value="↑" onclick="stateChange('second');" disabled="disabled" class="BtnCalculator">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="button" value="M" onclick="showhistory('second');" disabled="disabled" id="memorybtn2" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button"  id ="Y7" value="7" onClick="pointadd('second', '7');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id ="Y8" value="8" onClick="pointadd('second', '8');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id ="Y9" value="9" onClick="pointadd('second', '9');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="E" onClick="extra();" id="calcbtn2" disabled="disabled" class="BtnCalculator">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   
                                    <div id="tosetup2" onclick="tosetupp();" style="width:69px; height:40px; padding-top:20px;"><div class="circle"></div></div>
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" value="H" id="pl2minusbtn"onClick="pointadd('second', 'H');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" id ="Y0" value="0" onClick="pointadd('second', '0');" class="BtnCalculator">
                                </td>
                                <td>
                                    <input type="button" value="-" id="pl2plusbtn" onClick="pointadd('second', '-');" class="BtnCalculator">
                                </td>
                                <td style="width:26px;">&nbsp;</td>
                                <td>
                                    <input type="button" id="CbtnY" value="C" onClick="resetscore2()" class="BtnCalculator">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>        
        </div>
          <div id="hover">
              <asp:HiddenField ID="handicapval1" runat="server" Value="0" />
              <asp:HiddenField ID="handicapval2" runat="server" Value="0"/>
        </div>

  <div id="popup">
    <div id="close">X</div>
    <p style="font-size: 24px; margin: 16px;">Memory details</p>
  </div>
        <div id="resulthover"></div>
    <div id="resultpopup">
    <p style="font-size: 24px; margin: 16px;line-height: 40px;">
        <asp:Label ID="lblWoS" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblName" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblName1" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblPoint" runat="server" Text=""></asp:Label><br />
        <asp:Label ID="lblSet" runat="server" Text=""></asp:Label>
    </p>
    <div id="resultclose">  <input type="button" onClick="CallLoader();" id="btnLoader" value="Next Set" /></div>
  </div>

        <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close"></span>
      <h1 align ="center" style="color:white">Handicap Game</h1>
    </div>
    <div align ="center" class="modal-body">
      <h2 style="color:blue">>Press - YES  or NO - in this label  to Confirm  or Reset  </h2>
      <h2 style="color:blue">>To START GAME press the - G - key in White or Yellow side of Score </h2>
 <input id="yesb" type="button" class="button12" value="YES">
         <input id="nob" type="button" class="button12" value="NO">
    </div>
    <div class="modal-footer">
  
    </div>
  </div>

</div>
         <div id="myModal1" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
        

    <div class="modal-footer">
     <h1 align ="center" style="color:white">Start Game</h1>
    </div>
   
  </div>
             
</div>

         <div id="myModal2" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close"></span>
      <h1 align ="center" style="color:white">Extra Time </h1>
    </div>
    <div align ="center" class="modal-body">
      <h2 style="color:blue">>Press - YES  or NO - in this label  to Confirm  or Reset  </h2>
      
 <input id="yesbex" type="button" class="button12" value="YES">
         <input id="nobex" type="button" class="button12" value="NO">
    </div>
    <div class="modal-footer">
  
    </div>
  </div>
</div>

         <div id="myModal3" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close"></span>
      <h1 align ="center" style="color:white">Extra Time </h1>
    </div>
    <div align ="center" class="modal-body">
      <h2 style="color:blue">>Sorry Extra Time is not Permitted  </h2>
      
 <input id="okbex" type="button" class="button12" value="OK">
      
    </div>
    <div class="modal-footer">
  
    </div>
  </div>

</div>

        <asp:HiddenField ID="exchangestate" runat="server" Value="0"/>
        <asp:HiddenField ID="exarrow" runat="server" Value="0"/>
        <asp:HiddenField ID="ZZ" runat="server" Value="0"/>
        <asp:HiddenField ID="PP" runat="server" Value="0"/>
        <asp:HiddenField ID="II" runat="server" Value="0"/>
    </form>
</body>
</html>
