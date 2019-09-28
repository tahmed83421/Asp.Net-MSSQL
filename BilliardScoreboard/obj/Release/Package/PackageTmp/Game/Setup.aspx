<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Setup.aspx.cs" Inherits="BilliardScoreboard.Game.Setup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Game Setup</title>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>--%>
    <link rel="stylesheet" href="../css/Game.css" />
    <link rel="stylesheet" href="../css/ResponsiveGrid.css" />
    <link href="../css/jquery-confirm.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/highlight.dark.css" rel="stylesheet" />
    <link href="../css/main.css" rel="stylesheet" />
    <script src="../js/vkboard.js"></script>
    <script src="../js/jquery-2.1.4.min.js"></script>
     <script src="../js/zoom.js"></script>
    <script src="../js/jquery.confirm.js"></script>
    

  <%--  <script src="../CamDetection/adapter.min.js"></script>
    <script src="../CamDetection/adapter.screenshare.js"></script>--%>  <%--  <script type="text/javascript">

        function BtnItalianButtonClick() {
            //PlaySound();

            document.getElementById('audiotag1').play();
            //window.location.href = '../Game/Setup.aspx';
            document.getElementById('<%= btnItalian.ClientID %>').onclick = function () {
                window.location.href = "../Game/Setup.aspx";

            }
        }
    </script>--%> <%--   <script type="text/javascript">
       
        var height = window.screen.availHeight;
        var width = window.screen.availWidth;

       
           window.open("../Game/Setup.aspx", "", "fullscreen=yes, width=" + width + ", height=" + height + "");
        

    </script>--%>


   <script type="text/javascript">
       $(function () {
          
           $('#txtn1PW').click( function () {
              
               var status = $('#txtn1PW').is(":focus");
               if (status == true) {
                   document.getElementById('audiotag1').play();
               }
           });
           $('#txtn2PW').click(function () {
              
               var status = $('#txtn2PW').is(":focus");
               if (status == true) {
                   document.getElementById('audiotag1').play();
               }
           });
           $('#txtn3PW').click(function () {
              
               var status = $('#txtn3PW').is(":focus");
               if (status == true) {
                   document.getElementById('audiotag1').play();
               }
           });
           $('#txtn4PW').click(function () {
              
               var status = $('#txtn4PW').is(":focus");
               if (status == true) {
                   document.getElementById('audiotag1').play();
               }
           });

       });
    
      /* $(document).ready(function () {

           navigator.getUserMedia = (navigator.getUserMedia ||
                                     navigator.webkitGetUserMedia ||
                                     navigator.mozGetUserMedia ||
                                     navigator.msGetUserMedia);

           if (navigator.getUserMedia) {
               // Request the camera.
               navigator.getUserMedia(
                 // Constraints
                 {
                     video: true
                 },

                 // Success Callback
                 function () {
                     $('#chkSpeed').attr("checked", "checked");
                     $('#chkLabel').attr("checked", "checked");
                     $('#chkEmail').attr("checked", "checked");

                     return true;
                 },

                 function (err) {
                     // Log the error to the console.
                     console.log('The following error occurred when trying to use getUserMedia: ' + err);
                 }
               );

           }

           if (navigator.webkitGetUserMedia) { // WebKit-prefixed
              
               navigator.webkitGetUserMedia(
                 // Constraints
                 {
                     video: true
                 },

                 // Success Callback
                 function () {
                     $('#chkSpeed').attr("checked", "checked");
                     $('#chkLabel').attr("checked", "checked");
                     $('#chkEmail').attr("checked", "checked");

                     return true;

                 },

                 function (err) {
                     // Log the error to the console.
                     console.log('The following error occurred when trying to use getUserMedia: ' + err);
                 }
               );
           }
           else {
               //alert('Sorry, your browser does not support getUserMedia webkit');
           }


           if (navigator.mozGetUserMedia) { // Mozilla

               navigator.mozGetUserMedia(
                 // Constraints
                 {
                     video: true
                 },

                 // Success Callback
                 function () {
                     $('#chkSpeed').attr("checked", "checked");
                     $('#chkLabel').attr("checked", "checked");
                     $('#chkEmail').attr("checked", "checked");

                     return true;
                   },

                 function (err) {
                     // Log the error to the console.
                     console.log('The following error occurred when trying to use getUserMedia: ' + err);
                 }
               );
           }

           else {
               //alert('Sorry, your browser does not support getUserMedia');
           }

       });
       */
    </script>


    <script type="text/javascript">

    

        document.onkeydown = enterKeyEvent;
        document.onkeypress = enterKeyEvent
        document.onkeyup = enterKeyEvent;
        function enterKeyEvent(e) {
            var code = (e.keyCode ? e.keyCode : e.which);
            if (code == 13) { //Enter keycode 
                document.getElementById('audiotag1').play();
                var f = 0;
                if (document.getElementById("chkLabel").checked == true && document.getElementById("chkSpeed").checked == true) {
                    alert("you can not check Penalty and Zero at same time");
                    document.getElementById("chkLabel").checked = false;
                    document.getElementById("chkSpeed").checked = false;
                    return false;
                    f = 1 ;
                }

           var tim1 = parseInt(document.getElementById('<%= txtTimer1.ClientID %>').value);
                var point = parseInt(document.getElementById('<%= txtPoint.ClientID %>').value);
                if (tim1 <=0) { alert("Timer1 must be more than 0"); return false; }

                if (point > 0) {
                    var stat1 = parseInt(document.getElementById('<%= hdnStatus1.ClientID %>').value);
                    var stat2 = parseInt(document.getElementById('<%= hdnStatus2.ClientID %>').value);
                    if (stat1 > 0 && stat2 >= 0) {
                        if ((stat1 > 1 && stat2 > 0 && f != 1) || (stat1 == 1 && f != 1)) {
                            var clickButton = document.getElementById("<%= btnEnter.ClientID %>");
                            clickButton.click();
                            
                        }
                        else {
                            alert("Sorry! Please select atleast one opponent.");
                            return false;
                        }
                    }
                    else {
                        alert("Sorry! Please select both player.");
                        return false;
                    }
                }
                else {
                    alert("Point should be more than 0.");
                    return false;
                }
           
          
            }
            //alert("are you sure u want to continue.");
            //return false;
        }

        //$("#txtn1PW").click(function () {
        //    alert("sound enter");
        //    document.getElementById('audiotag1').play();
        //    alert("sound exit");
        //})
        //if ($("#txtn1PW").is(':focus')) {
        //    alert("sound enter");
        //    document.getElementById('audiotag1').play();
        //}
       


        $(document).ready(function () {
            
            setTimeout(function () {
                document.getElementById("keyboard___enter_top").onclick = enterEvent;
                document.getElementById("keyboard___enter_l").onclick = enterEvent;
            }, 100);
        });
        function enterEvent() {
            document.getElementById('audiotag1').play();

            var f = 0;
            if (document.getElementById("chkLabel").checked == true && document.getElementById("chkSpeed").checked == true)
            {
                alert("you can not check Penalty and Zero at same time");
                document.getElementById("chkLabel").checked = false;
                document.getElementById("chkSpeed").checked = false;
                return false;
                f = 1;
                           }


          var tim1 = parseInt(document.getElementById('<%= txtTimer1.ClientID %>').value);
            var point = parseInt(document.getElementById('<%= txtPoint.ClientID %>').value);


            if (tim1 <=0) { alert("Timer1 must be more than 0"); return false;}
            if (point > 0) {
                var stat1 = parseInt(document.getElementById('<%= hdnStatus1.ClientID %>').value);
                var stat2 = parseInt(document.getElementById('<%= hdnStatus2.ClientID %>').value);
                if (stat1 > 0 && stat2 >= 0) {
                    if ((stat1 > 1 && stat2 > 0 && f != 1) || (stat1 == 1 && f != 1)) {
                        if
                        var clickButton = document.getElementById("<%= btnEnter.ClientID %>");
                        clickButton.click();
                    }
                    else {
                        alert("Sorry! Please select atleast one opponent.");
                        return false;
                    }
                }
                else {
                    alert("Sorry! Please select both player.");
                    return false;
                }
            }
            else {
                alert("Point should be more than 0.");
            
                return false;
            }

            alert("Are You Sure u Want to Continue.");
            return false;
        }

        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        specialKeys.push(9); //Tab
        specialKeys.push(46); //Delete
        specialKeys.push(36); //Home
        specialKeys.push(35); //End
        specialKeys.push(37); //Left
        specialKeys.push(39); //Right
        function IsNumeric(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            document.getElementById('audiotag1').play();
            return ret;
        }
        function IsSet(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = (keyCode == 49 || keyCode == 51 || keyCode == 53 || keyCode == 55 || keyCode == 57 || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            return ret;
        }
        function IsPins(e, type) {
            if (type == "Italian") {
                var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
                var ret = (keyCode == 53 || keyCode == 57 || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
                return ret;
            }
            if (type == "Carom") {
                var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
                var ret = (keyCode >= 48 && keyCode <= 51 || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
                return ret;
            }
        }
        function IsTimer1(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            return ret;
        }
        function IsTimer2(e) {
            var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
            var ret = ((keyCode >= 48 && keyCode <= 57) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
            return ret;
        }
    </script>
    <script>
        // 'source' is the field which is currently focused:
        var source = null, insertionS = 0, insertionE = 0;
        //var isFirefox = typeof InstallTrigger !== 'undefined';
        var userstr = navigator.userAgent.toLowerCase();
        var safari = (userstr.indexOf('applewebkit') != -1);
        var gecko = (userstr.indexOf('gecko') != -1) && !safari;
        var standr = gecko || window.opera || safari;

        function search_for_text_field(num) {
            var tg = document.getElementsByTagName("INPUT");

            if (tg && tg[num])
                return tg[num];
            else {
                var tg2 = document.getElementsByTagName("TEXTAREA");

                if (tg2 && tg2[tg.length - num])
                    return tg2[tg.length - num];
            }

            return null;
        }

        // This function retrieves the source element
        // for the given event object:
        function get_event_source(e) {
            var event = e || window.event;
            return event.srcElement || event.target;
        }

        // This function binds 'handler' function to the 
        // 'eventType' event of the 'elem' element:
        function setup_event(elem, eventType, handler) {
            return (elem.attachEvent) ? elem.attachEvent("on" + eventType, handler) : ((elem.addEventListener) ? elem.addEventListener(eventType, handler, false) : false);
        }

        // By focusing the INPUT field we set the 'source'
        // to the newly focused field:
        function focus_keyboard(e) {
            source = get_event_source(e);
        }

        // This function slightly differs from one with the same name
        // in '4-test-fly' sample. Now it accepts not the id, but the
        // number (index in the INPUT elements array) of the INPUT field.
        function register_input_field(num) {
            var tg = document.getElementsByTagName("INPUT");

            if (tg && tg[num])
                setup_event(tg[num], "focus", focus_keyboard);
        }

        // The same for TEXTAREA fields:
        function register_textarea_field(num) {
            var tg = document.getElementsByTagName("TEXTAREA");

            if (tg && tg[num])
                setup_event(tg[num], "focus", focus_keyboard);
        }

        // This function enumerates and "registers" all INPUT fields
        // on the page:
        function register_text_fields() {
            var tg = document.getElementsByTagName("INPUT");

            if (tg) {
                for (var i = 0; i < tg.length; i++)
                    register_input_field(i);
            }

            tg = document.getElementsByTagName("TEXTAREA");

            if (tg) {
                for (var i = 0; i < tg.length; i++)
                    register_textarea_field(i);
            }
        }

        function init() {
            // Note: all parameters, starting with 3rd, in the following
            // expression are equal to the default parameters for the
            // VKeyboard object. The only exception is 18th parameter
            // (flash switch), which is false by default.

            new VKeyboard("keyboard",    // container's id
                          keyb_callback, // reference to the callback function
                          true,          // create the arrow keys or not? (this and the following params are optional)
                          true,          // create up and down arrow keys? 
                          false,         // reserved
                          true,          // create the numpad or not?
                          "",            // font name ("" == system default)
                          "19px",        // font size in px
                          "#000",        // font color
                          "#F00",        // font color for the dead keys
                          "#000",        // keyboard base background color
                          "#AAA",        // keys' background color
                          "#DDD",        // background color of switched/selected item
                          "#000",        // border color
                          "#CCC",        // border/font color of "inactive" key (key with no value/disabled)
                          "#DDD",        // background color of "inactive" key (key with no value/disabled)
                          "#F77",        // border color of the language selector's cell
                          true,          // show key flash on click? (false by default)
                          "#CC3300",     // font color during flash
                          "#FF9966",     // key background color during flash
                          "#CC3300",     // key border color during flash
                          false,         // embed VKeyboard into the page?
                          true,          // use 1-pixel gap between the keys?
                          0);            // index(0-based) of the initial layout

            // The very 1st (index == 0) field is "focused" by default:
            source = search_for_text_field(0);

            // Any INPUTs? Register them all!
            if (source) register_text_fields();

            source.focus();
        }

        // Advanced callback function:
        //
        function keyb_callback(ch) {
            document.getElementById('audiotag1').play();
            var val = source.value;
           
            
            switch (ch) {
                case "BackSpace":
                    if (val.length >= 0) {
                        
                        var span = null;

                        if (window.getSelection)
                            
                        //span = window.getSelection.duplicate();


                        var span = "";
                        if (typeof window.getSelection != "undefined") {
                            var sel = window.getSelection();
                            if (sel.rangeCount) {
                                var container = document.createElement("div");
                                for (var i = 0, len = sel.rangeCount; i < len; ++i) {
                                    container.appendChild(sel.getRangeAt(i).cloneContents());
                                }
                                span = container.innerHTML;
                            }
                        } else if (typeof document.selection != "undefined") {
                            if (document.selection.type == "Text") {
                                span = document.selection.createRange().htmlText;
                            }
                        }


                       

                            if (span && span.text.length > 0) {
                               
                            span.text = "";
                            getCaretPositions(source);
                        }
                        else
                            deleteAtCaret(source);
                    }

                    break;

                case "<":
                    if (insertionS > 0)
                      
                        setRange(source, insertionS - 1, insertionE - 1);

                    break;

                case ">":
                    if (insertionE < val.length)
                      
                        setRange(source, insertionS + 1, insertionE + 1);

                    break;

                case "/\\":
                    if (!standr) break;

                    var prev = val.lastIndexOf("\n", insertionS) + 1;
                    var pprev = val.lastIndexOf("\n", prev - 2);
                    var next = val.indexOf("\n", insertionS);

                    if (next == -1) next = val.length;
                    var nnext = next - insertionS;

                    if (prev > next) {
                        prev = val.lastIndexOf("\n", insertionS - 1) + 1;
                        pprev = val.lastIndexOf("\n", prev - 2);
                    }

                    // number of chars in current line to the left of the caret:
                    var left = insertionS - prev;

                    // length of the prev. line:
                    var plen = prev - pprev - 1;

                    // number of chars in the prev. line to the right of the caret:
                    var right = (plen <= left) ? 1 : (plen - left);

                    var change = left + right;
                    setRange(source, insertionS - change, insertionE - change);

                    break;

                case "\\/":
                    if (!standr) break;

                    var prev = val.lastIndexOf("\n", insertionS) + 1;
                    var next = val.indexOf("\n", insertionS);
                    var pnext = val.indexOf("\n", next + 1);

                    if (next == -1) next = val.length;
                    if (pnext == -1) pnext = val.length;

                    if (pnext < next) pnext = next;

                    if (prev > next)
                        prev = val.lastIndexOf("\n", insertionS - 1) + 1;

                    // number of chars in current line to the left of the caret:
                    var left = insertionS - prev;

                    // length of the next line:
                    var nlen = pnext - next;

                    // number of chars in the next line to the left of the caret:
                    var right = (nlen <= left) ? 0 : (nlen - left - 1);

                    var change = (next - insertionS) + nlen - right;
                    setRange(source, insertionS + change, insertionE + change);

                    break;

                default:
                    
                    var isFirefox = typeof InstallTrigger !== 'undefined';
                    /*Test*/

                    //insertAtCaret(source, (ch == "Enter" ? (window.opera || !isFirefox ? '\r\n' : '\n') : ch));
                    
                    if (ch == "Enter") {
                        //       alert("Enter pressed");
                        var f = 0;

                   

                        if (document.getElementById("chkLabel").checked == true && document.getElementById("chkSpeed").checked == true) {
                            alert("you can not check Penalty and Zero at same time");
                            document.getElementById("chkLabel").checked = false;
                            document.getElementById("chkSpeed").checked = false;
                            return false;
                            f = 1 ;
                        }


                   var point = parseInt(document.getElementById('<%= txtPoint.ClientID %>').value);
                if (point > 0) {
                    var stat1 = parseInt(document.getElementById('<%= hdnStatus1.ClientID %>').value);
                    var stat2 = parseInt(document.getElementById('<%= hdnStatus2.ClientID %>').value);
                    if (stat1 > 0 && stat2 >= 0) {
                        if ((stat1 >= 1 && stat2 >= 1 && f != 1) || (stat1 > 2 && f != 1)) {
                            var clickButton = document.getElementById("<%= btnEnter.ClientID %>");
                       
                            if(  document.getElementById("chkId").checked == false && idck == 1)
                                alert ("Please Check the Id+pw box");
                            else
                            clickButton.click();
                            
                        }
                        else {
                             var clickButton = document.getElementById("<%= btnEnter.ClientID %>");
                            if(  document.getElementById("chkId").checked == false && idck == 0)
                                clickButton.click();
                            else{
                                alert("Sorry! Please select atleast one opponent.");
                                return false;}
                        }
                    }
                    else {
                         var clickButton = document.getElementById("<%= btnEnter.ClientID %>");
                        if(  document.getElementById("chkId").checked == false && idck == 0)
                            clickButton.click();
                        else{
                            alert("Sorry! Please select both player.");
                            return false;
                        }
                    }
                }
                else {
                    alert("Point should be more than 0.");
                    return false;
                }
     
                    }
                    var value = ch == "Enter" ? (window.opera || isFirefox ? '\r\n' : '\n') : ch;

                    insertAtCaret(source, value);


            }
        }

        // This function retrieves the position (in chars, relative to
        // the start of the text) of the edit cursor (caret), or, if
        // text is selected in the TEXTAREA, the start and end positions
        // of the selection.
        //
        function getCaretPositions(ctrl) {
            var CaretPosS = -1, CaretPosE = 0;

            // Mozilla way:
          
            if (ctrl.selectionStart || (ctrl.selectionStart == '0')) {
                CaretPosS = ctrl.selectionStart;
                CaretPosE = ctrl.selectionEnd;

                insertionS = CaretPosS == -1 ? CaretPosE : CaretPosS;
                insertionE = CaretPosE;
            }
                // InterenetExplorer way:
            else if (document.selection && ctrl.createTextRange) {
                var start = end = 0;
                try {
                  
                    start = Math.abs(document.selection.createRange().moveStart("character", -10000000)); // start

                    if (start > 0) {
                        try {
                            var endReal = Math.abs(ctrl.createTextRange().moveEnd("character", -10000000));

                            var r = document.body.createTextRange();
                            r.moveToElementText(ctrl);
                            var sTest = Math.abs(r.moveStart("character", -10000000));
                            var eTest = Math.abs(r.moveEnd("character", -10000000));

                            if ((ctrl.tagName.toLowerCase() != 'input') && (eTest - endReal == sTest))
                                start -= sTest;
                        }
                        catch (err) { }
                    }
                }
                catch (e) { }

                try {
                    end = Math.abs(document.selection.createRange().moveEnd("character", -10000000)); // end
                    if (end > 0) {
                        try {
                            var endReal = Math.abs(ctrl.createTextRange().moveEnd("character", -10000000));

                            var r = document.body.createTextRange();
                            r.moveToElementText(ctrl);
                            var sTest = Math.abs(r.moveStart("character", -10000000));
                            var eTest = Math.abs(r.moveEnd("character", -10000000));

                            if ((ctrl.tagName.toLowerCase() != 'input') && (eTest - endReal == sTest))
                                end -= sTest;
                        }
                        catch (err) { }
                    }
                }
                catch (e) { }

                insertionS = start;
                insertionE = end
            }
        }

        function setRange(ctrl, start, end) {
            
            if (ctrl.setSelectionRange) // Standard way (Mozilla, Opera, Safari ...)
            {
               
                ctrl.setSelectionRange(start, end);
            }
            else // MS IE
            {
               
                var range;

                try {
                    range = ctrl.createTextRange();
                }
                catch (e) {
                    try {
                        range = document.body.createTextRange();
                        range.moveToElementText(ctrl);
                    }
                    catch (e) {
                        range = null;
                    }
                }

                if (!range) return;

                range.collapse(true);
                range.moveStart("character", start);
                range.moveEnd("character", end - 1);
                range.select();
            }

            insertionS = start;
            insertionE = end;
           
        }

        function deleteSelection(ctrl) {
          
          
            if (insertionS == insertionE) return;
            var isFirefox = typeof InstallTrigger !== 'undefined';
            var tmp = (document.selection && !window.opera && !isFirefox) ? ctrl.value.replace(/\r/g, "") : ctrl.value;
            ctrl.value = tmp.substring(0, insertionS) + tmp.substring(insertionE, tmp.length);

            setRange(ctrl, insertionS, insertionE);
        }

        function deleteAtCaret(ctrl) {
            // if(insertionE < insertionS) insertionE = insertionS;
           
            //if (insertionS != insertionE) {
                
            //    deleteSelection(ctrl);
            //    return;
            //}
            //alert("delete soon");
            //if (insertionS == insertionE)
            //    insertionS = insertionS - 1;
            var isFirefox = typeof InstallTrigger !== 'undefined';
            var tmp = (document.selection && !window.opera && !isFirefox) ? ctrl.value.replace(/\r/g, "") : ctrl.value;
           

            ctrl.value = tmp.substring(0, insertionS) + tmp.substring(insertionE, tmp.length);
           
            if (tmp == ctrl.value) {
                if (tmp.length > 0) {                  
                    ctrl.value = tmp.substring(0, tmp.length - 1);
                    //ctrl.selectionStart = ctrl.value.length;                  
                }
            }
            //setRange(ctrl, insertionS, insertionS);
        }

        // This function inserts text at the caret position:
        //
        function insertAtCaret(ctrl, val) {
            
            var idVal = ctrl.id;
            var status = false;
            if (idVal == 'txtPoint') {
                if (val >= 0 && val <= 9) {
                    if (ctrl.maxLength > ctrl.value.length) {
                        status = true;
                    }
                }
            }
            if (idVal == 'txtSet') {
                if (val == 1 || val == 3 || val == 5 || val == 7 || val == 9) {
                    if (ctrl.maxLength > ctrl.value.length) {
                        //alert("dfd");
                        //alert(ctrl.value.length);
                        //alert(ctrl.maxLength);
                        status = true;
                    }
                }
            }
            if (idVal == 'txtPins') {
                if (val == 5 || val == 9) {
                    if (ctrl.maxLength > ctrl.value.length) {
                        status = true;
                    }
                }
            }
            if (idVal == 'txtTimer1') {
                if (val >= 0 && val <= 9) {
                    if (ctrl.maxLength > ctrl.value.length) {
                        status = true;
                    }
                }
            }
            if (idVal == 'txtTimer2') {
                if (val >= 0 && val <= 9) {
                    if (ctrl.maxLength > ctrl.value.length) {
                        status = true;
                    }
                }
            }
            if (idVal == "txtn1PW") {
                status = true;
            }
            if (idVal == "txtn2PW") {
                status = true;
            }
            if (idVal == "txtn3PW") {
                status = true;
            }
            if (idVal == "txtn4PW") {
                status = true;
            }
            if (status) {
                if (insertionS != insertionE)
                    deleteSelection(ctrl);
                // Firefox 1.0+
             
                
                var isFirefox = typeof InstallTrigger !== 'undefined';
                
              //var isFirefox = false;
                if (gecko && document.createEvent && !window.opera && !isFirefox) {
                    
                    var e = document.createEvent("KeyboardEvent");

                    if (e.initKeyEvent && ctrl.dispatchEvent) {
                       
                        e.initKeyEvent("keypress",        // in DOMString typeArg,
                                       false,             // in boolean canBubbleArg,
                                       true,              // in boolean cancelableArg,
                                       null,              // in nsIDOMAbstractView viewArg, specifies UIEvent.view. This value may be null;
                                       false,             // in boolean ctrlKeyArg,
                                       false,             // in boolean altKeyArg,
                                       false,             // in boolean shiftKeyArg,
                                       false,             // in boolean metaKeyArg,
                                       null,              // key code;
                                       val.charCodeAt(0));// char code.

                        ctrl.dispatchEvent(e);


                    }
                }
                else {
                  
                    var tmp = (document.selection && !window.opera) ? ctrl.value.replace(/\r/g, "") : ctrl.value;
                    ctrl.value = tmp.substring(0, insertionS) + val + tmp.substring(insertionS, tmp.length);
                }

                setRange(ctrl, insertionS + val.length, insertionS + val.length);
            }
        }

        function addSymbol(txtbox) {
            $('#' + txtbox.id).val($('#' + txtbox.id).val() + '"');
        }
        function removeSymbol(txtbox) {
            $('#' + txtbox.id).val($('#' + txtbox.id).val().replace(/['"]/g, ''));
        }
        //--></script>
    <script type="text/javascript">
        function PassCheck(id) {
            if (notEntered(id.value)) {
                $.ajax({
                    type: "POST",
                    url: "../BilliardScoreboard.asmx/CheckPassword",
                    data: '{prefixText: "' + id.value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (res) {
                        OnSuccess(res, id); // Call another function with additional parameter
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            else {
                alert("Sorry, you already used this account.");
                document.getElementById(id.id).value = "";
                document.getElementById(id.id).focus();
            }
        }
        var idck = 0;
        function notEntered(valuecheck) {
            var cnt = 0;
            if (document.getElementById('<%= txtn1PW.ClientID %>').value != "" && document.getElementById('<%= txtn1PW.ClientID %>').value == valuecheck) {
                { cnt++; 
                    idck = 1;
var dont = document.getElementById('<%= txtn1PW.ClientID %>').value;
}
                  
            }
            if (document.getElementById('<%= txtn2PW.ClientID %>').value != "" && document.getElementById('<%= txtn2PW.ClientID %>').value == valuecheck) {
                cnt++;
                idck = 1;
            }
            if (document.getElementById('<%= txtn3PW.ClientID %>').value != "" && document.getElementById('<%= txtn3PW.ClientID %>').value == valuecheck) {
                cnt++;
                idck = 1;
            }
            if (document.getElementById('<%= txtn4PW.ClientID %>').value != "" && document.getElementById('<%= txtn4PW.ClientID %>').value == valuecheck) {
                cnt++;
                idck = 1;
            }
            if (cnt > 1 ) {
                return false;
            }
            else {
                return true;
            }
        }
        function OnSuccess(response, inputbox) {
            if (response.d.length > 0) {
               
                if (inputbox.id == "txtn1PW") {

                    document.getElementById('<%= lblPlayerName1.ClientID %>').innerHTML = TextAbstract(response.d[0].Name + ' ' + response.d[0].FamilyName, 20);
                              document.getElementById('<%= lblC1.ClientID %>').innerHTML = TextAbstract(response.d[0].ClubName, 20);
                    document.getElementById('<%= imgC1.ClientID %>').src = '../' + response.d[0].ClubPicture;
                    document.getElementById('<%= hdnClub1.ClientID %>').value = response.d[0].ClubEmail;
                    document.getElementById('<%= hdnPlay1.ClientID %>').value = response.d[0].PlayerEmail;

                    

                    document.getElementById('<%= imgC1.ClientID %>').src = '../' + response.d[0].ClubPicture;
                    document.getElementById('<%= imgC1.ClientID %>').style.display = 'inline-block';
                    document.getElementById('<%= imgP1.ClientID %>').src = '../' + response.d[0].PlayerPicture;
                    document.getElementById('<%= imgP1.ClientID %>').style.display = 'inline-block';
                    document.getElementById('<%= hdnStatus1.ClientID %>').value = parseInt(document.getElementById('<%= hdnStatus1.ClientID %>').value) + 1;

                    document.getElementById('<%= P1.ClientID %>').value = document.getElementById('<%= lblPlayerName1.ClientID %>').innerHTML;
                    document.getElementById('<%= IP1.ClientID %>').value = document.getElementById('<%= imgP1.ClientID %>').src;
                    document.getElementById('<%= C1.ClientID %>').value = document.getElementById('<%= lblC1.ClientID %>').innerHTML;
                    document.getElementById('<%= IC1.ClientID %>').value = document.getElementById('<%= imgC1.ClientID %>').src
                   
                }
                if (inputbox.id == "txtn2PW") {
                   
                    document.getElementById('<%= lblPlayerName2.ClientID %>').innerHTML = TextAbstract(response.d[0].Name + ' ' + response.d[0].FamilyName, 20);
                    document.getElementById('<%= lblC2.ClientID %>').innerHTML = TextAbstract(response.d[0].ClubName, 20);
                    document.getElementById('<%= imgC2.ClientID %>').src = '../' + response.d[0].ClubPicture;

                    document.getElementById('<%= hdnClub2.ClientID %>').value = response.d[0].ClubEmail;
                    document.getElementById('<%= hdnPlay2.ClientID %>').value = response.d[0].PlayerEmail;


                    document.getElementById('<%= imgC2.ClientID %>').style.display = 'inline-block';
                    document.getElementById('<%= imgP2.ClientID %>').src = '../' + response.d[0].PlayerPicture;
                    document.getElementById('<%= imgP2.ClientID %>').style.display = 'inline-block';
                    document.getElementById('<%= hdnStatus2.ClientID %>').value = parseInt(document.getElementById('<%= hdnStatus2.ClientID %>').value) + 1;
                    

                    document.getElementById('<%= P2.ClientID %>').value = document.getElementById('<%= lblPlayerName2.ClientID %>').innerHTML;
                    document.getElementById('<%= IP2.ClientID %>').value = document.getElementById('<%= imgP2.ClientID %>').src;
                    document.getElementById('<%= C2.ClientID %>').value = document.getElementById('<%= lblC2.ClientID %>').innerHTML;
                    document.getElementById('<%= IC2.ClientID %>').value = document.getElementById('<%= imgC2.ClientID %>').src
                   
                }
                if (inputbox.id == "txtn3PW") {
                    document.getElementById('<%= lblPlayerName3.ClientID %>').innerHTML = TextAbstract(response.d[0].Name + ' ' + response.d[0].FamilyName, 20);
                    document.getElementById('<%= lblC3.ClientID %>').innerHTML = TextAbstract(response.d[0].ClubName, 20);
                    document.getElementById('<%= imgC3.ClientID %>').src = '../' + response.d[0].ClubPicture;
                    document.getElementById('<%= imgC3.ClientID %>').style.display = 'inline-block';
                    document.getElementById('<%= imgP3.ClientID %>').src = '../' + response.d[0].PlayerPicture;
                    document.getElementById('<%= imgP3.ClientID %>').style.display = 'inline-block';

                    document.getElementById('<%= hdnClub3.ClientID %>').value = response.d[0].ClubEmail;
                    document.getElementById('<%= hdnPlay3.ClientID %>').value = response.d[0].PlayerEmail;

                    document.getElementById('<%= hdnStatus1.ClientID %>').value = parseInt(document.getElementById('<%= hdnStatus1.ClientID %>').value) + 1;

                    document.getElementById('<%= P3.ClientID %>').value = document.getElementById('<%= lblPlayerName3.ClientID %>').innerHTML;
                    document.getElementById('<%= IP3.ClientID %>').value = document.getElementById('<%= imgP3.ClientID %>').src;
                    document.getElementById('<%= C3.ClientID %>').value = document.getElementById('<%= lblC3.ClientID %>').innerHTML;
                    document.getElementById('<%= IC3.ClientID %>').value = document.getElementById('<%= imgC3.ClientID %>').src
                }
                if (inputbox.id == "txtn4PW") {
                    document.getElementById('<%= lblPlayerName4.ClientID %>').innerHTML = TextAbstract(response.d[0].Name + ' ' + response.d[0].FamilyName, 20);
                    document.getElementById('<%= lblC4.ClientID %>').innerHTML = TextAbstract(response.d[0].ClubName, 20);
                    document.getElementById('<%= imgC4.ClientID %>').src = '../' + response.d[0].ClubPicture;
                    document.getElementById('<%= imgC4.ClientID %>').style.display = 'inline-block';
                    document.getElementById('<%= imgP4.ClientID %>').src = '../' + response.d[0].PlayerPicture;
                    document.getElementById('<%= imgP4.ClientID %>').style.display = 'inline-block';
                    document.getElementById('<%= hdnStatus2.ClientID %>').value = parseInt(document.getElementById('<%= hdnStatus2.ClientID %>').value) + 1;

                    document.getElementById('<%= hdnClub4.ClientID %>').value = response.d[0].ClubEmail;
                    document.getElementById('<%= hdnPlay4.ClientID %>').value = response.d[0].PlayerEmail;


                    document.getElementById('<%= P4.ClientID %>').value = document.getElementById('<%= lblPlayerName4.ClientID %>').innerHTML;
                    document.getElementById('<%= IP4.ClientID %>').value = document.getElementById('<%= imgP4.ClientID %>').src;
                    document.getElementById('<%= C4.ClientID %>').value = document.getElementById('<%= lblC4.ClientID %>').innerHTML;
                    document.getElementById('<%= IC4.ClientID %>').value = document.getElementById('<%= imgC4.ClientID %>').src
                    
                }
            }
        }
        function TextAbstract(text, length) {
            if (text == null) {
                return "";
            }
            if (text.length <= length) {
                return text;
            }
            text = text.substring(0, length);
            last = text.lastIndexOf(" ");
            text = text.substring(0, last);
            return text + "...";
        }
    </script>
    <style type="text/css">
        .lmnbutton {}
        #keyboard {
            height: 28px;


        }
        #chkId {
width:30px;
height:28px;
}

    </style>
</head>
<body onload="init()">
    <form id="form1" runat="server">
    <div id="bg">
        <div id="topLine" runat="server" style="width: 100%; height: 100px; top:0px; margin:0 auto; text-align:center; vertical-align:bottom;">
            <asp:Label ID="lblGameName" runat="server" Font-Names="Arial" Font-Size="50pt" Font-Bold="true" style="line-height:97px;"></asp:Label>
        </div>
              <audio id="audiotag1" src="../Game/sounds/button-16.wav " preload="auto"></audio>
        <div style="width:100%; margin: 0.0% auto 2%;">
            <table style="height:20px; width:40%;margin: 30px auto 0px;">
                <tr>
                    <td colspan="7" style="text-align:center; font:16pt Arial;">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblId" runat="server" Text="Id+Pw" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:CheckBox ID="chkId"  runat="server" />
                               
                                </td>
                                  
                                <td>
                                    <asp:Label ID="lblSpeed" runat="server" Text="Penalty" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:CheckBox ID="chkSpeed" runat="server" />
                               
                                </td>
                                <td>
                                    <asp:Label ID="lblLabel" runat="server" Text="Zero" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:CheckBox ID="chkLabel" runat="server" />
                                </td>
                                <td>
                                    <asp:Label ID="lblEmail" runat="server" Text="E-Mail" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                     <asp:CheckBox ID="chkEmail" runat="server"  />
                                </td>
                                 
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="7" style="text-align:center; font:16pt Arial;">
                        <table style="width:100%;">
                            <tr>
                                    
                                <td>
                                    <asp:Label ID="lblPoint" runat="server" Text="Point" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtPoint" runat="server" Text="0" MaxLength="3" CssClass="txtBox" Width="60px" onkeypress="return IsNumeric(event);"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblSet" runat="server" Text="Set" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtSet" runat="server" Text="1" MaxLength="1" CssClass="txtBox" Width="30px" onkeypress="return IsSet(event);"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblPins" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtPins" runat="server" Text="5" MaxLength="1" CssClass="txtBox" Width="30px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblTimer1" runat="server" Text="Timer 1" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtTimer1" runat="server" Text="" MaxLength="2" CssClass="txtBox" Width="45px" onblur="addSymbol(this)" onfocus="removeSymbol(this)" onkeypress="return IsTimer1(event);"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label ID="lblTimer2" runat="server" Text="Timer 2" ForeColor="#FFFFFF"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtTimer2" runat="server" Text="" MaxLength="2" CssClass="txtBox" Width="45px" onblur="addSymbol(this)" onfocus="removeSymbol(this)" onkeypress="return IsTimer2(event);"></asp:TextBox>
                                </td>
                                <td  >
                                    <asp:Label ID="lblTime" runat="server" Text="Game Time" ForeColor="#FFF" style="color:#FFFFFF !important;"></asp:Label>
                                    <br />
                                    <div title=".roundedOne" class="digit">
                                <!-- .roundedOne -->
                                <div class="roundedOne">
                                    <input type="checkbox" value="None" id="roundedOne" runat="server" name="check" checked  />
                                    <label for="roundedOne"></label>
                                </div>
                                <!-- end .roundedOne -->
                                </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--<tr style="height:20px;">
                    <td colspan="7" style="text-align:center;">
                    </td>
                </tr> --%>   
                </table>
                <div style="width: 100%; text-align: center; display: inline-block; margin-top: 38px; margin-bottom: 35px;">
                    <div style="font:18pt Arial; display:inline-block; text-align:left;" class="White">
                        <asp:Label ID="lblPlayerName1" runat="server" Text=""></asp:Label> - 
                        <asp:HiddenField ID="P1" runat="server" />
                        <asp:HiddenField ID="IP1" runat="server" />
                        <asp:Label ID="lblC1" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="C1" runat="server" />
                        <asp:HiddenField ID="IC1" runat="server" />
                        <br />
                        <asp:Image ID="imgP1" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 3px #FFF;" ImageUrl="~/img/Black.jpg" /> &nbsp;
                        <asp:Label ID="lblP1" runat="server" Text="1" style="background-color:#FFFFFF; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;
                        <asp:TextBox ID="txtn1PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                        <asp:Image ID="imgC1" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 3px #FFF;" ImageUrl="~/img/Black.jpg" />
                        <br /><br />
                        <asp:Label ID="lblPlayerName3" runat="server" Text=""></asp:Label> - 
                            <asp:HiddenField ID="P3" runat="server" />
                            <asp:HiddenField ID="IP3" runat="server" />
                            <asp:Label ID="lblC3" runat="server" Text=""></asp:Label>
                            <asp:HiddenField ID="C3" runat="server" />
                            <asp:HiddenField ID="IC3" runat="server" />
                        <br />
                        <asp:Image ID="imgP3" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 3px #FFF;" ImageUrl="~/img/Black.jpg" /> &nbsp;
                            <asp:Label ID="lblP3" runat="server" Text="3" style="background-color:#FFFFFF; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;
                            <asp:TextBox ID="txtn3PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                            <asp:Image ID="imgC3" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 3px #FFF;" ImageUrl="~/img/Black.jpg" /> 
                    </div>
                    <div  style="display: inline-block; text-align: left; width: 6px; border: 2px solid rgb(221, 221, 221); background-color: rgb(221, 221, 221); margin: 0px 30px 21px; position: relative; top: 23px; height: 274px;">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    </div>
                    <div style="color:#FF6A00; font:18pt Arial; display:inline-block; text-align:left;">
                        <asp:Label ID="lblPlayerName2" runat="server" Text=""></asp:Label> - 
                        <asp:HiddenField ID="P2" runat="server" />
                        <asp:HiddenField ID="IP2" runat="server" />
                        <asp:Label ID="lblC2" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="C2" runat="server" />
                        <asp:HiddenField ID="IC2" runat="server" />
                        <br />
                        <asp:Image ID="imgP2" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 3px #FF6A00;" ImageUrl="~/img/Black.jpg" /> &nbsp;                      
                        <asp:Label ID="lblP2" runat="server" Text="2" style="background-color:#FF6A00; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;           
                        <asp:TextBox ID="txtn2PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" BackColor="#ff6a00" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                        <asp:Image ID="imgC2" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 3px #FF6A00;" ImageUrl="~/img/Black.jpg"/> 
                        <br /><br />
                        <asp:Label ID="lblPlayerName4" runat="server" Text=""></asp:Label> - 
                            <asp:HiddenField ID="P4" runat="server" />
                            <asp:HiddenField ID="IP4" runat="server" />
                            <asp:Label ID="lblC4" runat="server" Text=""></asp:Label>
                            <asp:HiddenField ID="C4" runat="server" />
                            <asp:HiddenField ID="IC4" runat="server" />
                        <br />  
                        <asp:Image ID="imgP4" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 3px #FF6A00;" ImageUrl="~/img/Black.jpg" /> &nbsp;                       
                            <asp:Label ID="lblP4" runat="server" Text="4" style="background-color:#FF6A00; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;                        
                            <asp:TextBox ID="txtn4PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" BackColor="#ff6a00" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                            <asp:Image ID="imgC4" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 3px #FF6A00;" ImageUrl="~/img/Black.jpg"/>
                    </div>
                </div>
                <div style="text-align:center; width:100%; display:inline-flex;">
                    <audio id="audiotag1" src="../sounds/button-16.wav " preload="auto"></audio>
           
                    <div id="keyboard"  style="margin: 15px auto 0;"></div>
                </div>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <div style="text-align: center; width: 100%; display: inline-block; position: relative; bottom: 50px; left: 0px; height: 110px;">
            <asp:Button ID="btnSelectGame" CssClass="lmnbutton" runat="server" OnClick="btnSelectGame_Click" Text="Select Game"  style="margin-top:2.5cm;" Height="37px" Font-Bold="True" Width="128px" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
            
              <asp:Button ID="btnReset" CssClass="lmnbutton" runat="server" Text="Reset" OnClick="btnReset_Click" style="margin-right: -1px;" Height="37px" Width="127px" Font-Bold="True"/>
                </div>
            <%--<tr>
                    <td colspan="3" style="width:425px; font:18pt Arial;" class="White">
                        <asp:Label ID="lblPlayerName1" runat="server" Text=""></asp:Label> - 
                        <asp:HiddenField ID="P1" runat="server" />
                        <asp:HiddenField ID="IP1" runat="server" />
                        <asp:Label ID="lblC1" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="C1" runat="server" />
                        <asp:HiddenField ID="IC1" runat="server" />
                    </td>
                    <td style="width:2%;"></td>
                    <td colspan="3" style="width:425px; color:#FF6A00; font:18pt Arial; padding-left:118px;">
                        <asp:Label ID="lblPlayerName2" runat="server" Text=""></asp:Label> - 
                        <asp:HiddenField ID="P2" runat="server" />
                        <asp:HiddenField ID="IP2" runat="server" />
                        <asp:Label ID="lblC2" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="C2" runat="server" />
                        <asp:HiddenField ID="IC2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="width:425px" class="White">
                        <asp:Image ID="imgP1" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 1px #FFF;" ImageUrl="~/img/Black.jpg" /> &nbsp;
                        <asp:Label ID="lblP1" runat="server" Text="1" style="background-color:#FFFFFF; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;
                        <asp:TextBox ID="txtn1PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                        <asp:Image ID="imgC1" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 1px #FFF;" ImageUrl="~/img/Black.jpg" />                       
                    </td>
                    <td rowspan="4" style="border: 2px solid rgb(221, 221, 221); background-color: rgb(221, 221, 221)">
                        <div></div>
                    </td>
                    <td colspan="3" style="width:425px; text-align:right;" class="White">
                        <asp:Image ID="imgP2" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 1px #FF6A00;" ImageUrl="~/img/Black.jpg" /> &nbsp;                      
                        <asp:Label ID="lblP2" runat="server" Text="2" style="background-color:#FF6A00; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;           
                        <asp:TextBox ID="txtn2PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" BackColor="#ff6a00" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                        <asp:Image ID="imgC2" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 1px #FF6A00;" ImageUrl="~/img/Black.jpg"/>                       
                    </td>
                </tr>
                 <tr>
                    <td colspan="6" style="text-align:center; height:50px">
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="width:425px; font:18pt Arial;" class="White">
                        <asp:Label ID="lblPlayerName3" runat="server" Text=""></asp:Label> - 
                        <asp:HiddenField ID="P3" runat="server" />
                        <asp:HiddenField ID="IP3" runat="server" />
                        <asp:Label ID="lblC3" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="C3" runat="server" />
                        <asp:HiddenField ID="IC3" runat="server" />
                    </td>
                    <td colspan="3" style="width:425px; padding-left:118px; color:#FF6A00; font:18pt Arial;">
                        <asp:Label ID="lblPlayerName4" runat="server" Text=""></asp:Label> - 
                        <asp:HiddenField ID="P4" runat="server" />
                        <asp:HiddenField ID="IP4" runat="server" />
                        <asp:Label ID="lblC4" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="C4" runat="server" />
                        <asp:HiddenField ID="IC4" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="width:425px" class="White">
                        <asp:Image ID="imgP3" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 1px #FFF;" ImageUrl="~/img/Black.jpg" /> &nbsp;
                        <asp:Label ID="lblP3" runat="server" Text="3" style="background-color:#FFFFFF; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;
                        <asp:TextBox ID="txtn3PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                        <asp:Image ID="imgC3" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 1px #FFF;" ImageUrl="~/img/Black.jpg" />                       
                    </td>
                    <td colspan="3" style="width:425px; text-align:right;" class="White">
                        <asp:Image ID="imgP4" runat="server" Height="75px" Width="65px" style="vertical-align:bottom; bottom: 0; border:solid 1px #FF6A00;" ImageUrl="~/img/Black.jpg" /> &nbsp;                       
                        <asp:Label ID="lblP4" runat="server" Text="4" style="background-color:#FF6A00; color:#000000; width:50px; padding: 1px 8px; border-radius:5px;"></asp:Label> &nbsp;                        
                        <asp:TextBox ID="txtn4PW" runat="server" CssClass="txtBox" TextMode="Password" Width="90px" BackColor="#ff6a00" onblur="return PassCheck(this)"></asp:TextBox> &nbsp;
                        <asp:Image ID="imgC4" runat="server" Height="75px" Width="75px" style="vertical-align:bottom; bottom: 0; border-radius:50%; border:solid 1px #FF6A00;" ImageUrl="~/img/Black.jpg"/>                       
                    </td>
                </tr>
                <tr>
                    <td colspan="7" style="text-align:center;">
                        <div id="keyboard"></div>
                    </td>
                </tr>
            </table>--%>
        </div>
        <div id="bottomLine" runat="server" style="width: 100%; height: 100px; position:fixed; bottom:0px; margin:0 auto; text-align:center; vertical-align:bottom;">

            <asp:Label ID="lblSite" runat="server" ForeColor="White" Font-Names="Arial" Font-Size="50pt" Font-Bold="true" style="line-height:95px;" Text="www.biliardoprofessionale.it"></asp:Label>
          
        </div>
        <asp:HiddenField ID="hdnStatus1" runat="server" Value="0" />
        <asp:HiddenField ID="hdnStatus2" runat="server" Value="0" />
        <asp:Button ID="btnEnter" runat="server" Text="" style="display:none;" OnClick="btnEnter_Click" />

        <asp:HiddenField ID="hdnPlay1" runat="server" Value="" />
        <asp:HiddenField ID="hdnPlay4" runat="server" Value="" />
        <asp:HiddenField ID="hdnPlay2" runat="server" Value="" />
        <asp:HiddenField ID="hdnPlay3" runat="server" Value="" />

        <asp:HiddenField ID="hdnClub1" runat="server" Value="" />
        <asp:HiddenField ID="hdnClub2" runat="server" Value="" />
        <asp:HiddenField ID="hdnClub3" runat="server" Value="" />
        <asp:HiddenField ID="hdnClub4" runat="server" Value="" />
         <asp:HiddenField ID="Zerochk" runat="server" Value="0"/>
         <asp:HiddenField ID="Penaltychk" runat="server" Value="0"/>


    </div>
    </form>
</body>
</html>
