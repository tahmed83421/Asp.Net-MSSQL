using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Drawing.Imaging;
using System.Configuration;
using System.Text;
using System.Drawing;
using System.Net.NetworkInformation;

namespace BilliardScoreboard
{
    /// <summary>
    /// Summary description for BilliardScoreboard
    /// </summary>
    [WebService(Namespace = "https://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class BilliardScoreboard : System.Web.Services.WebService
    {
        public static String ss = "";

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<string> GetClubName(string prefixText, int count)
        {
            List<string> ClubResult = new List<string>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT ClubId, ClubName FROM ClubDetails WHERE ClubName LIKE '%' + '" + prefixText + "' +'%'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string item = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(dr["ClubName"].ToString(), dr["ClubId"].ToString());
                        ClubResult.Add(item);
                    }
                    con.Close();
                    return ClubResult;
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string GetPassword(string prefixText)
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM PlayerDetails WHERE Password = '" + prefixText + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        con.Close();
                        return "true";
                    }
                    else
                    {
                        con.Close();
                        return "false";
                    }
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public Details[] CheckPassword(string prefixText)
        {
            ss = prefixText;
            List<Details> details = new List<Details>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT  PD.PlayerId, PD.Name, PD.FamilyName, PD.PlayerPicture, CD.ClubName, CD.ClubLogo FROM PlayerDetails PD INNER JOIN ClubDetails CD ON CD.ClubId = PD.ClubId WHERE PD.Password Collate SQL_Latin1_General_CP1_CS_AS = '" + prefixText + "' AND CD.Status Collate SQL_Latin1_General_CP1_CS_AS ='Active' AND PD.Status Collate SQL_Latin1_General_CP1_CS_AS = 'Active' AND PD.login = '0'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {
                    Details dtl = new Details();
                    dtl.PlayerId = dtrow["PlayerId"].ToString();
                    dtl.Name = dtrow["Name"].ToString();
                    dtl.FamilyName = dtrow["FamilyName"].ToString();
                    dtl.PlayerPicture = dtrow["PlayerPicture"].ToString();
                    dtl.ClubName = dtrow["ClubName"].ToString();
                    dtl.ClubPicture = dtrow["ClubLogo"].ToString();
                    details.Add(dtl);
                }

            }
            return details.ToArray();
        }

        //----------------------------------------------------------------------//-----------------------------------------------------------//
        //windows api start..//

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public Details getPlayerDetails(string playerName)
        {
            ss = playerName;
            Details details = new Details();


            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT PD.Name,PD.Email, PD.FamilyName, PD.PlayerPicture, PD.login, CD.ClubName, CD.ClubLogo FROM PlayerDetails PD INNER JOIN ClubDetails CD ON CD.ClubId = PD.ClubId WHERE PD.Password Collate SQL_Latin1_General_CP1_CS_AS = '" + playerName + "' AND CD.Status Collate SQL_Latin1_General_CP1_CS_AS ='Active' AND PD.Status Collate SQL_Latin1_General_CP1_CS_AS = 'Active'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {
                    details.Name = dtrow["Name"].ToString();
                    details.PlayerId = dtrow["Email"].ToString();
                    details.FamilyName = dtrow["FamilyName"].ToString();
                    details.PlayerPicture = dtrow["PlayerPicture"].ToString();
                    details.ClubName = dtrow["ClubName"].ToString();
                    details.ClubPicture = dtrow["ClubLogo"].ToString();
                    details.ClubId = dtrow["login"].ToString();

                }

            }
            return details;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string AddBiliardNo(string ClubNo)
        {




            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("update RealTimeScoreDetails set BoardNo=@Bnum where MatchId=1111 AND TeamID=1",con);
             
                command.Parameters.AddWithValue("@Bnum", ClubNo);
                if (con.State != ConnectionState.Open)
                    con.Open();
                command.ExecuteNonQuery();
                con.Close();

            }
            return "success";
        }

