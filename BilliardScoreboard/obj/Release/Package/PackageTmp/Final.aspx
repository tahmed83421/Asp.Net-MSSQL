<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Final.aspx.cs" Inherits="BilliardScoreboard.Final" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Final Page</title>
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
            var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
            if (w < 1920 || h < 959) {
                popup();
            }
        });
        function popup() {
            document.getElementById("popupDiv").style.display = 'block';
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="popupDiv" class="ontop">
        <div id="popup">
            Sorry You can’t get the score because your monitor is not at 1920 x 1080px.
        </div>			                
	</div>
    </form>
</body>
</html>
