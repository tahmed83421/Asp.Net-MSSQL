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
    public partial class Survey_admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadValues();
            if (!IsPostBack)
            {
                ViewState["Clicked"] = "YES";
            }
          
        }


        public void LoadValues()

        {
            // Calendar1.Visible = false;
          
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter ad = new SqlDataAdapter("SELECT ID,Topic,Yes,No,Expire,Ore from Vote", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);



                foreach (DataRow drow in ds.Tables[0].Rows)
                {
/*
                   Ore.Text = drow["Ore"].ToString().Trim();
                    DateTime.Text = drow["Expire"].ToString().Trim();
                    TopicNo.Text = "00" + drow["ID"].ToString().Trim();
                    Question.Text = drow["Topic"].ToString().Trim();
                    CountSI.Text = "n°" + drow["Yes"].ToString().Trim();
                    CountNO.Text = "n°" + drow["No"].ToString().Trim();*/

                    if (drow["Yes"].ToString() == null || drow["Yes"].ToString() == null) VoteInit();

                }


            }
        }

        public void VoteInit()

        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

              /*  SqlCommand ad = new SqlCommand("update Vote set Yes='0',No='0'  where ID=" + Convert.ToInt32(TopicNo.Text) + "", con);

                ad.CommandType = CommandType.Text;
                con.Open();
                ad.ExecuteReader();
                con.Close();
*/

            }
        }
      
        protected void ImageButtonBill_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ClearCokies_Click(object sender, EventArgs e)
        {
            string script = "alert('Are You Sure?');";
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(ClearCokies, this.GetType(), "Test", script, true);

            if (Request.Cookies["State"] != null)
            {
                Response.Cookies["State"].Expires = System.DateTime.Now.AddDays(-4);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
        
            if (Calendar1.Visible == true)
            {
                Calendar1.Visible = false;

            }
            else
            {
                Calendar1.Visible = true;
            }
            
        }
        public string GetLastDate()
        {
            DateTime dt = Convert.ToDateTime("1/1/2000");
            string dts = "";
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter ad = new SqlDataAdapter("SELECT Expire from Vote", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);



                foreach (DataRow drow in ds.Tables[0].Rows)
                {

                 //  dt = Convert.ToDateTime(drow["Expire"].ToString());
                    dts = drow["Expire"].ToString();


                }

                return dts;


            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
           
            if (e.Day.Date.CompareTo( Convert.ToDateTime( GetLastDate())) < 0)
            {
                e.Day.IsSelectable = false;
            }
        }
        

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            
            if (ViewState["Clicked"].ToString()=="YES")
            {
                txtStartDate.Text = Calendar1.SelectedDate.ToShortDateString();
                ViewState["Clicked"] = "NO";
                if (Calendar1.Visible == true)
                {
                    Calendar1.Visible = false;

                }
                else
                {
                    Calendar1.Visible = true;
                }

            }
            else
            {
                txtExpire.Text = Calendar1.SelectedDate.ToShortDateString();
                ViewState["Clicked"] = "YES";
                if (Calendar1.Visible == true)
                {
                    Calendar1.Visible = false;

                }
                else
                {
                    Calendar1.Visible = true;
                }

            }

        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible == true)
            {
                Calendar1.Visible = false;

            }
            else
            {
                Calendar1.Visible = true;
            }

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlCommand command = new SqlCommand("Insert into Vote(Topic,Yes,No,Expire,Ore,StartDate)Values('"+txtTopic.Text+"','0','0','"+txtExpire.Text+"','24','"+txtStartDate.Text+"')",con);
                command.CommandType = CommandType.Text;
                con.Open();
                command.ExecuteReader();
                con.Close();




            }
            txtStartDate.Text = "";
            txtExpire.Text = "";
            txtTopic.Text = "";
            string script = "alert('New Topic Added Successfully!');";
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(ClearCokies, this.GetType(), "Test", script, true);
            Response.Redirect("Survey-admin.aspx");
        }
       

        }
}