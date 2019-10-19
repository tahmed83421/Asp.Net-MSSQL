<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StreamBoardNo.aspx.cs" Inherits="BilliardScoreboard.Game.StreamBoardNo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


 
</head>
<body>
    <form id="form1" runat="server">





       
          
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            
           <asp:TextBox ID="TextBox1" style="text-align:center;font-size:105px"   Text="5" CssClass="txtbox"  runat="server" BackColor="Black" BorderColor="White" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Size="30pt" Font-Strikeout="False" ForeColor="White" ReadOnly="True" Width="189px" OnTextChanged="TextBox1_TextChanged" Height="118px"></asp:TextBox>
            &nbsp;

        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
       
      
    </form>
</body>
</html>
