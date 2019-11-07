<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey-adminLogin.aspx.cs" Inherits="BilliardScoreboard.Survey_admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.3.min.js"></script>
   
</head>
<body style="background-color:black">
    <form id="form1" runat="server">
       
        <div style="border-bottom-style:groove; margin-top:100px; border-bottom-color:white"; ></div>


        <img  width="50%" style="margin-left:530px; margin-top:50px;" src="img/BigLogo.png" /><br /><br /><br />
       
        
       <u style="color:white"> <h1 style="text-align:center; color:white"> Vote Login</h1></u>
        <br /><br /><br /><br />

        <div style="color:white; font-size:40px; text-align:center">
          <b>UserId:&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; </b><asp:TextBox ID="txtUserId" runat="server"></asp:TextBox><br /><br />
               <b>Password:&nbsp;&nbsp; &nbsp; </b><asp:TextBox ID="txtPassword"  runat="server"></asp:TextBox>  <br><br />
             <asp:Label ID="Msg" style=" color:red"  runat="server" Text="Label" Visible="False"></asp:Label><br />
          
           

            <asp:Button ID="btnLogin" runat="server" style="font-size:35px; border-radius:20%; background-color:black;color:white;" Text="Login" OnClick="btnLogin_Click" />
        </div>
        
   
      
        <div style="border-bottom-style:groove;  margin-top:130px; border-bottom-color:white"; ></div>
       
    </form>
</body>
</html>
