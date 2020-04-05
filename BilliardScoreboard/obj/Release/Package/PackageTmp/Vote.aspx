<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="BilliardScoreboard.Vote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .center-screen {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  min-height: 100vh;
}
    </style>
</head>
<body  style="background-color:black">
    <form id="form1" runat="server">
        <div class="center-screen" style="text-align:center;">
              <div >
                  <br />
                   <img  width="50%" style=" margin-top:50px;" src="img/BigLogo.png" /><br /><br /><br /><br /><br />

            <div style="color:white; text-align:center; font-size:25px">
                <b>Votate con 1 click questo argomento  &nbsp;&nbsp;  n° 
                    <asp:Label ID="TopicNo" runat="server" Text="000"></asp:Label>
                     &nbsp;&nbsp;&nbsp;&nbsp;che si chiude il :
                    <asp:Label ID="DateTime" runat="server" Text="00/00/00"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;ore
                    <asp:Label ID="Ore" runat="server" Text="24"></asp:Label>
                </b>
                 <h1  style=""> <asp:Label ID="Question" runat="server" Text="preferite i panni verdinjikkjijiuiu ?"></asp:Label></h1>
                 <asp:ImageButton ID="ImageButtonBill" style="float:right;  margin-right:0px;" ImageUrl="../img/bill.jpg" runat="server" OnClick="ImageButtonBill_Click" />
                <br /><br />
                
               <asp:Button ID="SI" runat="server" Text="SI"  BackColor="black" BorderWidth="5"  style="border-radius:50%; width:70px;   height:70px;  border-color:green;  border:4; text-align:center;color:white;  font-size:25px;" OnClick="SI_Click"    />
            
                <asp:Button ID="NO" runat="server" Text="NO" BackColor="Black"  BorderWidth="5"  style="border-radius:50%; width:70px; margin-left:100px; height:70px; border-color:red; border:4; text-align:center;color:white;  font-size:25px;" OnClick="NO_Click"   />
               <br />
                 <asp:Button ID="Button1" runat="server" style="float:right; background-image:url('../img//vedi.png'); border:none;" Text="" Width="226px" Height="55px" OnClick="Button1_Click" />
                
               <br /> <asp:Button ID="ConfirmVote"  Visible="false" BackColor="Black"  style="  border-radius:15%; color:white; font-size:25px;" runat="server" Text="conferma" OnClick="ConfirmVote_Click" />
                </div>

                  
               
            

            <br /> 

              
        </div>
            </div>
    </form>
</body>
</html>
