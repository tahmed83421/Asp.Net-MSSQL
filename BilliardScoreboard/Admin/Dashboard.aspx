<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BilliardScoreboard.Admin.Dashboard" %>

<%--<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>--%>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" TagPrefix="ajax" %>

<!DOCTYPE html>

<html xmlns="https://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" />
    <link rel="stylesheet" href="../css/components.css">
    <link rel="stylesheet" href="../css/responsee.css">
    <link rel="stylesheet" href="../css/custom.css">
    <!-- CUSTOM STYLE -->
    <link rel="stylesheet" href="../css/template-style.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../js/modernizr.js"></script>
    <script type="text/javascript" src="../js/responsee.js"></script>
    <!--[if lt IE 9]> 
    <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
    <![endif]-->
    <style type="text/css">
        /*neeraj baghel data grid start*/
        .EU_TableScroll
        {
            max-height: 275px;
            overflow: auto;
            border:1px solid #ccc;
           
        }
        .EU_DataTable
        {
            border-collapse: collapse;
            width:100%;
        }
            .EU_DataTable tr th
            {
                background-color: #3c454f;
                color: #ffffff;
                padding: 10px 5px 10px 5px;
                border: 1px solid #cccccc;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                font-weight: normal;
                text-transform:capitalize;
            }
            .EU_DataTable tr:nth-child(2n+2)
            {
                background-color: #f3f4f5;
            }

            .EU_DataTable tr:nth-child(2n+1) td
            {
                background-color: #d6dadf;
                color: #454545;
            }
            .EU_DataTable tr td
            {
                padding: 5px 10px 5px 10px;
                color: #454545;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 11px;
                border: 1px solid #cccccc;
                vertical-align: middle;
            }
                .EU_DataTable tr td:first-child
                {
                    text-align: center;
                }
        /*neeraj baghel data grid end*/
        .Detailstbl {
            width: 100%;
        }
        .Detailstbl td {
            width:25%;
        }
        .message{
    background-size: 25px 25px;
    background-image: linear-gradient(135deg, rgba(255, 255, 255, .05) 25%, transparent 25%,
                        transparent 50%, rgba(255, 255, 255, .05) 50%, rgba(255, 255, 255, .05) 75%,
                        transparent 75%, transparent);                                      
     box-shadow: inset 0 -1px 0 rgba(255,255,255,.4);
     width: 100%;
     border: 1px solid;
     color: #fff;
     padding: 5px;
     position: fixed;
     _position: absolute;
     text-shadow: 0 1px 0 rgba(0,0,0,.5);
     animation: animate-bg 5s linear infinite;
     text-align:center;
}
        .success{
     background-color: #68C735;
     border-color: #55a12c;
}
.message p{
     margin: 0;                                                  
}

@keyframes animate-bg {
    from {
        background-position: 0 0;
    }
    to {
       background-position: -80px 0;
    }
}
    </style>
    <script language="javascript" type="text/javascript">
        var myMessages = ['success'];
        $(document).ready(function () {
            hideAllMessages()
        });
        function ShowPopup(stat) {
            showMessage('success',stat);
        }
        function HidePopup(){
            $(this).animate({ top: -$(this).outerHeight() }, 500);
        }
        function showMessage(type, stat) {
            document.getElementById("<%#lblEmailStat.ClientID%>").innerHTML = stat;
            $('.success').css('top', '0px');            
            $('.' + type).fadeIn(500).delay(1000).fadeOut(2500);
        }
        function hideAllMessages() {
            var messagesHeights = new Array(); // this array will store height for each

            for (i = 0; i < 1; i++) {
                messagesHeights[i] = $('.success').outerHeight(); // fill array
                $('.success').css('top', -messagesHeights[i]); //move element outside viewport     
            }
        }
        function ChangeValue(item) {
            if (confirm(item))
                setTimeout('__doPostBack(\'' + item.id + '\',\'' + item.value + '\')', 0);
            else
                return false;
        }
    </script>

        <link rel="Stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>


