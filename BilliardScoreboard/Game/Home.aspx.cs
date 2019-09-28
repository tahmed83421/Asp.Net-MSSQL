using System;
using System.Collections.Generic;
using System.Linq;
using System.Media;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BilliardScoreboard.Game
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void BtnItalian_Click(object sender, EventArgs e)
        {
            this.Session["Game"] = (object)"Italian";
            SystemSounds.Beep.Play();
            this.Response.Redirect("../Game/Setup.aspx");
        }

        public void BtnCarom_Click(object sender, EventArgs e)
        {
  //          this.Session["Game"] = (object)"Carom";
//            this.Response.Redirect("../Game/Setup.aspx");
        }
    }
}
