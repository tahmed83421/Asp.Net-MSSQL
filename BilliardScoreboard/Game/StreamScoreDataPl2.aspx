<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StreamScoreDataPl2.aspx.cs" Inherits="BilliardScoreboard.Game.StreamScoreDataPl2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div style="font-family:Arial;">
            <table border="1" style="background-color:black">
              
                <tr style="color:white; border-bottom:solid; border-bottom-color:red" >
                    <td colspan="" > 
                        <b> Punti-</b><asp:Label ID="Punti2" runat="server" Text="Label"></asp:Label></td>
                    <td> <b>Tiri-&nbsp;</b><asp:Label ID="Tiri2" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td><b>Alla fine -</b><asp:Label ID="Allafine2" runat="server" Text="Label"></asp:Label> </td>
                    <td><b>Set-&nbsp;&nbsp;&nbsp;</b><asp:Label ID="lblSet2" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp; </td> 
                </tr>
                
              

                <tr style="color:white">
                    <td>
                        <asp:Label ID="Player2Name" runat="server" Text="Sergio&nbsp;"></asp:Label>
                        <asp:Image ID="imgPlayer2" ImageUrl="" runat="server" Width="35px" style="border-radius:50%;" />
                    </td>
                    <td >
                        <asp:Label ID="Club2Name" runat="server" Text="&nbsp;Biliardo Club"></asp:Label>
                        <asp:Image ID="imgClub2" ImageUrl="" Width="35px" style="border-radius:50%;" runat="server" />
                       
                    </td>
                    <td>
                         <asp:Label ID="Player4Name" runat="server" Text="Sergio&nbsp;&nbsp;&nbsp;"></asp:Label>
                        <asp:Image ID="imgPlayer4" ImageUrl="" Width="35px" style="border-radius:50%;" runat="server" />
                        
                    </td>
                    <td >
                      <asp:Label ID="Club4Name" runat="server" Text="&nbsp;Club"></asp:Label>
                        <asp:Image ID="imgClub4" ImageUrl="" runat="server" Width="35px" style="border-radius:50%;" />
                        
                    </td>
                  
                </tr>
             

            </table>
          
              <asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick"></asp:Timer>

        </div>
    </form>
</body>
</html>
