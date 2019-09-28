<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Renew.aspx.cs" Inherits="BilliardScoreboard.Renew" enableEventValidation ="false" %>


<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Activate Page</title>
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById("popupDiv").style.display = 'block';
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
            Your account activated. <br /><asp:LinkButton ID="lnkClick" runat="server" OnClick="lnkClick_Click">Click here</asp:LinkButton> to go website.
        </div>			                
	</div>
    </form>
</body>
</html>
