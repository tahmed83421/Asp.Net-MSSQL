using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BilliardScoreboard
{
    public partial class Survey_admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
            {

                SqlDataAdapter ad = new SqlDataAdapter("SELECT COUNT(*) from AdminDetails where pass = '" + txtPassword.Text+"' ", connection);
                DataTable dt = new DataTable();

                SqlDataAdapter sd = new SqlDataAdapter("SELECT COUNT(*) from PlayerDetails where Password = '" + txtPassword.Text + "' ", connection);
                DataTable dt1 = new DataTable();
                SqlDataAdapter sd2 = new SqlDataAdapter("SELECT COUNT(*) from ClubDetails where Password = '" + txtPassword.Text + "' ", connection);
                DataTable dt2 = new DataTable();

                ad.Fill(dt);
                sd.Fill(dt1);
                sd2.Fill(dt2);
                if (dt.Rows[0][0].ToString() == "1" || dt1.Rows[0][0].ToString() == "1" || dt2.Rows[0][0].ToString() == "1")
                {
                    Response.Redirect("Survey.aspx");

                }
                else
                {
                    Msg.Visible = true;

                    Msg.Text = "Please Double Check Your Id and Password "+ dt.Rows[0][0].ToString()+"";
                }


            }
        }
    }
}