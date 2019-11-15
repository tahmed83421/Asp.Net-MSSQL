<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey-adminLogin.aspx.cs" Inherits="BilliardScoreboard.Survey_admin" %>

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
    <script src="js/jquery-1.8.3.min.js"></script>
   
</head>
<body style="background-color:black">
    <form id="form1" runat="server">
       
          <div class="center-screen">
          



        <img  width="50%" style=" margin-top:50px;" src="img/BigLogo.png" /><br /><br /><br />
       
        <div style="text-align:center">
       <u style="color:white"> <h1 style="text-align:center; color:white"> Vote Login</h1></u>
        <br /><br /><br /><br />

        <div style="color:white; font-size:40px; text-align:center">
          <b>UserId:&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; </b><asp:TextBox ID="txtUserId" runat="server"></asp:TextBox><br /><br />
               <b>Password:&nbsp;&nbsp; &nbsp; </b><asp:TextBox ID="txtPassword"  runat="server"></asp:TextBox>  <br><br />
             <asp:Label ID="Msg" style=" color:red"  runat="server" Text="Label" Visible="False"></asp:Label><br />
          
           

            <asp:Button ID="btnLogin" runat="server" style="font-size:25px; border-radius:15%; background-color:black;color:white;" Text="Conferma" OnClick="btnLogin_Click" />
        </div>
        
   
   </div>
              </div>
       
       
    </form>
</body>
</html>
