function newPointAdd(type, pnts) {
    
    document.getElementById('audiotag1').play();
    if (startgame == 'start') {
        if (pnts == '+' || pnts == '-') {

            spc = '1';
            cal = pnts;
            stopprogress();

        }
        if (type == "first") {
            enteredvalue = pnts;
            var points = document.getElementById('<%=lblTeamScore1.ClientID%>').innerHTML;
            var Prev1 = document.getElementById('<%=lblPrev1.ClientID%>').innerHTML;

            if (Prev1 == undefined)
                Prev1 = '';
            if (points == undefined)
                points = '';

            //alert('before piont with symbol: ' + lblPrev1.innerHTML + pnts);
            var pointsWithSymbol = lblPrev1.innerHTML;
            if (pointsWithSymbol.indexOf('+') != 1 && pnts == '-') {
                alert('what to do now' + pointsWithSymbol.replace('+', '-'));
                points = pointsWithSymbol.replace('+', '');
                lblPrev1.innerHTML = pointsWithSymbol.replace('+', '-');

            }
            alert('x1');
            if ((points.indexOf('+') != -1) || (points.indexOf('-') != -1)) {

                lblPrev1.innerHTML = points + pnts;
                lblTeamScore1.innerHTML = '';
            }


            else if (points == '0') {
                if (spc == '1') {

                    lblTeamScore1.innerHTML = '';
                    lblPrev1.innerHTML = pnts;
                }
            }
            else {
                if (spc == '1') {

                    //lblPrev1.innerHTML = lblTeamScore1.innerHTML + pnts;
                    lblPrev1.innerHTML = points + pnts;
                    lblTeamScore1.innerHTML = '';

                }
                else {
                    alert('z1');
                    var str = document.getElementById('lblTeamScore1').innerHTML;

                    if (str.length > 2) {

                        document.getElementById('lblTeamScore1').innerHTML = str.substr(0, 3);
                        alert("You can enter only Three digits.");
                    }
                    else {

                        if ((Prev1.indexOf('+') != -1) || (Prev1.indexOf('-') != -1)) {
                            lblTeamScore1.innerHTML = points + pnts;

                        }

                    }
                }
            }
        }
        if (type == "second") {

            if (pnts == '+' || pnts == '-') {
                spc = '1';
                stopprogress();
            }
            enteredvalue = pnts;
            var points2 = document.getElementById('<%=lblTeamScore2.ClientID%>').innerHTML;
            var Prev2 = document.getElementById('<%=lblPrev2.ClientID%>').innerHTML;
            if (Prev2 == undefined)
                Prev2 = '';

            if ((points2.indexOf('+') != -1) || (points2.indexOf('-') != -1)) {

                alert(lblPrev2.innerHTML + ' : ::: ' + points);

                if (points == undefined)
                    points = lblTeamScore2.innerHTML;
                lblPrev2.innerHTML = points + pnts;
                lblTeamScore2.innerHTML = '';


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

                    var str = document.getElementById('lblTeamScore2').innerHTML;

                    if (str.length > 2) {

                        document.getElementById('lblTeamScore2').innerHTML = str.substr(0, 3);
                        alert("You can enter only Three digits.");
                    }
                    else {

                        if ((Prev2.indexOf('+') != -1) || (Prev2.indexOf('-') != -1)) {
                            lblTeamScore2.innerHTML = points2 + pnts;
                        }
                    }
                }
            }
        }
        spc = '';
    }
}