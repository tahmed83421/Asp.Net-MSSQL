using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BilliardScoreboard.Game
{
    public partial class StreamScoreDataPl2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetValues();
            
        }

        private void SetValues()
        {
            string mid = Setup.MatchId.ToString();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT TVal,PVal, SVal,Score from RealTimeScoreDetails where MatchId=" + mid + " AND TeamID=2", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {

                    lblSet2.Text = dtrow["SVal"].ToString();
                    Punti2.Text = dtrow["Score"].ToString();
                    Tiri2.Text = dtrow["TVal"].ToString();
                    Allafine2.Text = dtrow["PVal"].ToString();






                }

            }





        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            SetValues();
        }

       
    }
}