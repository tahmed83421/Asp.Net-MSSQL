<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="card.aspx.cs" Inherits="BilliardScoreboard.card" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Billiard Professional</title>
   
     <link rel="stylesheet" href="css/custom.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:Panel ID="Panel1" runat="server" BackColor="#92D14F" BorderColor="Black" BorderStyle="Ridge" BorderWidth="5px" Font-Names="Arial" Font-Size="Medium" Height="250px" style="margin-left: 0px" Width="400px">
            <asp:Table ID="Table1" runat="server" Height="250px" Width="400px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">
                        
            &nbsp;&nbsp;
            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="{Name}"></asp:Label>
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="{FamilyName}"></asp:Label>
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label10" runat="server" Font-Size="Medium" Text="Iscrizione al Club :"></asp:Label>
            <br />
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                         <asp:Image ID="Image3" ImageUrl="~/public/Upload/Player/1PLY.png" Height="80" Width="80" BorderWidth="3" runat="server"  Style="left: 294px; position: absolute; top:40px" />
                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Image ID="impProfPic" ImageUrl="~/img/biliard.png" runat="server"  Style="left:384px; top:25px; position:absolute;" />
                       </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell VerticalAlign="Top" runat="server">
                   <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="{ClubName}"></asp:Label>
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label12"  runat="server" Text="via {Street},{NDegree}-{Zip}"></asp:Label>
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label1"  runat="server" Text="{City}"></asp:Label>
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label13" runat="server" Text="dal {RegisteredOn} al {nbexpirydate}"></asp:Label>
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="Label14" runat="server" Text="Tessera N<sup>o</sup> {PlayerId}"></asp:Label>
            <br />
            

                    </asp:TableCell>
                    <asp:TableCell runat="server">
                        <asp:Image ID="Image2" ImageUrl="~/public/Upload/Club/ASD.jpg" Height="80" Width="80" BorderWidth="3" runat="server" Style="left: 294px; position: absolute; top:155px" />
                
                           </asp:TableCell>
                        
                </asp:TableRow>
            </asp:Table>
           
        </asp:Panel>
          
                   
    </form>
</body>
</html>
