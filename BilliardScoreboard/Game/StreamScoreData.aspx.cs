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
            SetValues();
            if (Session["MatchID"] == null) Session["MatchID"] = string.Empty;
        }

        private void SetValues()
        {
            string mid = Setup.MatchId.ToString();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT TVal,PVal, SVal,Score from RealTimeScoreDetails where MatchId=" + Session["MatchID"].ToString() + " AND TeamID=1", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);
                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {

                        lblSet1.Text = dtrow["SVal"].ToString();
                        Punti1.Text = dtrow["Score"].ToString();
                        Tiri1.Text = dtrow["TVal"].ToString();
                        Allafine1.Text = dtrow["PVal"].ToString();
                        Player1Name.Text = Convert.ToString(Session["P1"]);
                        imgPlayer1.ImageUrl = Convert.ToString(Session["PP1"]);
                        Club1Name.Text = Convert.ToString(Session["C1"]);
                        imgClub1.ImageUrl = Convert.ToString(Session["CP1"]);
                        Player2.Text = Session["MatchID"].ToString();






                    }
                }
                catch { Response.Write("Please Start The Game First to see Score"); }

            }





        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetValues();
        }

    }
}