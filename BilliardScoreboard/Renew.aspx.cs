// Decompiled with JetBrains decompiler
// Type: BilliardScoreboard.Activate
// Assembly: BilliardScoreboard, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: 3495D177-A22A-4438-98EF-642A25D54653
// Assembly location: E:\score.biliardoprofessionale.it\BilliardScoreboard.dll

using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Web;

namespace BilliardScoreboard
{
    public partial class Renew : Page
    {
        private SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        protected HtmlForm form1;
        protected LinkButton lnkClick;
        public DataTable dt = new DataTable();   //name email pass clubid
        public DataSet ds2 = new DataSet();     // player showing details

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Request.QueryString["PlayerId"] != null)
            {
                string PID = this.Request.QueryString["PlayerId"].ToString();
                SqlDataAdapter ad = new SqlDataAdapter("SELECT Name,Email,Password,ClubId,nbexpirydate FROM PlayerDetails WHERE PlayerId='" + PID.ToString() + "' ", this.con);
                ad.Fill(dt);

                
            }

            else
                this.Response.Redirect("https://www.biliardoprofessionale.it/");
        }
        protected void lnkClick_Click(object sender, EventArgs e)
        {
            //try
            //{
            DateTime exp= Convert.ToDateTime(dt.Rows[0]["nbexpirydate"]);
            if (exp.Date <= DateTime.Now.Date|| exp.Date<= DateTime.Now.AddMonths(1).Date)
            {

                SqlCommand sqlCommand = new SqlCommand("UPDATE PlayerDetails SET Status='Stop',nbexpirydate=@nbexpirydate WHERE PlayerId=@PlayerId", this.con);
                sqlCommand.Parameters.AddWithValue("@PlayerId", (object)this.Request.QueryString["PlayerId"].ToString());
                if (exp.Date <= DateTime.Now.Date)
                    sqlCommand.Parameters.AddWithValue("@nbexpirydate", DateTime.Now.AddYears(1));
                else sqlCommand.Parameters.AddWithValue("@nbexpirydate", exp.AddYears(1));
                this.con.Open();
                sqlCommand.ExecuteNonQuery();
                this.con.Close();

                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.CommandText = "RegistrationDetails";
                cmd2.Parameters.AddWithValue("@TableName", "Player");
                cmd2.Parameters.AddWithValue("@Email", Convert.ToString(dt.Rows[0]["Email"]));
                cmd2.Parameters.AddWithValue("@Password", Convert.ToString(dt.Rows[0]["Password"]));
                cmd2.Connection = con;
                SqlDataAdapter da2 = new SqlDataAdapter();
                da2.SelectCommand = cmd2;
                da2.Fill(ds2);

                string body = PopulateBody(dt.Rows[0]["Name"].ToString(), dt.Rows[0]["Email"].ToString(), dt.Rows[0]["Password"].ToString(), ds2.Tables[0], true);
                SendHtmlFormattedEmail(dt.Rows[0]["Email"].ToString(), "Renew registration completed successfully", body);

                body = PopulateBody(dt.Rows[0]["Name"].ToString(), dt.Rows[0]["Email"].ToString(), dt.Rows[0]["Password"].ToString(), ds2.Tables[0], false);
                SendHtmlFormattedEmailclub(ds2.Tables[0].Rows[0]["Cemail"].ToString(), "Renew Player registration completed successfully", body);

                this.Response.Redirect("https://www.biliardoprofessionale.it");
            }
            else this.Response.Redirect("https://www.biliardoprofessionale.it");
                //}
            //catch { }
        }
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
        protected byte[] GetData()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM PlayerDetails WHERE ClubId = " + dt.Rows[0]["ClubId"].ToString());
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = con;
            if (con.State != ConnectionState.Open) con.Open();
            sda.SelectCommand = cmd;
            DataTable dtt = new DataTable();
            sda.Fill(dtt);

            cmd = new SqlCommand("SELECT ClubName,Street,NDegree,Zip,City FROM ClubDetails WHERE ClubId = " + dt.Rows[0]["ClubId"].ToString());
            cmd.Connection = con;
            if (con.State != ConnectionState.Open) con.Open();
            sda.SelectCommand = cmd;
            DataTable dtc = new DataTable();
            sda.Fill(dtc);


            dtt.Columns.Remove("ClubId");
            dtt.Columns.Remove("PlayerPicture");
            dtt.Columns.Remove("Password");
            dtt.Columns.Remove("login");
            dtt.Columns.Remove("ShareData");
            dtt.Columns.Remove("ScoreSponsor");
            dtt.Columns.Remove("LookingForSponsor");
            dtt.Columns.Remove("RightsTelevisionImage");
            dtt.Columns.Remove("VatNo");

            string strBody = DataTable2ExcelString(dtt, dtc);
            byte[] data = Encoding.ASCII.GetBytes(strBody);
            return data;
        }
        static string DataTable2ExcelString(System.Data.DataTable dt, System.Data.DataTable dtc)
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
        private string PopulateBody(string Name, string Email, string Password, DataTable dt, bool player)
        {
            string body = string.Empty;
            if (player)
            {
                using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/PlayerRegistrationTemplate.html")))
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
      
    }
}