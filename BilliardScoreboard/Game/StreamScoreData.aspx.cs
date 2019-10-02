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
            if (Session["MatchID"] == null) Session["MatchID"] = Setup.MatchId.ToString();
        }

        private void SetValues()
        {

          
            string mid = Setup.MatchId.ToString();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                    SqlDataAdapter ad = new SqlDataAdapter("SELECT TVal,PVal, SVal,Score from RealTimeScoreDetails where MatchId=" + mid + " AND TeamID=1", con);
                    DataSet ds = new DataSet();
                    ad.Fill(ds);

                SqlDataAdapter sd = new SqlDataAdapter("select imgPlayer1,Player1Name,Club1Name,Club3Name,imgPlayer3,Player3Name,imgClub3,imgClub1 from MatchDetails where MatchIDD = " + mid+"", con);
                DataSet dataSet = new DataSet();
                sd.Fill(dataSet);


                foreach (DataRow drow in dataSet.Tables[0].Rows)
                {
                    Player1Name.Text = drow["Player1Name"].ToString();
                    imgPlayer1.ImageUrl = drow["imgPlayer1"].ToString();
                    Club1Name.Text = drow["Club1Name"].ToString();
                    imgClub1.ImageUrl = drow["imgClub1"].ToString();
                    Player3Name.Text = drow["Player3Name"].ToString();
                    ImgPlayer3.ImageUrl = drow["imgPlayer3"].ToString();
                    Club3Name.Text = drow["Club3Name"].ToString();
                    imgClub3.ImageUrl = drow["imgClub3"].ToString();
                }



                    foreach (DataRow dtrow in ds.Tables[0].Rows)
                    {

                        lblSet1.Text = dtrow["SVal"].ToString();
                        Punti1.Text = dtrow["Score"].ToString();
                        Tiri1.Text = dtrow["TVal"].ToString();
                        Allafine1.Text = dtrow["PVal"].ToString();
                       
                       








                   
                }
               

            }





        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetValues();
        }

    }
}