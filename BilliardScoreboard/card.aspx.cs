using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace BilliardScoreboard
{
    public partial class card : System.Web.UI.Page
    {
        public DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
                dt = (DataTable)Session["CARD"];

                if (!IsPostBack)
                {
                    Label8.Text = dt.Rows[0][0].ToString();
                    Label9.Text = dt.Rows[0][1].ToString();
                    Label11.Text = dt.Rows[0][2].ToString();
                    Image3.ImageUrl = dt.Rows[0][3].ToString();
                    Image2.ImageUrl = dt.Rows[0][4].ToString();

                    Label8.Text= dt.Rows[0][0].ToString();    //name
                    Label9.Text = dt.Rows[0][1].ToString();   //fname
                    Label11.Text = dt.Rows[0][2].ToString();  //cname
                    Label12.Text = "via ";
                    
                    Label12.Text+=dt.Rows[0][5].ToString()+ "," ;
                    Label12.Text += dt.Rows[0][6].ToString() + "-";
                    Label12.Text += dt.Rows[0][7].ToString();
                    
                    if (Label12.Text.Length > 36)
                        Label12.Text = Label12.Text.Substring(0, 36);


                    Label1.Text = dt.Rows[0][8].ToString();
                    if (Label1.Text.Length > 36)
                        Label1.Text = Label1.Text.Substring(0, 36);

                    Label13.Text = "dal " + Convert.ToDateTime(dt.Rows[0][9]).ToShortDateString() + " al " + Convert.ToDateTime(dt.Rows[0][10]).ToShortDateString();
                    Label13.Font.Bold = true;
                    Label14.Text = "Tessera N<sup>o</sup> "+dt.Rows[0][11].ToString();
                }
                else
                {
                    Response.Redirect("https://biliardoprofessionale.it");
                }
            //}
            //catch { Response.Redirect("https://biliardoprofessionale.it"); }
        }
    }
}