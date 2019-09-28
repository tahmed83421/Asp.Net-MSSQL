
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRegistration.aspx.cs" Inherits="BilliardScoreboard.ClubRegistration" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billiard Professional</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/responsee.css">
    <link rel="stylesheet" href="css/custom.css">
    <!-- CUSTOM STYLE -->  
    <link rel="stylesheet" href="css/template-style.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>    
    <script type="text/javascript" src="js/modernizr.js"></script>
    <script type="text/javascript" src="js/responsee.js"></script>  
    <script type="text/javascript" src="js/custom.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" type="text/javascript"></script>
    <!--[if lt IE 9]> 
    <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
    <![endif]-->

    <script type="text/javascript">
        $(function () {
            $("#fuClubLogo").on("change", function () {
                    var files = !!this.files ? this.files : [];
                    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
 
                    if (/^image/.test(files[0].type)) { // only image file
                        var reader = new FileReader(); // instance of the FileReader
                        reader.readAsDataURL(files[0]); // read the local file
 
                        reader.onloadend = function () { // set image data as background of div
 
                            $("#impProfPic").attr('src', this.result);
                        }
                    }
                });
        });
        function myfunction() {
            alert("I was called from a child iframe");
        }
        $("[name*=rbTermandcondition] input").on("click", function () {
            var selectedValue = $(this).val();
            var selectedText = $(this).next().html();
            alert("Selected Text: " + selectedText + " Selected Value: " + selectedValue);
        });
    </script>

    <script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        specialKeys.push(9); //Tab
        specialKeys.push(46); //Delete
        specialKeys.push(36); //Home
        specialKeys.push(35); //End
        specialKeys.push(37); //Left
        specialKeys.push(39); //Right
        function IsAlphaNumeric(cnt, e) {
            if (cnt.value.length <= 6) {
                var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
                var ret = ((keyCode >= 48 && keyCode <= 57) || (keyCode >= 65 && keyCode <= 90) || (specialKeys.indexOf(e.keyCode) != -1 && e.charCode != e.keyCode));
                return ret;
            }
            else {
                return false;
            }
        }
    </script>
    
    <script type="text/javascript">
        function popup() {
            document.getElementById("popupDiv").style.display = 'block';
        }
        function statuscheck() {
            if (ValidateRequiredField()) {
                var status = document.getElementById('<%=lblStatus.ClientID%>').innerHTML;
                if (status == "Email already exists") {
                    return false;
                }
                if (document.getElementById("<%=txtPassword.ClientID %>").value == "") {
                    alert("Please enter password");
                    return false;
                }
                <%--var Share = document.getElementsByName('<%=rbShare.ClientID%>');
                if (Share[1].checked) {
                    alert("Please select Data share on Internet to Yes to complete the registration.")
                    return false;
                }--%>
                <%--var TelevisonImage = document.getElementsByName('<%=rbTelevisonImage.ClientID%>');
                if (TelevisonImage[1].checked) {
                    alert("Please select Rights Television Image to Yes to complete the registration.")
                    return false;
                }--%>
                <%--if (document.getElementById("<%=hdnpp.ClientID %>").value == "") {
                    alert("Please select Club logo");
                    return false;
                }--%>
                else {
                    return true;
                }
            }
            else {
                return false;
            }
        }
        function fuPP() {
            document.getElementById('<%=hdnpp.ClientID%>').value = document.getElementById('<%=fuClubLogo.ClientID %>').value;
        }
        $(document).ready(function () {
            $('#lblClubLogo').tooltip();
            $('#lblPassword').tooltip();
            $('#lblShare').tooltip();
            $('#lblTelevisonImage').tooltip();
            $('#lblTermandcondition').tooltip();

            $('#lblpaypal').tooltip();
            $('#lblinfocom').tooltip();
            $('#lblsponser').tooltip();
        });
    </script>

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-18997513-2']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>

        
<style>
       .first-sec {
    width: 33%;
    margin:auto;
    float: left;
}
       .first-sec input[type=radio] {
    display: inline-block;
        transform: scale(1.5);
    vertical-align: middle;
}
       .first-sec label {
    border: none !important;
    background: transparent !important;
        padding: 4px 20px !important;
    color: #26e826 !important;
    font-size: 20px !important;
    font-weight: 600;
        outline: 0 !important;
    box-shadow: none !important;
}
       .common {
    width: 60%;
    display: flex;
    margin: auto;
}
             @media screen and (max-width:768px)
       {
           .first-sec label {
  
    font-size: 18px !important;
    
    
}
       
       }

    @media screen and (max-width:767px) {
        .first-sec label {
            font-size: 8px !important;
            font-weight: 500;
            padding: 0 5px !important;
        }

        .first-sec input[type=radio] {
            transform: scale(1);
        }
    }
    @media screen and (max-width:360px) {
        .first-sec label {
            font-size: 7px !important;
        }
    }
        