<script>
    $(document).ready(function () {
        $('#MyTable').DataTable({
            initComplete: function () {
                this.api().columns().every(function () {
                    var column = this;
                    var select = $('<select><option value=""></option></select>')
                        .appendTo($(column.footer()).empty())
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );
                            //to select and search from grid
                            column
                                .search(val ? '^' + val + '$' : '', true, false)
                                .draw();
                        });

                    column.data().unique().sort().each(function (d, j) {
                        select.append('<option value="' + d + '">' + d + '</option>')
                    });
                });
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('#MyTable2').DataTable({
            initComplete: function () {
                this.api().columns().every(function () {
                    var column = this;
                    var select = $('<select><option value=""></option></select>')
                        .appendTo($(column.footer()).empty())
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );
                            //to select and search from grid
                            column
                                .search(val ? '^' + val + '$' : '', true, false)
                                .draw();
                        });

                    column.data().unique().sort().each(function (d, j) {
                        select.append('<option value="' + d + '">' + d + '</option>')
                    });
                });
            }
        });
    });
</script>

</head>
<body class="size-1140">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section>
            <!-- FIRST BLOCK -->
            <div id="first-block" style="background-color: #FFFFFF">
                <div class="line">
                    <h2>Dashboard</h2>
                    <p class="subtitile">
                       Club and Player User Details              
                    </p>
                    <div class="margin">
                        <div class="s-12 margin-bottom" style="text-align:center;">
                        <asp:Button id="btnpnladmin" runat="server" Text="Admin Details" OnClick="btnpnladmin_Click"/>
                        <asp:Button id="btnpnlclub" runat="server" Text="Club Details" OnClick="btnpnlclub_Click"/>
                        <asp:Button id="btnpnlplayer" runat="server" Text="Player Details" OnClick="btnpnlplayer_Click"/>    
                        </div>
                        <div id="pnldivadmindetails" runat="server" class="s-12 margin-bottom" style="text-align:center;">
                          <h4>ADMIN:</h4>  
                             <asp:Label ID="lbluserid" Text="ID" runat="server" ForeColor="Black" ></asp:Label>
                             <asp:TextBox ID="txtuserid" runat="server" ForeColor="Black"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             <asp:Label ID="lblpass" Text="PW" runat="server" ForeColor="Black" ></asp:Label>
                             <asp:TextBox ID="txtpass" runat="server" ForeColor="Black"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <asp:Button ID="btnLogout" runat="server" Text="Update/Logout" CssClass="logoutbutton" OnClick="btnLogout_Click" Width="110px" />
                        </div>
                        <div id="pnldivclubdetails" runat="server"  class="s-12 margin-bottom" style="text-align: left;">
                            <h3>Club Details</h3>
                         
                            <div id="pnldivindclub" runat="server" style="color: black;"> </div>
                             <div class="line"></div>
                                                                                      
                               <table id="MyTable" runtat="server" style="color:black;font-size: 10px;" class="display" cellspacing="0" width="100%">
        <thead>
         <tr>
             
                
			    <th>Name</th>
                <th>Contact Person</th>
                <th>Company Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Phone</th>
                <th>Nation</th>
                <th>City</th>
                <th>Federation</th>
                <th>Registered On</th>
                <th>Status</th>
               <th>View</th>
		</tr>
            
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
               
            </tr>
        </tfoot>
        <tbody  ID="pnlclubbody" runat="server" >
            
        </tbody>
    </table>

                        </div>
                        <div id="pnldivplayerdetails" runat="server"  class="s-12 margin-bottom" style="text-align: left;">
                            <h3>Player Details</h3>
                            <div id="pnldivindplayer" runat="server" style="color:black;"> </div> 
                                     <table id="MyTable2"  style="color:black;font-size: 10px;" class="display" cellspacing="0" width="100%">
        <thead>
         <tr>
			<th>Name</th><th>Gender</th><th>Email</th><th>Password</th><th>Phone</th><th>Nation</th><th>City</th><th>Category</th><th>Registered</th><th>Status</th><th>Expiry date</th><th>Club</th><th>View</th>
		</tr>
            
        </thead>
        <tfoot>
            <tr>
                <th>Name</th>
               
            </tr>
        </tfoot>
        <tbody  ID="pnlplayerbody" runat="server" >
            
        </tbody>
    </table>
                             
                                <%--<ItemTemplate>
                                        <table class="Detailstbl" >
                                            <tr>
                                                <td>Family Name : <asp:Label ID="FamilyName" Text='<%# Eval("FamilyName") %>' runat="server" /></td>
                                                <td>Club Membership : <asp:Label ID="ClubName" Text='<%# Eval("ClubName") %>' runat="server" /></td>
                                                <td>Country : <asp:Label ID="Nation" Text='<%# Eval("Nation") %>' runat="server" /></td>
                                                <td>Password : <asp:Label ID="lblPassword" Text='<%# Eval("Password") %>' runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>City : <asp:Label ID="City" Text='<%# Eval("City") %>' runat="server" /></td>
                                                <td>Zip : <asp:Label ID="Zip" Text='<%# Eval("Zip") %>' runat="server" /></td>
                                                <td>Street : <asp:Label ID="Street" Text='<%# Eval("Street") %>' runat="server" /></td>
                                                <td rowspan="4" style="text-align:center;">
                                                    <asp:Image ID="imgPP" runat="server" Height="151px" Width="125px" AlternateText="Player Picture" ImageUrl='<%# "../" + Eval("PlayerPicture") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Fiscal Code : <asp:Label ID="VatNo" Text='<%# Eval("VatNo") %>' runat="server" /></td>
                                                <td>Phone : <asp:Label ID="Phone" Text='<%# Eval("Phone") %>' runat="server" /></td>
                                                <td>Cell : <asp:Label ID="Cell" Text='<%# Eval("Cell") %>' runat="server" /></td>                                                   
                                            </tr>
                                            <tr>
                                                <td>PayPal account: <asp:Label ID="Label3" Text='<%# Eval("nbpaypal") %>' runat="server" /></td>
                                                <td>Personal Web Site : <asp:Label ID="Label4" Text='<%# Eval("ClubWebsite") %>' runat="server" /></td>
                                                <td>N° : <asp:Label ID="Label1" Text='<%# Eval("NDegree") %>' runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>Federation Membership : <asp:Label ID="Label5" Text='<%# Eval("FederationMembership") %>' runat="server" /></td>
                                                <td>Category Level : <asp:Label ID="Label6" Text='<%# Eval("Category") %>' runat="server" /></td>
                                                <td>Game Speciality : <asp:Label ID="Label7" Text='<%# Eval("GameSpeciality") %>' runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>n° CF Owner : <asp:Label ID="Label8" Text='<%# Eval("nbcodice") %>' runat="server" /></td>
                                                <td>n° CI Owner : <asp:Label ID="Label9" Text='<%# Eval("nbncarta") %>' runat="server" /></td>
                                                <td>Expiry Date : <asp:Label ID="Label10" Text='<%# Eval("nbexpirydate") %>' runat="server" /></td>
                                                <td>
                                                    Status : 
                                                    <asp:RadioButtonList ID="rbPlayerStatus" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" SelectedValue='<%# Eval("Status") %>' OnSelectedIndexChanged="rbPlayerStatus_SelectedIndexChanged">
                                                        <asp:ListItem onclick="return ChangeValue('Are you sure you want to Active this account?')">Active</asp:ListItem>
                                                        <asp:ListItem onclick="return ChangeValue('Are you sure you want to Stop this account?')">Stop</asp:ListItem>
                                                        <asp:ListItem onclick="return ChangeValue('Are you sure you want to Delete this account?')">Delete</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:HiddenField ID="hdnPId" runat="server" Value='<%# Eval("PlayerId") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>--%>
                        </div>
                   </div>
                </div>
            </div>
            <div class="line"></div>
        </section>
        <!-- FOOTER -->
        <footer>
            <div class="line">
                <div class="s-12 l-6">
                    <p>
                        Copyright 2019, Billiard Professional
              
                    </p>
                </div>
                
            </div>
        </footer>
            
        <div class="success message">
         <p>
             <asp:Label ID="lblEmailStat" runat="server" />
         </p>
        </div>
    </form>
</body>
</html>
