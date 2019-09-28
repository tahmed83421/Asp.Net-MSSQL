using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Resources;
using System.Globalization;
using System.Threading;
using System.Reflection;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;
using System.Configuration;

namespace BilliardScoreboard
{
    public partial class ClubRegistration : System.Web.UI.Page
    {
        ResourceManager rm;
        CultureInfo ci;
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        int privacyCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            privacyCount = privacyCount + 1;

            if (rbTermandcondition.SelectedItem != null)
            {
                if (rbTermandcondition.SelectedItem.Text == "Yes")
                {
                    privacy.Visible = false;
                }
            }
            privacy.Visible = false;
            btnLogin.Visible = false;

        if (Session["Lang"] == null)
        {
            //Session["Lang"] = Request.UserLanguages[0];
            Session["Lang"] = ddLang.SelectedValue;
        }

            if (!IsPostBack)
            {
                LoadString();
                RButton1.Checked = true;
            }

            if (RButton1.Checked == true)
            {
                this.divbody1.Style.Add("background-color", "green");
                this.divbody.Style.Add("background-color", "green");
                txtId.Enabled = txtPw.Enabled = txtForgetPassword.Enabled = txtpaypal.Enabled = txtcodice.Enabled = txtncarta.Enabled = false;
                txtContactPerson.Enabled = txtCompanyName.Enabled = txtVAT.Enabled = txtPhone.Enabled = txtCellphone.Enabled  = txtZip.Enabled = txtStreet.Enabled = txtN.Enabled = txtWebsite.Enabled = txtFederation.Enabled = txtInternationalBilliard.Enabled = false;
                btnUpdate.Enabled = btnForgetPassword.Enabled = rgbsponser.Enabled = rgbinfocom.Enabled = fuClubLogo.Enabled = false;
            }
            else
            {

                this.divbody1.Style.Add("background-color", "black");
                this.divbody.Style.Add("background-color", "black");
                txtId.Enabled = txtPw.Enabled = txtForgetPassword.Enabled = txtpaypal.Enabled = txtcodice.Enabled = txtncarta.Enabled = true;
                txtContactPerson.Enabled = txtCompanyName.Enabled = txtVAT.Enabled = txtPhone.Enabled = txtCellphone.Enabled = txtZip.Enabled = txtStreet.Enabled = txtN.Enabled = txtWebsite.Enabled = txtFederation.Enabled = txtInternationalBilliard.Enabled = true;
                btnUpdate.Enabled = btnForgetPassword.Enabled = rgbsponser.Enabled = rgbinfocom.Enabled = fuClubLogo.Enabled = true;
            }

        }

