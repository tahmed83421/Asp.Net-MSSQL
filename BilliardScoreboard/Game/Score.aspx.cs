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
namespace BilliardScoreboard.Game
{

    public partial class Score : System.Web.UI.Page
    {
       static string mailattatchment = "nb";
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
           // this.Response.Redirect("~/Default.aspx");
            //if (!IsPostBack)
            //{
            //    if (Setup.s3.Equals(1)) ZZ.Value = "1";

            //    if (Setup.s4.Equals(1)) PP.Value = "1";

            //    if (Setup.s5.Equals(1)) II.Value = "1";         

            //        lblPlayer1.Text = Convert.ToString(Session["P1"]);
            //        imgPlayer1.ImageUrl = Convert.ToString(Session["PP1"]);
            //        lblClub1.Text = Convert.ToString(Session["C1"]);
            //        imgClub1.ImageUrl = Convert.ToString(Session["CP1"]);
            //        lblPlayer3.Text = Convert.ToString(Session["P2"]);
            //        imgPlayer3.ImageUrl = Convert.ToString(Session["PP2"]);
            //        lblClub3.Text = Convert.ToString(Session["C2"]);
            //        imgClub3.ImageUrl = Convert.ToString(Session["CP2"]);
            //        lblPlayer2.Text = Convert.ToString(Session["P3"]);
            //        imgPlayer2.ImageUrl = Convert.ToString(Session["PP3"]);
            //        lblClub2.Text = Convert.ToString(Session["C3"]);
            //        imgClub2.ImageUrl = Convert.ToString(Session["CP3"]);
            //        lblPlayer4.Text = Convert.ToString(Session["P4"]);
            //        imgPlayer4.ImageUrl = Convert.ToString(Session["PP4"]);
            //        lblClub4.Text = Convert.ToString(Session["C4"]);
            //        imgClub4.ImageUrl = Convert.ToString(Session["CP4"]);

            //    lblGameType.Text = Convert.ToString(Session["Game"]) + " Game " + Convert.ToString(Session["Pins"]) +" "+ Convert.ToString(Session["Point"]) + "P";
            //    lbls1.Text = "s" + "0/" + Convert.ToString(Session["Set"]);
            //    lbls2.Text = "s" + "0/" + Convert.ToString(Session["Set"]);

