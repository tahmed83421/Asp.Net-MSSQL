using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BilliardScoreboard
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnItalian_Click(object sender, EventArgs e)
        {
            Session["Game"] = "Italian";
            Response.Redirect("Game/Setup.aspx");
        }

        protected void btnCarom_Click(object sender, EventArgs e)
        {
            Session["Game"] = "Carom";
            Response.Redirect("Game/Setup.aspx");
        }

        protected void btnItScoreTrackingLine_Click(object sender, EventArgs e)
        {

        }

        protected void btnCarScoreTrackingLine_Click(object sender, EventArgs e)
        {

        }
    }
}