        protected void ddLang_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Lang"] = ddLang.SelectedValue;
            LoadString();
        }

        protected void onAckTypeChanged(object sender, EventArgs e)
        {
            if (rbTermandcondition.SelectedItem.Text == "Yes") {
                privacy.Visible = true;
            }
        }

        private void LoadString()
        {
            if (Session["Lang"] != null)
            {
                ddLang.SelectedValue = Convert.ToString(Session["Lang"]);

                if (Convert.ToString(Session["Lang"]) == "en-US")
                {
                    if (ddNation.Items.Count > 0)
                    {
                        ddNation.Items.Clear();
                    }
                    ddNation.Items.Add(new ListItem("Argentina", "Argentina"));
                    ddNation.Items.Add(new ListItem("Austria", "Austria"));
                    ddNation.Items.Add(new ListItem("Belgium", "Belgium"));
                    ddNation.Items.Add(new ListItem("China", "China"));
                    ddNation.Items.Add(new ListItem("England", "England"));
                    ddNation.Items.Add(new ListItem("Finland", "Finland"));
                    ddNation.Items.Add(new ListItem("France", "France"));
                    ddNation.Items.Add(new ListItem("Germany", "Germany"));
                    ddNation.Items.Add(new ListItem("Greece", "Greece"));
                    ddNation.Items.Add(new ListItem("Italy", "Italy"));
                    ddNation.Items.Add(new ListItem("Japan", "Japan"));
                    ddNation.Items.Add(new ListItem("Netherland", "Netherland"));
                    ddNation.Items.Add(new ListItem("Portugal", "Portugal"));
                    ddNation.Items.Add(new ListItem("South Korea", "South Korea"));
                    ddNation.Items.Add(new ListItem("Spain", "Spain"));
                    ddNation.Items.Add(new ListItem("Sweden", "Sweden"));
                    ddNation.Items.Add(new ListItem("Other Country", "Other Country"));
                }
                else if (Convert.ToString(Session["Lang"]) == "it-IT")
                {
                    if (ddNation.Items.Count > 0)
                    {
                        ddNation.Items.Clear();
                    }
                    ddNation.Items.Add(new ListItem("Argentina", "Argentina"));
                    ddNation.Items.Add(new ListItem("Austria", "Austria"));
                    ddNation.Items.Add(new ListItem("Belgio", "Belgium"));
                    ddNation.Items.Add(new ListItem("Cina", "China"));
                    ddNation.Items.Add(new ListItem("Inghilterra", "England"));
                    ddNation.Items.Add(new ListItem("Finlandia", "Finland"));
                    ddNation.Items.Add(new ListItem("Francia", "France"));
                    ddNation.Items.Add(new ListItem("Germania", "Germany"));
                    ddNation.Items.Add(new ListItem("Grecia", "Greece"));
                    ddNation.Items.Add(new ListItem("Italia", "Italy"));
                    ddNation.Items.Add(new ListItem("Japan", "Japan"));
                    ddNation.Items.Add(new ListItem("Olanda", "Netherland"));
                    ddNation.Items.Add(new ListItem("Potogallo", "Portugal"));
                    ddNation.Items.Add(new ListItem("South Korea", "South Korea"));
                    ddNation.Items.Add(new ListItem("Spagna", "Spain"));
                    ddNation.Items.Add(new ListItem("Svezia", "Sweden"));
                    ddNation.Items.Add(new ListItem("Altra Nazione", "Other Country"));
                }
            }
            Thread.CurrentThread.CurrentCulture = new CultureInfo(Session["Lang"].ToString());
            rm = new ResourceManager("BilliardScoreboard.App_GlobalResources.Lang", Assembly.GetExecutingAssembly());
            ci = Thread.CurrentThread.CurrentCulture;
            lblHeading.Text = rm.GetString("ClubHeading", ci);
            lblLogintext.Text = rm.GetString("Logintext", ci);
            lblSignuptext.Text = rm.GetString("Signuptext", ci);
            lblId.Text = rm.GetString("Id", ci);
            txtId.Attributes.Add("placeholder", rm.GetString("Id", ci));
            lblPw.Text = rm.GetString("Pw", ci);
            txtPw.Attributes.Add("placeholder", rm.GetString("Pw", ci));
            btnLogin.Text = rm.GetString("Unlock", ci);
            lblClubName.Text = rm.GetString("ClubName", ci);
            txtClubName.Attributes.Add("placeholder", rm.GetString("ClubName", ci));
            lblClubLogo.Text = rm.GetString("ClubLogo", ci);
            lblClubLogo.Attributes.Add("title", rm.GetString("ImagePopup", ci));
            lblContactPerson.Text = rm.GetString("ContactPerson", ci);
            txtContactPerson.Attributes.Add("placeholder", rm.GetString("ContactPerson", ci));
            lblCompanyName.Text = rm.GetString("CompanyName", ci);
            txtCompanyName.Attributes.Add("placeholder", rm.GetString("CompanyName", ci));
            lblVAT.Text = rm.GetString("VAT", ci);
            txtVAT.Attributes.Add("placeholder", rm.GetString("VAT", ci));
            lblEmail.Text = rm.GetString("Email", ci);
            txtEmail.Attributes.Add("placeholder", rm.GetString("Email", ci));
            lblPassword.Text = rm.GetString("Password", ci);
            lblPassword.Attributes.Add("title", rm.GetString("PasswordPopup", ci));
            txtPassword.Attributes.Add("placeholder", rm.GetString("Password", ci));
            lblPhone.Text = rm.GetString("Phone", ci);
            txtPhone.Attributes.Add("placeholder", rm.GetString("Phone", ci));
            lblCellPhone.Text = rm.GetString("CellPhone", ci);
            txtCellphone.Attributes.Add("placeholder", rm.GetString("CellPhone", ci));
            lblNation.Text = rm.GetString("Nation", ci);
            lblCity.Text = rm.GetString("City", ci);
            txtCity.Attributes.Add("placeholder", rm.GetString("City", ci)); ;
            lblZip.Text = rm.GetString("Zip", ci);
            txtZip.Attributes.Add("placeholder", rm.GetString("Zip", ci));
            lblStreet.Text = rm.GetString("Street", ci);
            txtStreet.Attributes.Add("placeholder", rm.GetString("Street", ci));
            lblN.Text = rm.GetString("N", ci);
            txtN.Attributes.Add("placeholder", rm.GetString("N", ci));
            //lblShare.Text = rm.GetString("Share", ci);
            //lblShare.Attributes.Add("title", rm.GetString("SharePopup", ci));
            lblWebsite.Text = rm.GetString("Website", ci);
            txtWebsite.Attributes.Add("placeholder", rm.GetString("Website", ci));
            lblFederation.Text = rm.GetString("Federation", ci);
            txtFederation.Attributes.Add("placeholder", rm.GetString("Federation", ci));
            //lblSponsorBrand.Text = rm.GetString("SponsorBrand", ci);
            //lblLookingSponsor.Text = rm.GetString("LookingSponsor", ci);
            lblInternationalBilliard.Text = rm.GetString("InternationalBilliard", ci);
            txtInternationalBilliard.Attributes.Add("placeholder", rm.GetString("InternationalBilliard", ci));
            //lblAmericanPoolBilliard.Text = rm.GetString("AmericanPoolBilliard", ci);
            //txtAmericanPoolBilliard.Attributes.Add("placeholder", rm.GetString("AmericanPoolBilliard", ci));
            //lblSnookerBilliard.Text = rm.GetString("SnookerBilliard", ci);
            //txtSnookerBilliard.Attributes.Add("placeholder", rm.GetString("SnookerBilliard", ci));
            //lblTelevisonImage.Text = rm.GetString("TelevisonImage", ci);
            //lblTelevisonImage.Attributes.Add("title", rm.GetString("TelevisionPopup", ci));
            lblTermandcondition.Text = rm.GetString("Termandcondition", ci);
            lblTermandcondition.Attributes.Add("title", rm.GetString("PTermsPop", ci));
            btnSignup.Text = rm.GetString("Signup", ci);
            lblForgetPassword.Text = rm.GetString("ForgetPassword", ci);
            txtForgetPassword.Attributes.Add("placeholder", rm.GetString("ForgetPass", ci));
            btnForgetPassword.Text = rm.GetString("ForgetPasswordSend", ci);
            btnUpdate.Text = rm.GetString("ClubUpdate", ci);
            btnSave.Text = rm.GetString("ClubSave", ci);

            //new label and button by neeraj.
            lblpaypal.Text = rm.GetString("nbClblpaypal", ci);
            lblinfocom.Text = rm.GetString("nbClblinfocom", ci);
            lblsponser.Text = rm.GetString("nbClblsponser", ci);
            lblcodice.Text = rm.GetString("nbClblcodice",ci);
            lblncarta.Text = rm.GetString("nbClblncarta", ci);
            txtncarta.Attributes.Add("placeholder", rm.GetString("nbClblncarta", ci));
            txtcodice.Attributes.Add("placeholder", rm.GetString("nbClblcodice", ci));
            txtpaypal.Attributes.Add("placeholder","PayPal account Club *");

            lblpaypal.Attributes.Add("title", rm.GetString("nbClblpaypalPopup", ci));
            lblinfocom.Attributes.Add("title", rm.GetString("nbClblinfocomPopup", ci));
            lblsponser.Attributes.Add("title", rm.GetString("nbClblsponserPopup", ci));
        }

        public bool fillall()
        {
            if (string.IsNullOrEmpty(txtClubName.Text) ||
            string.IsNullOrEmpty(txtContactPerson.Text) ||
            string.IsNullOrEmpty(txtCompanyName.Text) ||
            string.IsNullOrEmpty(txtVAT.Text) ||
            string.IsNullOrEmpty(txtEmail.Text) ||
            string.IsNullOrEmpty(txtPassword.Text) ||
            string.IsNullOrEmpty(txtPhone.Text) ||
            string.IsNullOrEmpty(txtCellphone.Text) ||
            string.IsNullOrEmpty(ddNation.SelectedValue) ||
            string.IsNullOrEmpty(txtCity.Text) ||
            string.IsNullOrEmpty(txtZip.Text) ||
            string.IsNullOrEmpty(txtStreet.Text) ||
            string.IsNullOrEmpty(txtN.Text) ||
            string.IsNullOrEmpty(txtWebsite.Text) ||
            string.IsNullOrEmpty(txtFederation.Text) ||
            string.IsNullOrEmpty(txtInternationalBilliard.Text) ||
            string.IsNullOrEmpty(txtpaypal.Text) ||
            string.IsNullOrEmpty(rgbinfocom.SelectedValue) ||
            string.IsNullOrEmpty(rgbsponser.SelectedValue) ||
            string.IsNullOrEmpty(txtcodice.Text) ||
            string.IsNullOrEmpty(txtncarta.Text))
                return false;
            else return true;
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            int ClubID = 0;
            if (   RButton1.Checked ||fillall())
            {
                if (rbTermandcondition.SelectedValue == "Yes")
                {

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "AddClub";
                    if (fuClubLogo.HasFile == true)
                    {
                        //Save files to disk
                        string FileName = Path.GetFileName(fuClubLogo.PostedFile.FileName);
                        fuClubLogo.SaveAs(Server.MapPath("public/Upload/Club/" + FileName));
                        cmd.Parameters.AddWithValue("@ClubLogo", "public/Upload/Club/" + FileName);
                    }
                    cmd.Parameters.AddWithValue("@ClubName", txtClubName.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactPerson", txtContactPerson.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text.Trim());
                    cmd.Parameters.AddWithValue("@VatNo", txtVAT.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Cell", txtCellphone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Nation", ddNation.SelectedValue);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@Zip", txtZip.Text.Trim());
                    cmd.Parameters.AddWithValue("@Street", txtStreet.Text.Trim());
                    cmd.Parameters.AddWithValue("@NDegree", txtN.Text.Trim());
                    cmd.Parameters.AddWithValue("@ShareData", true);
                    cmd.Parameters.AddWithValue("@ClubWebsite", txtWebsite.Text.Trim());
                    cmd.Parameters.AddWithValue("@FederationMembership", txtFederation.Text.Trim());
                    cmd.Parameters.AddWithValue("@ScoreSponsorBrand", false);
                    cmd.Parameters.AddWithValue("@LookingForSponsor", true);
                    cmd.Parameters.AddWithValue("@InternationalBilliard", txtInternationalBilliard.Text.Trim());
                    cmd.Parameters.AddWithValue("@AmericanPoolBilliard", "0");
                    cmd.Parameters.AddWithValue("@SnookerBilliard", "0");
                    cmd.Parameters.AddWithValue("@RightsTelevisionImage", true);
                    // neeraj  ----start ---
                    cmd.Parameters.AddWithValue("@nbpaypal", txtpaypal.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbinfo", rgbinfocom.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbsponser", rgbsponser.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbcodice", txtcodice.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbncatra", txtncarta.Text.Trim());
                    // neeraj  ----end-----
                    cmd.Parameters.Add("@Result", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Connection = con;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        ClubID = Convert.ToInt32(cmd.Parameters["@Result"].Value);

                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd2.CommandText = "RegistrationDetails";

                        cmd2.Parameters.AddWithValue("@TableName", "Club");
                        cmd2.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd2.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd2.Connection = con;
                        SqlDataAdapter da2 = new SqlDataAdapter();
                        da2.SelectCommand = cmd2;
                        DataSet ds2 = new DataSet();
                        da2.Fill(ds2);
                        string body = PopulateBody(txtClubName.Text.Trim(), txtEmail.Text.Trim(), txtPassword.Text.Trim(), ds2.Tables[0]);
                        SendHtmlFormattedEmail(txtEmail.Text.Trim(), "New registration completed successfully", body);
                        ScriptManager.RegisterStartupScript(this, GetType(), "popup", "popup();", true);
                    }
                    catch (Exception ex)
                    {
                        SqlCommand cmd3 = new SqlCommand();
                        cmd3.CommandType = CommandType.StoredProcedure;
                        cmd3.CommandText = "DeleteDetails";
                        cmd3.Parameters.AddWithValue("@TableName", "Club");
                        cmd3.Parameters.AddWithValue("@Id", ClubID);
                        cmd3.Connection = con;
                        cmd3.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sorry, there have some issue with data. Please check it and try again.');", true);
                    }
                    finally
                    {
                        con.Close();
                        con.Dispose();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please accept term and condition');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please fill all fields');", true);
            }
        }        

        protected void btnRedirect_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("http://www.biliardoprofessionale.it");
        }

        //Email id check
        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CheckEmail";
            con.Open();
            cmd.Parameters.AddWithValue("@TableName", "Club");
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Connection = con;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                lblStatus.Text = "Email already exists";
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblStatus.Text = "";
            }
            con.Close();
        }

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

        private string PopulateBody(string Name, string Email, string Password, DataTable dt)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/ClubRegistrationTemplate.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{Name}", Name);
            body = body.Replace("{Email}", Email);
            body = body.Replace("{Password}", Password);


            body = body.Replace("{ClubName}", Convert.ToString(dt.Rows[0]["ClubName"]));
            body = body.Replace("{ContactPerson}", Convert.ToString(dt.Rows[0]["ContactPerson"]));
            body = body.Replace("{Email}", Convert.ToString(dt.Rows[0]["Email"]));
            body = body.Replace("{Password}", Convert.ToString(dt.Rows[0]["Password"]));
            body = body.Replace("{VatNo}", Convert.ToString(dt.Rows[0]["VatNo"]));
            body = body.Replace("{Nation}", Convert.ToString(dt.Rows[0]["Nation"]));
            body = body.Replace("{City}", Convert.ToString(dt.Rows[0]["City"]));
            body = body.Replace("{Zip}", Convert.ToString(dt.Rows[0]["Zip"]));
            body = body.Replace("{Street}", Convert.ToString(dt.Rows[0]["Street"]));
            body = body.Replace("{NDegree}", Convert.ToString(dt.Rows[0]["NDegree"]));
            body = body.Replace("{ClubLogo}", Convert.ToString(dt.Rows[0]["ClubLogo"]));
            body = body.Replace("{ShareData}", Convert.ToString(dt.Rows[0]["ShareData"]));
            body = body.Replace("{ClubWebsite}", Convert.ToString(dt.Rows[0]["ClubWebsite"]));
            body = body.Replace("{FederationMembership}", Convert.ToString(dt.Rows[0]["FederationMembership"]));
            body = body.Replace("{ScoreSponsorBrand}", Convert.ToString(dt.Rows[0]["ScoreSponsorBrand"]));
            body = body.Replace("{LookingForSponsor}", Convert.ToString(dt.Rows[0]["LookingForSponsor"]));
            body = body.Replace("{InternationalBilliard}", Convert.ToString(dt.Rows[0]["InternationalBilliard"]));
            body = body.Replace("{AmericanPoolBilliard}", Convert.ToString(dt.Rows[0]["AmericanPoolBilliard"]));
            body = body.Replace("{SnookerBilliard}", Convert.ToString(dt.Rows[0]["SnookerBilliard"]));
            body = body.Replace("{RightsTelevisionImage}", Convert.ToString(dt.Rows[0]["RightsTelevisionImage"]));
            body = body.Replace("{Status}", Convert.ToString(dt.Rows[0]["Status"]));
            body = body.Replace("{Url}", Convert.ToString(dt.Rows[0]["ClubId"]));
            return body;
        }

        protected void btnForgetPassword_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CheckEmail";
            con.Open();
            cmd.Parameters.AddWithValue("@TableName", "Club");
            cmd.Parameters.AddWithValue("@Email", txtForgetPassword.Text.Trim());
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            SqlDataReader dr = cmd.ExecuteReader();
            if (ds.Tables[0].Rows.Count>0)
            {
                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/ForgetPasswordTemplate.html")))
                {
                    body = reader.ReadToEnd();
                }

                body = body.Replace("{Name}", ds.Tables[0].Rows[0]["ClubName"].ToString());
                body = body.Replace("{Email}", ds.Tables[0].Rows[0]["Email"].ToString());
                body = body.Replace("{Password}", ds.Tables[0].Rows[0]["Password"].ToString());
                SendHtmlFormattedEmail(txtForgetPassword.Text.Trim(), "Biliardo Professionale account details", body);
                lblPasswordStatus.Text = "A email sent to your email with account details.";
                lblPasswordStatus.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblPasswordStatus.Text = "Sorry, no email found.";
                lblPasswordStatus.ForeColor = System.Drawing.Color.Red;
            }
            con.Close();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
          
           
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("UPDATE PlayerDetails SET login = '0' ", con);
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Players are unlocked Successfully'); window.location.href = 'ClubRegistration.aspx';", true);
       
           
        }
        
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                
                    Details details = new Details();
                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {
                        SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM AdminDetails", con);
                        DataSet ds = new DataSet();
                        ad.Fill(ds);
                        foreach (DataRow dtrow in ds.Tables[0].Rows)
                        {
                            details.Name = dtrow["id"].ToString();
                            details.FamilyName = dtrow["userid"].ToString();
                            details.PlayerPicture = dtrow["pass"].ToString();
                            
                            break;
                        }
                        if (txtId.Text.Trim() == details.FamilyName.Trim() && txtPw.Text.Trim() == details.PlayerPicture.Trim())
                        {
                            Session["admin"] = "Admin";
                            Response.Redirect("Admin/Dashboard.aspx");
                        }
                        
                    }
                
                //if (txtId.Text.Trim() == "admin" && txtPw.Text.Trim() == "admini123abc")
                //{
                //    Session["admin"] = "Admin";
                //    Response.Redirect("Admin/Dashboard.aspx");
                //}
                //else
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "LoginDetails";
                    con.Open();
                    cmd.Parameters.AddWithValue("@TableName", "Club");
                    cmd.Parameters.AddWithValue("@Email", txtId.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPw.Text.Trim());
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        hdnClubId.Value = Convert.ToString(ds.Tables[0].Rows[0]["ClubId"]).Trim();
                        txtClubName.Text = Convert.ToString(ds.Tables[0].Rows[0]["ClubName"]).Trim();
                        hdnpp.Value = Convert.ToString(ds.Tables[0].Rows[0]["ClubLogo"]).Trim();
                        impProfPic.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["ClubLogo"]).Trim();
                        txtContactPerson.Text = Convert.ToString(ds.Tables[0].Rows[0]["ContactPerson"]).Trim();
                        txtCompanyName.Text = Convert.ToString(ds.Tables[0].Rows[0]["CompanyName"]).Trim();
                        txtVAT.Text = Convert.ToString(ds.Tables[0].Rows[0]["VatNo"]).Trim();
                        txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["Email"]).Trim();
                       // txtEmail.Attributes.Add("readonly", "readonly");
                        txtPassword.Attributes.Add("value", Convert.ToString(ds.Tables[0].Rows[0]["Password"]).Trim());
                        txtPhone.Text = Convert.ToString(ds.Tables[0].Rows[0]["Phone"]).Trim();
                        txtCellphone.Text = Convert.ToString(ds.Tables[0].Rows[0]["Cell"]).Trim();
                        ddNation.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["Nation"]).Trim();
                        txtCity.Text = Convert.ToString(ds.Tables[0].Rows[0]["City"]).Trim();
                        txtZip.Text = Convert.ToString(ds.Tables[0].Rows[0]["Zip"]).Trim();
                        txtStreet.Text = Convert.ToString(ds.Tables[0].Rows[0]["Street"]).Trim();
                        txtN.Text = Convert.ToString(ds.Tables[0].Rows[0]["NDegree"]).Trim();
                       // rbShare.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["ShareData"]);
                        txtWebsite.Text = Convert.ToString(ds.Tables[0].Rows[0]["ClubWebsite"]).Trim();
                        txtFederation.Text = Convert.ToString(ds.Tables[0].Rows[0]["FederationMembership"]).Trim();
                       // rbSponsorBrand.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["ScoreSponsorBrand"]);
                       // rbLookingSponsor.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["LookingForSponsor"]);
                        txtInternationalBilliard.Text = Convert.ToString(ds.Tables[0].Rows[0]["InternationalBilliard"]).Trim();
                       // txtAmericanPoolBilliard.Text = Convert.ToString(ds.Tables[0].Rows[0]["AmericanPoolBilliard"]);
                        //txtSnookerBilliard.Text = Convert.ToString(ds.Tables[0].Rows[0]["SnookerBilliard"]);
                        //rbTelevisonImage.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["RightsTelevisionImage"]);

                        // neeraj updates ----------------start-----
                        try { txtpaypal.Text = Convert.ToString(ds.Tables[0].Rows[0]["nbpaypal"]).Trim(); }catch { }
                        try{ rgbinfocom.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["nbinfo"]).Trim();}catch{}
                        try{rgbsponser.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["nbsponser"]).Trim();}catch{}
                        try{ txtcodice.Text = Convert.ToString(ds.Tables[0].Rows[0]["nbcodice"]).Trim();}catch{}
                        try { txtncarta.Text = Convert.ToString(ds.Tables[0].Rows[0]["nbncatra"]).Trim(); }catch { }
                        // neeraj updates ----------------end-------
                        btnSave.Visible = true;
                        btnSignup.Visible = false;
                       
                        btnLogin.Visible = true;
                        lblPw.Visible = false;
                        txtPw.Visible = false;
                        lblSignIn.Visible = false;
                        btnUpdate.Visible = false;
                        lblForgetPassword.Visible = false;
                        txtForgetPassword.Visible = false;
                        btnForgetPassword.Visible = false;
                    }
                    else
                    {
                        lblSignIn.Text = "Sorry, wrong email or password.";
                        lblSignIn.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (fillall())
            {
                if (rbTermandcondition.SelectedValue == "Yes")
                {
                    if (fuClubLogo.HasFile == true)
                    {
                        string FileName = Path.GetFileName(fuClubLogo.PostedFile.FileName);
                        //Save files to disk
                        fuClubLogo.SaveAs(Server.MapPath("public/Upload/Club/" + FileName));
                    }
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "AddClub";
                    cmd.Parameters.AddWithValue("@ClubId", hdnClubId.Value);
                    cmd.Parameters.AddWithValue("@ClubName", txtClubName.Text.Trim());
                    cmd.Parameters.AddWithValue("@ContactPerson", txtContactPerson.Text.Trim());
                    cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text.Trim());
                    string[] words = hdnpp.Value.Split('\\');
                    if (words.Count() >= 2)
                    {
                        cmd.Parameters.AddWithValue("@ClubLogo", "public/Upload/Club/" + words[words.Length - 1]);
                    }
                    else
                    {
                        words = hdnpp.Value.Split('/');
                        cmd.Parameters.AddWithValue("@ClubLogo", "public/Upload/Club/" + words[words.Length - 1]);
                    }
                    cmd.Parameters.AddWithValue("@VatNo", txtVAT.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Cell", txtCellphone.Text.Trim());
                    cmd.Parameters.AddWithValue("@Nation", ddNation.SelectedValue);
                    cmd.Parameters.AddWithValue("@City", txtCity.Text.Trim());
                    cmd.Parameters.AddWithValue("@Zip", txtZip.Text.Trim());
                    cmd.Parameters.AddWithValue("@Street", txtStreet.Text.Trim());
                    cmd.Parameters.AddWithValue("@NDegree", txtN.Text.Trim());
                    cmd.Parameters.AddWithValue("@ShareData", true);
                    cmd.Parameters.AddWithValue("@ClubWebsite", txtWebsite.Text.Trim());
                    cmd.Parameters.AddWithValue("@FederationMembership", txtFederation.Text.Trim());
                    cmd.Parameters.AddWithValue("@ScoreSponsorBrand", false);
                    cmd.Parameters.AddWithValue("@LookingForSponsor", true);
                    cmd.Parameters.AddWithValue("@InternationalBilliard", txtInternationalBilliard.Text.Trim());
                    cmd.Parameters.AddWithValue("@AmericanPoolBilliard", "0");
                    cmd.Parameters.AddWithValue("@SnookerBilliard", "0");
                    cmd.Parameters.AddWithValue("@RightsTelevisionImage", true);
                    // neeraj  ----start ---
                    cmd.Parameters.AddWithValue("@nbpaypal", txtpaypal.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbinfo", rgbinfocom.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbsponser", rgbsponser.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbcodice", txtcodice.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbncatra", txtncarta.Text.Trim());
                    // neeraj  ----end-----
                    cmd.Connection = con;
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        btnSave.Visible = false;
                        btnSignup.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        con.Close();
                        con.Dispose();
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Club details updated successfully'); window.location.href = 'ClubRegistration.aspx';", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please accept term and condition');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Please fill all fields');", true);
            }
        }

     
    }
}