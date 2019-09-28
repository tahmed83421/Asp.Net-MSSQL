using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Resources;
using System.Globalization;
using System.Threading;
using System.Reflection;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;
using System.Web.Services;
using System.Text;
using System.Drawing.Imaging;

namespace BilliardScoreboard
{
    public partial class advertaising : System.Web.UI.Page
    {
        ResourceManager rm;
        CultureInfo ci;
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        Teacher TeacherDetail = new Teacher();
        BilliardScoreboard service = new BilliardScoreboard();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Lang"] == null)
            {
                //Session["Lang"] = ddLang.SelectedValue;

                //Session["Lang"] = Request.UserLanguages[1];
            }

            if (!IsPostBack)
            {
                //LoadString();
            }
        }
        
            
        
    }
}