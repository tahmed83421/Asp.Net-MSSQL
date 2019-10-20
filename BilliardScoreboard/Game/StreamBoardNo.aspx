<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StreamBoardNo.aspx.cs" Inherits="BilliardScoreboard.Game.StreamBoardNo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


 
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>


 
    </head>
<body>
    <form id="form1" runat="server">





       
          
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            
            &nbsp;<asp:Button ID="Button1" runat="server" style ="background-image:url('../img/back1.jpg'); background-repeat:no-repeat; font-size:50px; color:white" Text="22" Height="140px" Width="310px" CssClass="auto-style1" />

            
           &nbsp;<asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
       
      
    </form>
</body>
</html>
