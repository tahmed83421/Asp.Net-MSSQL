<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey-admin.aspx.cs" Inherits="BilliardScoreboard.Survey_admin1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.3.min.js"></script>

</head>
<body style="background-color:black">
    <form id="form1" runat="server">
       
        <div style="border-bottom-style:groove; margin-top:100px; border-bottom-color:white"; ></div>


        <img  width="50%" style="margin-left:560px; margin-top:50px;" src="img/BigLogo.png" /><br /><br /><br />
           <div style="color:white;margin-left:550px; font-size:35px">
                <b>Votate con 1 click questo argomento  &nbsp;&nbsp;  n° 
                    <asp:Label ID="TopicNo" runat="server" Text="000"></asp:Label>
                     &nbsp;&nbsp;&nbsp;&nbsp;che si chiude il :
                    <asp:Label ID="DateTime" runat="server" Text="00/00/00"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;ore
                    <asp:Label ID="Ore" runat="server" Text="24"></asp:Label>
                </b>
                 <h1  style="margin-left:180px;"> <asp:Label ID="Question" runat="server" Text="preferite i panni verdi ?"></asp:Label></h1>
               <asp:Label ID="CountSI" runat="server"  style="color:green; margin-left:300px;"  Text="n°1235"></asp:Label>
                 <asp:Button ID="SI" runat="server" Text="SI"  BorderWidth="5"  style="border-radius:50%; width:70px; margin-left:00px; height:70px; background-image:url('../img/black.jpg'); border-color:green;  border:4; text-align:center;color:white;  font-size:25px;"     />
             <asp:Button ID="NO" runat="server" Text="NO"  BorderWidth="5"  style="border-radius:50%; width:70px; margin-left:100px; height:70px; background-image:url('../img/black.jpg'); border-color:red; border:4; text-align:center;color:white;  font-size:25px;"   />
              
                <asp:Label ID="CountNO" runat="server"  style="color:red;"  Text="n°355"></asp:Label>
               <asp:ImageButton ID="ImageButtonBill" style="margin-left:100px;" ImageUrl="../img/billActive.png" runat="server" />
                <br />
              </div>
        <br />
              <h3 style="text-align:center; margin-right:200px; font-size:35px; color:white;">Elenco argomenti chiusi</h3><br />
               
     <div style="text-align:center; font-size:35px; margin-left:400px;">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />
                </td>
                <td>
                    <asp:Label ID="ExpireLabel" runat="server" Text='<%# Eval("Expire") %>' />
                </td>
                <td>
                    <asp:Label ID="YesLabel" runat="server" Text='<%# Eval("Yes") %>' />
                </td>
                <td>
                    <asp:Label ID="NoLabel" runat="server" Text='<%# Eval("No") %>' />
                </td>
                <td>
                    <asp:Label ID="OreLabel" runat="server" Text='<%# Eval("Ore") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="TopicTextBox" runat="server" Text='<%# Bind("Topic") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ExpireTextBox" runat="server" Text='<%# Bind("Expire") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YesTextBox" runat="server" Text='<%# Bind("Yes") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NoTextBox" runat="server" Text='<%# Bind("No") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OreTextBox" runat="server" Text='<%# Bind("Ore") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="TopicTextBox" runat="server" Text='<%# Bind("Topic") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ExpireTextBox" runat="server" Text='<%# Bind("Expire") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YesTextBox" runat="server" Text='<%# Bind("Yes") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NoTextBox" runat="server" Text='<%# Bind("No") %>' />
                </td>
                <td>
                    <asp:TextBox ID="OreTextBox" runat="server" Text='<%# Bind("Ore") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />
                </td>
                <td>
                    <asp:Label ID="ExpireLabel" runat="server" Text='<%# Eval("Expire") %>' />
                </td>
                <td>
                    <asp:Label ID="YesLabel" runat="server" Text='<%# Eval("Yes") %>' />
                </td>
                <td>
                    <asp:Label ID="NoLabel" runat="server" Text='<%# Eval("No") %>' />
                </td>
                <td>
                    <asp:Label ID="OreLabel" runat="server" Text='<%# Eval("Ore") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">ID</th>
                                <th runat="server">Topic</th>
                                <th runat="server">Expire</th>
                                <th runat="server">Yes</th>
                                <th runat="server">No</th>
                                <th runat="server">Ore</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />
                </td>
                <td>
                    <asp:Label ID="ExpireLabel" runat="server" Text='<%# Eval("Expire") %>' />
                </td>
                <td>
                    <asp:Label ID="YesLabel" runat="server" Text='<%# Eval("Yes") %>' />
                </td>
                <td>
                    <asp:Label ID="NoLabel" runat="server" Text='<%# Eval("No") %>' />
                </td>
                <td>
                    <asp:Label ID="OreLabel" runat="server" Text='<%# Eval("Ore") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
         </asp:ListView>

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" DeleteCommand="DELETE FROM [Vote] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Vote] ([Topic], [Expire], [Yes], [No], [Ore]) VALUES (@Topic, @Expire, @Yes, @No, @Ore)" SelectCommand="SELECT [ID], [Topic], [Expire], [Yes], [No], [Ore] FROM [Vote]" UpdateCommand="UPDATE [Vote] SET [Topic] = @Topic, [Expire] = @Expire, [Yes] = @Yes, [No] = @No, [Ore] = @Ore WHERE [ID] = @ID">
             <DeleteParameters>
                 <asp:Parameter Name="ID" Type="Int32" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="Topic" Type="String" />
                 <asp:Parameter Name="Expire" Type="String" />
                 <asp:Parameter Name="Yes" Type="Int32" />
                 <asp:Parameter Name="No" Type="Int32" />
                 <asp:Parameter Name="Ore" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="Topic" Type="String" />
                 <asp:Parameter Name="Expire" Type="String" />
                 <asp:Parameter Name="Yes" Type="Int32" />
                 <asp:Parameter Name="No" Type="Int32" />
                 <asp:Parameter Name="Ore" Type="String" />
                 <asp:Parameter Name="ID" Type="Int32" />
             </UpdateParameters>
         </asp:SqlDataSource>

         </div>


           </form>


      <div style="border-bottom-style:groove;  margin-top:130px; border-bottom-color:white"; ></div>
</body>
</html>
