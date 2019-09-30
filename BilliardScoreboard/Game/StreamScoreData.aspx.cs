﻿using System;
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
        }

        private void SetValues()
        {
            string mid = Setup.MatchId.ToString();
            using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {
                SqlDataAdapter ad = new SqlDataAdapter("SELECT TVal,PVal, SVal,Score from RealTimeScoreDetails where MatchId="+mid+" AND TeamID=1", con) ;
                DataSet ds = new DataSet();
                ad.Fill(ds);
                foreach (DataRow dtrow in ds.Tables[0].Rows)
                {

                    lblSet.Text = mid;
                    Punti.Text = dtrow["Score"].ToString();
                    Tiri.Text = dtrow["TVal"].ToString();
                    Allafine.Text = dtrow["PVal"].ToString();






                }

            }





        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            SetValues();
        }

    }
}