<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="survey.aspx.cs" Inherits="BilliardScoreboard.survey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script>
        $('#Button2').click(function () {

            alert("Are you sure?");

        });
    </script>
</head>
<body style="background-color:black">
    <form id="form1" runat="server">
       
        <div style="border-bottom-style:groove; margin-top:100px; border-bottom-color:white"; ></div>


        <img  width="50%" style="margin-left:360px; margin-top:50px;" src="img/BigLogo.png" /><br /><br /><br />
        <div style="color:white;margin-left:350px; font-size:21px">
        <asp:Label ID="Label1" runat="server" style="color:white; " Text="Votate con 1 click questo argomento"></asp:Label>
          &nbsp;&nbsp;  <asp:Label ID="Label2" runat="server"  Text="n° 0001"></asp:Label>
           &nbsp;&nbsp;che si chiude il : &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="  29 /10/ 2019"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="Label4" runat="server" Text="ore 24:00 "></asp:Label>

             <h1  style="margin-left:150px;"> <asp:Label ID="Question" runat="server" Text="preferite i panni verdi ?"></asp:Label></h1>
            <asp:ListView ID="ListView1" runat="server"></asp:ListView> <asp:Label ID="Yess" runat="server" style="color:green; font-size:40px;"  Text="Label"></asp:Label>
              <asp:Button ID="Button2" runat="server" Text="SI"  BorderWidth="5"  style="border-radius:50%; width:70px; margin-left:220px; height:70px; background-image:url('../img/black.jpg'); border-color:green;  border:4; text-align:center;color:white;  font-size:25px;" OnClick="Button2_Click"   />
             <asp:Button ID="Button1" runat="server" Text="NO"  BorderWidth="5"  style="border-radius:50%; width:70px; margin-left:100px; height:70px; background-image:url('../img/black.jpg'); border-color:red; border:4; text-align:center;color:white;  font-size:25px;"   />
            
            </div>
        <asp:ListView ID="ListView2" runat="server"></asp:ListView>
      
        <div style="border-bottom-style:groove;  margin-top:130px; border-bottom-color:white"; ></div>
       
    </form>
</body>
</html>
