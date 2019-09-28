// Decompiled with JetBrains decompiler
// Type: BilliardScoreboard.Game.Setup
// Assembly: BilliardScoreboard, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 3495D177-A22A-4438-98EF-642A25D54653
// Assembly location: E:\score.biliardoprofessionale.it\BilliardScoreboard.dll


using System;
using System.Drawing;
using System.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

namespace BilliardScoreboard.Game
{
    public partial class Setup : Page
    {
        // private CaptureDeviceEnumeratorTests captureDeviceEnumeratorTest = new CaptureDeviceEnumeratorTests();
        public static int s3 = 0;
        public static int s4 = 0;
        public static int s5 = 0;

        protected HtmlForm form1;
        protected HtmlGenericControl topLine;
        protected Label lblGameName;
        protected Label lblSpeed;
        protected CheckBox chkSpeed;
        protected Label lblLabel;
        protected CheckBox chkLabel;
        protected Label lblEmail;
        protected CheckBox chkEmail;
        protected Label lblPoint;
        protected TextBox txtPoint;
        protected Label lblSet;
        protected TextBox txtSet;
        protected Label lblPins;
        protected TextBox txtPins;
        protected Label lblTimer1;
        protected TextBox txtTimer1;
        protected Label lblTimer2;
        protected TextBox txtTimer2;
        protected Label lblTime;
        protected HtmlInputCheckBox roundedOne;
        protected Label lblPlayerName1;
        protected HiddenField P1;
        protected HiddenField IP1;
        protected Label lblC1;
        protected HiddenField C1;
        protected HiddenField IC1;
        protected System.Web.UI.WebControls.Image imgP1;
        protected Label lblP1;
        protected TextBox txtn1PW;
        protected System.Web.UI.WebControls.Image imgC1;
        protected Label lblPlayerName3;
        protected HiddenField P3;
        protected HiddenField IP3;
        protected Label lblC3;
        protected HiddenField C3;
        protected HiddenField IC3;
        protected System.Web.UI.WebControls.Image imgP3;
        protected Label lblP3;
        protected TextBox txtn3PW;
        protected System.Web.UI.WebControls.Image imgC3;
        protected Label lblPlayerName2;
        protected HiddenField P2;
        protected HiddenField IP2;
        protected Label lblC2;
        protected HiddenField C2;
        protected HiddenField IC2;
        protected System.Web.UI.WebControls.Image imgP2;
        protected Label lblP2;
        protected TextBox txtn2PW;
        protected System.Web.UI.WebControls.Image imgC2;
        protected Label lblPlayerName4;
        protected HiddenField P4;
        protected HiddenField IP4;
        protected Label lblC4;
        protected HiddenField C4;
        protected HiddenField IC4;
        protected System.Web.UI.WebControls.Image imgP4;
        protected Label lblP4;
        protected TextBox txtn4PW;
        protected System.Web.UI.WebControls.Image imgC4;
        protected Button btnSelectGame;
        protected Button btnReset;
        protected HtmlGenericControl bottomLine;
        protected Label lblSite;
        protected HiddenField hdnStatus1;
        protected HiddenField hdnStatus2;
        protected Button btnEnter;
        protected HiddenField hdnPlay1;
        protected HiddenField hdnPlay4;
        protected HiddenField hdnPlay2;
        protected HiddenField hdnPlay3;
        protected HiddenField hdnClub1;
        protected HiddenField hdnClub2;
        protected HiddenField hdnClub3;
        protected HiddenField hdnClub4;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Response.Redirect("~/Default.aspx");
            //if (Convert.ToString(this.Request.QueryString["Game"]) == "Ita")
            //    this.Session["Game"] = (object)"Italian";
            //else if (Convert.ToString(this.Request.QueryString["Game"]) == "Carom")
            //    this.Session["Game"] = (object)"Carom";
            //if (!this.IsPostBack)
            //{
            //    if (Convert.ToString(this.Session["Game"]) == "Italian")
            //    {
            //        this.lblGameName.Text = "Italian Game";
            //        this.lblGameName.ForeColor = ColorTranslator.FromHtml("#FFFFFF");
            //        this.lblPins.Text = "Quills";
            //        this.txtPins.Text = "5";
            //        this.txtPins.Attributes.Add("onkeypress", "return IsPins(event,'Italian');");
            //        this.txtPoint.BackColor = ColorTranslator.FromHtml("#00CC00");
            //        this.txtSet.BackColor = ColorTranslator.FromHtml("#00CC00");
            //        this.txtPins.BackColor = ColorTranslator.FromHtml("#00CC00");
            //        this.txtTimer1.BackColor = ColorTranslator.FromHtml("#00CC00");
            //        this.txtTimer2.BackColor = ColorTranslator.FromHtml("#00CC00");
            //        this.topLine.Style.Add("background-color", "#00CC00");
            //        this.bottomLine.Style.Add("background-color", "#00CC00");
            //    }
            //    else if (Convert.ToString(this.Session["Game"]) == "Carom")
            //    {
            //        this.lblGameName.Text = "Carom Game";
            //        this.lblGameName.ForeColor = ColorTranslator.FromHtml("#FFFFFF");
            //        this.lblPins.Text = "Rail";
            //        this.txtPins.Text = "3";
            //        this.txtPins.Attributes.Add("onkeypress", "return IsPins(event,'Carom');");
            //        this.txtPoint.BackColor = ColorTranslator.FromHtml("#33CCFF");
            //        this.txtSet.BackColor = ColorTranslator.FromHtml("#33CCFF");
            //        this.txtPins.BackColor = ColorTranslator.FromHtml("#33CCFF");
            //        this.txtTimer1.BackColor = ColorTranslator.FromHtml("#33CCFF");
            //        this.txtTimer2.BackColor = ColorTranslator.FromHtml("#33CCFF");
            //        this.topLine.Style.Add("background-color", "#33CCFF");
            //        this.bottomLine.Style.Add("background-color", "#33CCFF");
            //    }
            //    else
            //        this.Response.Redirect("~/Default.aspx");
            //    this.txtTimer1.Text = "40\"";
            //    this.txtTimer2.Text = "20\"";
            //}
           // this.chkEmail.Checked = true;
        }
        public static string PW(string s)
        {
            String email = "";
            String name = s.Substring(s.IndexOf(' ') + 1);
            //String fmlyname = s.Substring(s.IndexOf(' ') + 1, s.Length);
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            string ooString = "Select Password from PlayerDetails where FamilyName=@name";

            SqlCommand oCmd = new SqlCommand(ooString, con);
            oCmd.Parameters.AddWithValue("@name", name);
            con.Open();
            using (SqlDataReader oReader = oCmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    email = oReader["Password"].ToString();
                    // string mail2 = oReader["Password"].ToString();
                }
                con.Close();
            }
            return email;
        }

        [SecuritySafeCritical]
        protected void btnEnter_Click(object sender, EventArgs e)
        {

            String p12 = PW(this.lblPlayerName1.Text);
            String p11 = PW(this.lblPlayerName1.Text);
            /* string str = this.captureDeviceEnumeratorTest.CanDetectMyWebCamTest();
             if (str != null && str != "")
             {
                 this.Response.Redirect("Scorewithtracking.aspx");
             }
             else*/
            {
                if (chkLabel.Checked == true) s3 = 1;
                else s3 = 0;
                this.Session["Zerochk"] = s3;
                if (chkSpeed.Checked == true) s4 = 1;
                else s4 = 0;
                this.Session["Penaltychk"] = s4;
                if (chkId.Checked == true) s5 = 1;
                else s5 = 0;
                this.Session["Point"] = (object)this.txtPoint.Text.Trim();
                this.Session["Set"] = (object)this.txtSet.Text.Trim();
                this.Session["Pins"] = (object)(this.txtPins.Text.Trim() + " " + this.lblPins.Text);
                this.Session["Timer1"] = (object)this.txtTimer1.Text.ToString().Remove(this.txtTimer1.Text.ToString().Length - 1);
                this.Session["Timer2"] = (object)this.txtTimer2.Text.ToString().Remove(this.txtTimer2.Text.ToString().Length - 1);
                this.Session["Time"] = (object)this.roundedOne.Checked;
                this.Session["P1"] = (object)this.Request.Form[this.P1.UniqueID];
                this.Session["PP1"] = (object)this.Request.Form[this.IP1.UniqueID];
                this.Session["C1"] = (object)this.Request.Form[this.C1.UniqueID];
                this.Session["CP1"] = (object)this.Request.Form[this.IC1.UniqueID];
                this.Session["P2"] = (object)this.Request.Form[this.P2.UniqueID];
                this.Session["PP2"] = (object)this.Request.Form[this.IP2.UniqueID];
                this.Session["C2"] = (object)this.Request.Form[this.C2.UniqueID];
                this.Session["CP2"] = (object)this.Request.Form[this.IC2.UniqueID];
                this.Session["P3"] = (object)this.Request.Form[this.P3.UniqueID];
                this.Session["PP3"] = (object)this.Request.Form[this.IP3.UniqueID];
                this.Session["C3"] = (object)this.Request.Form[this.C3.UniqueID];
                this.Session["CP3"] = (object)this.Request.Form[this.IC3.UniqueID];
                this.Session["P4"] = (object)this.Request.Form[this.P4.UniqueID];
                this.Session["PP4"] = (object)this.Request.Form[this.IP4.UniqueID];
                this.Session["C4"] = (object)this.Request.Form[this.C4.UniqueID];
                this.Session["CP4"] = (object)this.Request.Form[this.IC4.UniqueID];
                this.Session["P1ID"] = (object)this.hdnPlay1.Value;
                this.Session["P2ID"] = (object)this.hdnPlay2.Value;
                this.Session["P3ID"] = (object)this.hdnPlay3.Value;
                this.Session["P4ID"] = (object)this.hdnPlay4.Value;
                this.Session["C1ID"] = (object)this.hdnClub1.Value;
                this.Session["C2ID"] = (object)this.hdnClub2.Value;
                this.Session["C3ID"] = (object)this.hdnClub3.Value;
                this.Session["C4ID"] = (object)this.hdnClub4.Value;
                this.Session["StartTime"] = (object)string.Format("{0:yyyy-MM-dd HH:mm:ss}", (object)DateTime.Now);

                //  SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                // con.Open();
                //    SqlCommand cmd = new SqlCommand("UPDATE PlayerDetails SET login = '1' where PlayerId = 1", con);
                //    cmd.ExecuteNonQuery();
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {

                    String PW1 = PW(this.Session["P1"].ToString());
                    String PW2 = PW(this.Session["P2"].ToString());
                    String PW3 = PW(this.Session["P3"].ToString());
                    String PW4 = PW(this.Session["P4"].ToString());

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "Update PlayerDetails set login='1' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW1 + "'";
                    //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "Update PlayerDetails set login='1' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW2 + "'";
                    //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                    cmd1.Connection = con;

                    con.Open();
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "Update PlayerDetails set login='1' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW3 + "'";
                    //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                    cmd2.Connection = con;

                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    SqlCommand cmd3 = new SqlCommand();
                    cmd3.CommandType = CommandType.Text;
                    cmd3.CommandText = "Update PlayerDetails set login='1' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW4 + "'";
                    //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                    cmd3.Connection = con;

                    con.Open();
                    cmd3.ExecuteNonQuery();
                    con.Close();
                }
                 this.Response.Redirect("Score.aspx");
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            this.lblC1.Text = "";
            this.lblC2.Text = "";
            this.lblC3.Text = "";
            this.lblC4.Text = "";
            this.txtn1PW.Text = "";
            this.txtn2PW.Text = "";
            this.txtn3PW.Text = "";
            this.txtn4PW.Text = "";
            this.txtPins.Text = "";
            this.txtPoint.Text = "";
            this.txtSet.Text = "";
            this.txtTimer1.Text = "";
            this.txtTimer2.Text = "";
          /*
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE PlayerDetails SET login = '0' ", con);
            cmd.ExecuteNonQuery();
          */   
            this.Response.Redirect("~/Game/Setup.aspx");
        }
        protected void btnSelectGame_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("http://www.biliardoprofessionale.it/sart.htm");
        }
    }
}
