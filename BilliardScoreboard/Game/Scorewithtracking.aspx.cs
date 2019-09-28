using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BilliardScoreboard.Game
{
    public partial class Scorewithtracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Response.Redirect("~/Default.aspx");
            //if (!IsPostBack)
            //{
            //    lblPlayer1.Text = Convert.ToString(Session["P1"]);
            //    imgPlayer1.ImageUrl = Convert.ToString(Session["PP1"]);
            //    lblClub1.Text = Convert.ToString(Session["C1"]);
            //    imgClub1.ImageUrl = Convert.ToString(Session["CP1"]);
            //    lblPlayer3.Text = Convert.ToString(Session["P2"]);
            //    imgPlayer3.ImageUrl = Convert.ToString(Session["PP2"]);
            //    lblClub3.Text = Convert.ToString(Session["C2"]);
            //    imgClub3.ImageUrl = Convert.ToString(Session["CP2"]);
            //    lblPlayer2.Text = Convert.ToString(Session["P3"]);
            //    imgPlayer2.ImageUrl = Convert.ToString(Session["PP3"]);
            //    lblClub2.Text = Convert.ToString(Session["C3"]);
            //    imgClub2.ImageUrl = Convert.ToString(Session["CP3"]);
            //    lblPlayer4.Text = Convert.ToString(Session["P4"]);
            //    imgPlayer4.ImageUrl = Convert.ToString(Session["PP4"]);
            //    lblClub4.Text = Convert.ToString(Session["C4"]);
            //    imgClub4.ImageUrl = Convert.ToString(Session["CP4"]);

            //    lblGameType.Text = Convert.ToString(Session["Game"]) + " Game " + Convert.ToString(Session["Pins"]);

            //    lbls1.Text = "s" + "0/" + Convert.ToString(Session["Set"]);
            //    lbls2.Text = "s" + "0/" + Convert.ToString(Session["Set"]);

            //    if (Convert.ToString(Session["Game"]) == "Italian")
            //    {
            //        lblt1.Text = "t0";
            //        lblt2.Text = "t0";
            //        lblGameType.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00CC00");
            //        lblp1.Text = "p" + Convert.ToString(Session["Point"]);
            //        lblp2.Text = "p" + Convert.ToString(Session["Point"]);
            //    }
            //    else if (Convert.ToString(Session["Game"]) == "Carom")
            //    {
            //        lblt1.Text = "i0";
            //        lblt2.Text = "i0";
            //        lblGameType.ForeColor = System.Drawing.ColorTranslator.FromHtml("#33CCFF");
            //        lblp1.Text = "c" + Convert.ToString(Session["Point"]);
            //        lblp2.Text = "c" + Convert.ToString(Session["Point"]);
            //    }
            //}
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Time"]) == "True")
            {
                string[] items = lblTime.Text.Split(':');
                int hours = int.Parse(items[0]);
                int mins = int.Parse(items[1]);
                int secs = int.Parse(items[2]);
                secs++;
                if (secs == 60)
                {
                    mins++;
                    secs = 0;
                    if (mins == 60)
                    {
                        hours++;
                        mins = 0;
                        if (hours == 24) hours = 0;
                    }
                }
                lblTime.Text = String.Format("{0:D2}:{1:D2}:{2:D2}", hours, mins, secs);
            }
        }
    }
}