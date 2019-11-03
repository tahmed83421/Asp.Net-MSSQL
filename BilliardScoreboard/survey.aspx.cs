using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.Web.Configuration;

namespace BilliardScoreboard
{
    public partial class survey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string message = "Do you want to submit?";
            ClientScript.RegisterOnSubmitStatement(this.GetType(), "confirm", "return confirm('" + message + "');");
            SetValues();
        }
        private string Yes1;
        private void SetValues()
        {

            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter ad = new SqlDataAdapter("SELECT Topic,Yes,No from Vote", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);



                foreach (DataRow drow in ds.Tables[0].Rows)
                {




                    Question.Text = drow["Topic"].ToString().Trim();
                    
                  Yes1 = drow["Yes"].ToString().Trim();
                    Yess.Text = "n°"+ Yes1;
                }





            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            

            int count;
            count = Convert.ToInt32(Yes1);
            count++;
            Yes1 = count.ToString();
            Yess.Text = "n°" + Yes1.ToString();


            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlCommand ad = new SqlCommand("Update Vote set Yes ="+count+" where Id=1 ", con);
                ad.CommandType = CommandType.Text;
                con.Open();
                ad.ExecuteReader();
                con.Close();



               





            }

         

        }
    }
}