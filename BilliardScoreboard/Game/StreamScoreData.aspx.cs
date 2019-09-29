using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace BilliardScoreboard.Game
{
    public partial class StreamScoreData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void SetValues()
        {

            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT TVal,PVal, SVal,Score from RealTimeScoreDetails where MatchID= 7", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {

                    lblSet.Text = dtrow["SVal"].ToString();
                    Punti.Text = dtrow["Score"].ToString();


                }

            }





        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetValues();
        }

    }
}