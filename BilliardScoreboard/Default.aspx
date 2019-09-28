<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BilliardScoreboard.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billiard Professional</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/responsee.css">
    <!-- CUSTOM STYLE -->  
    <link rel="stylesheet" href="css/template-style.css">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>    
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/responsee.js"></script>  
    <!--[if lt IE 9]> 
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
    <![endif]--> 
</head>
<body class="size-1140">
    <form id="form1" runat="server">
      
      <section>
         <!-- FIRST BLOCK --> 	
         <div id="first-block">
            <div class="line">
               <h2>biliardoprofessionale.it</h2>
               <p class="subtitile">On line registration Club and Players
               </p>
               <div class="margin">
                  <div class="s-12 l-6 margin-bottom">
                     <a href="ClubRegistration.aspx"><i class="icon-paperplane_ico icon2x"></i></a>
                     <h3>Club</h3>
                     <p style="color:#000">Sign up as billiard club.
                     </p>
                  </div>
                  <div class="s-12 l-6 margin-bottom">
                     <a href="PlayerRegistration.aspx"><i class="icon-new_user icon2x"></i></a>
                     <h3>Player</h3>
                     <p style="color:#000">Sign up as billiard player.
                     </p>
                  </div>
               </div>
                <div class="margin">
                  <div class="s-12 margin-bottom" style="margin-top:50px;">
                      <asp:Button ID="btnItScoreTrackingLine" runat="server" CssClass="submitbutton" Text="Italian SCORE with Tracking Lines" style="width:225px !important; background-color:#000000 !important;" OnClick="btnItScoreTrackingLine_Click" /> 
                        <asp:Button ID="btnItalian" runat="server" CssClass="submitbutton" Text="Italian BASIC SCORE" style="width:145px !important; background-color:#000000 !important;" OnClick="btnItalian_Click" /> 
                        <asp:Button ID="btnCarom" runat="server" CssClass="submitbutton" Text="Carom BASIC SCORE" style="width:145px !important; background-color:#000000 !important;" OnClick="btnCarom_Click" />
                      <asp:Button ID="btnCarScoreTrackingLine" runat="server" CssClass="submitbutton" Text="Carom SCORE with Tracking Lines" style="width:225px !important; background-color:#000000 !important;" OnClick="btnCarScoreTrackingLine_Click" />
                        <p style="color:#000">Game setup link </p>
                  </div>                 
               </div>
            </div>
         </div>
      </section>
      <!-- FOOTER -->   
      <footer>
         <div class="line">
            <div class="s-12 l-6">
               <p>Copyright 2015, 
               </p>
            </div>
            <div class="s-12 l-6">
               <p class="right">
                  <a class="right" href="#" title="MS">biliardoprofessionale.it</a>
               </p>
            </div>
         </div>
      </footer>
    </form>
</body>
</html>
