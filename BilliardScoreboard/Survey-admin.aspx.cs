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
                    TopicNo.Text = "00" + drow["ID"].ToString().Trim();
                    Question.Text = drow["Topic"].ToString().Trim();
                    CountSI.Text = "n°" + drow["Yes"].ToString().Trim();
                    CountNO.Text = "n°" + drow["No"].ToString().Trim();


                }


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
    }
}