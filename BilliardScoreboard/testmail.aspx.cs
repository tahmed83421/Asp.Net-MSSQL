using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BilliardScoreboard
{
    public partial class testmail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Ad();
        }
        private string PopulateBody(string Name, string expdate, string click)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/PlayerRemember.html")))
            {  body = reader.ReadToEnd(); }
            body = body.Replace("{Cname}", Name);
            body = body.Replace("{expdate}",Convert.ToDateTime(expdate).Date.ToShortDateString());
            body = body.Replace("{Url}", click);
            return body;
        }
      void  Ad()
        {

            SqlCommand cmd = new SqlCommand("SELECT Name,FamilyName,Email,nbexpirydate,PlayerId FROM PlayerDetails where Status=@Status");
            cmd.Parameters.AddWithValue("@Status", "Active");
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.Connection = con;
            if (con.State != ConnectionState.Open) 
                con.Open();
            sda.SelectCommand = cmd;
            DataTable dt = new DataTable();
            sda.Fill(dt);


            //try
            //{
                foreach (DataRow dr in dt.Rows)
                {
                    //try
                    //{
                        DateTime datedime = Convert.ToDateTime(dr[3].ToString());

                        if (datedime.Date == DateTime.Now.Date || datedime.Date == DateTime.Now.Date.AddDays(-1) || datedime.Date == DateTime.Now.Date.AddDays(-7) ||
                            datedime.Date == DateTime.Now.Date.AddDays(-14) || datedime.Date == DateTime.Now.Date.AddDays(-21) || datedime.Date == DateTime.Now.Date.AddDays(-28))
                        {
                            string body = PopulateBody(dr[0].ToString() + "   " + dr[1].ToString(), dr[3].ToString(),dr[4].ToString());
                            using (MailMessage mailMessage = new MailMessage())
                            {
                                mailMessage.From = new MailAddress("info@biliardoprofessionale.it");
                                mailMessage.Subject ="Player registration";
                                mailMessage.Body = body;
                                mailMessage.IsBodyHtml = true;
                                mailMessage.To.Add(new MailAddress(dr[2].ToString()));

                                SmtpClient smtp = new SmtpClient("smtp.biliardoprofessionale.it", 25);
                                smtp.EnableSsl = false;
                                smtp.Credentials = new NetworkCredential("info@biliardoprofessionale.it", "sergio123");
                                smtp.Send(mailMessage);
                            }
                        }
                        else
                        {
                            if (datedime.Date < DateTime.Now.Date)
                            {
                                string body = PopulateBody(dr[0].ToString() + "   " + dr[1].ToString(), dr[3].ToString(), dr[4].ToString());
                                using (MailMessage mailMessage = new MailMessage())
                                {
                                    mailMessage.From = new MailAddress("info@biliardoprofessionale.it");
                                    mailMessage.Subject = "Player registration";
                                    mailMessage.Body = body;
                                    mailMessage.IsBodyHtml = true;
                                    mailMessage.To.Add(new MailAddress(dr[2].ToString()));

                                    SmtpClient smtp = new SmtpClient("smtp.biliardoprofessionale.it", 25);
                                    smtp.EnableSsl = false;
                                    smtp.Credentials = new NetworkCredential("info@biliardoprofessionale.it", "sergio123");
                                    smtp.Send(mailMessage);
                                }

                                cmd = new SqlCommand("UPDATE PlayerDetails SET Status=@Status where Email=@Email", con);
                                cmd.Parameters.AddWithValue("@Status", "Stop");
                                cmd.Parameters.AddWithValue("@Email", dr[2].ToString());
                                if (con.State != ConnectionState.Open)
                                    con.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }


                    //}
                    //catch { }
                }
           // }
            //catch { }



        }

    }
}