</style>






</head>
<body class="size-1140">
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <section>
               <div id="head">
            <div class="line">
                <asp:Image ID="logo" runat="server" ImageUrl="~/img/logoTop.png"/>
                  </div>
<div class="common">
    
<div class="first-sec">
                 <asp:RadioButton ID="RButton1" runat="server" Text="Registrazione veloce" GroupName="ritem" Checked="true" AutoPostBack="True" TextAlign="Left" />
       
</div>
<div class="first-sec">

   <h1><asp:Label ID="lblHeading" runat="server"></asp:Label></h1>
</div>
<div class="first-sec">
     <asp:RadioButton ID="RButton2" runat="server" Text="Registrazione completa"  GroupName="ritem" Checked="false" AutoPostBack="True" />
      
             </div>

         </div>
             </div>

   <div id="content" class="left-align contact-page">
            <div class="line">
               <div class="margin">
                   <div class="customform">
                   <div class="s-13" style="text-align:right">
                       <asp:DropDownList ID="ddLang" runat="server" Width="120px" AutoPostBack="true" OnSelectedIndexChanged="ddLang_SelectedIndexChanged">
                            <asp:ListItem Value="it-IT" Text="italiano" />
                            <asp:ListItem Value="en-US" Text="English" Enabled="False" />
                        </asp:DropDownList>
                   </div>
                       </div>
                  <div class="s-12 l-3">&nbsp;</div>
                   <div class="s-12 l-4"  id="divbody1" runat="server">                      
                        <h2><asp:Label ID="lblLogintext" runat="server" ForeColor="#FFFFFF"></asp:Label></h2>
                     <div class="customform"> 
                       <div class="s-12 l-5">
                        <asp:Label ID="lblId" runat="server" Text=""></asp:Label>
                        <asp:TextBox ID="txtId" runat="server"></asp:TextBox>
                        </div>
                        <div class="s-12 l-5">
                            <asp:Label ID="lblPw" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtPw" runat="server" TextMode="Password"></asp:TextBox>
                             <asp:Label ID="lblSignIn" runat="server" Text=""></asp:Label>
                        </div>
                         <div class="s-4">
                             <asp:Button ID="btnLogin" runat="server"  CssClass="submitbutton"  OnClick="btnLogin_Click"  />
                             <asp:Button ID="btnUpdate" runat="server" CssClass="submitbutton" OnClick="btnUpdate_Click" />
                         </div>
                         <div class="s-12 l-5" style="margin-top:20px">
                            <asp:Label ID="lblForgetPassword" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtForgetPassword" runat="server"></asp:TextBox>
                             <asp:Label ID="lblPasswordStatus" runat="server" Text=""></asp:Label>
                        </div>
                         <div class="s-4"><asp:Button ID="btnForgetPassword" runat="server" CssClass="submitbutton" OnClick="btnForgetPassword_Click" /></div>
                        <div class="s-12 l-5" style="margin-top:30px">
                            <asp:Label runat="server" Text="" style="color:#228B22">Per eliminare la Tua registrazione contattaci !<br /></asp:Label>
                            <asp:Label runat="server" Text="" style="color:#00B0F0">-<br /></asp:Label>
                            <asp:Label runat="server" Text="" style="color:#00B0F0">To cancel your registration contact us !</asp:Label>
                        </div>
                        <div class="s-12 l-5" style="margin-top: 80px"> <h2><asp:Label ID="Label1" Text="Proprietà" runat="server" ForeColor="#FFFFFF"></asp:Label></h2></div>
                         <div class="s-12 l-5" style="margin-top: 20px">
                             
                                    <asp:Label ID="lblpaypal" runat="server" data-toggle="tooltip" data-placement="top"></asp:Label>
                                    <asp:TextBox ID="txtpaypal" runat="server"></asp:TextBox>
                            </div>
                         <div class="s-12 l-5">
                                    <asp:Label ID="lblinfocom" runat="server" data-toggle="tooltip" data-placement="top" ></asp:Label>
                                    <asp:RadioButtonList ID="rgbinfocom" runat="server" RepeatDirection="Horizontal" class="required" message="Please select Accept the infocom">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <%--<asp:ListItem>No</asp:ListItem>--%>
                                    </asp:RadioButtonList>
                            </div>
                         <div class="s-12 l-5">
                                    <asp:Label ID="lblsponser" runat="server" data-toggle="tooltip" data-placement="top" ></asp:Label>
                                    <asp:RadioButtonList ID="rgbsponser" runat="server" RepeatDirection="Horizontal" class="required" message="Please select Accept the sponser">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <%--<asp:ListItem>No</asp:ListItem>--%>
                                    </asp:RadioButtonList>
                            </div>
                          <div class="s-12 l-5" style="margin-top: 60px">
                                    <asp:Label ID="lblcodice" runat="server"></asp:Label>
                                    <asp:TextBox ID="txtcodice" runat="server"></asp:TextBox>
                            </div>
                         <div class="s-12 l-5" style="margin-bottom: 86px">
                                    <asp:Label ID="lblncarta" runat="server"></asp:Label>
                                    <asp:TextBox ID="txtncarta" runat="server"></asp:TextBox>
                            </div>
                     
                             </div>
                         
                      
                  </div>
                  <div class="s-12 l-4" id="divbody" runat="server">
                     <h2><asp:Label ID="lblSignuptext" runat="server" ForeColor="#FFFFFF"></asp:Label></h2>
                     <div class="customform">                        
                        <div class="s-12 l-5"  style="background-color:black;padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblClubName" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtClubName" runat="server" data-val-required="true" message="Please enter Club Name"></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblClubLogo" runat="server" Text="" data-toggle="tooltip" data-placement="top"></asp:Label>
                            <asp:FileUpload ID="fuClubLogo" runat="server" style="float:left;" onchange="fuPP()" />
                             <asp:Image ID="impProfPic" runat="server" CssClass="roundimage" style="left:230px; position:absolute;" />
                             <asp:HiddenField ID="hdnpp" runat="server" />
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblContactPerson" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtContactPerson" runat="server" ></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblCompanyName" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtCompanyName" runat="server" ></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblVAT" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtVAT" runat="server" ></asp:TextBox>
                        </div>
                          <div class="s-12 l-5"  style="background-color:black;padding:0px 4px 0px 4px;">
                              <asp:UpdatePanel runat="server" ID="up1">
                                <ContentTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtEmail" runat="server" AutoPostBack="true" OnTextChanged="txtEmail_TextChanged" data-Emailval-required="true" message="Please enter Email"></asp:TextBox>
                            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                            </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                         <div class="s-12 l-5"  style="background-color:black;padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblPassword" runat="server" Text="" data-toggle="tooltip" data-placement="top"></asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" onkeypress="return IsAlphaNumeric(this, event);" data-val-required="true" message="Please enter Password"></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblCellPhone" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtCellphone" runat="server" ></asp:TextBox>
                        </div>
                         <div class="s-12 l-5"  style="background-color:black;padding:0px 4px 0px 4px;"> 
                            <asp:Label ID="lblNation" runat="server" Text=""></asp:Label>
                            <asp:DropDownList ID="ddNation" runat="server"></asp:DropDownList>
                        </div>
                         <div class="s-12 l-5" style="background-color:black; padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblCity" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtCity" runat="server" data-val-required="true" message="Please enter City Name" ></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblZip" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtZip" runat="server" ></asp:TextBox>
                        </div>
                          <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblStreet" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtStreet" runat="server" ></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblN" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtN" runat="server" ></asp:TextBox>
                        </div>
                         <%--<div class="s-12 l-5">
                            <asp:Label ID="lblShare" runat="server" Text="" data-toggle="tooltip" data-placement="top"></asp:Label>
                            <asp:RadioButtonList ID="rbShare" runat="server" RepeatDirection="Horizontal" class="required" message="Please select Share data in Internet">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>--%>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblWebsite" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtWebsite" runat="server" ></asp:TextBox>
                        </div>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblFederation" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtFederation" runat="server" ></asp:TextBox>
                        </div>
                         <%--<div class="s-12 l-5">
                            <asp:Label ID="lblSponsorBrand" runat="server" Text=""></asp:Label>
                            <asp:RadioButtonList ID="rbSponsorBrand" runat="server" RepeatDirection="Horizontal" class="required" message="Please select Score Sponsor Brand">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>--%>
                         <%--<div class="s-12 l-5">
                            <asp:Label ID="lblLookingSponsor" runat="server" Text=""></asp:Label>
                            <asp:RadioButtonList ID="rbLookingSponsor" runat="server" RepeatDirection="Horizontal" class="required" message="Please select Looking for Sponsor">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>--%>
                         <div class="s-12 l-5" style="padding:0px 4px 0px 4px;">
                            <asp:Label ID="lblInternationalBilliard" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtInternationalBilliard" runat="server" ></asp:TextBox>
                        </div>
                         <%--<div class="s-12 l-5">
                            <asp:Label ID="lblAmericanPoolBilliard" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtAmericanPoolBilliard" runat="server" data-val-required="true" message="Please enter N° Pool billiard"></asp:TextBox>
                        </div>--%>
                         <%-- <div class="s-12 l-5">
                            <asp:Label ID="lblSnookerBilliard" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="txtSnookerBilliard" runat="server" data-val-required="true" message="Please enter N° Snooker billiard"></asp:TextBox>
                        </div>--%>
                         <%--<div class="s-12 l-5">
                            <asp:Label ID="lblTelevisonImage" runat="server" Text="" data-toggle="tooltip" data-placement="top"></asp:Label>
                            <asp:RadioButtonList ID="rbTelevisonImage" runat="server" RepeatDirection="Horizontal" class="required" message="Please select Rights Television Image">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                             </asp:RadioButtonList>
                        </div>--%>
                         <div class="s-12 l-5"   style="background-color:black; left:-10px;width: 400px; padding:4px 104px 0px 14px;">
                            <asp:Label ID="lblTermandcondition" runat="server" Text=""></asp:Label>
                            <asp:RadioButtonList ID="rbTermandcondition" AutoPostBack="true" OnSelectedIndexChanged="onAckTypeChanged"  runat="server" RepeatDirection="Horizontal" class="required" message="Please select Accept the contract">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="s-4"  style="background-color:black; left:-10px;width:400px; padding:4px 204px 0px 14px;">
                            <asp:Button ID="btnSignup" runat="server" CssClass="submitbutton" OnClick="btnSignup_Click" OnClientClick="return statuscheck();" />
                            <asp:Button ID="btnSave" runat="server" CssClass="submitbutton" OnClick="btnSave_Click" OnClientClick="return statuscheck();" Visible="false" />
                            <asp:HiddenField ID="hdnClubId" runat="server" />
                           <div id="popupDiv" class="ontop">
                                <div id="popup">
                                    Registration is completed successfully. Please check you inbox also the spamming folder to activate the account. <br />
                                    <asp:Button ID="btnRedirect" runat="server" Text="Ok" CssClass="submitbutton" OnClick="btnRedirect_Click" />
                                </div>			                
		                    </div>
                        </div>
                     </div>
                  </div>                  
               </div>
            </div>
         </div>
          <iframe id="privacy" runat="server" src="privacy.html" style="position:fixed; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;"></iframe>
      </section>
      <!-- FOOTER -->   
      <footer>
         <div class="line">
            <div class="s-12 l-4">
               <p>&nbsp
               </p>
            </div>
             <div class="s-12 l-4">
               <asp:Image ID="footer" runat="server" ImageUrl="~/img/et.eBottom.png"/>
            </div>
            <div class="s-12 l-4">
               <p class="right">
               </p>
            </div>
         </div>
      </footer>
    </form>
</body></html>