        //webmethod for Setup details insert

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string AddPlayerDetailsOnStream(string MatchIDD,string Player1Name,string Player2Name, string Player3Name, string Player4Name,string Club1Name, string Club2Name, string Club3Name, string Club4Name,string imgPlayer1, string imgPlayer2, string imgPlayer3, string imgPlayer4,string imgClub1, string imgClub2, string imgClub3, string imgClub4)
        {
           
          


            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("Insert into MatchDetails (MatchIDD,Player1Name,Player2Name,Player3Name,Player4Name,Club1Name,Club2Name,Club3Name,Club4Name,imgPlayer1,imgPlayer2,imgPlayer3,imgPlayer4,imgClub1,imgClub2,imgClub3,imgClub4) Values("+MatchIDD+","+Player1Name+","+Player2Name+","+Player3Name+","+Player4Name+","+Club1Name+","+Club2Name+ "," + Club3Name + "," + Club4Name + "," + imgPlayer1 + "," + imgPlayer2 + "," +
                    imgPlayer3 + "," + imgPlayer4 + "," + imgClub1 + "," + imgClub2 + "," + imgClub3 + "," + imgClub4 + ")", con);
                if (con.State != ConnectionState.Open)
                    con.Open();
                command.ExecuteNonQuery();
                con.Close();

            }
            return "success";
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string AddPlayerDetailsOnStreamTest2(string MatchIDD, string Player1Name, string Player2Name
            ,  string Club1Name, string Club2Name,  string imgPlayer1, string imgPlayer2, string imgClub1, string imgClub2)
        {




            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("Insert into MatchDetails (MatchIDD,Player1Name,Player2Name,Club1Name,Club2Name,imgPlayer1,imgPlayer2,imgClub1,imgClub2) Values(@MatchIDD,@Player1Name,@Player2Name,@Club1Name,@Club2Name,@imgPlayer1,@imgPlayer2,@imgClub1,@imgClub2)", con);
                command.Parameters.AddWithValue("@MatchIDD", MatchIDD);
                command.Parameters.AddWithValue("@Player1Name", Player1Name);
                command.Parameters.AddWithValue("@Player2Name", Player2Name);
              

                command.Parameters.AddWithValue("@Club1Name", Club1Name);
                command.Parameters.AddWithValue("@Club2Name", Club2Name);

               
                command.Parameters.AddWithValue("@imgPlayer1", imgPlayer1);
                command.Parameters.AddWithValue("@imgPlayer2", imgPlayer2);
              
                command.Parameters.AddWithValue("@imgClub1", imgClub1);
                command.Parameters.AddWithValue("@imgClub2", imgClub2);
              

                if (con.State != ConnectionState.Open)
                    con.Open();
                command.ExecuteNonQuery();
                con.Close();

            }
            return "success";
        }


        //webmethod for Setup details insert test 

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string AddPlayerDetailsOnStreamTest(string MatchIDD,string Player1Name, string Player2Name, string Player3Name
            , string Player4Name,string Club1Name,string Club2Name,string Club3Name,string Club4Name,string imgPlayer1,string imgPlayer2,string imgPlayer3,string imgPlayer4,string imgClub1,string imgClub2,string imgClub3,string imgClub4)
        {
           



            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("Insert into MatchDetails (MatchIDD,Player1Name,Player2Name,Player3Name,Player4Name,Club1Name,Club2Name,Club3Name,Club4Name,imgPlayer1,imgPlayer2,imgPlayer3,imgPlayer4,imgClub1,imgClub2,imgClub3,imgClub4) Values(@MatchIDD,@Player1Name,@Player2Name,@Player3Name,@Player4Name,@Club1Name,@Club2Name,@Club3Name,@Club4Name,@imgPlayer1,@imgPlayer2,@imgPlayer3,@imgPlayer4,@imgClub1,@imgClub2,@imgClub3,@imgClub4)", con);
                command.Parameters.AddWithValue("@MatchIDD", MatchIDD);
                command.Parameters.AddWithValue("@Player1Name", Player1Name);
                command.Parameters.AddWithValue("@Player2Name", Player2Name);
                command.Parameters.AddWithValue("@Player3Name", Player3Name);
                command.Parameters.AddWithValue("@Player4Name", Player4Name);
              
                command.Parameters.AddWithValue("@Club1Name", Club1Name);
                command.Parameters.AddWithValue("@Club2Name", Club2Name);
               
              command.Parameters.AddWithValue("@Club3Name", Club3Name);
              command.Parameters.AddWithValue("@Club4Name", Club4Name);
               
             command.Parameters.AddWithValue("@imgPlayer1", imgPlayer1);
             command.Parameters.AddWithValue("@imgPlayer2", imgPlayer2);
             command.Parameters.AddWithValue("@imgPlayer3", imgPlayer3);
             command.Parameters.AddWithValue("@imgPlayer4", imgPlayer4);
                
            command.Parameters.AddWithValue("@imgClub1", imgClub1);
            command.Parameters.AddWithValue("@imgClub2", imgClub2);
            command.Parameters.AddWithValue("@imgClub3", imgClub3);
            command.Parameters.AddWithValue("@imgClub4", imgClub4);
          
                if (con.State != ConnectionState.Open)
                    con.Open();
                command.ExecuteNonQuery();
                con.Close();

            }
            return "success";
        }

        // >>>>>>>>>>>>>>>>>>>>>>>>>> FINAL Update on Streaming 

        // Insert Score Data During Game

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public  string UpdateScoreDataOnStream(string Score, string PVal, string TVal, string SVal, string TeamID)
        {




            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlCommand cmd= new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update RealTimeScoreDetails set Score=" + Score + ", TVal='" + TVal + "',PVal='" + PVal + "' , SVal= '" + SVal + "' where MatchId=1111 AND TeamID=" + TeamID + "";
                //                cmd.CommandText = "INSERT INTO PlayerDetails (LoggedIn) VALUES (1)";
                cmd.Connection = con;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


            }


            return "Succedd";
        }





        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string UpdatePlayerLogin(string Email, string login)
        {
            string id = false.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("update PlayerDetails set login=@login where Email=@Email", con);
                    sqlCommand.Parameters.AddWithValue("@Email", Email);
                    sqlCommand.Parameters.AddWithValue("@login", login);

                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    con.Close();
                    id = true.ToString();
                }

            }
            catch (Exception ex) { id = id + ex.ToString(); }
            return id;
        }
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public clubDetails getClubDetails(string EmailId, string Password)
        {
            clubDetails details = new clubDetails();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "LoginDetails";
                con.Open();
                cmd.Parameters.AddWithValue("@TableName", "Club");
                cmd.Parameters.AddWithValue("@Email", EmailId.Trim());
                cmd.Parameters.AddWithValue("@Password", Password.Trim());
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {
                    details.clubId = dtrow["ClubId"].ToString();
                    details.ClubName = dtrow["ClubName"].ToString();
                    details.ClubLogo = dtrow["ClubLogo"].ToString();
                    details.ContactPerson = dtrow["ContactPerson"].ToString();
                    details.CompanyName = dtrow["CompanyName"].ToString();
                    details.VatNo = dtrow["VatNo"].ToString();
                    details.Email = dtrow["Email"].ToString();
                    details.Password = dtrow["Password"].ToString();
                    details.Phone = dtrow["Phone"].ToString();
                    details.Cell = dtrow["Cell"].ToString();
                    details.Nation = dtrow["Nation"].ToString();
                    details.City = dtrow["City"].ToString();
                    details.Status = dtrow["Status"].ToString();

                }
            }
            return details;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string getClubPassword(string EmailId)
        {
            string pass = "";
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT Password	FROM ClubDetails WHERE Email ='" + EmailId + "'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                    pass = dtrow["Password"].ToString();
            }
            return pass;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]

        public void getmail(string name, string fmail, string tmail, string sub, string body)
        {
            SendHtmlFormattedEmail(name, fmail, tmail, sub, body);
        }
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public void getmailwithattach(string name, string fmail, string tmail, string sub, string body)
        {
            SendHtmlFormattedEmail(name, fmail, tmail, sub, body);
        }
        private void SendHtmlFormattedEmail(string name, string sender, string recepientEmail, string subject, string body)
        {
            try
            {
                using (MailMessage mailMessage = new MailMessage())
                {
                    mailMessage.From = new MailAddress(sender, name);
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
        //updates---------------------------------------------------//

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string checkupdate(string app, int version)
        {
            string path = "";
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT path	FROM AppUpdate WHERE app ='" + app + "' AND version > '" + version + "'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                    path = dtrow["path"].ToString();
            }
            return path;
        }

        //costapi-----------------------------------------------------//
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string daysCost(string clubid, string billiardno, int nodays)
        {
            string strcost = "0,00";
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT SUM (convert( decimal(10,2), totcost) ) FROM GameCost WHERE (clubid ='" + clubid + "' AND billno='" + billiardno + "') AND ((noplayers > 0 and status = 'OVER')and nbdate >=" + DateTime.Now.AddDays(-nodays).ToShortDateString() + ") ", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0][0].ToString()))
                        return ds.Tables[0].Rows[0][0].ToString() + " €";
                    else return "0,00 €";
                }
                catch (Exception ex) { strcost = "last" + strcost + ex.ToString(); }
            }

            return strcost;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public costDetails getCostDetails(string clubid, string bilino)
        {
            costDetails details = new costDetails();
            details.id = "0";
            details.clubid = clubid;
            details.bilino = bilino;
            details.f1 = "08:01 AM";
            details.t1 = "02:00 PM";
            details.h1 = "0,00 €";
            details.d1 = "0";
            details.f2 = "02:01 PM";
            details.t2 = "06:30 PM";
            details.h2 = "0,00 €";
            details.d2 = "0";
            details.f3 = "06:31 PM";
            details.t3 = "10:00 PM";
            details.h3 = "0,00 €";
            details.d3 = "0";
            details.f4 = "10:01 PM";
            details.t4 = "08:00 AM";
            details.h4 = "0,00 €";
            details.d4 = "0";
            details.SpecialCharge = "10";
            details.SpecialBool = "f";
            details.DownloadExel = "f";
            details.costvisible = "t";
            details.emailcostPlayer = "t";
            details.emailcostowner = "t";
            details.coston = "t";

            if (bilino.Trim() != "0")
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM Cost WHERE clubid='" + clubid + "' AND bilino='" + bilino + "'", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dtrow in ds.Tables[0].Rows)
                        {
                            details.id = dtrow["id"].ToString();
                            details.clubid = dtrow["clubid"].ToString();
                            details.bilino = dtrow["bilino"].ToString();
                            details.f1 = dtrow["f1"].ToString();
                            details.t1 = dtrow["t1"].ToString();
                            details.h1 = dtrow["h1"].ToString();
                            details.d1 = dtrow["d1"].ToString();
                            details.f2 = dtrow["f2"].ToString();
                            details.t2 = dtrow["t2"].ToString();
                            details.h2 = dtrow["h2"].ToString();
                            details.d2 = dtrow["d2"].ToString();
                            details.f3 = dtrow["f3"].ToString();
                            details.t3 = dtrow["t3"].ToString();
                            details.h3 = dtrow["h3"].ToString();
                            details.d3 = dtrow["d3"].ToString();
                            details.f4 = dtrow["f4"].ToString();
                            details.t4 = dtrow["t4"].ToString();
                            details.h4 = dtrow["h4"].ToString();
                            details.d4 = dtrow["d4"].ToString();
                            details.SpecialCharge = dtrow["SpecialCharge"].ToString();
                            details.SpecialBool = dtrow["SpecialBool"].ToString();
                            details.DownloadExel = dtrow["DownloadExel"].ToString();
                            details.costvisible = dtrow["costvisible"].ToString();
                            details.emailcostPlayer = dtrow["emailcostPlayer"].ToString();
                            details.emailcostowner = dtrow["emailcostowner"].ToString();
                            details.coston = dtrow["coston"].ToString();
                        }
                    }
                    else
                    {
                        SqlCommand sqlCommand = new SqlCommand("INSERT INTO Cost (clubid,bilino,f1,t1,h1,d1,f2,t2,h2,d2,f3,t3,h3,d3,f4,t4,h4,d4,SpecialCharge,SpecialBool,DownloadExel,costvisible,emailcostPlayer,emailcostowner,coston) VALUES (@clubid,@bilino,@f1,@t1,@h1,@d1,@f2,@t2,@h2,@d2,@f3,@t3,@h3,@d3,@f4,@t4,@h4,@d4,@SpecialCharge,@SpecialBool,@DownloadExel,@costvisible,@emailcostPlayer,@emailcostowner,@coston)", con);

                        sqlCommand.Parameters.AddWithValue("@f1", details.f1);
                        sqlCommand.Parameters.AddWithValue("@t1", details.t1);
                        sqlCommand.Parameters.AddWithValue("@h1", details.h1);
                        sqlCommand.Parameters.AddWithValue("@d1", details.d1);

                        sqlCommand.Parameters.AddWithValue("@f2", details.f2);
                        sqlCommand.Parameters.AddWithValue("@t2", details.t2);
                        sqlCommand.Parameters.AddWithValue("@h2", details.h2);
                        sqlCommand.Parameters.AddWithValue("@d2", details.d2);

                        sqlCommand.Parameters.AddWithValue("@f3", details.f3);
                        sqlCommand.Parameters.AddWithValue("@t3", details.t3);
                        sqlCommand.Parameters.AddWithValue("@h3", details.h3);
                        sqlCommand.Parameters.AddWithValue("@d3", details.d3);

                        sqlCommand.Parameters.AddWithValue("@f4", details.f4);
                        sqlCommand.Parameters.AddWithValue("@t4", details.t4);
                        sqlCommand.Parameters.AddWithValue("@h4", details.h4);
                        sqlCommand.Parameters.AddWithValue("@d4", details.d4);

                        sqlCommand.Parameters.AddWithValue("@SpecialCharge", details.SpecialCharge);
                        sqlCommand.Parameters.AddWithValue("@SpecialBool", details.SpecialBool);
                        sqlCommand.Parameters.AddWithValue("@DownloadExel", details.DownloadExel);

                        sqlCommand.Parameters.AddWithValue("@costvisible", details.costvisible);
                        sqlCommand.Parameters.AddWithValue("@emailcostPlayer", details.emailcostPlayer);
                        sqlCommand.Parameters.AddWithValue("@emailcostowner", details.emailcostowner);
                        sqlCommand.Parameters.AddWithValue("@coston", details.coston);

                        sqlCommand.Parameters.AddWithValue("@clubid", details.clubid);
                        sqlCommand.Parameters.AddWithValue("@bilino", details.bilino);
                        if (con.State != ConnectionState.Open)
                            con.Open();
                        sqlCommand.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            return details;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string updatecostdays(costDetails details)
        {
            string update = false.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM Cost WHERE clubid='" + details.clubid + "' AND bilino='" + details.bilino + "' ", con);
                    con.Open();
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    SqlCommand sqlCommand;
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        update = update + "has rows";
                        sqlCommand = new SqlCommand("UPDATE Cost SET f1=@f1, t1=@t1, h1=@h1,d1=@d1, f2=@f2, t2=@t2, h2=@h2,d2=@d2, f3=@f3, t3=@t3, h3=@h3,d3=@d3, f4=@f4, t4=@t4, h4=@h4,d4=@d4, SpecialCharge=@SpecialCharge, SpecialBool=@SpecialBool, DownloadExel=@DownloadExel,costvisible=@costvisible ,emailcostPlayer=@emailcostPlayer,emailcostowner=@emailcostowner,coston=@coston WHERE clubid=@clubid AND bilino=@bilino", con);
                    }
                    else
                    {
                        update = update + ds.Tables[0].Rows.Count.ToString() + "nb";
                        sqlCommand = new SqlCommand("INSERT INTO Cost (clubid,bilino,f1,t1,h1,d1,f2,t2,h2,d2,f3,t3,h3,d3,f4,t4,h4,d4,SpecialCharge,SpecialBool,DownloadExel,costvisible,emailcostPlayer,emailcostowner,coston) VALUES (@clubid,@bilino,@f1,@t1,@h1,@d1,@f2,@t2,@h2,@d2,@f3,@t3,@h3,@d3,@f4,@t4,@h4,@d4,@SpecialCharge,@SpecialBool,@DownloadExel,@costvisible,@emailcostPlayer,@emailcostowner,@coston)", con);

                    }
                    sqlCommand.Parameters.AddWithValue("@f1", details.f1);
                    sqlCommand.Parameters.AddWithValue("@t1", details.t1);
                    sqlCommand.Parameters.AddWithValue("@h1", details.h1);
                    sqlCommand.Parameters.AddWithValue("@d1", details.d1);

                    sqlCommand.Parameters.AddWithValue("@f2", details.f2);
                    sqlCommand.Parameters.AddWithValue("@t2", details.t2);
                    sqlCommand.Parameters.AddWithValue("@h2", details.h2);
                    sqlCommand.Parameters.AddWithValue("@d2", details.d2);

                    sqlCommand.Parameters.AddWithValue("@f3", details.f3);
                    sqlCommand.Parameters.AddWithValue("@t3", details.t3);
                    sqlCommand.Parameters.AddWithValue("@h3", details.h3);
                    sqlCommand.Parameters.AddWithValue("@d3", details.d3);

                    sqlCommand.Parameters.AddWithValue("@f4", details.f4);
                    sqlCommand.Parameters.AddWithValue("@t4", details.t4);
                    sqlCommand.Parameters.AddWithValue("@h4", details.h4);
                    sqlCommand.Parameters.AddWithValue("@d4", details.d4);

                    sqlCommand.Parameters.AddWithValue("@SpecialCharge", details.SpecialCharge);
                    sqlCommand.Parameters.AddWithValue("@SpecialBool", details.SpecialBool);
                    sqlCommand.Parameters.AddWithValue("@DownloadExel", details.DownloadExel);

                    sqlCommand.Parameters.AddWithValue("@costvisible", details.costvisible);
                    sqlCommand.Parameters.AddWithValue("@emailcostPlayer", details.emailcostPlayer);
                    sqlCommand.Parameters.AddWithValue("@emailcostowner", details.emailcostowner);
                    sqlCommand.Parameters.AddWithValue("@coston", details.coston);

                    sqlCommand.Parameters.AddWithValue("@clubid", details.clubid);
                    sqlCommand.Parameters.AddWithValue("@bilino", details.bilino);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    update = update + "forth";
                    con.Close();
                }
                update = true.ToString();
            }
            catch (Exception ex) { update = update + ex.ToString(); }
            return update;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string updateCostDetails(costDetails details)
        {
            string update = false.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM Cost WHERE clubid='" + details.clubid + "' AND bilino='" + details.bilino + "' ", con);
                    con.Open();
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    SqlCommand sqlCommand;
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        update = update + "has rows";
                        sqlCommand = new SqlCommand("UPDATE Cost SET f1=@f1, t1=@t1, h1=@h1, f2=@f2, t2=@t2, h2=@h2, f3=@f3, t3=@t3, h3=@h3, f4=@f4, t4=@t4, h4=@h4, SpecialCharge=@SpecialCharge, SpecialBool=@SpecialBool, DownloadExel=@DownloadExel,costvisible=@costvisible ,emailcostPlayer=@emailcostPlayer,emailcostowner=@emailcostowner,coston=@coston WHERE clubid=@clubid AND bilino=@bilino", con);
                    }
                    else
                    {
                        update = update + ds.Tables[0].Rows.Count.ToString() + "nb";
                        sqlCommand = new SqlCommand("INSERT INTO Cost (clubid,bilino,f1,t1,h1,d1,f2,t2,h2,d2,f3,t3,h3,d3,f4,t4,h4,d4,SpecialCharge,SpecialBool,DownloadExel,costvisible,emailcostPlayer,emailcostowner,coston) VALUES (@clubid,@bilino,@f1,@t1,@h1,@d1,@f2,@t2,@h2,@d2,@f3,@t3,@h3,@d3,@f4,@t4,@h4,@d4,@SpecialCharge,@SpecialBool,@DownloadExel,@costvisible,@emailcostPlayer,@emailcostowner,@coston)", con);

                    }
                    sqlCommand.Parameters.AddWithValue("@f1", details.f1);
                    sqlCommand.Parameters.AddWithValue("@t1", details.t1);
                    sqlCommand.Parameters.AddWithValue("@h1", details.h1);
                    sqlCommand.Parameters.AddWithValue("@d1", details.d1);

                    sqlCommand.Parameters.AddWithValue("@f2", details.f2);
                    sqlCommand.Parameters.AddWithValue("@t2", details.t2);
                    sqlCommand.Parameters.AddWithValue("@h2", details.h2);
                    sqlCommand.Parameters.AddWithValue("@d2", details.d2);

                    sqlCommand.Parameters.AddWithValue("@f3", details.f3);
                    sqlCommand.Parameters.AddWithValue("@t3", details.t3);
                    sqlCommand.Parameters.AddWithValue("@h3", details.h3);
                    sqlCommand.Parameters.AddWithValue("@d3", details.d3);

                    sqlCommand.Parameters.AddWithValue("@f4", details.f4);
                    sqlCommand.Parameters.AddWithValue("@t4", details.t4);
                    sqlCommand.Parameters.AddWithValue("@h4", details.h4);
                    sqlCommand.Parameters.AddWithValue("@d4", details.d4);

                    sqlCommand.Parameters.AddWithValue("@SpecialCharge", details.SpecialCharge);
                    sqlCommand.Parameters.AddWithValue("@SpecialBool", details.SpecialBool);
                    sqlCommand.Parameters.AddWithValue("@DownloadExel", details.DownloadExel);

                    sqlCommand.Parameters.AddWithValue("@costvisible", details.costvisible);
                    sqlCommand.Parameters.AddWithValue("@emailcostPlayer", details.emailcostPlayer);
                    sqlCommand.Parameters.AddWithValue("@emailcostowner", details.emailcostowner);
                    sqlCommand.Parameters.AddWithValue("@coston", details.coston);

                    sqlCommand.Parameters.AddWithValue("@clubid", details.clubid);
                    sqlCommand.Parameters.AddWithValue("@bilino", details.bilino);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    update = update + "forth";
                    con.Close();
                }
                update = true.ToString();
            }
            catch (Exception ex) { update = update + ex.ToString(); }
            return update;
        }
        //----------------------------------------------------score data-------------------//
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string setScoreData(ScoreData details)
        {

            string id = false.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("INSERT INTO scoredata (gameid,textdata,color,setdata,setid,status,tlavail) VALUES (@gameid,@text,@color,@setdata,@setid,@status,@tlavail)", con);
                    sqlCommand.Parameters.AddWithValue("@gameid", details.gameid);
                    sqlCommand.Parameters.AddWithValue("@text", details.text);
                    sqlCommand.Parameters.AddWithValue("@color", details.color);
                    sqlCommand.Parameters.AddWithValue("@setdata", details.setdata);
                    sqlCommand.Parameters.AddWithValue("@setid", details.setid);
                    sqlCommand.Parameters.AddWithValue("@status", details.status);
                    sqlCommand.Parameters.AddWithValue("@tlavail", details.tlavail);

                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();

                    con.Close();
                }
            }
            catch (Exception ex) { id = id + ex.ToString(); }
            return id;
        }


        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string delScoreData(ScoreData details)
        {
            string id = false.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("delete from scoredata where id=(select max(id) from scoredata where gameid=@gameid) ;", con);
                    sqlCommand.Parameters.AddWithValue("@gameid", details.gameid);

                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();

                    con.Close();
                }
            }
            catch (Exception ex) { id = id + ex.ToString(); }
            return id;
        }
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<string> GetScoreNationName()
        {
            List<string> ClubResult = new List<string>();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {

                        cmd.CommandText = "select distinct Nation from ClubDetails";
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            string item = dr["Nation"].ToString();
                            ClubResult.Add(item);
                        }
                        con.Close();

                    }
                }
            }
            catch (Exception ex)
            {
            }
            return ClubResult;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<string> GetScoreCityName(string givennation)
        {
            List<string> ClubResult = new List<string>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct City from ClubDetails where Nation='" + givennation + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string item = dr["City"].ToString();
                        ClubResult.Add(item);
                    }
                    con.Close();
                    return ClubResult;
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<string> GetScoreClubName(string givencity)
        {
            List<string> ClubResult = new List<string>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct ClubName from ClubDetails where City='" + givencity + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string item = dr["ClubName"].ToString();
                        ClubResult.Add(item);
                    }
                    con.Close();
                    return ClubResult;
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]

        public List<string> GetScoreFname(string givenclub)
        {
            List<string> ClubResult = new List<string>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct PD.FamilyName from PlayerDetails PD INNER JOIN ClubDetails CD ON CD.ClubId = PD.ClubId where CD.ClubName='" + givenclub + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string item = dr["FamilyName"].ToString();
                        ClubResult.Add(item);
                    }
                    con.Close();
                    return ClubResult;
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<string> GetScoreName(string givenfname)
        {
            List<string> ClubResult = new List<string>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select Name,Email from PlayerDetails where FamilyName='" + givenfname + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        string item = dr["Name"].ToString() + "|" + dr["Email"].ToString();
                        ClubResult.Add(item);
                    }
                    con.Close();
                    return ClubResult;
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]

        public List<gamecostdetails> GetScoreGameListWeb(string givenemail, int page)
        {
            List<gamecostdetails> Statisticlist = new List<gamecostdetails>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "DECLARE @totalcount int;" +
                        "set @totalcount = (select count (*) from  GameCost GC where " +
                        "GC.p1='" + givenemail + "' OR GC.p2='" + givenemail + "' OR GC.p3='" + givenemail + "' OR GC.p4='" + givenemail + "');" +

                        ";WITH Results_CTE AS( select ROW_NUMBER() OVER(ORDER BY GC.id desc) AS row_number ,@totalcount AS totalcount, *  from  GameCost GC where " +
                                      "GC.p1='" + givenemail + "' OR GC.p2='" + givenemail + "' OR GC.p3='" + givenemail + "' OR GC.p4='" + givenemail + "') " +
                                      "SELECT * FROM Results_CTE WHERE row_number > " + ((page - 1) * 10) + " AND row_number <= " + (((page - 1) * 10) + 10) + "";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        gamecostdetails Statistic = new gamecostdetails();

                        Statistic.id = dr["id"].ToString();
                        Statistic.clubid = dr["clubid"].ToString();
                        Statistic.billno = dr["billno"].ToString();
                        Statistic.date = dr["date"].ToString();
                        Statistic.fromtime = dr["fromtime"].ToString();
                        Statistic.noplayers = dr["row_number"].ToString();
                        Statistic.gameover = dr["gameover"].ToString();
                        Statistic.duration = dr["totalcount"].ToString();
                        Statisticlist.Add(Statistic);
                    }
                    con.Close();
                    return Statisticlist;
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<ScorePlayerData> GetScoreStatistic(string gameid)
        {
            List<ScorePlayerData> Statisticlist = new List<ScorePlayerData>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select GC.id,PD.Email,PD.Name,PD.FamilyName,PD.ClubId,CD.ClubName,CD.ClubLogo,PD.PlayerPicture,GC.p1,GC.p2,GC.p3,GC.p4 from  PlayerDetails PD INNER JOIN GameCost GC ON (GC.p1 = PD.Email OR GC.p2=PD.Email OR GC.p3=PD.Email OR GC.p4=PD.Email) INNER JOIN ClubDetails CD ON (CD.ClubId=PD.ClubId) where  GC.id='" + gameid + "' ORDER BY GC.id desc ";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        ScorePlayerData Statistic = new ScorePlayerData();

                        Statistic.id = dr["id"].ToString();
                        Statistic.Email = dr["Email"].ToString();
                        Statistic.Name = dr["Name"].ToString();
                        Statistic.FamilyName = dr["FamilyName"].ToString();
                        Statistic.ClubId = dr["ClubId"].ToString();
                        Statistic.ClubName = dr["ClubName"].ToString();
                        Statistic.ClubLogo = dr["ClubLogo"].ToString();
                        Statistic.PlayerPicture = dr["PlayerPicture"].ToString();

                        if (dr["Email"].ToString().Trim() == dr["p1"].ToString().Trim())
                            Statistic.playerno = "1";
                        else if (dr["Email"].ToString().Trim() == dr["p2"].ToString().Trim())
                            Statistic.playerno = "2";
                        else if (dr["Email"].ToString().Trim() == dr["p3"].ToString().Trim())
                            Statistic.playerno = "3";
                        else Statistic.playerno = "4";

                        Statisticlist.Add(Statistic);
                    }
                    con.Close();
                    return Statisticlist;
                }
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<ScoreData> GetScoreData(string givengameid)
        {
            List<ScoreData> ClubResult = new List<ScoreData>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from scoredata where gameid='" + givengameid + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        //try
                        //{
                        ScoreData sd = new ScoreData();
                        sd.id = int.Parse(dr["id"].ToString());
                        sd.gameid = int.Parse(dr["gameid"].ToString());
                        sd.color = dr["color"].ToString();
                        if (dr["setdata"].ToString() == "0")
                            sd.setdata = false;
                        else
                            sd.setdata = true;
                        sd.status = dr["status"].ToString();
                        if (dr["tlavail"].ToString() == "0")
                            sd.tlavail = false;
                        else
                            sd.tlavail = true;
                        sd.text = dr["textdata"].ToString();
                        sd.setid = int.Parse(dr["setid"].ToString());
                        ClubResult.Add(sd);
                        //}
                        //catch { }
                    }
                    con.Close();
                    return ClubResult;
                }
            }
        }

        //gamecostapi-------------------------------------------------------//
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]

        public string Updategamecost(gamecostdetails details)
        {
            string id = false.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("update GameCost set clubid=@clubid,billno=@billno,p1=@p1,p2=@p2,p3=@p3,p4=@p4,noplayers=@noplayers,costplayer=@costplayer,totcost=@totcost,date=@date,fromtime=@fromtime,totime=@totime,duration=@duration,nbdate=@nbdate,gameover=@gameover where id=@id", con);
                    sqlCommand.Parameters.AddWithValue("@id", details.id);
                    sqlCommand.Parameters.AddWithValue("@clubid", details.clubid);
                    sqlCommand.Parameters.AddWithValue("@billno", details.billno);
                    sqlCommand.Parameters.AddWithValue("@p1", details.p1);
                    sqlCommand.Parameters.AddWithValue("@p2", details.p2);
                    sqlCommand.Parameters.AddWithValue("@p3", details.p3);
                    sqlCommand.Parameters.AddWithValue("@p4", details.p4);
                    sqlCommand.Parameters.AddWithValue("@noplayers", details.noplayers);
                    sqlCommand.Parameters.AddWithValue("@costplayer", details.costplayer);
                    sqlCommand.Parameters.AddWithValue("@totcost", details.totcost);
                    sqlCommand.Parameters.AddWithValue("@date", details.date);
                    sqlCommand.Parameters.AddWithValue("@fromtime", details.fromtime);
                    sqlCommand.Parameters.AddWithValue("@totime", details.totime);
                    sqlCommand.Parameters.AddWithValue("@duration", details.duration);
                    sqlCommand.Parameters.AddWithValue("@nbdate", DateTime.Now);
                    sqlCommand.Parameters.AddWithValue("@gameover", details.gameover);

                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    con.Close();
                    id = true.ToString();
                }

            }
            catch (Exception ex) { id = id + ex.ToString(); }
            return id;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]

        public string deletelastgamecostiffree(gamecostdetails details)
        {
            string id = "";
            string gameover = "";
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("select gameover,id from GameCost where id=(select max(id) from GameCost where (clubid='" + details.clubid + "' and billno='" + details.billno + "'))", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {
                    gameover = dtrow["gameover"].ToString();
                    id = dtrow["id"].ToString();

                }
                if (gameover == false.ToString())
                {
                    SqlCommand sqlCommand = new SqlCommand("delete from GameCost where id ='" + id + "'", con);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    con.Close();
                    id = true.ToString();
                    id = "0";
                }
            }
            return id;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string insertgamecost(gamecostdetails details)
        {
            string id = false.ToString();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("INSERT INTO GameCost (clubid,billno,p1,p2,p3,p4,noplayers,costplayer,totcost,date,fromtime,totime,duration,nbdate,gameover,status,usbrelay) OUTPUT Inserted.ID VALUES (@clubid,@billno,@p1,@p2,@p3,@p4,@noplayers,@costplayer,@totcost,@date,@fromtime,@totime,@duration,@nbdate,@gameover,'start','f')", con);
                    sqlCommand.Parameters.AddWithValue("@clubid", details.clubid);
                    sqlCommand.Parameters.AddWithValue("@billno", details.billno);
                    sqlCommand.Parameters.AddWithValue("@p1", details.p1);
                    sqlCommand.Parameters.AddWithValue("@p2", details.p2);
                    sqlCommand.Parameters.AddWithValue("@p3", details.p3);
                    sqlCommand.Parameters.AddWithValue("@p4", details.p4);
                    sqlCommand.Parameters.AddWithValue("@noplayers", details.noplayers);
                    sqlCommand.Parameters.AddWithValue("@costplayer", details.costplayer);
                    sqlCommand.Parameters.AddWithValue("@totcost", details.totcost);
                    sqlCommand.Parameters.AddWithValue("@date", details.date);
                    sqlCommand.Parameters.AddWithValue("@fromtime", details.fromtime);
                    sqlCommand.Parameters.AddWithValue("@totime", details.totime);
                    sqlCommand.Parameters.AddWithValue("@duration", details.duration);
                    sqlCommand.Parameters.AddWithValue("@nbdate", DateTime.Now);
                    sqlCommand.Parameters.AddWithValue("@gameover", details.gameover);


                    if (con.State != ConnectionState.Open)
                        con.Open();
                    id = sqlCommand.ExecuteScalar().ToString();

                    con.Close();
                }
            }
            catch (Exception ex) { id = id + ex.ToString(); }
            return id;
        }
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string checklastgamecost(gamecostdetails details)
        {
            string id = "0";
            string gameover = false.ToString();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("select gameover,id from GameCost where id=(select max(id) from GameCost where (clubid='" + details.clubid + "' and billno='" + details.billno + "'))", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {
                    gameover = dtrow["gameover"].ToString();
                    id = dtrow["id"].ToString();
                }
                if (gameover == true.ToString())
                {
                    id = "0";
                }
            }
            return id;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string checkusbrelay(string id)
        {
            string usbrelay = "";
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("select usbrelay from GameCost where id='" + id + "'", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {
                    usbrelay = dtrow["usbrelay"].ToString();
                }

            }
            return usbrelay;
        }

        //-----------------------------------------------------------------------------------------------------------------------------------//
        //windows api end.   //

        //-----------------------------------------------------------------------------------------------------------------------------------//
        //windows reception api start.   //
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<gamecostdetails> listOfopenBilliard(string ClubId)
        {
            List<gamecostdetails> gclist = new List<gamecostdetails>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("select* from GameCost where status!='OVER' and clubid='" + ClubId + "';", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {

                    gamecostdetails gc = new gamecostdetails();
                    gc.id = dtrow["id"].ToString();
                    gc.clubid = dtrow["clubid"].ToString();
                    gc.billno = dtrow["billno"].ToString();
                    gc.p1 = dtrow["p1"].ToString();
                    gc.p2 = dtrow["p2"].ToString();
                    gc.p3 = dtrow["p3"].ToString();
                    gc.p4 = dtrow["p4"].ToString();
                    gc.noplayers = dtrow["noplayers"].ToString();
                    gc.costplayer = dtrow["costplayer"].ToString();
                    gc.totcost = dtrow["totcost"].ToString();
                    gc.date = dtrow["date"].ToString();
                    gc.fromtime = dtrow["fromtime"].ToString();
                    gc.totime = dtrow["totime"].ToString();
                    gc.duration = dtrow["duration"].ToString();
                    gc.gameover = dtrow["gameover"].ToString();
                    gc.status = dtrow["status"].ToString();
                    gc.usbrelay = dtrow["usbrelay"].ToString();

                    if (gc.p1.Trim() != "0")
                    {
                        SqlDataAdapter ad1 = new SqlDataAdapter("select Name ,FamilyName	from PlayerDetails where Email='" + gc.p1 + "';", con);
                        DataSet ds1 = new DataSet();
                        ad1.Fill(ds1);
                        gc.p1 = ds1.Tables[0].Rows[0]["Name"].ToString() + " " + ds1.Tables[0].Rows[0]["FamilyName"].ToString();
                    }
                    if (gc.p2.Trim() != "0")
                    {
                        SqlDataAdapter ad2 = new SqlDataAdapter("select Name ,FamilyName	from PlayerDetails where Email='" + gc.p2 + "';", con);
                        DataSet ds2 = new DataSet();
                        ad2.Fill(ds2);
                        gc.p2 = ds2.Tables[0].Rows[0]["Name"].ToString() + " " + ds2.Tables[0].Rows[0]["FamilyName"].ToString();
                    }
                    if (gc.p3.Trim() != "0")
                    {
                        SqlDataAdapter ad3 = new SqlDataAdapter("select Name ,FamilyName	from PlayerDetails where Email='" + gc.p3 + "';", con);
                        DataSet ds3 = new DataSet();
                        ad3.Fill(ds3);
                        gc.p3 = ds3.Tables[0].Rows[0]["Name"].ToString() + " " + ds3.Tables[0].Rows[0]["FamilyName"].ToString();
                    }
                    if (gc.p4.Trim() != "0")
                    {
                        SqlDataAdapter ad4 = new SqlDataAdapter("select Name ,FamilyName	from PlayerDetails where Email='" + gc.p4 + "';", con);
                        DataSet ds4 = new DataSet();
                        ad4.Fill(ds4);
                        gc.p4 = ds4.Tables[0].Rows[0]["Name"].ToString() + " " + ds4.Tables[0].Rows[0]["FamilyName"].ToString();
                    }

                    gclist.Add(gc);
                }
            }
            return gclist;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string Updategamecoststatus(string id, string status)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("update GameCost set status=@status where id=@id", con);
                    sqlCommand.Parameters.AddWithValue("@id", id);
                    sqlCommand.Parameters.AddWithValue("@status", status);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    con.Close();
                    id = true.ToString();
                }
            }
            catch (Exception ex) { id = id + ex.ToString(); }
            return id;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public string Updategameusbrelay(string id, string usbrelay)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand("update GameCost set usbrelay=@usbrelay where id=@id", con);
                    sqlCommand.Parameters.AddWithValue("@id", id);
                    sqlCommand.Parameters.AddWithValue("@usbrelay", usbrelay);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    con.Close();
                    id = true.ToString();
                }
            }
            catch (Exception ex) { id = id + ex.ToString(); }
            return id;
        }
        //-----------------------------------------------------------------------------------------------------------------------------------//
        //windows reception api end.   //

        #region Teacher Module
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public int AddShotDetail(Shot ShotInfo)
        {
            int id = -1;
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand sqlCommand = new SqlCommand(
                        "Insert into Shots (PlayerId,ShotName,Description,InSide,OutSide )" +
                        "values(@PlayerId, @ShotName, @Description, @InSide, @OutSide) SELECT SCOPE_IDENTITY();", con);
                    sqlCommand.Parameters.AddWithValue("@PlayerId", ShotInfo.PlayerId);
                    sqlCommand.Parameters.AddWithValue("@ShotName", ShotInfo.ShotName);
                    sqlCommand.Parameters.AddWithValue("@Description", ShotInfo.Description);
                    sqlCommand.Parameters.AddWithValue("@InSide", ShotInfo.InSide);
                    sqlCommand.Parameters.AddWithValue("@OutSide", ShotInfo.OutSide);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    //sqlCommand.ExecuteNonQuery();
                    object returnObj = sqlCommand.ExecuteScalar();

                    if (returnObj != null)
                    {
                        int.TryParse(returnObj.ToString(), out id);
                    }
                    try
                    {
                        if (id != -1)
                        {
                            foreach (var item in ShotInfo.ShotDimensions)
                            {
                                SqlCommand sqlCommand1 = new SqlCommand(
                            "Insert into ShotDimension (ShotId,X1,Y1,X2,Y2 )" +
                            "values(@ShotId, @X1, @Y1, @X2, @Y2)", con);
                                sqlCommand1.Parameters.AddWithValue("@ShotId", id);
                                sqlCommand1.Parameters.AddWithValue("@X1", item.X1);
                                sqlCommand1.Parameters.AddWithValue("@Y1", item.Y1);
                                sqlCommand1.Parameters.AddWithValue("@X2", item.X2);
                                sqlCommand1.Parameters.AddWithValue("@Y2", item.Y2);
                                sqlCommand1.ExecuteNonQuery();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    con.Close();
                    //id = true.ToString();
                }
            }
            catch (Exception ex) { /*id = id + ex.ToString();*/ }
            return id;
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public Shot GetShotDetailByShotId(int ShotId)
        {
            Shot ShotDetail = new Shot();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct * from Shots where ShotId='" + ShotId + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        ShotDetail.Description = dr["Description"]!=null?dr["Description"].ToString():null;
                        ShotDetail.InSide = Convert.ToChar(dr["InSide"]!=null?dr["InSide"].ToString():null);
                        ShotDetail.OutSide = Convert.ToChar(dr["OutSide"]!=null?dr["OutSide"].ToString():null);
                        ShotDetail.PlayerId = Convert.ToInt32(dr["PlayerId"]!=null?dr["PlayerId"].ToString():null);
                        ShotDetail.ShotId = Convert.ToInt32(dr["ShotId"]!=null?dr["ShotId"].ToString():null);
                        ShotDetail.ShotName = dr["ShotName"]!=null?dr["ShotName"].ToString():null;
                        ShotDetail.ShotDimensions = new List<ShotDimensions>();
                    }
                    con.Close();
                    cmd.CommandText = "select distinct * from ShotDimension where ShotId='" + ShotId + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr1 = cmd.ExecuteReader();
                    while (dr1.Read())
                    {
                        ShotDimensions Dimension = new ShotDimensions();
                        Dimension.ShotDimensionId = Convert.ToInt32(dr1["ShotDimensionId"]==null?null:dr1["ShotDimensionId"].ToString());
                        Dimension.ShotId = Convert.ToInt32(dr1["ShotId"] == null ? null : dr1["ShotId"].ToString());
                        Dimension.X1 = float.Parse(dr1["X1"]==null?null:dr1["X1"].ToString());
                        Dimension.Y1 = float.Parse(dr1["Y1"]==null?null:dr1["Y1"].ToString());
                        Dimension.X2 = float.Parse(dr1["X2"]==null?null:dr1["X2"].ToString());
                        Dimension.Y2 = float.Parse(dr1["Y2"]==null?null:dr1["Y2"].ToString());
                        ShotDetail.ShotDimensions.Add(Dimension);
                    }
                    con.Close();
                }

                return ShotDetail;
            }
        }

        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public List<Shot> GetShotListByPlayerId(int PlayerId)
        {
            List<Shot> ShotList = new List<Shot>();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select distinct * from Shots where PlayerId='" + PlayerId + "'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Shot ShotDetail = new Shot();
                        ShotDetail.Description = dr["Description"] == null ? null : dr["Description"].ToString();
                        ShotDetail.InSide = Convert.ToChar(dr["InSide"]==null?null:dr["InSide"].ToString());
                        ShotDetail.OutSide = Convert.ToChar(dr["OutSide"]==null?null:dr["OutSide"].ToString());
                        ShotDetail.PlayerId = Convert.ToInt32(dr["PlayerId"]==null?null:dr["PlayerId"].ToString());
                        ShotDetail.ShotId = Convert.ToInt32(dr["ShotId"]==null?null:dr["ShotId"].ToString());
                        ShotDetail.ShotName = dr["ShotName"]==null?null:dr["ShotName"].ToString();
                        ShotDetail.ShotDimensions = new List<ShotDimensions>();
                        ShotList.Add(ShotDetail);
                    }
                    con.Close();
                }
                return ShotList;
            }
        }
        #endregion

        #region Advertisement
        [WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public int SaveAdvertisement(advertisement data)
        {
            try
            {
                string Base64 = data.Img;
                //bool isNewTopic = false;
                //var oldTopicdata = new advertisement();
                advertisement IMagePath = new advertisement();
                advertisement isDataSaved = new advertisement();
                isDataSaved = SaveAdvertisementDetail(data);
                if (!string.IsNullOrEmpty(Base64) && Base64.Length > 100 && !data.IsTempStorage)
                {
                    data = isDataSaved;
                    data.Img = data.AdvertisementId + ".Jpeg";
                    //IMagePath = SaveAdvertisementDetail(data);
                    //SaveByteArrayAsImage(Base64, IMagePath.AdvertisementId);
                }
                return isDataSaved.AdvertisementId;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        [WebMethod]
        public bool SendEmailNotification(Email data)
        {
            error msg = new error();
            msg.Message = "Email notification start";
            ErrorLog(msg);
            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            m.From = new MailAddress(ConfigurationManager.AppSettings["EmailFrom"]);
            m.To.Add(data.To);
            m.Subject = data.Subject;
            m.Body = data.Message;
            m.IsBodyHtml = true;
            sc.Host = ConfigurationManager.AppSettings["SMTP"];
            string str1 = "gmail.com";
            string str2 = ConfigurationManager.AppSettings["EmailFrom"];
            if (str2.Contains(str1))
            {
                try
                {
                    sc.Port = Convert.ToInt32(ConfigurationManager.AppSettings["port"]);
                    sc.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["EmailFrom"], ConfigurationManager.AppSettings["Password"]);
                    sc.EnableSsl = true;
                    sc.Send(m);
                    return true;
                }
                catch (Exception ex)
                {
                    error emsg = new error();
                    emsg.Message = ex.Message;
                    emsg.InnerException = Convert.ToString(ex.InnerException);
                    emsg.Source = Convert.ToString(ex.Source);
                    emsg.StackTrace = Convert.ToString(ex.StackTrace);
                    ErrorLog(emsg);
                    return false;

                }
            }
            else
            {
                try
                {
                    sc.Port = Convert.ToInt32(ConfigurationManager.AppSettings["port"]);
                    sc.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["EmailFrom"], ConfigurationManager.AppSettings["Password"]);
                    sc.EnableSsl = false;
                    sc.Send(m);
                    return true;
                }
                catch (Exception ex)
                {
                    error emsg = new error();
                    emsg.Message = ex.Message;
                    emsg.InnerException = Convert.ToString(ex.InnerException);
                    emsg.Source = Convert.ToString(ex.Source);
                    emsg.StackTrace = Convert.ToString(ex.StackTrace);
                    ErrorLog(emsg);
                    return true;
                }
            }
        }
        [WebMethod]
        public int SignUpAdvertiser(AdvUser data)
        {
            int id = -1;
            try
            {
                var user = CheckUserEmail(data.Email);
                if (user.UserId == 0)
                {
                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {
                        string query = string.Empty;
                        query = "Insert into AdvertisementUser (Email,Password,Company,Website,Vat,EmailForSale,IsAdmin)" +
                            "values(@Email,@Password,@Company,@Website,@Vat,@EmailForSale,@IsAdmin) SELECT SCOPE_IDENTITY();";
                        SqlCommand sqlCommand = new SqlCommand(query, con);
                        sqlCommand.Parameters.AddWithValue("@Email", data.Email);
                        sqlCommand.Parameters.AddWithValue("@Password", data.Password);
                        sqlCommand.Parameters.AddWithValue("@Company", data.Company);
                        sqlCommand.Parameters.AddWithValue("@Website", data.Website);
                        sqlCommand.Parameters.AddWithValue("@Vat", data.Vat);
                        sqlCommand.Parameters.AddWithValue("@EmailForSale", data.EmailForSale);
                        sqlCommand.Parameters.AddWithValue("@IsAdmin", data.IsAdmin);
                        
                        if (con.State != ConnectionState.Open)
                            con.Open();
                        //sqlCommand.ExecuteNonQuery();
                        object returnObj = sqlCommand.ExecuteScalar();
                        int.TryParse(returnObj.ToString(), out id);
                        con.Close();
                        //id = true.ToString();
                    }
                }
                else
                {                    
                    return -1;
                }
            }
            catch (Exception ex) {
                error msg = new error();
                msg.Message = ex.Message;
                msg.InnerException = Convert.ToString(ex.InnerException);
                msg.Source = Convert.ToString(ex.Source);
                msg.StackTrace = Convert.ToString(ex.StackTrace);
                ErrorLog(msg);
            }
            return id;
        }

        [WebMethod]
        public void AddViewHistory(int data)
        {
            try
            {
                int id = 0;
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {
                        string query = string.Empty;
                        query = "Insert into AdvViewHistory (IpAddress,AdvertisementId,VisitedOn)" +
                            "values(@IpAddress,@AdvertisementId,@VisitedOn) SELECT SCOPE_IDENTITY();";
                        SqlCommand sqlCommand = new SqlCommand(query, con);
                        sqlCommand.Parameters.AddWithValue("@IpAddress", GetIPAddress());
                        sqlCommand.Parameters.AddWithValue("@AdvertisementId", data);
                        sqlCommand.Parameters.AddWithValue("@VisitedOn", DateTime.Now);
                        if (con.State != ConnectionState.Open)
                            con.Open();
                        //sqlCommand.ExecuteNonQuery();
                        object returnObj = sqlCommand.ExecuteScalar();
                        int.TryParse(returnObj.ToString(), out id);
                        con.Close();
                        //id = true.ToString();
                    }
            }
            catch (Exception ex)
            {
                error msg = new error();
                msg.Message = ex.Message;
                msg.InnerException = Convert.ToString(ex.InnerException);
                msg.Source = Convert.ToString(ex.Source);
                msg.StackTrace = Convert.ToString(ex.StackTrace);
                ErrorLog(msg);
            }
        }

        public AdvUser CheckUserEmail(string email)
        {
            AdvUser user = new AdvUser();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        query = "select * from AdvertisementUser where Email='" + email + "';";
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
                        }
                        con.Close();

                    }

                }
            }
            catch (Exception ex) {
                error msg = new error();
                msg.Message = ex.Message;
                msg.InnerException = Convert.ToString(ex.InnerException);
                msg.Source = Convert.ToString(ex.Source);
                msg.StackTrace = Convert.ToString(ex.StackTrace);
                ErrorLog(msg);
            }
            return user;
        }

        [WebMethod]
        public string getip()
        {
            string ip = string.Empty;
            try
            {
                ip = GetIPAddress();
            }
            catch (Exception ex)
            {
                ip = ex.Message;
            }
            return ip;
        }

        public string GetIPAddress()
        {
            HttpContext context = HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }

            return context.Request.ServerVariables["REMOTE_ADDR"];
        }

        [WebMethod]
        public AdvUser SignIn(AdvUser data)
        {
            AdvUser user = new AdvUser();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        query = "select * from AdvertisementUser where Email='" + data.Email + "' and Password='" + data.Password + "';";
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
                        }
                        con.Close();
                        user=GetStatestic(user);
                    }

                }
            }
            catch (Exception ex) {
                error msg = new error();
                msg.Message = ex.Message;
                ErrorLog(msg);
            }
            return user;
        }

        [WebMethod]
        public AdvUser GetStestics(AdvUser data)
        {
            AdvUser user = new AdvUser();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        query = "select * from AdvertisementUser where Email='" + data.Email + "';";
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
                        }
                        con.Close();
                        user = GetStatestic(user);
                    }

                }
            }
            catch (Exception ex)
            {
                error msg = new error();
                msg.Message = ex.Message;
                ErrorLog(msg);
            }
            return user;
        }

        [WebMethod]
        public int SaveDiscountRequest(Discount data)
        {
            int id = 0;
            try
            {  
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;
                    query = "Insert into DiscountRequest (AdvertisementId,Name,Email,AdvEmail,CreatedOn)" +
                        "values(@AdvertisementId,@Name,@Email,@AdvEmail,@CreatedOn) SELECT SCOPE_IDENTITY();";
                    SqlCommand sqlCommand = new SqlCommand(query, con);
                    sqlCommand.Parameters.AddWithValue("@AdvertisementId", data.AdvertisementId);
                    sqlCommand.Parameters.AddWithValue("@Name", data.Name);
                    sqlCommand.Parameters.AddWithValue("@Email", data.Email);
                    sqlCommand.Parameters.AddWithValue("@AdvEmail", data.AdvEmail); 
                    sqlCommand.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    //sqlCommand.ExecuteNonQuery();
                    object returnObj = sqlCommand.ExecuteScalar();
                    int.TryParse(returnObj.ToString(), out id);
                    con.Close();
                    //id = true.ToString();
                }
            }
            catch (Exception ex)
            {
                error msg = new error();
                msg.Message = ex.Message;
                msg.InnerException = Convert.ToString(ex.InnerException);
                msg.Source = Convert.ToString(ex.Source);
                msg.StackTrace = Convert.ToString(ex.StackTrace);
                ErrorLog(msg);
            }
            return id;
        }


        public AdvUser GetStatestic(AdvUser user)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        query = "select(select count(*) from advertisement as adv " +
                                     "inner join AdvViewHistory as advh on adv.AdvertisementId = advh.AdvertisementId where UserId = " + user.UserId + ") as TotalView," +
                                     "(select count(*) from advertisement as adv inner join DiscountRequest as advh " +
                                     "on adv.AdvertisementId = advh.AdvertisementId where UserId = " + user.UserId + ") as TotalDisountRequest, COUNT(AdvertisementId) as TotalAdvertisement from advertisement where UserId = " + user.UserId;
                        cmd.CommandText = query;
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            user.TotalPublication =Convert.ToInt32(dr["TotalAdvertisement"]);
                            user.TotalVisitors = Convert.ToInt32(dr["TotalView"].ToString());
                            user.TotalDiscount = Convert.ToInt32(dr["TotalDisountRequest"].ToString());
                        }
                        con.Close();
                    }

                }
            }
            catch (Exception ex)
            {
                error msg = new error();
                msg.Message = ex.Message;
                ErrorLog(msg);
            }
            return user;
        }

        [WebMethod]
        public AdvUser ForgotPw(AdvUser data)
        {
            AdvUser user = new AdvUser();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        query = "select * from AdvertisementUser where Email='" + data.Email + "';";
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
                            user.Password = dr["Password"].ToString();
                            user.Website = dr["Website"].ToString();
                        }
                        con.Close();

                    }

                }
            }
            catch (Exception ex) { /*id = id + ex.ToString();*/ }
            if (user.UserId != 0)
            {
                Email emaildata = new Email();
                emaildata.Subject = "Password recovery";
                emaildata.Message = "Your password is : " + user.Password;
                emaildata.To = data.Email;
                SendEmailNotification(emaildata);
            }
            return user;
        }

        [WebMethod]
        public advertisement GetRendomeImg()
        {
            string RequestIp = HttpContext.Current.Request.UserHostAddress;
            advertisement data = new advertisement();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        //query = "SELECT TOP 1 * FROM advertisement as adv inner join AdvertisementUser as advuser on adv.UserId = advuser.UserId where adv.IsTempStorage='false' ORDER BY NEWID(); ";
                        query = "exec sp_selectRandomAdvertisement '"+ RequestIp+"'";
                        cmd.CommandText = query;
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            data.AdvertisementId = Convert.ToInt32(dr["AdvertisementId"].ToString());
                            data.Color = dr["Color"].ToString();
                            data.Discount = Convert.ToInt32(dr["Discount"].ToString());
                            data.Img = dr["Img"].ToString();
                            data.Text = dr["Text"].ToString();
                            data.advEmail = dr["EmailForSale"].ToString();
                            data.UserId = Convert.ToInt32(dr["UserId"].ToString());
                            data.IsTempStorage= Convert.ToBoolean(dr["IsTempStorage"].ToString());
                            AddViewHistory(data.AdvertisementId);
                        }
                        con.Close();
                    }

                }
            }
            catch (Exception ex) { /*id = id + ex.ToString();*/ }
            return data;
        }


        [WebMethod]
        public advertisement GetAdByIda(int id)
        {
            advertisement data = new advertisement();
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;

                    using (SqlCommand cmd = new SqlCommand())
                    {
                        query = "SELECT * FROM advertisement where AdvertisementId='" + id + "'; ";
                        cmd.CommandText = query;
                        cmd.Connection = con;
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            data.AdvertisementId = Convert.ToInt32(dr["AdvertisementId"].ToString());
                            data.Color = Convert.ToString(dr["Color"]);
                            data.Discount = Convert.ToInt32(Convert.ToString(dr["Discount"]));
                            data.Img = Convert.ToString(dr["Img"]);
                            data.Text = Convert.ToString(dr["Text"]);
                            //data.advEmail = Convert.ToString(dr["EmailForSale"]);
                            data.UserId = Convert.ToInt32(Convert.ToString(dr["UserId"]));
                            data.IsTempStorage = Convert.ToBoolean(Convert.ToString(dr["IsTempStorage"]));
                        }
                        con.Close();
                    }

                }
            }
            catch (Exception ex) { /*id = id + ex.ToString();*/ }
            return data;
        }

        public advertisement SaveAdvertisementDetail(advertisement data)
        {
            int id = -1;
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = string.Empty;
                    if (data.AdvertisementId == 0)
                    {

                        query = "Insert into advertisement (Color,Discount,Img,Text,UserId,IsTempStorage,PublicationDate)" +
                            "values(@Color, @Discount, @Img, @Text, @UserId,@IsTempStorage,@PublicationDate) SELECT SCOPE_IDENTITY();";
                    }
                    else
                    {
                        query = "UPDATE advertisement set Color=@Color,Discount=@Discount,Img=@Img,Text=@Text,UserId=@UserId,IsTempStorage=@IsTempStorage,PublicationDate=@PublicationDate where AdvertisementId=@AdvertisementId";
                    }
                    SqlCommand sqlCommand = new SqlCommand(query, con);
                    sqlCommand.Parameters.AddWithValue("@UserId", data.UserId);
                    sqlCommand.Parameters.AddWithValue("@Color", data.Color);
                    sqlCommand.Parameters.AddWithValue("@Discount", data.Discount);
                    sqlCommand.Parameters.AddWithValue("@Img", data.Img);
                    sqlCommand.Parameters.AddWithValue("@Text", data.Text);
                    sqlCommand.Parameters.AddWithValue("@AdvertisementId", data.AdvertisementId);
                    sqlCommand.Parameters.AddWithValue("@IsTempStorage", data.IsTempStorage);
                    sqlCommand.Parameters.AddWithValue("@PublicationDate", DateTime.Now);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    //sqlCommand.ExecuteNonQuery();
                    object returnObj = sqlCommand.ExecuteScalar();
                    if (data.AdvertisementId != 0)
                    {
                        id = data.AdvertisementId;
                    }
                    else if (returnObj != null)
                    {
                        int.TryParse(returnObj.ToString(), out id);
                    }
                    con.Close();
                    //id = true.ToString();
                }
            }
            catch (Exception ex) { /*id = id + ex.ToString();*/ }
            data.AdvertisementId = id;
            return data;
        }
        public void SaveByteArrayAsImage(string base64String, int ID)
        {
            try
            {   
                //byte[] imageBytes = Convert.FromBase64String(base64String);
                //MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                //// Convert byte[] to Image
                //ms.Write(imageBytes, 0, imageBytes.Length);
                //System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                ////string newFile = Guid.NewGuid().ToString() + fileExtensionApplication;
                string filePath = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/img/AdvImages/"), ID + ".Jpeg");
                //image.Save(filePath, ImageFormat.Jpeg);
                byte[] bytes = Convert.FromBase64String(base64String);
                using (Image image = Image.FromStream(new MemoryStream(bytes)))
                {
                    image.Save(filePath, ImageFormat.Jpeg);  // Or Png
                }
            }
            catch (Exception ex)
            {
                error msg = new error();
                msg.Message = ex.Message;
                msg.InnerException = Convert.ToString(ex.InnerException);
                msg.Source = Convert.ToString(ex.Source);
                msg.StackTrace= Convert.ToString(ex.StackTrace);
                ErrorLog(msg);
                string filePath = System.Web.HttpContext.Current.Server.MapPath("~/img/");
                StringBuilder sb = new StringBuilder();
                sb.Append(ex.Message);
                // flush every 20 seconds as you do it
                File.AppendAllText(filePath + "log.txt", sb.ToString());
                sb.Clear();
            }

        }

        //public void SaveByteArrayAsImage(string base64String, int ID)
        //{
        //    try
        //    {
        //        error msg = new error();
        //        msg.Message = "SaveAdvertisement image generation start";
        //        ErrorLog(msg);
        //        byte[] imageBytes = Convert.FromBase64String(base64String);
        //        MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
        //        // Convert byte[] to Image
        //        ms.Write(imageBytes, 0, imageBytes.Length);
        //        System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
        //        //string newFile = Guid.NewGuid().ToString() + fileExtensionApplication;
        //        string filePath = Path.Combine(System.Web.HttpContext.Current.Server.MapPath("~/img/AdvImages/"), ID + ".Jpeg");
        //        image.Save(filePath, ImageFormat.Jpeg);
        //        msg.Message = "img path" + filePath;
        //        ErrorLog(msg);
        //        msg.Message = "SaveAdvertisement image generation end";
        //        ErrorLog(msg);
        //    }
        //    catch (Exception ex)
        //    {
        //        error msg = new error();
        //        msg.Message = ex.Message;
        //        msg.InnerException = Convert.ToString(ex.InnerException);
        //        msg.Source = Convert.ToString(ex.Source);
        //        msg.StackTrace = Convert.ToString(ex.StackTrace);
        //        msg.CreatedOn = DateTime.Now;
        //        ErrorLog(msg);
        //        string filePath = System.Web.HttpContext.Current.Server.MapPath("~/img/");
        //        StringBuilder sb = new StringBuilder();
        //        sb.Append(ex.Message);
        //        // flush every 20 seconds as you do it
        //        File.AppendAllText(filePath + "log.txt", sb.ToString());
        //        sb.Clear();
        //    }

        //}

        [WebMethod]
        public string GenerateLog()
        {
            try
            {
                string filePath = System.Web.HttpContext.Current.Server.MapPath("~/img/");
                StringBuilder sb = new StringBuilder();
                sb.Append("testasd"+ filePath);
                // flush every 20 seconds as you do it
                File.AppendAllText(filePath + "log.txt", sb.ToString());
                sb.Clear();
                return filePath;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public void ErrorLog(error ex)
        {
            int id = -1;
            try
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    string query = "Insert into ErrorLog (Message,Source,StackTrace,InnerException,CreatedOn)" +
                            "values('"+ex.Message+"','"+ ex.Source + "','" + ex.StackTrace + "','" + ex.InnerException + "','');";
                    SqlCommand sqlCommand = new SqlCommand(query, con);
                    //sqlCommand.Parameters.AddWithValue("@Message", ex.Message);
                    //sqlCommand.Parameters.AddWithValue("@Source", ex.Source);
                    //sqlCommand.Parameters.AddWithValue("@StackTrace", ex.StackTrace);
                    //sqlCommand.Parameters.AddWithValue("@InnerException", ex.InnerException);
                    //sqlCommand.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                    if (con.State != ConnectionState.Open)
                        con.Open();
                    sqlCommand.ExecuteNonQuery();
                    con.Close();
                    //id = true.ToString();
                    //if (con.State != ConnectionState.Open)
                    //    con.Open();
                    ////sqlCommand.ExecuteNonQuery();
                    //object returnObj = sqlCommand.ExecuteScalar();
                    //con.Close();
                    ////id = true.ToString();
                }
            }
            catch (Exception e) { /*id = id + ex.ToString();*/ }
        }
        #endregion
    }
    public class Email
    {
        public string From { get; set; }
        public string Subject { get; set; }
        public string To { get; set; }
        public string Message { get; set; }
    }
    public class AdvUser
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Company { get; set; }
        public string Website { get; set; }
        public string Vat { get; set; }
        public string EmailForSale { get; set; }
        public bool IsAdmin { get; set; }
        public int TotalPublication { get; set; }
        public int TotalVisitors{ get; set; }
        public int TotalDiscount { get; set; }
    }

    public class Details
    {
        public string PlayerId { get; set; }
        public string ClubId { get; set; }
        public string Name { get; set; }
        public string FamilyName { get; set; }
        public string PlayerPicture { get; set; }
        public string ClubName { get; set; }
        public string ClubPicture { get; set; }
    }
    public class clubDetails
    {
        public string clubId { get; set; }
        public string ClubName { get; set; }
        public string ClubLogo { get; set; }
        public string ContactPerson { get; set; }
        public string CompanyName { get; set; }
        public string VatNo { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Cell { get; set; }
        public string Nation { get; set; }
        public string City { get; set; }
        public string Status { get; set; }
    }
    public class costDetails
    {
        public string id { get; set; }
        public string clubid { get; set; }
        public string bilino { get; set; }
        public string f1 { get; set; }
        public string t1 { get; set; }
        public string h1 { get; set; }
        public string d1 { get; set; }
        public string f2 { get; set; }
        public string t2 { get; set; }
        public string h2 { get; set; }
        public string d2 { get; set; }
        public string f3 { get; set; }
        public string t3 { get; set; }
        public string h3 { get; set; }
        public string d3 { get; set; }
        public string f4 { get; set; }
        public string t4 { get; set; }
        public string h4 { get; set; }
        public string d4 { get; set; }
        public string SpecialCharge { get; set; }
        public string SpecialBool { get; set; }
        public string DownloadExel { get; set; }
        public string costvisible { get; set; }
        public string emailcostPlayer { get; set; }
        public string emailcostowner { get; set; }
        public string coston { get; set; }
    }
    public class gamecostdetails
    {
        public string id { get; set; }
        public string clubid { get; set; }
        public string billno { get; set; }
        public string p1 { get; set; }
        public string p2 { get; set; }
        public string p3 { get; set; }
        public string p4 { get; set; }
        public string noplayers { get; set; }
        public string costplayer { get; set; }
        public string totcost { get; set; }
        public string date { get; set; }
        public string fromtime { get; set; }
        public string totime { get; set; }
        public string duration { get; set; }
        public string gameover { get; set; }

        public string status { get; set; }

        public string usbrelay { get; set; }

    }
    public class ScoreData
    {
        public int id { get; set; }
        public int gameid { get; set; }
        public string text { get; set; }
        public string color { get; set; }
        public bool setdata { get; set; }
        public int setid { get; set; }
        public string status { get; set; }
        public bool tlavail { get; set; }


    }

    public class ScorePlayerData
    {
        public string id { get; set; }
        public string Email { get; set; }
        public string Name { get; set; }
        public string FamilyName { get; set; }
        public string ClubId { get; set; }
        public string ClubName { get; set; }
        public string ClubLogo { get; set; }
        public string PlayerPicture { get; set; }

        public string playerno { get; set; }

    }

    public class Shot
    {
        public int ShotId { get; set; }
        public int PlayerId { get; set; }
        public String ShotName { get; set; }
        public String Description { get; set; }
        public float InSide { get; set; }
        public float OutSide { get; set; }
        public List<ShotDimensions> ShotDimensions { get; set; }
    }
    public class ShotDimensions
    {
        public int ShotDimensionId { get; set; }
        public int ShotId { get; set; }
        public float X1 { get; set; }
        public float Y1 { get; set; }
        public float X2 { get; set; }
        public float Y2 { get; set; }
    }
    public class error
    {
        public string Message { get; set; }
        public string Source { get; set; }
        public string StackTrace { get; set; }
        public string InnerException { get; set; }
        public DateTime CreatedOn { get; set; }
    }
    public class AdvView
    {
        public int Id { get; set; }
        public string IpAddress { get; set; }
        public int AdvertisementId { get; set; }
        public DateTime VisitedOn { get; set; }
    }
    public class Discount
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int AdvertisementId { get; set; }
        public string Email { get; set; }
        public string AdvEmail { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
