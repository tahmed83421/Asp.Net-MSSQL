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
using System.Web.Services;
using System.Text;

namespace BilliardScoreboard
{
    public partial class PlayerRegistration : System.Web.UI.Page
    {
        ResourceManager rm;
        CultureInfo ci;
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        int privacyCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            privacyCount = privacyCount + 1;
            if(rbTermandcondition.SelectedItem!=null)
            if (rbTermandcondition.SelectedItem.Text == "Yes")
            {
                privacy.Visible = false;
            }
            privacy.Visible = false;

            if (Session["Lang"] == null)
            {
                Session["Lang"] = ddLang.SelectedValue;
                
                //Session["Lang"] = Request.UserLanguages[1];
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
                txtPhone.Enabled = ddNation.Enabled= txtCellphone.Enabled = txtCity.Enabled = txtZip.Enabled = txtStreet.Enabled = txtN.Enabled = txtWebsite.Enabled = txtFederation.Enabled = false;
                btnUpdate.Enabled = btnForgetPassword.Enabled = rgbsponser.Enabled = rgbinfocom.Enabled = rgblbliscri.Enabled = rbGender.Enabled = fuPlayerPicture.Enabled = ddCategoryLevel.Enabled = rbGameSpeciality.Enabled = false;
            }
            else
            {

                this.divbody1.Style.Add("background-color", "black");
                this.divbody.Style.Add("background-color", "black");
                
                txtId.Enabled = txtPw.Enabled = txtForgetPassword.Enabled = txtpaypal.Enabled = txtcodice.Enabled = txtncarta.Enabled = true;
                txtPhone.Enabled = ddNation.Enabled = txtCellphone.Enabled = txtCity.Enabled = txtZip.Enabled = txtStreet.Enabled = txtN.Enabled = txtWebsite.Enabled = txtFederation.Enabled = true;
                btnUpdate.Enabled = btnForgetPassword.Enabled = rgbsponser.Enabled = rgbinfocom.Enabled = rgblbliscri.Enabled = rbGender.Enabled = fuPlayerPicture.Enabled = ddCategoryLevel.Enabled = rbGameSpeciality.Enabled = true;
            }

        }
        protected void ddLang_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Lang"] = ddLang.SelectedValue;
            LoadString();
        }
        protected void onAckTypeChanged(object sender, EventArgs e)
        {
            if (rbTermandcondition.SelectedItem.Text == "Yes")
            {
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

                    rbGameSpeciality.Items[0].Text = "Italian";
                    rbGender.Items[0].Text = "Male";
                    rbGender.Items[1].Text = "Female";
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

                    rbGameSpeciality.Items[0].Text = "Italiana";
                    rbGender.Items[0].Text = "Maschio";
                    rbGender.Items[1].Text = "Femmina";
                }
            }
            Thread.CurrentThread.CurrentCulture = new CultureInfo(Session["Lang"].ToString());
            rm = new ResourceManager("BilliardScoreboard.App_GlobalResources.Lang", Assembly.GetExecutingAssembly());
            ci = Thread.CurrentThread.CurrentCulture;
            lblHeading.Text = rm.GetString("PlayerHeading", ci);
            lblLogintext.Text = rm.GetString("PLogintext", ci);
            lblSignuptext.Text = rm.GetString("PSignuptext", ci);
            lblId.Text = rm.GetString("PId", ci);
            txtId.Attributes.Add("placeholder", rm.GetString("PId", ci));
            lblPw.Text = rm.GetString("PPw", ci);
            txtPw.Attributes.Add("placeholder", rm.GetString("PPw", ci));
            btnLogin.Text = rm.GetString("PLogin", ci);
            lblClubMembership.Text = rm.GetString("PClubName", ci);
            txtClubMembership.Attributes.Add("placeholder", rm.GetString("PClubName", ci));
            lblFamilyName.Text = rm.GetString("PFamilyName", ci);
            txtFamilyName.Attributes.Add("placeholder", rm.GetString("PFamilyName", ci));
            lblName.Text = rm.GetString("PName", ci);
            txtName.Attributes.Add("placeholder", rm.GetString("PName", ci));
            lblGender.Text = rm.GetString("PGender", ci);
            lblPlayerPicture.Text = rm.GetString("PPlayerPicture", ci);
            lblPlayerPicture.Attributes.Add("title", rm.GetString("ImagePopup", ci));
            //lblFiscalCode.Text = rm.GetString("PFiscalCode", ci);
            //txtFiscalCode.Attributes.Add("placeholder", rm.GetString("PFiscalCode", ci));
            lblEmail.Text = rm.GetString("PEmail", ci);
            txtEmail.Attributes.Add("placeholder", rm.GetString("PEmail", ci));
            lblPassword.Text = rm.GetString("PPassword", ci);
            lblPassword.Attributes.Add("title", rm.GetString("PasswordPopup", ci));
            txtPassword.Attributes.Add("placeholder", rm.GetString("PPassword", ci));
            lblPhone.Text = rm.GetString("PPhone", ci);
            txtPhone.Attributes.Add("placeholder", rm.GetString("PPhone", ci));
            lblCellPhone.Text = rm.GetString("PCellPhone", ci);
            txtCellphone.Attributes.Add("placeholder", rm.GetString("PCellPhone", ci));
            lblNation.Text = rm.GetString("PNation", ci);
            lblCity.Text = rm.GetString("PCity", ci);
            txtCity.Attributes.Add("placeholder", rm.GetString("PCity", ci));
            lblZip.Text = rm.GetString("PZip", ci);
            txtZip.Attributes.Add("placeholder", rm.GetString("PZip", ci));
            lblStreet.Text = rm.GetString("PStreet", ci);
            txtStreet.Attributes.Add("placeholder", rm.GetString("PStreet", ci));
            lblN.Text = rm.GetString("PN", ci);
            txtN.Attributes.Add("placeholder", rm.GetString("PN", ci));
            //lblShare.Text = rm.GetString("PShare", ci);
            //lblShare.Attributes.Add("title", rm.GetString("SharePopup", ci));
            lblWebsite.Text = rm.GetString("PWebsite", ci);
            txtWebsite.Attributes.Add("placeholder", rm.GetString("PWebsite", ci));
            lblFederation.Text = rm.GetString("PFederation", ci);
            txtFederation.Attributes.Add("placeholder", rm.GetString("PFederation", ci));
            lblCategoryLevel.Text = rm.GetString("PCategoryLevel", ci);
            lblCategoryLevel.Attributes.Add("title", rm.GetString("CategoryPopup", ci));
            lblGameSpeciality.Text = rm.GetString("PGameSpeciality", ci);
            //lblScoreSponsor.Text = rm.GetString("PScoreSponsor", ci);
            //lblLookingSponsor.Text = rm.GetString("PLookingSponsor", ci);
            //lblTelevisonImage.Text = rm.GetString("PTelevisonImage", ci);
            //lblTelevisonImage.Attributes.Add("title", rm.GetString("TelevisionPopup", ci));
            lblTermandcondition.Text = rm.GetString("PTermandcondition", ci);
            lblTermandcondition.Attributes.Add("title", rm.GetString("PTermsPop", ci));
            btnSignup.Text = rm.GetString("PSignup", ci);
            lblForgetPassword.Text = rm.GetString("PForgetPassword", ci);
            txtForgetPassword.Attributes.Add("placeholder", rm.GetString("PForgetPass", ci));
            btnForgetPassword.Text = rm.GetString("PForgetPasswordSend", ci);
            btnUpdate.Text = rm.GetString("ClubUpdate", ci);
            btnSave.Text = rm.GetString("ClubSave", ci);

            //new label and button by neeraj.

            lblpaypal.Attributes.Add("title", rm.GetString("nbPlblpaypalPopup", ci));
            lblinfocom.Attributes.Add("title", rm.GetString("nbPlblinfocomPopup", ci));
            lblsponser.Attributes.Add("title", rm.GetString("nbPlblsponserPopup", ci));
            lbliscri.Attributes.Add("title", rm.GetString("nbPlbliscriPopup", ci));

            lblpaypal.Text = rm.GetString("nbPlblpaypal", ci);
            lblinfocom.Text = rm.GetString("nbPlblinfocom", ci);
            lblsponser.Text = rm.GetString("nbPlblsponser", ci);
            lbliscri.Text = rm.GetString("nbPlbliscri", ci);
            lblcodice.Text = rm.GetString("nbPlblcodice", ci);
            lblncarta.Text = rm.GetString("nbPlblncarta", ci);
            lblregistration.Text = DateTime.Now.ToShortDateString()+" to "+DateTime.Now.AddYears(1).ToShortDateString();

            txtncarta.Attributes.Add("placeholder", rm.GetString("nbPlblncarta", ci));
            txtcodice.Attributes.Add("placeholder", rm.GetString("nbPlblcodice", ci));
            txtpaypal.Attributes.Add("placeholder", "PayPal account Player *");

        }
        public bool fillall()
        {
            if (string.IsNullOrEmpty(ClubId.Value) ||
            string.IsNullOrEmpty(txtFamilyName.Text) ||
            string.IsNullOrEmpty(txtName.Text) ||
            string.IsNullOrEmpty(rbGender.SelectedValue) ||
            string.IsNullOrEmpty(txtEmail.Text) ||
           
            string.IsNullOrEmpty(txtPhone.Text) ||
             string.IsNullOrEmpty(txtCellphone.Text) ||
            string.IsNullOrEmpty(ddNation.SelectedValue) ||
            string.IsNullOrEmpty(txtCity.Text) ||
            string.IsNullOrEmpty(txtZip.Text) ||
            string.IsNullOrEmpty(txtStreet.Text) ||
            string.IsNullOrEmpty(txtN.Text) ||
            string.IsNullOrEmpty(txtWebsite.Text) ||
            string.IsNullOrEmpty(txtFederation.Text) ||
            string.IsNullOrEmpty(ddCategoryLevel.SelectedValue) ||
            string.IsNullOrEmpty(rbGameSpeciality.SelectedValue) ||
            string.IsNullOrEmpty(txtpaypal.Text) ||
            string.IsNullOrEmpty(rgbinfocom.SelectedValue) ||
            string.IsNullOrEmpty(rgbsponser.SelectedValue) ||
            string.IsNullOrEmpty(rgblbliscri.SelectedValue) ||
            string.IsNullOrEmpty(txtcodice.Text) ||
            string.IsNullOrEmpty(txtncarta.Text))
                return false;
            else return true;
        }
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            int PlayerID = 0;
            if (RButton1.Checked || fillall())
            {
                if (rbTermandcondition.SelectedValue == "Yes")
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "AddPlayer";
                    if (fuPlayerPicture.HasFile == true)
                    {
                        string FileName = Path.GetFileName(fuPlayerPicture.PostedFile.FileName);
                        //Save files to disk
                        fuPlayerPicture.SaveAs(Server.MapPath("public/Upload/Player/" + FileName));
                        cmd.Parameters.AddWithValue("@PlayerPicture", "public/Upload/Player/" + FileName);
                    }
                    cmd.Parameters.AddWithValue("@ClubId", ClubId.Value.ToString());
                    cmd.Parameters.AddWithValue("@FamilyName", txtFamilyName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", rbGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@VatNo", "0000");
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
                    cmd.Parameters.AddWithValue("@Category", ddCategoryLevel.SelectedValue);
                    cmd.Parameters.AddWithValue("@GameSpeciality", rbGameSpeciality.SelectedValue);
                    cmd.Parameters.AddWithValue("@ScoreSponsor", false);
                    cmd.Parameters.AddWithValue("@LookingForSponsor", true);
                    cmd.Parameters.AddWithValue("@RightsTelevisionImage", true);
                    // neeraj  ----start ---
                    cmd.Parameters.AddWithValue("@nbpaypal", txtpaypal.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbinfo", rgbinfocom.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbsponser", rgbsponser.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbiscri", rgblbliscri.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbcodice", txtcodice.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbncarta", txtncarta.Text.Trim());
                    // neeraj  ----end-----
                    cmd.Parameters.Add("@Result", SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Connection = con;
                    try
                    {
                    if(con.State!=ConnectionState.Open)
                        con.Open();
                        cmd.ExecuteNonQuery();
                        PlayerID = Convert.ToInt32(cmd.Parameters["@Result"].Value);

                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandType = CommandType.StoredProcedure;
                        cmd2.CommandText = "RegistrationDetails";
                        cmd2.Parameters.AddWithValue("@TableName", "Player");
                        cmd2.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());   
                        cmd2.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd2.Connection = con;
                        SqlDataAdapter da2 = new SqlDataAdapter();
                        da2.SelectCommand = cmd2;
                        DataSet ds2 = new DataSet();
                        da2.Fill(ds2);
                        string body = PopulateBody(txtName.Text.Trim(), txtEmail.Text.Trim(), txtPassword.Text, ds2.Tables[0],true);
                        SendHtmlFormattedEmail(txtEmail.Text.Trim(), "New registration completed successfully", body);

                       // body = PopulateBody(txtName.Text.Trim(), txtEmail.Text.Trim(), txtPassword.Text, ds2.Tables[0], false);
                      //  SendHtmlFormattedEmailclub(Convert.ToString(ds2.Tables[0].Rows[0]["Cemail"]), "New Player registration completed successfully", body);
                        ScriptManager.RegisterStartupScript(this, GetType(), "popup", "popup();", true);
                    }
                    catch (Exception ex)
                    {
                        SqlCommand cmd3 = new SqlCommand();
                        cmd3.CommandType = CommandType.StoredProcedure;
                        cmd3.CommandText = "DeleteDetails";
                        cmd3.Parameters.AddWithValue("@TableName", "Player");
                        cmd3.Parameters.AddWithValue("@Id", PlayerID);
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
        //-------send xls file in this page-----//
        private void SendHtmlFormattedEmailclub(string recepientEmail, string subject, string body)
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

                    //Get some binary data
                    byte[] data = GetData();

                    //save the data to a memory stream
                    System.IO.MemoryStream ms = new System.IO.MemoryStream(data);

                    //create the attachment from a stream. Be sure to name the data with a file and
                    //media type that is respective of the data
                    mailMessage.Attachments.Add(new System.Net.Mail.Attachment(ms, "PlayerDetails.xls", "application/vnd.ms-excel"));

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
        protected  byte[] GetData()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM PlayerDetails WHERE ClubId = " + ClubId.Value.ToString());
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = con;
            if (con.State != ConnectionState.Open) con.Open();
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);

            cmd = new SqlCommand("SELECT ClubName,Street,NDegree,Zip,City FROM ClubDetails WHERE ClubId = " + ClubId.Value.ToString());
            cmd.Connection = con;
            if (con.State != ConnectionState.Open) con.Open();
            sda.SelectCommand = cmd;
            DataTable dtc = new DataTable();
            sda.Fill(dtc);

            
            dt.Columns.Remove("ClubId");
            dt.Columns.Remove("PlayerPicture");
            dt.Columns.Remove("Password");
            dt.Columns.Remove("login");
            dt.Columns.Remove("ShareData");
            dt.Columns.Remove("ScoreSponsor");
            dt.Columns.Remove("LookingForSponsor");
            dt.Columns.Remove("RightsTelevisionImage");
            dt.Columns.Remove("VatNo");
           
            string strBody = DataTable2ExcelString(dt,dtc);
            byte[] data = Encoding.ASCII.GetBytes(strBody);
            return data;
        }
        static string DataTable2ExcelString(System.Data.DataTable dt,System.Data.DataTable dtc)
        {
            StringBuilder sbTop = new StringBuilder();
            sbTop.Append("<html xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:x=\"urn:schemas-microsoft-com:office:excel\" ");
            sbTop.Append("xmlns=\" http://www.w3.org/TR/REC-html40\"><head><meta http-equiv=Content-Type content=\"text/html; charset=windows-1252\">");
            sbTop.Append("<meta name=ProgId content=Excel.Sheet ><meta name=Generator content=\"Microsoft Excel 9\"><!--[if gte mso 9]>");
            sbTop.Append("<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>" + dt.TableName + "</x:Name><x:WorksheetOptions>");
            sbTop.Append("<x:Selected/><x:ProtectContents>False</x:ProtectContents><x:ProtectObjects>False</x:ProtectObjects>");
            sbTop.Append("<x:ProtectScenarios>False</x:ProtectScenarios></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets>");
            sbTop.Append("<x:ProtectStructure>False</x:ProtectStructure><x:ProtectWindows>False</x:ProtectWindows></x:ExcelWorkbook></xml>");
            sbTop.Append("<![endif]-->");
            sbTop.Append("</head><body><table>");
            string bottom = "</table></body></html>";
            StringBuilder sb = new StringBuilder();

            sb.Append("<tr>");
            sb.Append("<td>  CLUB:-  </td>");
            sb.Append("<td>    " + dtc.Rows[0][0] + "  </td>");
            sb.Append("<td> via " + dtc.Rows[0][1] + "   </td>");
            sb.Append("<td>    " + dtc.Rows[0][2] + "   </td>");
            sb.Append("<td>    " + dtc.Rows[0][3] + "    </td>");
            sb.Append("<td>    " + dtc.Rows[0][4] + "    </td>");
            sb.Append("</tr>");

            sb.Append("<tr></tr>");
            sb.Append("<tr></tr>");

            //Header
            sb.Append("<tr>");
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                sb.Append("<td>" + dt.Columns[i].ColumnName + "</td>");
            }
            sb.Append("</tr>");

            //Items
            for (int x = 0; x < dt.Rows.Count; x++)
            {
                sb.Append("<tr>");
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    sb.Append("<td>" + dt.Rows[x][i] + "</td>");
                }
                sb.Append("</tr>");
            }

            string SSxml = sbTop.ToString() + sb.ToString() + bottom;

            return SSxml;
        }
        //-------send xls file in this page-----//
        //-------download xls file in this page-----//
        protected void sendRegistrationtoclub()
        {

            SqlCommand cmd = new SqlCommand("SELECT * FROM PlayerDetails WHERE ClubId = " + ClubId.Value.ToString());
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = con;
            if (con.State != ConnectionState.Open)    con.Open();
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView gvExcel = new GridView();
            gvExcel.DataSource = dt;
            gvExcel.DataBind();
            Export("FileToSave.xls", gvExcel);
        }
        public static void Export(string fileName, GridView gv)
        {
            HttpContext.Current.Response.Clear();
            //HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", fileName));
            //HttpContext.Current.Response.ContentType = "application/ms-excel";
            //HttpContext.Current.Response.Write("<head><meta http-equiv=Content-Type content=:" + '"' + "text/html; charset=utf-8" + '"' + "></head>");


            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    Table table = new Table();
                    
                    if (gv.HeaderRow != null)
                    {
                        PrepareControlForExport(gv.HeaderRow);
                        table.Rows.Add(gv.HeaderRow);
                    }

                    foreach (GridViewRow row in gv.Rows)
                    {
                        PrepareControlForExport(row);
                        table.Rows.Add(row);
                    }

                    if (gv.FooterRow != null)
                    {
                        PrepareControlForExport(gv.FooterRow);
                        table.Rows.Add(gv.FooterRow);
                    }
                    table.GridLines = gv.GridLines;
                    table.RenderControl(htw);

                  // HttpContext.Current.Response.Write(sw.ToString());
                  // HttpContext.Current.Response.End();
                }
            }
        }
        private static void PrepareControlForExport(Control control)
    {
        for (int i = 0; i < control.Controls.Count; i++)
        {
            Control current = control.Controls[i];
            if (current is LinkButton)
            {
                control.Controls.Remove(current);
                control.Controls.AddAt(i, new LiteralControl((current as LinkButton).Text));
            }
            else if (current is ImageButton)
            {
                control.Controls.Remove(current);
                control.Controls.AddAt(i, new LiteralControl((current as ImageButton).AlternateText));
            }
            else if (current is HyperLink)
            {
                control.Controls.Remove(current);
                control.Controls.AddAt(i, new LiteralControl((current as HyperLink).Text));
            }
            else if (current is DropDownList)
            {
                control.Controls.Remove(current);
                control.Controls.AddAt(i, new LiteralControl((current as DropDownList).SelectedItem.Text));
            }
            else if (current is CheckBox)
            {
                control.Controls.Remove(current);
                control.Controls.AddAt(i, new LiteralControl((current as CheckBox).Checked ? "True" : "False"));
            }
 
            if (current.HasControls())
            {
                PrepareControlForExport(current);
            }
        }
    }
        //-------download xls file in this page-----//
        protected void btnRedirect_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("https://www.biliardoprofessionale.it");
        }

        //Email id check
        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CheckEmail";
            con.Open();
            cmd.Parameters.AddWithValue("@TableName", "Player");
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
        private string PopulateBody(string Name, string Email, string Password, DataTable dt,bool player)
        {
            string body = string.Empty;
            if (player)
            {
                using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/PlayerEmailConfirmation.html")))
                {
                    body = reader.ReadToEnd();
                }
            }
            else
            {
                using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/PlayerRegistrationTemplateForClub.html")))
                {
                    body = reader.ReadToEnd();
                }
            }
            body = body.Replace("{Name}", Name);
            body = body.Replace("{Cname}", Convert.ToString(dt.Rows[0]["Cname"]));
            body = body.Replace("{ClubName}", Convert.ToString(dt.Rows[0]["ClubName"]));
            body = body.Replace("{Email}", Email);
            body = body.Replace("{Password}", Password);
            body = body.Replace("{FamilyName}", Convert.ToString(dt.Rows[0]["FamilyName"]));
            body = body.Replace("{Email}", Convert.ToString(dt.Rows[0]["Email"]));
            body = body.Replace("{Password}", Convert.ToString(dt.Rows[0]["Password"]));
            body = body.Replace("{VatNo}", Convert.ToString(dt.Rows[0]["VatNo"]));
            body = body.Replace("{Nation}", Convert.ToString(dt.Rows[0]["Nation"]));
            body = body.Replace("{City}", Convert.ToString(dt.Rows[0]["City"]));
            body = body.Replace("{Zip}", Convert.ToString(dt.Rows[0]["Zip"]));
            body = body.Replace("{Street}", Convert.ToString(dt.Rows[0]["Street"]));
            body = body.Replace("{Phone}", Convert.ToString(dt.Rows[0]["Phone"]));
            body = body.Replace("{Cell}", Convert.ToString(dt.Rows[0]["Cell"]));
            body = body.Replace("{NDegree}", Convert.ToString(dt.Rows[0]["NDegree"]));
            body = body.Replace("{PlayerPicture}", Convert.ToString(dt.Rows[0]["PlayerPicture"]));
            body = body.Replace("{ShareData}", Convert.ToString(dt.Rows[0]["nbpaypal"]));
            body = body.Replace("{ClubWebsite}", Convert.ToString(dt.Rows[0]["ClubWebsite"]));
            body = body.Replace("{FederationMembership}", Convert.ToString(dt.Rows[0]["FederationMembership"]));
            body = body.Replace("{Category}", Convert.ToString(dt.Rows[0]["Category"]));
            body = body.Replace("{GameSpeciality}", Convert.ToString(dt.Rows[0]["GameSpeciality"]));
            body = body.Replace("{ScoreSponsor}", Convert.ToString(dt.Rows[0]["nbcodice"]));
            body = body.Replace("{LookingForSponsor}", Convert.ToString(dt.Rows[0]["nbncarta"]));
            body = body.Replace("{RightsTelevisionImage}", Convert.ToString(dt.Rows[0]["nbexpirydate"]));
            body = body.Replace("{Status}", Convert.ToString(dt.Rows[0]["Status"]));
            body = body.Replace("{Url}", Convert.ToString(dt.Rows[0]["PlayerId"]));
            return body;
        }
        protected void btnForgetPassword_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CheckEmail";
            con.Open();
            cmd.Parameters.AddWithValue("@TableName", "Player");
            cmd.Parameters.AddWithValue("@Email", txtForgetPassword.Text.Trim());
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);

            SqlDataReader dr = cmd.ExecuteReader();
            if (ds.Tables[0].Rows.Count > 0)
            {
                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/ForgetPasswordTemplate.html")))
                {
                    body = reader.ReadToEnd();
                }

                body = body.Replace("{Name}", ds.Tables[0].Rows[0]["Name"].ToString());
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
            try
            { 
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "LoginDetails";
                    con.Open();
                    cmd.Parameters.AddWithValue("@TableName", "Player");
                    cmd.Parameters.AddWithValue("@Email", txtId.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPw.Text.Trim());
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Redirect("Final.aspx");
                    }
                    else
                    {
                        lblSignIn.Text = "Sorry, wrong email or password.";
                        lblSignIn.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (fillall())
            {
                if (rbTermandcondition.SelectedValue == "Yes")
                {
                    if (fuPlayerPicture.HasFile == true)
                    {
                        string FileName = Path.GetFileName(fuPlayerPicture.PostedFile.FileName);
                        //Save files to disk
                        fuPlayerPicture.SaveAs(Server.MapPath("public/Upload/Player/" + FileName));
                    }
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "AddPlayer";
                    cmd.Parameters.AddWithValue("@PlayerId", hdnPlayerId.Value);
                    cmd.Parameters.AddWithValue("@ClubId", ClubId.Value.ToString());
                    cmd.Parameters.AddWithValue("@FamilyName", txtFamilyName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", rbGender.SelectedValue);
                    string[] words = hdnpp.Value.Split('\\');
                    if (words.Count() >= 2)
                    {
                        cmd.Parameters.AddWithValue("@PlayerPicture", "public/Upload/Player/" + words[words.Length - 1]);
                    }
                    else
                    {
                        words = hdnpp.Value.Split('/');
                        cmd.Parameters.AddWithValue("@PlayerPicture", "public/Upload/Player/" + words[words.Length - 1]);
                    }
                    cmd.Parameters.AddWithValue("@VatNo", "0000");
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
                    cmd.Parameters.AddWithValue("@Category", ddCategoryLevel.SelectedValue);
                    cmd.Parameters.AddWithValue("@GameSpeciality", rbGameSpeciality.SelectedValue);
                    cmd.Parameters.AddWithValue("@ScoreSponsor", false);
                    cmd.Parameters.AddWithValue("@LookingForSponsor", true);
                    cmd.Parameters.AddWithValue("@RightsTelevisionImage", true);
                    // neeraj  ----start ---
                    cmd.Parameters.AddWithValue("@nbpaypal", txtpaypal.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbinfo", rgbinfocom.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbsponser", rgbsponser.SelectedValue);
                    cmd.Parameters.AddWithValue("@nbiscri", rgblbliscri.Text.Trim());

                    cmd.Parameters.AddWithValue("@nbcodice", txtcodice.Text.Trim());
                    cmd.Parameters.AddWithValue("@nbncarta", txtncarta.Text.Trim());
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
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Player details updated successfully'); window.location.href = 'PlayerRegistration.aspx';", true);
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
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "LoginDetails";
                    con.Open();
                    cmd.Parameters.AddWithValue("@TableName", "Player");
                    cmd.Parameters.AddWithValue("@Email", txtId.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPw.Text.Trim());
                    cmd.Connection = con;
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        hdnPlayerId.Value = Convert.ToString(ds.Tables[0].Rows[0]["PlayerId"]).Trim();
                        ClubId.Value = Convert.ToString(ds.Tables[0].Rows[0]["ClubId"]).Trim();
                        txtClubMembership.Text = Convert.ToString(ds.Tables[0].Rows[0]["ClubName"]).Trim();
                        txtFamilyName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FamilyName"]).Trim();
                        txtName.Text = Convert.ToString(ds.Tables[0].Rows[0]["Name"]).Trim();
                       // rbGender.Text = Convert.ToString(ds.Tables[0].Rows[0]["Gender"]);
                        hdnpp.Value = Convert.ToString(ds.Tables[0].Rows[0]["PlayerPicture"]).Trim();
                        impProfPic.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["PlayerPicture"]).Trim();
                        //txtFiscalCode.Text = Convert.ToString(ds.Tables[0].Rows[0]["VatNo"]);
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
                        //rbShare.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["ShareData"]);
                        txtWebsite.Text = Convert.ToString(ds.Tables[0].Rows[0]["ClubWebsite"]).Trim();
                        txtFederation.Text = Convert.ToString(ds.Tables[0].Rows[0]["FederationMembership"]).Trim();
                        ddCategoryLevel.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["Category"]).Trim();
                       // rbGameSpeciality.Text = Convert.ToString(ds.Tables[0].Rows[0]["GameSpeciality"]);
                        //rbScoreSponsor.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["ScoreSponsor"]);
                      //rbLookingSponsor.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["LookingForSponsor"]);
                        //rbTelevisonImage.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["RightsTelevisionImage"]);

                        // neeraj  ----start ---
                        try{txtpaypal.Text = Convert.ToString(ds.Tables[0].Rows[0]["nbpaypal"]).Trim();}catch{}
                        try{rgbinfocom.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["nbinfo"]).Trim();}catch{}
                        try{rgbsponser.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["nbsponser"]).Trim();}catch{}
                        try{rgblbliscri.Text = Convert.ToString(ds.Tables[0].Rows[0]["nbiscri"]).Trim();}catch{}
                        try { lblregistration.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["RegisteredOn"]).ToShortDateString() + " to " + Convert.ToDateTime(ds.Tables[0].Rows[0]["nbexpirydate"]).ToShortDateString(); }
                        catch { try { lblregistration.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["RegisteredOn"]).ToShortDateString() + " to " + Convert.ToDateTime(ds.Tables[0].Rows[0]["nbexpirydate"]).AddYears(1).ToShortDateString(); } catch { lblregistration.Text = ""; } }
                        try{txtcodice.Text = Convert.ToString(ds.Tables[0].Rows[0]["nbcodice"]).Trim();}catch{}
                        try{txtncarta.Text = Convert.ToString(ds.Tables[0].Rows[0]["nbncarta"]).Trim();}catch{}
                        // neeraj  ----end-----

                        btnSave.Visible = true;
                        btnSignup.Visible = false;

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
            catch (Exception ex)
            {
                throw ex;
            }            
        }
    }
}