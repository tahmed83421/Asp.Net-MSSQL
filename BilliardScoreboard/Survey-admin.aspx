<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey-admin.aspx.cs" Inherits="BilliardScoreboard.Survey_admin1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
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
<body style="background-color:black">
    <form id="form1" runat="server">
       
          <div class="center-screen" style="font-size:30px;" style="text-align:center;">
            
                  

        <img  width="50%" style=" margin-top:50px;" src="img/BigLogo.png" /><br /><br /><br />
  
     
              <h3 style="text-align:center;  font-size:35px; color:white;">Elenco argomenti chiusi</h3><br />

                  <!-- Insert Topic -->
              <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
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
                              <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
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
                              <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
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
                              <asp:TextBox ID="StartDateTextBox" runat="server" Text='<%# Bind("StartDate") %>' />
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
                              <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
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
                                          <th runat="server">StartDate</th>
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
                              <asp:Label ID="StartDateLabel" runat="server" Text='<%# Eval("StartDate") %>' />
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

                  
  
   

                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" DeleteCommand="DELETE FROM [Vote] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Vote] ([Topic], [StartDate], [Expire], [Yes], [No], [Ore]) VALUES (@Topic, @StartDate, @Expire, @Yes, @No, @Ore)" SelectCommand="SELECT [ID], [Topic], [StartDate], [Expire], [Yes], [No], [Ore] FROM [Vote]" UpdateCommand="UPDATE [Vote] SET [Topic] = @Topic, [StartDate] = @StartDate, [Expire] = @Expire, [Yes] = @Yes, [No] = @No, [Ore] = @Ore WHERE [ID] = @ID">
                                 <DeleteParameters>
                                     <asp:Parameter Name="ID" Type="Int32" />
                                 </DeleteParameters>
                                 <InsertParameters>
                                     <asp:Parameter Name="Topic" Type="String" />
                                     <asp:Parameter Name="StartDate" Type="String" />
                                     <asp:Parameter Name="Expire" Type="String" />
                                     <asp:Parameter Name="Yes" Type="Int32" />
                                     <asp:Parameter Name="No" Type="Int32" />
                                     <asp:Parameter Name="Ore" Type="String" />
                                 </InsertParameters>
                                 <UpdateParameters>
                                     <asp:Parameter Name="Topic" Type="String" />
                                     <asp:Parameter Name="StartDate" Type="String" />
                                     <asp:Parameter Name="Expire" Type="String" />
                                     <asp:Parameter Name="Yes" Type="Int32" />
                                     <asp:Parameter Name="No" Type="Int32" />
                                     <asp:Parameter Name="Ore" Type="String" />
                                     <asp:Parameter Name="ID" Type="Int32" />
                                 </UpdateParameters>
              </asp:SqlDataSource>

                  
  
   

                             <!-- Insert Topic END -->     <br />
                   <asp:Button ID="ClearCokies" runat="server" style="text-align:center;color:white;background-color:black"  Text="Clear MAC" OnClick="ClearCokies_Click" />
                     
                  <br />


                       <div style="text-align:center">       
                      <asp:TextBox ID="txtTopic" placeholder=" Write you Topic here" runat="server" Width="316px" ></asp:TextBox>
                     <asp:TextBox ID="txtStartDate" placeholder=" Topic Start Date" runat="server" Width="146px" AutoPostBack="False" OnTextChanged="txtStartDate_TextChanged" ReadOnly="True"></asp:TextBox>
<asp:ImageButton ID="ImageButton1" ImageUrl="https://p7.hiclipart.com/preview/65/293/189/computer-icons-google-calendar-time-attendance-clocks-calendar-date-others.jpg" Width="20px" runat="server" OnClick="ImageButton1_Click" /><asp:TextBox ID="txtExpire" placeholder="Topic Expires mm/dd/yyyy" runat="server" ReadOnly="True" Width="173px"></asp:TextBox>
                       <asp:ImageButton ID="ImageButton2" ImageUrl="https://p7.hiclipart.com/preview/65/293/189/computer-icons-google-calendar-time-attendance-clocks-calendar-date-others.jpg" Width="20px" runat="server" OnClick="ImageButton2_Click" />
                       <asp:Button ID="btnInsert" runat="server" Text="Insert Topic" BackColor="Black" BorderColor="Red" ForeColor="White" OnClick="btnInsert_Click" Width="139px" />
                     
                       <asp:Calendar ID="Calendar1" runat="server" Format="dd/MM/yyyy" Enabled="true"  Visible="false" style="text-align:center;" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
                          <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                          <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                          <OtherMonthDayStyle ForeColor="#CC9966" />
                          <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                          <SelectorStyle BackColor="#FFCC66" BorderColor="Maroon" />
                          <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                          <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                      </asp:Calendar>
                </div> 
                     </div>
       
           </form>


    
</body>
</html>
