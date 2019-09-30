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
                    <td colspan="2" > 
                        <b> Punti-</b><asp:Label ID="Punti2" runat="server" Text="Label"></asp:Label></td>
                    <td> <b>Tiri-&nbsp;</b><asp:Label ID="Tiri2" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td><b>Alla fine -</b><asp:Label ID="Allafine2" runat="server" Text="Label"></asp:Label> </td>
                    <td><b>Set-&nbsp;&nbsp;&nbsp;</b><asp:Label ID="lblSet2" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp; </td> 
                </tr>
                
              

                <tr style="color:white">
                    <td>
                        <asp:Label ID="Player2Name" runat="server" Text="Sergio&nbsp;&nbsp;&nbsp;"></asp:Label>
                    </td>
                    <td >
                        
                        <img src="../public/Upload/Player/Sergio.png" alt="Avatar" style="width:30px;border-radius:50%;"/>
                    </td>
                    <td>
                       
                         <asp:Label ID="Label3" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Biliardo Club"></asp:Label>
                    </td>
                    <td >
                    
                         <img src="../public/Upload/Club/ASD.jpg" alt="Avatar" style="width:30px;border-radius:50%;"/>
                    </td>
                    <td></td>
                </tr>
             

            </table>
          
              <asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick"></asp:Timer>

        </div>
    </form>
</body>
</html>