            //    if (Convert.ToString(Session["Game"]) == "Italian")
            //    {
            //        lblt1.Text = "t0";
            //        lblt2.Text = "t0";
            //        lblGameType.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00CC00");
            //        lblp1.Text = "p" + Convert.ToString(Session["Point"]);
            //        lblp2.Text = "p" + Convert.ToString(Session["Point"]);
            //    }
            //    else if (Convert.ToString(Session["Game"]) == "Carom")
            //    {
            //        lblt1.Text = "i0";
            //        lblt2.Text = "i0";
            //        lblGameType.ForeColor = System.Drawing.ColorTranslator.FromHtml("#33CCFF");
            //        lblp1.Text = "c" + Convert.ToString(Session["Point"]);
            //        lblp2.Text = "c" + Convert.ToString(Session["Point"]);
            //    }
            //}
           
        }
       
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Time"]) == "True")
            {
                string[] items = lblTime.Text.Split(':');
                int hours = int.Parse(items[0]);
                int mins = int.Parse(items[1]);
                int secs = int.Parse(items[2]);
                secs++;
                if (secs == 60)
                {
                    mins++;
                    secs = 0;
                    if (mins == 60)
                    {
                        hours++;
                        mins = 0;
                        if (hours == 24) hours = 0;
                    }
                }
                lblTime.Text = String.Format("{0:D2}:{1:D2}:{2:D2}", hours, mins, secs);
            }
        }
        private string PopulateBody(string param11,string point,string setm, string pl1, string pl2,string pl3,string pl4, string winpnt, string losepnt,string tt)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("EmailTemplate/ResultEmail.html")))
            {
                body = reader.ReadToEnd();
            }
            // prints score in table format
            string[] tabledata = param11.Split('R');
            string p1 = "";
            p1 = "<table> <tr>";
            for (int i = 1; i < tabledata.Count();i++ )
                p1 = p1 + "<td style="+'"'+"vertical-align:top"+'"'+"> R"+ tabledata[i] + "</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>";
            p1 = p1 + "</tr></table>";

            // calculate score stats

            //remove unesssary data
            param11 = param11.Replace("<br><br>", "<br>");
            param11 = param11.Replace("<u>", "");
            param11 = param11.Replace("</u>", "");
            param11 = param11.Replace("&nbsp;", "");

            //stats var
            int pl12set, pl34set, pl12shot, pl34shot, pl12score, pl34score, pl12zero, pl34zero,pl12gain,pl34gain, pl12pal, pl34pal, pl12han, pl34han;

            pl12set = pl34set = pl12shot = pl34shot = pl12score = pl34score = pl12zero = pl34zero = pl12gain=pl34gain= pl12pal = pl34pal = pl12han = pl34han = 0;

            tabledata = param11.Split('R');  //split game sets
            for (int i = 1; i < tabledata.Count();i++ )
            {
                string[] rowdata = tabledata[i].Split(new string[]{"<br>"},StringSplitOptions.None); //get rows
                int p1turn = 0;   
                for (int j = 1; j < rowdata.Count(); j++)
                {
                    rowdata[j] = rowdata[j].Trim();
                    if (rowdata[j].Contains("#000000"))   //if black
                    {
                        if (rowdata[j].Contains("2t")) //if timer panalty
                        {
                            p1turn = 2;
                            pl34gain += 2;
                        }
                        else if (rowdata[j].Contains("&"))
                        {
                            
                            try
                            {
                                pl12pal += Convert.ToInt32(rowdata[j].Split('&')[1].Split('t')[0]);
                                mailattatchment = pl12pal.ToString();
                            }
                            catch { }
 
                        }
                        else if(rowdata[j].Contains("@"))
                        {
                            try
                            {
                                pl12gain += Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]);
                                mailattatchment = pl12gain.ToString();
                            }
                            catch { }
                        }
                        else if (rowdata[j].Contains("%"))
                        {
                            p1turn = 1;
                            try
                            {
                                pl12han += Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]);
                                mailattatchment = pl12han.ToString();
                            }
                            catch { }
                        }
                        else
                        {
                            pl12shot++;
                            p1turn = 1;
                            try
                            {
                                if (Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]) == 0)
                                    pl12zero++;
                                pl12score += Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]);
                                mailattatchment = pl12score.ToString();
                            }
                            catch { }
                        }
                        
                    }
                    else                                  // if red
                        if (rowdata[j].Contains("#D2691E"))
                        {
                            if (rowdata[j].Contains("2t")) //if timer panalty
                            {
                                p1turn = 1;
                                pl12gain += 2;
                            }
                            else if (rowdata[j].Contains("&"))
                            {

                                try
                                {
                                    pl34pal += Convert.ToInt32(rowdata[j].Split('&')[1].Split('t')[0]);
                                    mailattatchment = pl34pal.ToString();
                                }
                                catch { }

                            }
                            else if (rowdata[j].Contains("@"))
                            {
                                try
                                {
                                    pl34gain += Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]);
                                    mailattatchment = pl34gain.ToString();
                                }
                                catch { }
                            }
                            else if (rowdata[j].Contains("%"))
                            {
                                p1turn = 2;
                                try
                                {
                                    pl34han += Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]);
                                    mailattatchment = pl34han.ToString();
                                }
                                catch { }
                            }
                            else
                            {
                                pl34shot++;
                                p1turn = 2;
                                try
                                {
                                    if (Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]) == 0)
                                        pl34zero++;
                                    pl34score += Convert.ToInt32(rowdata[j].Split('>')[1].Split('t')[0]);
                                    mailattatchment = pl34score.ToString();
                                }
                                catch { }
                            }
                        }
                }
                //set wins
                if (p1turn == 1)
                    pl12set++;
                if (p1turn == 2)
                    pl34set++;
            }
            
            p1 = p1 + "<br> " + pl1 + " / " + pl2 + "--statistic :</strong>";
            p1 = p1 + "<br> [Set Wins " + pl12set + "]--[Total Shots " + pl12shot + "/media points " + (pl12score +pl12pal+pl12han+pl12gain)+ "]--[Shot with points " + (pl12shot-pl12zero) + "/media points " + pl12score + "]--[shot with zeroPoint "+pl12zero+"]--[points grainted "+pl12gain+"]--[panalty point " + pl12pal + "]--[handicap point "+pl12han+"]";
            p1 = p1 + "<br> <br>";
            p1 = p1 + "<br> <font style=" + '"' + "color:#D2691E" + '"' + "><strong>"+ pl3 + " / " + pl4 + "--statistic :</strong>";
            p1 = p1 + "<br>[Set Wins " + pl34set + "]--[Total Shots " + pl34shot + "/media points " + (pl34score +pl34pal+pl34han+pl34gain)+ "]--[Shot with points " + (pl34shot-pl34zero) + "/media points " + pl34score + "]--[shot with zeroPoint "+pl34zero+"]--[points grainted "+pl34gain+"]--[panalty point " + pl34pal + "]--[handicap point "+pl34han+"]";
            p1 = p1 + "<strong></font>";

            string clb1= Convert.ToString(Session["C1"]);
            
            string clb2= Convert.ToString(Session["C2"]);
            string clb3 = Convert.ToString(Session["C3"]);
            string clb4 = Convert.ToString(Session["C4"]);
            string quil = Convert.ToString(Session["Pins"]);
            string t1 = Convert.ToString(Session["Timer1"]);
            string t2 = Convert.ToString(Session["Timer2"]);
            
            body = body.Replace("{Point}", point);
            body = body.Replace("{Set}", setm);

            body = body.Replace("{Quills}", quil);
            body = body.Replace("{Timer1}", t1);
            body = body.Replace("{Timer2}", t2);
            body = body.Replace("{TimeFinish}", tt);

            body = body.Replace("{Res1}", p1);
          
            body = body.Replace("{Name1}", pl1);
            body = body.Replace("{Name2}", pl2);
            body = body.Replace("{Name3}", pl3);
            body = body.Replace("{Name4}", pl4);
            body = body.Replace("{Club1}", clb1);
            body = body.Replace("{Club2}", clb2);
            body = body.Replace("{Club3}", clb3);
            body = body.Replace("{Club4}", clb4);
            body = body.Replace("{Winpoint}", winpnt);
            body = body.Replace("{Losepoint}", losepnt);

            if (pl12set >= pl34set)
            {
                body = body.Replace("{win1}", pl1);
                body = body.Replace("{win2}", pl2);
                body = body.Replace("{win3}", pl3);
                body = body.Replace("{win4}", pl4);
            }
            else
            {
                body = body.Replace("{win1}", pl3);
                body = body.Replace("{win2}", pl4);
                body = body.Replace("{win3}", pl1);
                body = body.Replace("{win4}", pl2);
            }

            return body;
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
        public static string mail(string s)
        {

            String email = "";
            String name = s.Substring(s.IndexOf(' ') + 1);
            //String fmlyname = s.Substring(s.IndexOf(' ') + 1, s.Length);
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            string oString = "Select Email from PlayerDetails where FamilyName=@name";

            SqlCommand oCmd = new SqlCommand(oString, con);
            oCmd.Parameters.AddWithValue("@name", name);
            con.Open();
            using (SqlDataReader oReader = oCmd.ExecuteReader())
            {
                while (oReader.Read())
                {
                    email = oReader["Email"].ToString();
                    string mail2 = oReader["Email"].ToString();
                }

                con.Close();
                

            }
            return email;
        }


        // Insert Live Score .. New 
        [System.Web.Services.WebMethod]
        public static void InsertLiveScoreData(string Score,string TVal)
        {

            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    //  cmd.CommandText = "update RealTimeScoreDetails set Score=" + Score + ", TVal=" + TVal + ",PVal=" + PVal + " , SVal= " + SVal + " where MatchId=" + Setup.MatchId + " AND TeamID=" + TeamID + '1';
                    //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                    cmd.CommandText = "update RealTimeScoreDetails set Score= "+Score+", TVal='"+TVal+"',PVal='p60' , SVal= '0/2' where MatchId= "+Setup.MatchId+" AND TeamID=1";
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteReader();


                    con.Close();

                }
            }
        }

        [System.Web.Services.WebMethod]
        public static string UpdateScoreData(string Score, string PVal, string TVal, string SVal,string TeamID)
        {
           
           
           

                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "update RealTimeScoreDetails set Score="+Score+", TVal='"+TVal+"',PVal='"+PVal+"' , SVal= '"+SVal+"' where MatchId=" +Setup.MatchId + " AND TeamID="+TeamID+"";
                    //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                    cmd2.Connection = con;

                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();


                }

         
            return "Succedd";
            }
            




        [System.Web.Services.WebMethod]
        public static string SomeMethod1(string pl1, string pl2, string pl3, string pl4)
        {
            try
            { 

            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                String PW1 = PW(pl1);
                String PW2 = PW(pl2);
                String PW3 = PW(pl3);
                String PW4 = PW(pl4);

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW1 + "'";
                //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                cmd.Connection = con;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW2 + "'";
                //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                cmd1.Connection = con;

                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();

                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandType = CommandType.Text;
                cmd2.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW3 + "'";
                //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                cmd2.Connection = con;

                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();

                SqlCommand cmd3 = new SqlCommand();
                cmd3.CommandType = CommandType.Text;
                cmd3.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW4 + "'";
                //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                cmd3.Connection = con;

                con.Open();
                cmd3.ExecuteNonQuery();
                con.Close();
            }

        }
            catch (System.Exception ex)
            {
                throw (ex);


            }
            return PW(pl1);
            
        }
        [System.Web.Services.WebMethod]
        public static string SomeMethod(string param1,string point,string setm, string pl1, string pl2,string pl3,string pl4,string winpnt,string losepnt,string tt)
        {
           
                String c = BilliardScoreboard.ss;
                Score s = new Score();
                string bodd = "";
                try
                {
                  bodd=  s.PopulateBody(param1, point, setm, pl1, pl2, pl3, pl4, winpnt, losepnt, tt);
                }
                catch { }

                try
                {
                    try
                    {
                        using (MailMessage mailMessage = new MailMessage())
                        {
                            String plyr1 = pl1;
                            mailMessage.From = new MailAddress("info@biliardoprofessionale.it");
                            mailMessage.Subject = "Game Summary";
                            mailMessage.Body = bodd;
                            mailMessage.IsBodyHtml = true;

                            //{
                            //    //Get some binary data
                            //    byte[] data = Encoding.ASCII.GetBytes(mailattatchment);

                            //    //save the data to a memory stream
                            //    System.IO.MemoryStream ms = new System.IO.MemoryStream(data);

                            //    //create the attachment from a stream. Be sure to name the data with a file and
                            //    //media type that is respective of the data

                            //    System.Net.Mime.ContentType ct = new System.Net.Mime.ContentType(System.Net.Mime.MediaTypeNames.Text.Html);
                            //    System.Net.Mail.Attachment attach = new System.Net.Mail.Attachment(ms, ct);
                            //    attach.ContentDisposition.FileName = "test.html";

                            //    mailMessage.Attachments.Add(attach);

                            //}
                            try { mailMessage.To.Add(new MailAddress(mail(pl1))); } catch { }
                            try{mailMessage.To.Add(new MailAddress(mail(pl2)));  }catch{ }
                            try{mailMessage.To.Add(new MailAddress(mail(pl3)));}catch{ }
                            try { mailMessage.To.Add(new MailAddress(mail(pl4))); } catch { }
                            SmtpClient smtp = new SmtpClient("smtp.biliardoprofessionale.it", 25);
                            smtp.EnableSsl = false;
                            System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential("info@biliardoprofessionale.it", "sergio123");
                            smtp.Credentials = NetworkCred;
                            smtp.Send(mailMessage);
                            //Response.Write("E-mail sent!");

                        }
                    }
                    catch { }
                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {

                        String PW1 = PW(pl1);
                        String PW2 = PW(pl2);
                        String PW3 = PW(pl3);
                        String PW4 = PW(pl4);

                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW1 + "'";
                        //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                        cmd.Connection = con;

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandType = CommandType.Text;
                        cmd1.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW2 + "'";
                        //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                        cmd1.Connection = con;

                        con.Open();
                        cmd1.ExecuteNonQuery();
                        con.Close();

                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandType = CommandType.Text;
                        cmd2.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW3 + "'";
                        //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                        cmd2.Connection = con;

                        con.Open();
                        cmd2.ExecuteNonQuery();
                        con.Close();

                        SqlCommand cmd3 = new SqlCommand();
                        cmd3.CommandType = CommandType.Text;
                        cmd3.CommandText = "Update PlayerDetails set login='0' WHERE Password Collate SQL_Latin1_General_CP1_CS_AS ='" + PW4 + "'";
                        //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                        cmd3.Connection = con;
                        con.Open();
                        cmd3.ExecuteNonQuery();
                        con.Close();
                    }
                }
                catch (System.Exception ex)
                {
                    throw (ex);
                }
            String hh = PW(pl1);
            string m = mail(pl1) + "<br>" +"<br>"+ mail(pl3);
            return PW(pl1);
        }
    }
}

