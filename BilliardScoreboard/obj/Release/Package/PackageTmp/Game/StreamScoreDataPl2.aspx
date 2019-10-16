<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StreamScoreDataPl2.aspx.cs" Inherits="BilliardScoreboard.Game.StreamScoreDataPl2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style8 {
            width: 207px;
        }
        .auto-style9 {
            height: 81px;
            width: 207px;
        }
        .auto-style10 {
            width: 194px;
        }
        .auto-style11 {
            height: 81px;
            width: 194px;
        }
        .auto-style12 {
            width: 189px;
        }
        .auto-style13 {
            height: 81px;
            width: 189px;
        }
        .auto-style14 {
            width: 202px;
        }
        .auto-style15 {
            height: 81px;
            width: 202px;
        }
    </style>
</head>
<body>
      <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div style="font-family:Arial;">
            <table border="1" style="background-color:black">
              
                <tr style="color:white; border-bottom:solid; border-bottom-color:red" >
                    <td colspan="" class="auto-style14" > 
                        <b> Punti-</b><asp:Label ID="Punti2" runat="server" Text="Label"></asp:Label></td>
                    <td class="auto-style12"> <b>Tiri-&nbsp;</b><asp:Label ID="Tiri2" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style8"><b>Alla fine -</b><asp:Label ID="Allafine2" runat="server" Text="Label"></asp:Label> </td>
                    <td class="auto-style10"><b>Set-&nbsp;&nbsp;&nbsp;</b><asp:Label ID="lblSet2" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp; </td> 
                </tr>
                
              

                <tr style="color:white">
                    <td class="auto-style15">
                        <asp:Label ID="Player2Name" runat="server" Text="Sergio&nbsp;"></asp:Label>
                        <asp:Image ID="imgPlayer2" ImageUrl="" runat="server" Width="65px" style="border-radius:15%;" />
                    </td>
                    <td class="auto-style13" >
                        <asp:Label ID="Club2Name" runat="server" Text="&nbsp;Biliardo Club"></asp:Label>
                        <asp:Image ID="imgClub2" ImageUrl="" Width="65px" style="border-radius:15%;" runat="server" />
                       
                    </td>
                    <td class="auto-style9">
                         <asp:Label ID="Player4Name" runat="server" Text="Sergio&nbsp;&nbsp;&nbsp;"></asp:Label>
                        <asp:Image ID="imgPlayer4" ImageUrl="" Width="65px" style="border-radius:15%;" runat="server" />
                        
                    </td>
                    <td class="auto-style11" >
                      <asp:Label ID="Club4Name" runat="server" Text="&nbsp;Club"></asp:Label>
                        <asp:Image ID="imgClub4" ImageUrl="" runat="server" Width="65px" style="border-radius:15%;" />
                        
                    </td>
                  
                </tr>
             

            </table>
          
              <asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick"></asp:Timer>

        </div>
    </form>
</body>
</html>
