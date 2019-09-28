using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BilliardScoreboard
{
    public partial class costexcelmail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataTable table = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            downloadexcel();
        }
        void downloadexcel()
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad1 = new SqlDataAdapter("SELECT clubid,bilino FROM Cost where DownloadExel='t'", con);
                
                if (con.State != ConnectionState.Open)
                    con.Open();
                ad1.Fill(ds1);
                foreach (DataRow dtrow in ds1.Tables[0].Rows)
                {
                    SqlDataAdapter ad2 = new SqlDataAdapter("SELECT * FROM GameCost where (clubid='" + dtrow["clubid"].ToString() + "' AND billno='" + dtrow["bilino"].ToString() + "') AND (nbdate >=" + DateTime.Now.Date.AddDays(-1).ToShortDateString() + ")", con);
                    ds2 = new DataSet();
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    ad2.Fill(ds2);

                    // Here we create a DataTable with four columns.
                    table = new DataTable();
                    table.Columns.Add("Player's Email", typeof(string));
                    table.Columns.Add("Billiard no", typeof(string));
                    table.Columns.Add("Ammount", typeof(string));

                    foreach (DataRow dtrow1 in ds2.Tables[0].Rows)
                    {
                        if (dtrow1["p1"].ToString() != "0")
                            table.Rows.Add(dtrow1["p1"].ToString(), dtrow1["billno"].ToString(), dtrow1["costplayer"].ToString());
                        if (dtrow1["p2"].ToString() != "0")
                            table.Rows.Add(dtrow1["p2"].ToString(), dtrow1["billno"].ToString(), dtrow1["costplayer"].ToString());
                        if (dtrow1["p3"].ToString() != "0")
                            table.Rows.Add(dtrow1["p3"].ToString(), dtrow1["billno"].ToString(), dtrow1["costplayer"].ToString());
                        if (dtrow1["p4"].ToString() != "0")
                            table.Rows.Add(dtrow1["p4"].ToString(), dtrow1["billno"].ToString(), dtrow1["costplayer"].ToString());
                    }

                    if (table.Rows.Count > 0)
                    {
                        SqlDataAdapter ad3 = new SqlDataAdapter("SELECT Email FROM ClubDetails where ClubId='" + dtrow["clubid"].ToString() + "'", con);
                        DataSet ds3 = new DataSet();
                        if (con.State != ConnectionState.Open)
                            con.Open();
                        ad3.Fill(ds3);
                        string body = PopulateBody(dtrow["bilino"].ToString(), DateTime.Now.Date.AddDays(-1).ToShortDateString());
                        //get
                        SendHtmlFormattedEmailclubdownloadexcel(ds3.Tables[0].Rows[0]["Email"].ToString(), "DownloadExel", body);
                    }
                }
            }
        }

        string  PopulateBody(string bidno,string date)
        {
            string body =
            "<img src = " + '"' + "http://score.biliardoprofessionale.it/img/logoTop.png" + '"' + " /><br /><br />" +
                " <div style =" + '"' + "border-top:3px solid #22BCE5; border-top-width: 1px;" + '"' + "></div>" +
                "<span style = " + '"' + "font-family:Arial;font-size:10pt" + '"' + ">      <h1>  <strong>Download Exel </strong><br /></h1>" +
                "Hello <b>"+"</b><br /><br />" +
                " Please Download Exel Attatchment for :- <br><br>Billiard Number : " + bidno + "<br>" +
                "Date : " + date + "  <br>" +

                "Thanks<br />" +
                "Biliardo Professionale<br>";
            return body;
        }
        void SendHtmlFormattedEmailclubdownloadexcel(string recepientEmail, string subject, string body)
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
                    byte[] data = Encoding.ASCII.GetBytes(DataTable2ExcelString(table));

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
        static string DataTable2ExcelString(System.Data.DataTable dt)
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
    }
}