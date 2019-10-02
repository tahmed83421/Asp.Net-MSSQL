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

                SqlDataAdapter sd = new SqlDataAdapter("select imgPlayer2,Player2Name,Club2Name,Club4Name,imgPlayer4,Player4Name,imgClub2,imgClub4 from MatchDetails where MatchIDD = " + mid + "", con);
                DataSet dataSet = new DataSet();
                sd.Fill(dataSet);

                foreach (DataRow drow in dataSet.Tables[0].Rows)
                {
                    Player2Name.Text = drow["Player2Name"].ToString();
                    imgPlayer2.ImageUrl = drow["imgPlayer2"].ToString();
                    Club2Name.Text = drow["Club2Name"].ToString();
                    imgClub2.ImageUrl = drow["imgClub2"].ToString();
                    Player4Name.Text = drow["Player4Name"].ToString();
                    imgPlayer4.ImageUrl = drow["imgPlayer4"].ToString();
                    Club4Name.Text = drow["Club4Name"].ToString();
                    imgClub4.ImageUrl = drow["imgClub4"].ToString();
                }



                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {

                    lblSet2.Text = dtrow["SVal"].ToString();
                    Punti2.Text = dtrow["Score"].ToString();
                    Tiri2.Text = dtrow["TVal"].ToString();
                    Allafine2.Text = dtrow["PVal"].ToString();
                    Player2Name.Text= Convert.ToString(Session["P2"]);
                    imgPlayer2.ImageUrl = Convert.ToString(Session["PP2"]);
                    Club4Name.Text = Convert.ToString(Session["C2"]);
                    imgPlayer4.ImageUrl = Convert.ToString(Session["CP2"]);






                }

            }





        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            SetValues();
        }

       
    }
}