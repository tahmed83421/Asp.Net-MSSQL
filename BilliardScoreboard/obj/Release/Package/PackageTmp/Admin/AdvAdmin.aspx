<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvAdmin.aspx.cs" Inherits="BilliardScoreboard.Admin.AdvAdmin" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/css/footable.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-footable/0.1.0/js/footable.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=GridView1]').footable();
        });
    </script>
    <!--[if lt IE 9]> 
    <script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script> 
    <![endif]-->
    <style type="text/css">
        td{
            vertical-align:top !important;
        }
        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }

            .pagination-ys table > tbody > tr > td {
                display: inline;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: #dd4814;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

        .Detailstbl {
            width: 100%;
        }

        th {
            border: none;
        }

        .Detailstbl td {
            width: 25%;
        }

        .message {
            background-size: 25px 25px;
            background-image: linear-gradient(135deg, rgba(255, 255, 255, .05) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .05) 50%, rgba(255, 255, 255, .05) 75%, transparent 75%, transparent);
            box-shadow: inset 0 -1px 0 rgba(255,255,255,.4);
            width: 100%;
            border: 1px solid;
            color: #fff;
            padding: 5px;
            position: fixed;
            _position: absolute;
            text-shadow: 0 1px 0 rgba(0,0,0,.5);
            animation: animate-bg 5s linear infinite;
            text-align: center;
        }

        .success {
            background-color: #68C735;
            border-color: #55a12c;
        }

        .message p {
            margin: 0;
        }

        .roundimage {
            height: 100px;
            width: 100px;
            border: none;
            border-radius: 0;
        }

        @keyframes animate-bg {
            from {
                background-position: 0 0;
            }

            to {
                background-position: -80px 0;
            }
        }

        .rgMasterTable {
            color: black !important;
        }

        #GridView1 {
            color: black;
        }

        #loader {
            position: absolute;
            left: 50%;
            top: 50%;
            z-index: 1;
            width: 150px;
            height: 150px;
            margin: -75px 0 0 -75px;
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            animation: spin 2s linear infinite;
        }

        #GridView1 > tbody > tr:last-child > td > table > tbody > tr > td {
            width: 10px;
        }

        table tr td, table tr th {
            padding: 0.625em 0.625em 0.625em 15px;
        }
    </style>

    <script language="javascript" type="text/javascript">
        var myMessages = ['success'];
        $(document).ready(function () {
            hideAllMessages()
        });
        function ShowPopup(stat) {
            showMessage('success', stat);
        }
        function HidePopup() {
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
</head>
<body class="size-1140">
    <form id="form1" runat="server">
        <div id="loader" style="display: none;"></div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section>
            <!-- FIRST BLOCK -->
            <div id="first-block" style="background-color: #FFFFFF">
                <div class="line" style="background-color: #FFFFFF">
                    <h2>Dashboard</h2>
                    <p class="subtitile">
                        Submited advertaising list              
                    </p>
                    <div class="margin">
                        <div class="s-12 margin-bottom" style="text-align: center;">
                            <h4>ADMIN:</h4>
                            <h5 id="errormessage" runat="server" visible="false" style="color:red;">User not found</h5>
                            <h5 id="notAdminUser" runat="server" visible="false" style="color:red;">Not a admin user</h5>
                            <asp:Label ID="message" Text="" runat="server" ForeColor="red"></asp:Label>
                            <div id="divlogin" runat="server">
                                <div>
                                <asp:Label ID="lbluserid" Text="ID &nbsp;" runat="server" ForeColor="Black"></asp:Label>
                                <asp:TextBox ID="txtuserid" runat="server" ForeColor="Black"></asp:TextBox>
                               </div>
                             <asp:Label ID="lblpass" Text="PW" runat="server" ForeColor="Black"></asp:Label>
                                <asp:TextBox ID="txtpass" TextMode="Password" runat="server" ForeColor="Black"></asp:TextBox>
                            </div>
                            <%--<asp:Button ID="btnAdminUpdate" runat="server" Text="Update" CssClass="logoutbutton" OnClick="btnLogout_Click" />--%>
                            <%--</div>
                        <div class="s-12 margin-bottom" style="text-align: right;">--%>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="logoutbutton" OnClick="btnLogin_Click" Width="110px" />
                            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logoutbutton" OnClick="btnLogout_Click" Width="110px" />
                        </div>
                        <div id="divinfo" runat="server" class="s-12 margin-bottom" style="text-align: left;">
                            <h3>Advertaisement List</h3>
                            <div id="dvGrid">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="overflow-y: scroll;">
                                    <ContentTemplate>
                                        <%--OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating"--%>
                                        <asp:GridView ID="GridView1" CssClass="footable" runat="server" AutoGenerateColumns="false" DataKeyNames="AdvertisementId" OnRowDataBound="OnRowDataBound"
                                            PageSize="10" AllowPaging="true" OnPageIndexChanging="OnPaging"
                                            OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
                                            Width="100%">
                                            <PagerStyle CssClass="pagination-ys" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Publication Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPublicationDate" runat="server" Text='<%# Eval("PublicationDate","{0:dd,MMM yyyy hh:mm tt}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("AdvertisementId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                                    </ItemTemplate>                                                    
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Password">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="  Image">
                                                    <ItemTemplate>
                                                        <%--imageonserver--%>
                                                        <%--<asp:Image ID="imgPP" runat="server" CssClass="roundimage" Style="border: 2px solid #CACACA" AlternateText="Player Picture" ImageUrl='<%# "/img/AdvImages/" + Eval("Img") %>' />--%>
                                                        <asp:Image ID="imgPP" runat="server" CssClass="roundimage" Style="border: 2px solid #CACACA" AlternateText="Player Picture" ImageUrl='<%# Eval("Img") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="  Discount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Discount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="  Text">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Text") %>' style="word-break: break-word;"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ButtonType="Link" ShowEditButton="false" ShowDeleteButton="true" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- FOOTER -->
        <%--<footer>
            <div class="line">
                <div class="s-12 l-6">
                    <p>
                        Copyright 2015, Billiard Professional
              
                    </p>
                </div>
                <div class="s-12 l-6">
                    <p class="right">
                        <a class="right" href="#" title="MS">Design and coding by MS</a>
                    </p>
                </div>
            </div>
        </footer>--%>
        <div class="success message">
            <p>
                <asp:Label ID="lblEmailStat" runat="server" />
            </p>
        </div>
    </form>
</body>
</html>
