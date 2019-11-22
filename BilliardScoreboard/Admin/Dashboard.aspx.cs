using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
//using Telerik.Web.UI;
using System.Net.Mail;
using System.IO;
using System.ComponentModel;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.Services;

namespace BilliardScoreboard.Admin
{
    public partial class Dashboard : System.Web.UI.Page{
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        string Adminid = "";
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();
            
            if (Convert.ToString(Session["admin"]) == "Admin")
            {
                if (!IsPostBack)
                {
                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {
                        SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM AdminDetails", con);
                        DataSet ds = new DataSet();
                        ad.Fill(ds);
                        foreach (DataRow dtrow in ds.Tables[0].Rows)
                        {
                            Adminid = dtrow["id"].ToString().Trim();
                            txtuserid.Text = dtrow["userid"].ToString().Trim();
                            txtpass.Text = dtrow["pass"].ToString().Trim();
                            break;

                        }
                        Session["clubid"] = null;
                        Session["playerid"] = null;
                    }
                    
                   pnldivplayerdetails.Visible = pnldivadmindetails.Visible= false;
                }
                   ClubPopulate();

                    PlayerPopulate();
                    if (Session["clubid"] != null)
                    {
                        string hdnclubid=Convert.ToString(Session["clubid"]);
                        clubdetailsshow(hdnclubid);
                    }
                    if (Session["playerid"] != null)
                    {
                        string hdnplayerid = Convert.ToString(Session["playerid"]);
                        playerdetailsshow(hdnplayerid);
                       
                    }
                
                }
                
            else
            {
                Response.Redirect("https://score.biliardoprofessionale.it/ClubRegistration.aspx");
            }
        }
        protected void ClubPopulate()
        {
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.CommandText = "SelectDetails";
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd1.Parameters.AddWithValue("@TableName", "Club");
            cmd1.Connection = con;
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            ds1.Tables[0].DefaultView.Sort = "RegisteredOn asc";
            DataTable dt= ds1.Tables[0].DefaultView.ToTable();

            
            dt.Columns.Remove("VatNo");
            dt.Columns.Remove("Zip");
            dt.Columns.Remove("ClubLogo");
            
            dt.Columns.Remove("Nbpaypal");
            dt.Columns.Remove("Cell");

            dt.Columns.Remove("NDegree");
            dt.Columns.Remove("InternationalBilliard");
            dt.Columns.Remove("ClubWebsite");
            dt.Columns.Remove("ShareData");
            dt.Columns.Remove("ScoreSponsorBrand");
            dt.Columns.Remove("LookingForSponsor");
            dt.Columns.Remove("AmericanPoolBilliard");
            dt.Columns.Remove("SnookerBilliard");
            dt.Columns.Remove("RightsTelevisionImage");
            dt.Columns.Remove("Street");
            dt.Columns.Remove("Nbinfo");
            dt.Columns.Remove("Nbsponser");
            dt.Columns.Remove("Nbcodice");
            dt.Columns.Remove("Nbncatra");

            pnlclubbody.Controls.Clear();
            foreach (DataRow myRow in dt.Rows)  
            {
                    TableRow ttr = new TableRow();
                    TableCell ttc = new TableCell();
                    

                    for (int i = 1; i < dt.Columns.Count;i++ )
                    {
                         ttc  = new TableCell();
                        ttc.Text = myRow[i].ToString();
                        ttr.Controls.Add(ttc);
                    }

                    Button btn = new Button();
                    btn.ID = "Button" + myRow[0].ToString();
                    btn.ToolTip = myRow[0].ToString();
                    btn.Text = "View";
                    btn.Click += btn_Click;
                    ttc = new TableCell();
                    ttc.Controls.Add(btn);
                    ttr.Controls.Add(ttc);
                   pnlclubbody.Controls.Add(ttr);
                }     
            
            con.Close();
        }
        public void clubdetailsshow(string ClubId)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM ClubDetails WHERE ClubId = " + ClubId);
            SqlDataAdapter sda = new SqlDataAdapter();

            cmd.Connection = con;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            sda.SelectCommand = cmd;

            DataTable dt = new DataTable();
            sda.Fill(dt);

            pnldivindclub.Controls.Clear();

            Table ttb = new Table();
            ttb.CssClass = "Detailstbl";
            ttb.Style.Add("color", "black");

