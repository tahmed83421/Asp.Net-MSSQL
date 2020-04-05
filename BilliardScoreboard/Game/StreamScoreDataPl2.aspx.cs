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
        public bool vis;
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["ClubID"].ToString() != "")
            {
                SetValues();
                imgPlayer4.Visible = vis;

                imgClub4.Visible = vis;
            }

        }
        
        private void SetValues()
        {
            string mid = Setup.MatchId.ToString();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
               
                SqlDataAdapter ad = new SqlDataAdapter("SELECT TVal,PVal, SVal,Score from RealTimeScoreDetails where MatchId='"+ Request.QueryString["ClubID"].ToString() + "' AND TeamID=2", con);
                DataSet ds = new DataSet();
                ad.Fill(ds);

                SqlDataAdapter sd = new SqlDataAdapter("select imgPlayer2,Player2Name,Club2Name,Club4Name,imgPlayer4,Player4Name,imgClub2,imgClub4 from MatchDetails where MatchIDD ='"+ Request.QueryString["ClubID"].ToString() + "'", con);
                DataSet dataSet = new DataSet();
                sd.Fill(dataSet);

                foreach (DataRow drow in dataSet.Tables[0].Rows)
                {


                    if (string.IsNullOrEmpty(drow["imgPlayer4"].ToString()) || string.IsNullOrEmpty(drow["Player4Name"].ToString()) || string.IsNullOrEmpty(drow["imgClub4"].ToString()) || string.IsNullOrEmpty(drow["Club4Name"].ToString())) { vis = false; } else { vis = true; }


                    Player2Name.Text = drow["Player2Name"].ToString();
                    imgPlayer2.ImageUrl = "https://score.biliardoprofessionale.it/" + drow["imgPlayer2"].ToString().Trim();
                    Club2Name.Text = drow["Club2Name"].ToString();
                    imgClub2.ImageUrl = "https://score.biliardoprofessionale.it/" + drow["imgClub2"].ToString().Trim();
                    Player4Name.Text = drow["Player4Name"].ToString();
                    imgPlayer4.ImageUrl = "https://score.biliardoprofessionale.it/" + drow["imgPlayer4"].ToString().Trim();
                    Club4Name.Text = drow["Club4Name"].ToString();
                    imgClub4.ImageUrl = "https://score.biliardoprofessionale.it/" + drow["imgClub4"].ToString().Trim();
                }



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