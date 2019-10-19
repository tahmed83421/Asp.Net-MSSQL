<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StreamScoreDataPl2.aspx.cs" Inherits="BilliardScoreboard.Game.StreamScoreDataPl2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style16 {
            width: 660px;
            height: 130px;
        }
        .auto-style17 {
            width: 644px;
        }
    </style>
</head>
<body>
      <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <div style="font-family:Arial;">
              <table border="1" style="background-color:black; border-color:white; "; class="auto-style16" >
              
                <tr style="color:white; border-bottom:solid; border-bottom-color:red; border-color:white" >
                    <td colspan="" class="auto-style17" style="text-align:center;">
                   
                         &nbsp; &nbsp;&nbsp;&nbsp;Punti&nbsp;&nbsp;<asp:Label ID="Punti2" runat="server"  Font-Size="23"  Text="000" ></asp:Label>
               &nbsp; - &nbsp;&nbsp;Tiri&nbsp;&nbsp;&nbsp;<asp:Label ID="Tiri2" runat="server" Font-Size="23" Text="t00"></asp:Label>
                  
                   &nbsp; -&nbsp;&nbsp;alla fine&nbsp;&nbsp;&nbsp;<asp:Label ID="Allafine2" Font-Size="23" runat="server" Text="000"></asp:Label> 
                   &nbsp;-&nbsp;Set&nbsp;&nbsp;&nbsp;<asp:Label ID="lblSet2" runat="server" Font-Size="23" Text="0/0"></asp:Label> &nbsp;&nbsp;&nbsp; 
                        </td>
                </tr>
                
              

                <tr style="color:white ; " >
                  
             
                    <td class="auto-style17"; style="align-items:center;  text-align:center;  align-self:center"  >
                        
                        <asp:Label ID="Player2Name" runat="server" Font-Size="16" Text="White-1"></asp:Label>&nbsp;&nbsp;
                        
                         <asp:Image ID="imgPlayer2" runat="server"   ImageUrl=""  Width="45px" style="border-radius:15%;" />&nbsp;&nbsp;
                  
                    
                         <asp:Label ID="Club2Name" runat="server" Font-Size="16" Text="&nbsp;Club1"></asp:Label>
                           <asp:Image ID="imgClub2" runat="server"   ImageUrl="~/public/Upload/Club/ASD.jpg"  Width="45px" style="border-radius:15%;"/>&nbsp;&nbsp;
                       
                 
                  
                        <asp:Label ID="Player4Name" runat="server" Font-Size="16" Text="White-2"></asp:Label>
                      <asp:Image ID="imgPlayer4" runat="server"   ImageUrl=""  Width="45px" style="border-radius:15%;" />&nbsp;&nbsp;
                        
                  
                   
                     <asp:Label ID="Club4Name" runat="server" Font-Size="16" Text="&nbsp;Club2"></asp:Label>
                          <asp:Image ID="imgClub4" runat="server"   ImageUrl=""  Width="45
                              px" style="border-radius:15%;" />
                       
                    </td>
                 
                </tr>
             

            </table>
          
              <asp:Timer ID="Timer2" runat="server" Interval="1000" OnTick="Timer2_Tick"></asp:Timer>

        </div>
    </form>
</body>
</html>
