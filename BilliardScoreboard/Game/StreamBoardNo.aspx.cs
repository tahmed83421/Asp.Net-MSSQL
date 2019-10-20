using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace BilliardScoreboard.Game
{
    public partial class StreamBoardNo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SetValues();
            
        }


        private void SetValues()
        {
           
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter ad = new SqlDataAdapter("SELECT BoardNo from RealTimeScoreDetails where MatchId=1111 AND TeamID=1", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);

              

                foreach (DataRow drow in ds.Tables[0].Rows)
                {


                  
                  
                    Button1.Text = drow["BoardNo"].ToString().Trim();
                }



           

            }





        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetValues();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}