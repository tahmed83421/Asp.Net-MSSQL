using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;
using System.IO;
using System.ComponentModel;
using System.Configuration;

namespace BilliardScoreboard.Admin
{
    public partial class AdvAdmin : Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        string Adminid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Page.Header.DataBind();

            //if (Convert.ToString(Session["admin"]) == "Admin")
            //{
            if (!IsPostBack)
            {
                if (Session["adminuser"] == null)
                {
                    divinfo.Visible = false;
                    btnLogout.Visible = false;

                }
                else
                {
                    divinfo.Visible = true;
                    divlogin.Visible = false;
                    btnLogout.Visible = true;
                    btnLogin.Visible = false;
                    BindGrid();
                }
            }
            //using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            //{
            //    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM advertisement", con);
            //    DataSet ds = new DataSet();
            //    ad.Fill(ds);
            //    foreach (DataRow dtrow in ds.Tables[0].Rows)
            //    {
            //        Adminid = dtrow["AdvertisementId"].ToString().Trim();
            //        txtuserid.Text = dtrow["UserId"].ToString().Trim();
            //        txtpass.Text = dtrow["pass"].ToString().Trim();
            //        break;
            //    }
            //}
            //ClubPopulate();
            //rgClub.DataBind();
            //PlayerPopulate();
            //rgPlayer.DataBind();
            //    }
            //}
            //else
            //{
            //    //Response.Redirect("https://score.biliardoprofessionale.it/ClubRegistration.aspx");
            //}
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
            string query = "select * from advertisement as adv join AdvertisementUser as us on adv.UserId=us.UserId";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void Insert(object sender, EventArgs e)
        {
            //string name = txtName.Text;
            //string country = txtCountry.Text;
            //txtName.Text = "";
            //txtCountry.Text = "";
            //string query = "INSERT INTO Customers VALUES(@Name, @Country)";
            //string constr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand(query))
            //    {
            //        cmd.Parameters.AddWithValue("@Name", name);
            //        cmd.Parameters.AddWithValue("@Country", country);
            //        cmd.Connection = con;
            //        con.Open();
            //        cmd.ExecuteNonQuery();
            //        con.Close();
            //    }
            //}
            //this.BindGrid();
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int customerId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string query = "delete from Advertisement where AdvertisementId=" + customerId;
                string constr = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                this.BindGrid();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record deleted Successfully')", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record not deleted. Please try again')", true);
            }

        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void ClubPopulate()
        {
            //SqlDataAdapter da = new SqlDataAdapter("select * from Advertisement", con);
            //DataSet ds = new DataSet();
            //try
            //{
            //    da.Fill(ds, "Advertisement");
            //    rgClub.DataSource = ds;
            //    rgClub.DataBind();
            //}
            //catch (Exception e)
            //{
            //    Response.Write(e.Message);
            //}
            //finally
            //{
            //    ds.Dispose();
            //    da.Dispose();
            //    con.Dispose();
            //}


            //SqlCommand cmd1 = new SqlCommand();
            //cmd1.CommandType = CommandType.StoredProcedure;
            //cmd1.CommandText = "SelectDetails";
            //con.Open();
            //cmd1.Parameters.AddWithValue("@TableName", "Advertisement");
            //cmd1.Connection = con;
            //SqlDataAdapter da1 = new SqlDataAdapter();
            //da1.SelectCommand = cmd1;
            //DataSet ds1 = new DataSet();
            //da1.Fill(ds1);
            ////ds1.Tables[0].DefaultView.Sort = "RegisteredOn asc";
            ////DataTable dt= ds1.Tables[0].DefaultView.ToTable();
            //rgClub.DataSource = da1;

            //con.Close();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[2].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete " + item + "?')){ return false; };";
                    }
                }
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtuserid.Text == null || txtuserid.Text == string.Empty)
            {
                message.Text = "Please enter username";
            }
            else if (txtpass.Text == null || txtpass.Text == string.Empty)
            {
                message.Text = "Please enter password";
            }
            else
            {
                AdvUser user = new AdvUser();
                try
                {
                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {
                        string query = string.Empty;

                        using (SqlCommand cmd = new SqlCommand())
                        {
                            query = "select * from AdvertisementUser where Email='" + txtuserid.Text + "' and Password='" + txtpass.Text + "';";
                            cmd.CommandText = query;
                            cmd.Connection = con;
                            con.Open();
                            SqlDataReader dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                user.Company = dr["Company"].ToString();
                                user.Email = dr["Email"].ToString();
                                user.EmailForSale = dr["EmailForSale"].ToString();
                                user.UserId = Convert.ToInt32(dr["UserId"].ToString());
                                user.Vat = dr["Vat"].ToString();
                                user.Website = dr["Website"].ToString();
                                user.IsAdmin = Convert.ToBoolean(dr["IsAdmin"]);
                                if (user.IsAdmin == false)
                                {
                                    message.Text = "Not a admin user";
                                    notAdminUser.Visible = true;
                                }
                                else
                                {
                                    Session["adminuser"] = user;
                                    notAdminUser.Visible = false;
                                    divinfo.Visible = true;
                                    divlogin.Visible = false;
                                    btnLogout.Visible = true;
                                    btnLogin.Visible = false;
                                    errormessage.Visible = false;
                                    message.Text = string.Empty;
                                    Page.Header.DataBind();
                                    BindGrid();
                                }
                            }
                            if (user.UserId == 0)
                            {
                                message.Text = "User not found";
                                errormessage.Visible = true;
                            }
                            con.Close();

                        }

                    }
                }
                catch (Exception ex) { /*id = id + ex.ToString();*/ }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["adminuser"] = null;
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

        //protected void rgClub_ItemDataBound(object sender, GridItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item is GridDataItem)
        //        {
        //            GridDataItem dataItem = e.Item as GridDataItem;
        //            string contactName = dataItem["AdvertisementId"].Text;

        //            //for the Classic RenderMode
        //            //LinkButton button = dataItem["DeleteColumn"].Controls[0] as LinkButton;
        //            //button.Attributes["onclick"] = "return confirm('Are you sure you want to delete " +
        //            //    contactName + "?')";

        //            //for the Lightweight RenderMode
        //            ElasticButton button = dataItem["DeleteColumn"].Controls[0] as ElasticButton;
        //            button.Attributes["onclick"] = "if (!confirm('Are you sure you want to delete " +
        //    contactName + "?')) {return false;}";
        //        }
        //    }
        //    catch (Exception exp)
        //    {
        //    }
        //}
        //protected void RadGrid1_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        //{
        //    string ID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["AdvertisementId"].ToString();

        //    try
        //    {
        //        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        //        SqlCommand cmd = new SqlCommand("delete from Advertisement where AdvertisementId=" + ID, con);
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        ClubPopulate();
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record deleted Successfully')", true);
        //    }
        //    catch (Exception ex)
        //    {
        //        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record fail to deleted. Please try again')", true);
        //        Response.Write(ex.Message);
        //    }
        //    finally
        //    {
        //        con.Dispose();
        //    }
        //}
        //protected void rgPlayer_ItemDataBound(object sender, GridItemEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Item is GridDataItem)
        //        {

        //        }
        //        if (e.Item.ItemType == GridItemType.NestedView)
        //        {
        //            HiddenField hidPlayerId = (HiddenField)e.Item.FindControl("hidPlayerId");

        //            DataList dvPlayer = (DataList)e.Item.FindControl("dvPlayer");

        //            string PlayerId = hidPlayerId.Value;

        //            SqlCommand cmd = new SqlCommand("SELECT PlayerDetails.*,ClubDetails.ClubName FROM PlayerDetails LEFT JOIN ClubDetails ON ClubDetails.ClubId = PlayerDetails.ClubId WHERE PlayerId = " + PlayerId);
        //            SqlDataAdapter sda = new SqlDataAdapter();

        //            cmd.Connection = con;
        //            if (con.State == ConnectionState.Closed)
        //            {
        //                con.Open();
        //            }
        //            sda.SelectCommand = cmd;

        //            DataTable dt = new DataTable();
        //            sda.Fill(dt);

        //            var rowsToUpdate = dt.AsEnumerable().Where(r => r.Field<string>("PlayerPicture") == null);
        //            foreach (var row in rowsToUpdate)
        //            {
        //                row.SetField("PlayerPicture", "../img/NoImage.png");
        //            }
        //            dt.AcceptChanges();

        //            if (con.State == ConnectionState.Open)
        //            {
        //                con.Close();
        //            }

        //            if (dt.Rows.Count > 0)
        //            {
        //                dvPlayer.DataSource = dt;
        //                dvPlayer.DataBind();
        //            }
        //            else
        //            {
        //                dvPlayer.DataSource = null;
        //                dvPlayer.DataBind();
        //            }
        //        }
        //    }
        //    catch (Exception exp)
        //    {
        //    }
        //}

        //protected void rbClubStatus_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //RadioButtonList imgBtn = (RadioButtonList)sender;
        //    //DataListItem item = (DataListItem)imgBtn.NamingContainer;
        //    //int index = ((imgBtn.NamingContainer as DataListItem)).ItemIndex;
        //    //HiddenField hdnClubId = (HiddenField)item.FindControl("hdnCId");
        //    //RadioButtonList rbClubStatus = (RadioButtonList)item.FindControl("rbClubStatus");

        //    //SqlCommand cmd = new SqlCommand("UPDATE ClubDetails SET Status=@Status WHERE ClubId=@ClubId", con);
        //    //cmd.Parameters.AddWithValue("@Status", imgBtn.SelectedValue);
        //    //cmd.Parameters.AddWithValue("@ClubId", hdnClubId.Value);
        //    //con.Open();
        //    //cmd.ExecuteNonQuery();

        //    //if (imgBtn.SelectedValue == "Delete")
        //    //{
        //    //    SqlCommand cmd2 = new SqlCommand("DELETE FROM ClubDetails WHERE ClubId=@ClubId", con);
        //    //    cmd2.Parameters.AddWithValue("@ClubId", hdnClubId.Value);
        //    //    cmd2.ExecuteNonQuery();
        //    //}

        //    //con.Close();

        //    //ClubPopulate();
        //    //rgClub.DataBind();
        //}

        //protected void rgClub_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        //{
        //    //ClubPopulate();
        //}

        //protected void rgPlayer_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        //{
        //    //PlayerPopulate();
        //}

        //protected void rbPlayerStatus_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    RadioButtonList imgBtn = (RadioButtonList)sender;
        //    DataListItem item = (DataListItem)imgBtn.NamingContainer;
        //    int index = ((imgBtn.NamingContainer as DataListItem)).ItemIndex;
        //    HiddenField hdnPlayerId = (HiddenField)item.FindControl("hdnPId");

        //    SqlCommand cmd = new SqlCommand("UPDATE PlayerDetails SET Status=@Status WHERE PlayerId=@PlayerId", con);
        //    cmd.Parameters.AddWithValue("@Status", imgBtn.SelectedValue);
        //    cmd.Parameters.AddWithValue("@PlayerId", hdnPlayerId.Value);
        //    con.Open();
        //    cmd.ExecuteNonQuery();

        //    if (imgBtn.SelectedValue == "Delete")
        //    {
        //        SqlCommand cmd2 = new SqlCommand("DELETE FROM PlayerDetails WHERE PlayerId=@PlayerId", con);
        //        cmd2.Parameters.AddWithValue("@PlayerId", hdnPlayerId.Value);
        //        cmd2.ExecuteNonQuery();
        //    }

        //    con.Close();

        //    //PlayerPopulate();
        //    //rgPlayer.DataBind();
        //}

        //protected void lnkClubEmail_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        LinkButton lnkClubEmail = (LinkButton)sender;
        //        GridDataItem item = (GridDataItem)lnkClubEmail.NamingContainer;
        //        int rowId = Convert.ToInt32(item.ItemIndex);

        //        Label lblClubName = (Label)item.OwnerTableView.Items[rowId].FindControl("lblClubName");
        //        string body = string.Empty;
        //        using (StreamReader reader = new StreamReader(Server.MapPath("../EmailTemplate/MailTemplate.html")))
        //        {
        //            body = reader.ReadToEnd();
        //        }
        //        body = body.Replace("{Name}", lblClubName.Text);
        //        SendHtmlFormattedEmail(lnkClubEmail.Text.Trim(), "Biliardo Professionale test mail", body);
        //        ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "ShowPopup('Email sent successfully');", true);
        //    }
        //    catch (Exception ex)
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "ShowPopup('Error in Email sending, Please check the Email');", true);
        //    }
        //}

        //Email send
        //private void SendHtmlFormattedEmail(string recepientEmail, string subject, string body)
        //{
        //    try
        //    {
        //        using (MailMessage mailMessage = new MailMessage())
        //        {
        //            mailMessage.From = new MailAddress("info@biliardoprofessionale.it");
        //            mailMessage.Subject = subject;
        //            mailMessage.Body = body;
        //            mailMessage.IsBodyHtml = true;
        //            mailMessage.To.Add(new MailAddress(recepientEmail));
        //            SmtpClient smtp = new SmtpClient("smtp.biliardoprofessionale.it", 25);
        //            smtp.EnableSsl = false;
        //            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential("info@biliardoprofessionale.it", "sergio123");
        //            smtp.Credentials = NetworkCred;
        //            smtp.Send(mailMessage);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw (ex);
        //    }
        //}

        //protected void lblPlayerEmail_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        LinkButton lnkPlayerEmail = (LinkButton)sender;
        //        GridDataItem item = (GridDataItem)lnkPlayerEmail.NamingContainer;
        //        int rowId = Convert.ToInt32(item.ItemIndex);

        //        Label lblPlayerName = (Label)item.OwnerTableView.Items[rowId].FindControl("lblPlayerName");
        //        string body = string.Empty;
        //        using (StreamReader reader = new StreamReader(Server.MapPath("../EmailTemplate/MailTemplate.html")))
        //        {
        //            body = reader.ReadToEnd();
        //        }
        //        body = body.Replace("{Name}", lblPlayerName.Text);
        //        SendHtmlFormattedEmail(lnkPlayerEmail.Text.Trim(), "Biliardo Professionale test mail", body);
        //        ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "ShowPopup('Email sent successfully');", true);
        //    }
        //    catch (Exception ex)
        //    {
        //        ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "ShowPopup('Error in Email sending, Please check the Email');", true);
        //    }
        //}
    }
}