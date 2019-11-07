using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BilliardScoreboard
{
    public partial class Vote : System.Web.UI.Page
    {
        public int byes;
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Cookies["State"] != null)
            {
                ImageButtonBill.ImageUrl = "../img/billActive.png";
                ImageButtonVedi.ImageUrl = "../img/Vedi.png";
            }
          
            LoadValues();
        }



        public string LoadCount(string answer)

        {
            string ans = "";
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter ad = new SqlDataAdapter("SELECT "+answer+" from Vote", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);


               
                    foreach (DataRow drow in ds.Tables[0].Rows)
                    {

                    if (answer == "YES")
                    {
                        ans = drow["Yes"].ToString().Trim();
                    }
                    else if(answer == "NO")
                    {
                        ans = drow["No"].ToString().Trim();
                    }


                    }
                
                return ans;

            }
           
        }





        public void LoadValues()

        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter ad = new SqlDataAdapter("SELECT ID,Topic,Yes,No,Expire,Ore from Vote", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);



                foreach (DataRow drow in ds.Tables[0].Rows)
                {

                    Ore.Text = drow["Ore"].ToString().Trim();
                    DateTime.Text = drow["Expire"].ToString().Trim();
                    TopicNo.Text= "00" + drow["ID"].ToString().Trim();
                    Question.Text = drow["Topic"].ToString().Trim();

                 
                }


            }
        }


            private bool  GetValue( string MAC)
        {

            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter sd = new SqlDataAdapter("SELECT COUNT(*) from VoteStatistic where MAC = '" +MAC+ "' ", con);
                DataTable dt = new DataTable();

                sd.Fill(dt);


                if (dt.Rows[0][0].ToString() == "1")
                {

                    return true;
                }
                else
                {
                    return false;
                }
            }
           
        }
        public string GetMACAddress()
        {
            string mac_src = "";
            string macAddress = "";

            foreach (System.Net.NetworkInformation.NetworkInterface nic in System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces())
            {
                if (nic.OperationalStatus == System.Net.NetworkInformation.OperationalStatus.Up)
                {
                    mac_src += nic.GetPhysicalAddress().ToString();
                    break;
                }
            }

            while (mac_src.Length < 12)
            {
                mac_src = mac_src.Insert(0, "0");
            }

            for (int i = 0; i < 11; i++)
            {
                if (0 == (i % 2))
                {
                    if (i == 10)
                    {
                        macAddress = macAddress.Insert(macAddress.Length, mac_src.Substring(i, 2));
                    }
                    else
                    {
                        macAddress = macAddress.Insert(macAddress.Length, mac_src.Substring(i, 2)) + "-";
                    }
                }
            }
            return macAddress;
        }
        protected void SI_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["State"] == null)
            {
                ConfirmVote.Visible = true;
                ConfirmVote.Enabled = true;
                ViewState["V"] = "yes";

            }
            else
            {
                string script = "alert('You already Voted');";
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(ImageButtonBill, this.GetType(), "Test", script, true);
            }

           
        }

        protected void NO_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["State"] == null)
            {
                ConfirmVote.Visible = true;
                ConfirmVote.Enabled = true;
                ViewState["V"] = "no";
            }
            else
            {
                string script = "alert('You already Voted');";
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(ImageButtonBill, this.GetType(), "Test", script, true);
            }
        }
   

        protected void ConfirmVote_Click(object sender, EventArgs e)
        {
           
           
            if (Request.Cookies["State"] == null)
            {
                using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                {
                    SqlCommand ad = new SqlCommand("Insert into VoteStatistic(MAC,Yes)values('set'," + byes + ")", con);
                    ad.CommandType = CommandType.Text;
                    con.Open();
                    ad.ExecuteReader();
                    con.Close();
                    ImageButtonBill.ImageUrl = "../img/billActive.png";
                    ImageButtonVedi.ImageUrl = "../img/Vedi.png";
                    ConfirmVote.Visible = false;
                }

                if (ViewState["V"].ToString() == "yes")
                {
                    int CountYes = Convert.ToInt32(LoadCount("YES")) + 1;
                   
                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {
                        SqlCommand sc = new SqlCommand("update Vote set Yes ='" + CountYes.ToString() + "' where ID=" + Convert.ToInt32(TopicNo.Text) + "", con);
                        sc.CommandType = CommandType.Text;
                        con.Open();
                        sc.ExecuteReader();
                        con.Close();
                       

                    }
                }
                else if(ViewState["V"].ToString() == "no")
                {
                    int CountNo = Convert.ToInt32(LoadCount("NO")) + 1;
                   
                    using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
                    {
                        SqlCommand sc = new SqlCommand("update Vote set No ='" + CountNo.ToString() + "' where ID=" + Convert.ToInt32(TopicNo.Text) + "", con);
                        sc.CommandType = CommandType.Text;
                        con.Open();
                        sc.ExecuteReader();
                        con.Close();
                       

                    }

                }
                HttpCookie HC = new HttpCookie("State");
                HC.Values["State"] = "Set";
                HC.Expires = 
                    System.DateTime.Now.AddDays(2); //Added cookies Expires time  
                Response.Cookies.Add(HC);
            
            }

           
        }
      

        protected void ImageButtonBill_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.Cookies["State"] != null)
            {
                Response.Redirect("https://www.biliardoprofessionale.it/");
            }
            else
            {
                string script = "alert('Please Vote to Leave the page');";
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(ImageButtonBill, this.GetType(), "Test", script, true);
            }
        }

        protected void ImageButtonVedi_Click(object sender, ImageClickEventArgs e)
        {
            if (Request.Cookies["State"] != null)
            {
                Response.Redirect("survey-statistic.aspx");
            }
            else
            {
                string script = "alert('Please Vote to Leave the page');";
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(ImageButtonVedi, this.GetType(), "Test", script, true);
            }
        }
    }
}