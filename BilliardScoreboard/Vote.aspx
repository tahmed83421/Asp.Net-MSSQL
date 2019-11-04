<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="BilliardScoreboard.Vote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:black">
    <form id="form1" runat="server">
        <div>
              <div style="border-bottom-style:groove; margin-top:100px; border-bottom-color:white"; ></div>

                   <img  width="50%" style="margin-left:560px; margin-top:50px;" src="img/BigLogo.png" /><br /><br /><br /><br /><br />

            <div style="color:white;margin-left:550px; font-size:35px">
                <b>Votate con 1 click questo argomento  &nbsp;&nbsp;  n° 
                    <asp:Label ID="TopicNo" runat="server" Text="000"></asp:Label>
                     &nbsp;&nbsp;&nbsp;&nbsp;che si chiude il :
                    <asp:Label ID="DateTime" runat="server" Text="00/00/00"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;ore
                    <asp:Label ID="Ore" runat="server" Text="24"></asp:Label>
                </b>
                 <h1  style="margin-left:180px;"> <asp:Label ID="Question" runat="server" Text="preferite i panni verdi ?"></asp:Label></h1>

                 <asp:Button ID="SI" runat="server" Text="SI"  BorderWidth="5"  style="border-radius:50%; width:70px; margin-left:400px; height:70px; background-image:url('../img/black.jpg'); border-color:green;  border:4; text-align:center;color:white;  font-size:25px;" OnClick="SI_Click"    />
             <asp:Button ID="NO" runat="server" Text="NO"  BorderWidth="5"  style="border-radius:50%; width:70px; margin-left:100px; height:70px; background-image:url('../img/black.jpg'); border-color:red; border:4; text-align:center;color:white;  font-size:25px;" OnClick="NO_Click"   />
                <asp:ImageButton ID="ImageButtonBill" style="margin-left:100px;" ImageUrl="../img/bill.jpg" runat="server" />
                <br />
                <asp:ImageButton ID="ImageButtonVedi" style="margin-left:800px;" ImageUrl="../img/vediInactive.png" runat="server" />
                <br /> <br /> <asp:Button ID="ConfirmVote"  Visible="false"  style=" margin-left:500px; background-image:url('../img/black.jpg');border-radius:15%; color:white; font-size:25px;" runat="server" Text="conferma" OnClick="ConfirmVote_Click" />
                </div>
            

            <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> 

              <div style="border-bottom-style:groove;  margin-top:130px; border-bottom-color:white"; ></div>
        </div>
    </form>
</body>
</html>