            TableRow ttr = new TableRow();
            TableCell ttc = new TableCell();
            ttc.Text = "Name : " + dt.Rows[0]["ClubName"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Contact Person : " + dt.Rows[0]["ContactPerson"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Email : " + dt.Rows[0]["Email"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Password : " + dt.Rows[0]["Password"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "Vat No : " + dt.Rows[0]["VatNo"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Country : " + dt.Rows[0]["Nation"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "City : " + dt.Rows[0]["City"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.RowSpan = 3;
            ttc.Style.Add("text-align", "center");
            Image imgPP = new Image();
            imgPP.CssClass = "roundimage";
            imgPP.ImageUrl = "../" + dt.Rows[0]["ClubLogo"].ToString(); ttc.Controls.Add(imgPP); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "Zip : " + dt.Rows[0]["Zip"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Street : " + dt.Rows[0]["Street"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "N° : " + dt.Rows[0]["NDegree"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "PayPal account : " + dt.Rows[0]["nbpaypal"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Personal Web Site : " + dt.Rows[0]["ClubWebsite"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Federation Membership :" + dt.Rows[0]["FederationMembership"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "n° CF Owner : " + dt.Rows[0]["nbcodice"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "n° CI Owner : " + dt.Rows[0]["nbncatra"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "N° Inter. billiard : " + dt.Rows[0]["InternationalBilliard"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Status : ";

            RadioButtonList rbClubStatus = new RadioButtonList();

            rbClubStatus.RepeatDirection = RepeatDirection.Horizontal;
            rbClubStatus.Items.Add(new ListItem("Active"));
            rbClubStatus.Items.Add(new ListItem("Stop"));
            rbClubStatus.Items.Add(new ListItem("Delete"));
            rbClubStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
            rbClubStatus.SelectedIndexChanged += rbClubStatus_SelectedIndexChanged;
            rbClubStatus.AutoPostBack = true;

            
            //HiddenField hdnCId = new HiddenField();
            //hdnCId.Value = ClubId;

            ttc.Controls.Add(rbClubStatus);
            //ttc.Controls.Add(hdnCId);

            ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            pnldivindclub.Controls.Add(ttb);
        }
        void btn_Click(object sender, EventArgs e)
        {

            string ClubId = ((Button)sender).ToolTip;
            Session["clubid"] = ClubId;
            clubdetailsshow(ClubId);
           
        }
        public void playerdetailsshow(string PlayerId)
        {
            SqlCommand cmd = new SqlCommand("SELECT PlayerDetails.*,ClubDetails.ClubName FROM PlayerDetails	LEFT JOIN ClubDetails ON ClubDetails.ClubId = PlayerDetails.ClubId	WHERE PlayerDetails.PlayerId =  " + PlayerId);
            SqlDataAdapter sda = new SqlDataAdapter();


            cmd.Connection = con;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            sda.SelectCommand = cmd;

            DataTable dt = new DataTable();
            sda.Fill(dt);

            pnldivindplayer.Controls.Clear();

            Table ttb = new Table();
            ttb.CssClass = "Detailstbl";
            ttb.Style.Add("color", "black");

            TableRow ttr = new TableRow();
            TableCell ttc = new TableCell();
            ttc.Text = "Name : " + dt.Rows[0]["Name"].ToString() + " " + dt.Rows[0]["familyname"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Club : " + dt.Rows[0]["Clubname"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Email : " + dt.Rows[0]["Email"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Password : " + dt.Rows[0]["Password"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "Country : " + dt.Rows[0]["Nation"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "City : " + dt.Rows[0]["City"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Zip : " + dt.Rows[0]["Zip"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.RowSpan = 3;
            ttc.Style.Add("text-align", "center");
            Image imgPP = new Image();
            imgPP.CssClass = "roundimage";
            imgPP.ImageUrl = "../" + dt.Rows[0]["PlayerPicture"].ToString(); ttc.Controls.Add(imgPP); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "Street : " + dt.Rows[0]["Street"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Phone : " + dt.Rows[0]["Phone"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Cell : " + dt.Rows[0]["Cell"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();

            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "PayPal account : " + dt.Rows[0]["nbpaypal"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Personal Web Site : " + dt.Rows[0]["ClubWebsite"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "N° : " + dt.Rows[0]["NDegree"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();

            ttc.Text = "Federation Membership : " + dt.Rows[0]["FederationMembership"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Category Level : " + dt.Rows[0]["Category"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Game Speciality : " + dt.Rows[0]["GameSpeciality"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Fiscal Code : " + dt.Rows[0]["VatNo"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();

            ttb.Controls.Add(ttr); ttr = new TableRow();


            ttc.Text = "n° CF Owner : " + dt.Rows[0]["nbcodice"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "n° CI Owner : " + dt.Rows[0]["nbncarta"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Expiry Date : " + dt.Rows[0]["nbexpirydate"].ToString(); ttr.Controls.Add(ttc); ttc = new TableCell();
            ttc.Text = "Status : ";

            RadioButtonList rbPlayerStatus = new RadioButtonList();
            rbPlayerStatus.AutoPostBack = true;
            rbPlayerStatus.RepeatDirection = RepeatDirection.Horizontal;
            rbPlayerStatus.Items.Add(new ListItem("Active"));
            rbPlayerStatus.Items.Add(new ListItem("Stop"));
            rbPlayerStatus.Items.Add(new ListItem("Delete"));

            rbPlayerStatus.SelectedValue = dt.Rows[0]["Status"].ToString();
            rbPlayerStatus.SelectedIndexChanged += rbPlayerStatus_SelectedIndexChanged;



            //HiddenField hdnCId = new HiddenField();
            //hdnCId.Value = PlayerId;

            ttc.Controls.Add(rbPlayerStatus);
            //ttc.Controls.Add(hdnCId);
            ttr.Controls.Add(ttc); ttc = new TableCell();
            ttb.Controls.Add(ttr); ttr = new TableRow();


            pnldivindplayer.Controls.Add(ttb);

        }
        void btn2_Click(object sender, EventArgs e)
        {
            string PlayerId = ((Button)sender).ToolTip;
            Session["playerid"] = PlayerId;
            playerdetailsshow(PlayerId);
           
        }
        protected void PlayerPopulate()
        {
            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.CommandText = "SelectDetails";
            cmd2.Parameters.AddWithValue("@TableName", "Player");
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd2.Connection = con;
            SqlDataAdapter da2 = new SqlDataAdapter();
            da2.SelectCommand = cmd2;
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            ds2.Tables[0].DefaultView.Sort = "RegisteredOn asc";
            DataTable dt = ds2.Tables[0].DefaultView.ToTable();

           
            dt.Columns.Remove("ClubId");
            dt.Columns.Remove("PlayerPicture");
            dt.Columns.Remove("VatNo");
           
            dt.Columns.Remove("Cell");
            dt.Columns.Remove("Zip");
            dt.Columns.Remove("Street");
            dt.Columns.Remove("NDegree");
            dt.Columns.Remove("ShareData");
            dt.Columns.Remove("ClubWebsite");
            dt.Columns.Remove("FederationMembership");
            dt.Columns.Remove("ScoreSponsor");
            dt.Columns.Remove("LookingForSponsor");
            dt.Columns.Remove("RightsTelevisionImage");
            dt.Columns.Remove("Login");
            dt.Columns.Remove("Nbpaypal");
            dt.Columns.Remove("Nbinfo");
            dt.Columns.Remove("Nbsponser");
            dt.Columns.Remove("Nbiscri");
            dt.Columns.Remove("Nbcodice");
            dt.Columns.Remove("Nbncarta");
            dt.Columns.Remove("NbEmailVerify");
            dt.Columns.Remove("GameSpeciality");

            pnlplayerbody.Controls.Clear();

            foreach (DataRow myRow in dt.Rows)
            {
                TableRow ttr = new TableRow();
                TableCell ttc = new TableCell();


                for (int i = 2; i < dt.Columns.Count; i++)
                {

                    ttc = new TableCell();
                    if (i == 2)
                        ttc.Text = myRow[2].ToString() +" "+ myRow[1].ToString();
                    else ttc.Text = myRow[i].ToString();
                    ttr.Controls.Add(ttc);
                }

                Button btn = new Button();
                btn.ID = "Button" + myRow[0].ToString();
                btn.ToolTip = myRow[0].ToString();
                btn.Text = "View";
                btn.Click += btn2_Click;
                ttc = new TableCell();
                ttc.Controls.Add(btn);
                ttr.Controls.Add(ttc);
                pnlplayerbody.Controls.Add(ttr);
            }

            con.Close();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
         
                SqlCommand cmd = new SqlCommand("UPDATE AdminDetails SET userid=@userid, pass=@pass", con);
                cmd.Parameters.AddWithValue("@id", Adminid.Trim());
                cmd.Parameters.AddWithValue("@userid", txtuserid.Text.Trim());
                cmd.Parameters.AddWithValue("@pass", txtpass.Text.Trim());
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                cmd.ExecuteNonQuery();
            
            Session["admin"] = null;
            Response.Redirect("https://score.biliardoprofessionale.it/ClubRegistration.aspx");
        }
        protected void btnpnladmin_Click(object sender, EventArgs e)
        {
            
            pnldivadmindetails.Visible = true;
            pnldivclubdetails.Visible = false;
            pnldivplayerdetails.Visible = false;
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM AdminDetails", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {
                    Adminid = dtrow["id"].ToString().Trim();
                    txtuserid.Text = dtrow["userid"].ToString().Trim();
                    txtpass.Text = dtrow["pass"].ToString().Trim();
                    break;
                }
            }

        }
        protected void btnpnlclub_Click(object sender, EventArgs e)
        {

            pnldivadmindetails.Visible = false;
            pnldivclubdetails.Visible = true;
            pnldivplayerdetails.Visible = false;
            Session["clubid"] = null;
            pnldivindclub.Controls.Clear();

        }
        protected void btnpnlplayer_Click(object sender, EventArgs e)
        {

            pnldivadmindetails.Visible = false;
            pnldivclubdetails.Visible = false;
            pnldivplayerdetails.Visible = true;
            Session["playerid"] = null;

            pnldivindplayer.Controls.Clear();
        }
        protected void rbClubStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList imgBtn = (RadioButtonList)sender;
            
            SqlCommand cmd = new SqlCommand("UPDATE ClubDetails SET Status=@Status WHERE ClubId=@ClubId", con);
            cmd.Parameters.AddWithValue("@Status", imgBtn.SelectedValue);
            cmd.Parameters.AddWithValue("@ClubId", Convert.ToString(Session["clubid"]));
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();

            if (imgBtn.SelectedValue == "Delete")
            {
                SqlCommand cmd2 = new SqlCommand("DELETE FROM ClubDetails WHERE ClubId=@ClubId", con);
                cmd2.Parameters.AddWithValue("@ClubId", Convert.ToString(Session["clubid"]));
                cmd2.ExecuteNonQuery();
                pnldivindclub.Controls.Clear();
                Session["clubid"] = null;
            }

            con.Close();
            ClubPopulate();
            
        }
        protected void rbPlayerStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList imgBtn = (RadioButtonList)sender;
            
            SqlCommand cmd = new SqlCommand("UPDATE PlayerDetails SET Status=@Status WHERE PlayerId=@PlayerId", con);
            cmd.Parameters.AddWithValue("@Status", imgBtn.SelectedValue);
            cmd.Parameters.AddWithValue("@PlayerId", Convert.ToString(Session["playerid"]));
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();

            if (imgBtn.SelectedValue == "Delete")
            {
                SqlCommand cmd2 = new SqlCommand("DELETE FROM PlayerDetails WHERE PlayerId=@PlayerId", con);
                cmd2.Parameters.AddWithValue("@PlayerId", Convert.ToString(Session["playerid"]));
                cmd2.ExecuteNonQuery();

                pnldivindplayer.Controls.Clear();
                Session["playerid"] = null;
            }

            con.Close();

            PlayerPopulate();
           
        }

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
        private void SendHtmlFormattedEmail(string recepientEmail, string subject, string body)
        {
            try
            {
                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress("info@biliardoprofessionale.it");
                    mailMessage.Subject = subject;
                    mailMessage.Body = body;
                    mailMessage.IsBodyHtml = true;
                    mailMessage.To.Add(new MailAddress(recepientEmail));
                    SmtpClient smtp = new SmtpClient("smtp.biliardoprofessionale.it", 25);
                    smtp.EnableSsl = false;
                    System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential("info@biliardoprofessionale.it", "sergio123");
                    smtp.Credentials = NetworkCred;
                    smtp.Send(mailMessage);
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

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