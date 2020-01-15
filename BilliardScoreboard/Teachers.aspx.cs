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

namespace BilliardScoreboard
{
    public partial class Teachers : System.Web.UI.Page
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
                BindDropdown();
                //LoadString();
            }
        }

        protected void BindDropdown()
        {
            BindSurname();
            BindName(string.Empty);
        }

        public void BindSurname()
        {
            string com = "Select DISTINCT FamilyName from PlayerDetails where Status='Active'";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddSurname.DataSource = dt;
            ddSurname.DataBind();
            ddSurname.DataTextField = "FamilyName";
            ddSurname.DataValueField = "FamilyName";
            ddSurname.DataBind();
            ddSurname.Items.Insert(0, "Select");
        }
        public void BindName(string Surname)
        {
            string com = "Select Name,PlayerId from PlayerDetails where Status='Active'" + ((string.IsNullOrEmpty(Surname) || Surname == "Select") ? "" : " and LOWER(FamilyName)='" + Surname.ToLower() + "'");
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            ddName.DataSource = dt;
            ddName.DataBind();
            ddName.DataTextField = "Name";
            ddName.DataValueField = "PlayerId";
            ddName.DataBind();
            ddName.Items.Insert(0, "Select");
        }
        protected void ddSurname_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindName(ddSurname.SelectedItem.Text);
            //btnnext.Visible = false;
            //lblbtnpage.Visible = false;
            //btnpre.Visible = false;
            //pnlbodyimage.Visible = false;
            //lblselectgame.Text = "Please select Game/Set to see all data & statistic";
            //lblwinner.Visible = false;
            //LoadddCity();
            //ddClub.Items.Clear();
            //ddClub.Items.Add("Select");
            //ddFname.Items.Clear();
            //ddFname.Items.Add("Select");
            //ddName.Items.Clear();
            //ddName.Items.Add("Select");
        }
        protected void ddName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                UserDetailBlock.Visible = true;
                TeacherDetail = new Teacher(Convert.ToInt32(ddName.Text));
                impProfPic.ImageUrl = TeacherDetail.PlayerPicture;
                lblProfile.Text = TeacherDetail.Name;
                var ShotList = service.GetShotListByPlayerId(Convert.ToInt32(ddName.Text));
                ddShotList.DataSource = ShotList;
                ddShotList.DataTextField = "ShotName";
                ddShotList.DataValueField = "ShotId";
                ddShotList.DataBind();
                ddShotList.Items.Insert(0, "Select shot");
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", " GetRendomeImg();", true);
            }
            catch (Exception)
            {

            }
            
            //btnnext.Visible = false;
            //lblbtnpage.Visible = false;
            //btnpre.Visible = false;
            //pnlbodyimage.Visible = false;
            //lblwinner.Visible = false;
            //lblselectgame.Text = "Please select Game/Set to see all data & statistic";
            //LoadddClub();
            //ddFname.Items.Clear();
            //ddFname.Items.Add("Select");
            //ddName.Items.Clear();
            //ddName.Items.Add("Select");

        }

        protected void ddShotList_SelectedIndexChanged(object sender, EventArgs e)
        {
            var ShotDetail = service.GetShotDetailByShotId(Convert.ToInt32(ddShotList.Text));
            Repeater1.DataSource = ShotDetail.ShotDimensions;
            Repeater1.DataBind();
            ShotTitle.Text = ShotDetail.ShotName;
            ShotDescription.Text = ShotDetail.Description;
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "setsvg()", true);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "setsvg()", true);
        }

        protected void btnCancle_Click(object sender, EventArgs e)
        {

        }
    }
}