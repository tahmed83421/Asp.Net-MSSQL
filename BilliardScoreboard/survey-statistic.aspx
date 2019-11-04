<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="survey-statistic.aspx.cs" Inherits="BilliardScoreboard.survey_statistic" %>

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
           

          <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
              <AlternatingItemTemplate>
                  <tr style="background-color: black;color: white;">
                      <td>
                        n°  <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                      </td>
                      <td>
                    &nbsp;&nbsp;chiuso&nbsp;&nbsp;   <asp:Label ID="ExpireLabel" runat="server" Text='<%# Eval("Expire") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                      </td>
                      <td>
                          <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />&nbsp;&nbsp;
                      <td>
                          <asp:Label ID="YesLabel" runat="server" Text='<%# Eval("Yes") %>' />&nbsp; SI &nbsp;&nbsp;
                      </td>
                      <td>
                          <asp:Label ID="NoLabel" runat="server" Text='<%# Eval("No") %>' />&nbsp; NO
                      </td>
                  </tr>
              </AlternatingItemTemplate>
              <EditItemTemplate>
                  <tr style="background-color: black; color:white;">
                      <td>
                          <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                          <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                      </td>
                      <td>
                       n°   <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                      </td>
                      <td>
                          <asp:TextBox ID="ExpireTextBox" runat="server" Text='<%# Bind("Expire") %>' />
                      </td>
                      <td>
                          <asp:TextBox ID="TopicTextBox" runat="server" Text='<%# Bind("Topic") %>' />
                      </td>
                      <td>
                          <asp:TextBox ID="YesTextBox" runat="server" Text='<%# Bind("Yes") %>' />
                      </td>
                      <td>
                          <asp:TextBox ID="NoTextBox" runat="server" Text='<%# Bind("No") %>' />
                      </td>
                  </tr>
              </EditItemTemplate>
              <EmptyDataTemplate>
                  <table runat="server" style="background-color: black;border-collapse: collapse;border-color: white;border-style:none;border-width:1px;">
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
                          <asp:TextBox ID="ExpireTextBox" runat="server" Text='<%# Bind("Expire") %>' />
                      </td>
                      <td>
                          <asp:TextBox ID="TopicTextBox" runat="server" Text='<%# Bind("Topic") %>' />
                      </td>
                      <td>
                          <asp:TextBox ID="YesTextBox" runat="server" Text='<%# Bind("Yes") %>' />
                      </td>
                      <td>
                          <asp:TextBox ID="NoTextBox" runat="server" Text='<%# Bind("No") %>' />
                      </td>
                  </tr>
              </InsertItemTemplate>
              <ItemTemplate>
                  <tr style="background-color: black;color: white;">
                      <td>
                       n°   <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                      </td>
                      <td>
                         &nbsp;&nbsp;chiuso&nbsp;&nbsp; <asp:Label ID="ExpireLabel" runat="server" Text='<%# Eval("Expire") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                      </td>
                      <td>
                          <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />&nbsp;&nbsp;
                      </td>
                      <td>
                          <asp:Label ID="YesLabel" runat="server" Text='<%# Eval("Yes") %>' />&nbsp; SI &nbsp;&nbsp;
                      </td>
                      <td>
                          <asp:Label ID="NoLabel" runat="server" Text='<%# Eval("No") %>' />&nbsp; NO
                      </td>
                  </tr>
              </ItemTemplate>
              <LayoutTemplate>
                  <table runat="server">
                      <tr runat="server">
                          <td runat="server">
                              <table id="itemPlaceholderContainer" runat="server" border="0" style="background-color: black; color:white; border-collapse: collapse;border-color: #999999;border-style:none;border-width:0px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                  <tr runat="server" style="background-color: black;color: black">
                                      <th  runat="server">ID&nbsp;&nbsp</th>
                                      <th runat="server">Expire&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                      <th runat="server">Topic&nbsp;&nbsp;</th>
                                      <th runat="server">Yes&nbsp;&nbsp;</th>
                                      <th runat="server">No&nbsp;&nbsp;</th>
                                  </tr>
                                  <tr id="itemPlaceholder" runat="server">
                                  </tr>
                              </table>
                          </td>
                      </tr>
                      <tr runat="server">
                          <td runat="server" style="text-align: center;background-color: black;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
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
                  <tr style="background-color: black;font-weight: bold;color: white;">
                      <td>
                         n° <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                      </td>
                      <td>
                        &nbsp;&nbsp;  <asp:Label ID="ExpireLabel" runat="server" Text='<%# Eval("Expire") %>' />&nbsp;&nbsp;&nbsp;&nbsp;
                      </td>
                      <td>
                          <asp:Label ID="TopicLabel" runat="server" Text='<%# Eval("Topic") %>' />
                      </td>
                      <td>
                          <asp:Label ID="YesLabel" runat="server" Text='<%# Eval("Yes") %>' />
                      </td>
                      <td>
                          <asp:Label ID="NoLabel" runat="server" Text='<%# Eval("No") %>' />
                      </td>
                  </tr>
              </SelectedItemTemplate>
          </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [ID], [Expire], [Topic], [Yes], [No] FROM [Vote]"></asp:SqlDataSource>
            </div>
     
        <div style="border-bottom-style:groove;  margin-top:130px; border-bottom-color:white"; ></div>
       
    </form>
</body>
</html>

