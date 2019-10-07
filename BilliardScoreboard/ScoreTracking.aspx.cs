using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.IO;


namespace BilliardScoreboard
{
    
    public partial class Score_Tracking : System.Web.UI.Page
    {
        BilliardScoreboard bll = new BilliardScoreboard();

        string ggameid = "";
        int pg = 1;
     
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (this.Request.QueryString["PlayerId"] != null)
            {
                Loadbylist(this.Request.QueryString["PlayerId"].ToString());
            }
            else if (!IsPostBack)
            {
                pnlbodyimage.Visible = false;
                lblselectgame.Visible = true;
                LoadddNation();
            }
        }
        private void LoadddNation()
        {
            
        List<string> ss = bll.GetScoreNationName();
            ddNation.Items.Clear();
            ddNation.Items.Add("Select");
            foreach (string Data in ss)
            {
                ddNation.Items.Add(Data);
            }
                        
        }
        private void LoadddCity()
        {
            List<string> ss = bll.GetScoreCityName(ddNation.SelectedItem.Text.Trim());
            ddCity.Items.Clear();
            ddCity.Items.Add("Select");
            foreach (string Data in ss)
            {
                ddCity.Items.Add(Data);
            }
         
        }
        private void LoadddClub()
        {
            List<string> ss = bll.GetScoreClubName(ddCity.SelectedItem.Text.Trim());
            ddClub.Items.Clear();
            ddClub.Items.Add("Select");
            foreach (string Data in ss)
            {
                ddClub.Items.Add(Data);
            }

        }
        private void LoadddFname()
        {
            List<string> ss = bll.GetScoreFname(ddClub.SelectedItem.Text.Trim());
            ddFname.Items.Clear();
            ddFname.Items.Add("Select");
            foreach (string Data in ss)
            {
                ddFname.Items.Add(Data);
            }

        }
        private void LoadddName()
        {
            List<string> ss = bll.GetScoreName(ddFname.SelectedItem.Text.Trim());
            ddName.Items.Clear();
            ddName.Items.Add("Select");
            foreach (string Data in ss)
            {
                ListItem li = new ListItem();
                try
                {
                    li.Text = Data.Split('|')[0];
                    li.Value = Data.Split('|')[1];
                }
                catch
                {
                    li.Text = Data.Split('|')[0];
                    li.Value = Data.Split('|')[0];
                }
                ddName.Items.Add(li);
            }

        }
        private void LoaddGameData(string gid)
        {
            List<ScorePlayerData> ss = bll.GetScoreStatistic(gid);
      
            foreach (ScorePlayerData Data in ss)
            {
                ggameid = ss[0].id;
                if (ss[0].id == Data.id)
                {

                    if (Data.playerno.Trim() == "1")
                    {
                        lblp1.Text = Data.Name + " " + Data.FamilyName;
                        try
                        {
                            lblp1.Text = lblp1.Text.Substring(0, 15);
                        }
                        catch { }
                        picp1.ImageUrl = "~/" + Data.PlayerPicture;
                        picc1.ImageUrl = "~/" + Data.ClubLogo;
                    }
                    if (Data.playerno.Trim() == "2")
                    {
                        lblp2.Text = Data.Name + " " + Data.FamilyName;
                        try
                        {
                            lblp2.Text = lblp2.Text.Substring(0, 15);
                        }
                        catch { }
                        picp2.ImageUrl = "~/" + Data.PlayerPicture;
                        picc2.ImageUrl = "~/" + Data.ClubLogo;
                    }
                    if (Data.playerno.Trim() == "3")
                    {
                        lblp3.Text = Data.Name + " " + Data.FamilyName;
                        try
                        {
                            lblp3.Text = lblp3.Text.Substring(0, 15);
                        }
                        catch { } picp3.ImageUrl = "~/" + Data.PlayerPicture;
                        picc3.ImageUrl = "~/" + Data.ClubLogo;
                    }
                    if (Data.playerno.Trim() == "4")
                    {
                        lblp4.Text = Data.Name + " " + Data.FamilyName;
                        try
                        {
                            lblp4.Text = lblp4.Text.Substring(0, 15);
                        }
                        catch { } picp4.ImageUrl = "~/" + Data.PlayerPicture;
                        picc4.ImageUrl = "~/" + Data.ClubLogo;
                    }

                }

            }


            if (lblp1.Text.Contains('-'))
                lblstatistichead1.Text = lblp1.Text.Split('-')[0];
            else lblstatistichead1.Text = lblp1.Text;

            if (lblp3.Text.Contains('-'))
                lblstatistichead1.Text += "-" + lblp3.Text.Split('-')[0];
            else lblstatistichead1.Text += "-" + lblp3.Text;

            lblstatistichead1.Text += "-statistic:";





            if (lblp2.Text.Contains('-'))
                lblstatistichead2.Text = lblp2.Text.Split('-')[1];
            else lblstatistichead2.Text = lblp2.Text;

            if (lblp4.Text.Contains('-'))
                lblstatistichead2.Text += "-" + lblp4.Text.Split('-')[1];
            else lblstatistichead2.Text += "-" + lblp4.Text;

            lblstatistichead2.Text += "-statistic:";


        }
        public void LoaddScoreData()
        {

            if (ggameid != "")
            {
                
                List<ScoreData> sd = bll.GetScoreData(ggameid);

                if(sd.Where(s => s.tlavail == true).ToList().Count>0)
                {
                    lblselectgame.Text = "Tracking Line Available";
                }
                else
                {
                    lblselectgame.Text = "Tracking Line Not Available";
                }

                int pl12set, pl34set, pl12shot, pl34shot, pl12score, pl34score, pl12zero, pl34zero, pl12gain, pl34gain, pl12pal, pl34pal, pl12han, pl34han;
                pl12set = pl34set = pl12shot = pl34shot = pl12score = pl34score = pl12zero = pl34zero = pl12gain = pl34gain = pl12pal = pl34pal = pl12han = pl34han = 0;
                string pl12mediapoints = "", pl34mediapoints = "";
                int p1turn = -1;
                try
                {
                    for (int i = 1; i <= sd.Max(x => x.setid); i++)
                    {
                        int turn = 0;
                        p1turn = -1;


                        HtmlGenericControl ul1 = new HtmlGenericControl();
                        ul1.InnerHtml = "<div class=\"col-md-3 col-sm-3 col-xs-3\"><div class=\"list\"><h5 class=\"result\">Result Set " + i + "</h5><ul class=\"result\">";

                        Panel pnlcolresultset = new Panel();

                        HtmlGenericControl ul2 = new HtmlGenericControl();
                        ul2.InnerHtml = "</ul></div></div>";

                        List<ScoreData> ssd = sd.Where(s => s.setid == i && s.setdata == true).ToList();
                        foreach (ScoreData Data in ssd)
                        {

                            try
                            {
                                int extra = 1;
                                List<string> datatextlist = Data.text.Split('|').ToList();
                                if (datatextlist[0].Contains("@2T1"))
                                {
                                    if (Data.color == "White")
                                        pl34pal += Convert.ToInt32(datatextlist[0].Replace("@2T1", ""));
                                    else pl12pal += Convert.ToInt32(datatextlist[0].Replace("@2T1", ""));
                                }
                                else
                                    if (datatextlist[0].Contains("@2T2"))
                                    {
                                        if (Data.color == "White")
                                            pl34pal += Convert.ToInt32(datatextlist[0].Replace("@2T2", ""));
                                        else pl12pal += Convert.ToInt32(datatextlist[0].Replace("@2T2", ""));
                                    }
                                    else
                                        if (datatextlist[0].Contains("@"))
                                        {
                                            if (Data.color == "White")
                                                pl34gain += Convert.ToInt32(datatextlist[0].Replace("@", ""));
                                            else pl12gain += Convert.ToInt32(datatextlist[0].Replace("@", ""));
                                        }
                                        else
                                            if (datatextlist[0].Contains("H"))
                                            {
                                                if (Data.color == "White")
                                                    pl12han += Convert.ToInt32(datatextlist[0].Replace("H", ""));
                                                else pl34han += Convert.ToInt32(datatextlist[0].Replace("H", ""));
                                            }
                                            else extra = 0;

                                if (Data.color == "White")
                                {
                                    if (turn < Convert.ToInt32(datatextlist[2].Split('t')[1]))
                                    { pl12shot++; turn++; }
                                    p1turn = 1;
                                    if (extra == 0)
                                    {
                                        if (Convert.ToInt32(datatextlist[0]) > 0)
                                            pl12mediapoints += datatextlist[0] + ",";
                                        pl12score += Convert.ToInt32(datatextlist[0]);
                                        if (Convert.ToInt32(datatextlist[0]) == 0)
                                            pl12zero++;
                                    }

                                }
                                else
                                {
                                    if (turn < Convert.ToInt32(datatextlist[2].Split('t')[1]))
                                    { pl34shot++; turn++; }
                                    p1turn = 2;
                                    if (extra == 0)
                                    {
                                        if (Convert.ToInt32(datatextlist[0]) > 0)
                                            pl34mediapoints += datatextlist[0] + ",";
                                        pl34score += Convert.ToInt32(datatextlist[0]);
                                        if (Convert.ToInt32(datatextlist[0]) == 0)
                                            pl34zero++;
                                    }
                                }

                            }
                            catch { }
                            finally
                            {
                                HtmlGenericControl li = new HtmlGenericControl();
                                li.InnerHtml = "<li>" + "<a href=\"#\">" + "<span style=\"color:" + Data.color + ";\">" + Data.text.Replace('|', ' ') + "</span></a></li>";
                                pnlcolresultset.Controls.Add(li);
                            }
                            
                        }

                        if (p1turn == 1)
                                    pl12set++;
                        else pl34set++;

                        pnlresultset.Controls.Add(ul1);
                        pnlresultset.Controls.Add(pnlcolresultset);
                        pnlresultset.Controls.Add(ul2);

                    }
                }
                catch { }

                float a = (float)(pl12score - pl34pal - pl34gain) / (float)(pl12shot - pl12zero);
                float b = (float)(pl34score - pl12pal - pl12gain) / (float)(pl34shot - pl34zero);


                if (pl12set > pl34set)
                {
                    lblwinner.Text = "Winner : " + lblp1.Text.Replace("-", "").Trim();
                    if ((!string.IsNullOrEmpty(lblp1.Text.Replace("-", "").Trim())) && (!string.IsNullOrEmpty(lblp3.Text.Replace("-", "").Trim())))
                        lblwinner.Text += "-";
                    lblwinner.Text += lblp3.Text.Replace("-", "").Trim();
                }
                else if (pl12set < pl34set)
                {
                    lblwinner.Text = "Winner : " + lblp2.Text.Replace("-", "").Trim();
                    if ((!string.IsNullOrEmpty(lblp2.Text.Replace("-", "").Trim())) && (!string.IsNullOrEmpty(lblp4.Text.Replace("-", "").Trim())))
                        lblwinner.Text += "-";
                    lblwinner.Text += lblp4.Text.Replace("-", "").Trim();
                }
                else lblwinner.Text = "";                

                if (p1turn == 1)
                    pl12set--;
                else if (p1turn == 2)
                    pl34set--;
                lblstatistic1.Text = "[Set Wins " + pl12set + "]--[Total Shots " + pl12shot + "/media points " + (pl12score - pl34pal - pl34gain) + "]--[Shot with points " + (pl12shot - pl12zero) + "/media points " + a.ToString("0.000").Replace('.', ',') + "]--[shot with zeroPoint " + pl12zero + "]--[points granted @" + pl34gain + "]--[panalty point @" + pl34pal + "]--[handicap point " + pl12han + "]";
                lblstatistic2.Text = "[Set Wins " + pl34set + "]--[Total Shots " + pl34shot + "/media points " + (pl34score - pl12pal - pl12gain) + "]--[Shot with points " + (pl34shot - pl34zero) + "/media points " + b.ToString("0.000").Replace('.', ',') + "]--[shot with zeroPoint " + pl34zero + "]--[points granted @" + pl12gain + "]--[panalty point @" + pl12pal + "]--[handicap point " + pl34han + "]";


               
                
                if (sd.Where(s => s.setdata == false).ToList().Count > 0)
                {
                    lblwinner.Visible = true;
                    try
                    {

                        lblstatistic1.Text = sd.Where(s => s.setdata == false && s.color == "White").ToList().FirstOrDefault().text;
                    }
                    catch { lblstatistic1.Text = ""; }
                    try
                    {
                        lblstatistic2.Text = sd.Where(s => s.setdata == false && s.color != "White").ToList().FirstOrDefault().text;
                    }
                    catch { lblstatistic2.Text = ""; }
                }
                
            }
            
        }
        public void LoadGameList()
        {
            pnlgamelist.Controls.Clear();
            if (pg <= 1)
                btnpre.Visible = false;
            else btnpre.Visible = true;
            List<gamecostdetails> ss = bll.GetScoreGameListWeb(ddName.SelectedItem.Value.Trim(),pg);

            HtmlGenericControl u1 = new HtmlGenericControl();
            u1.InnerHtml = "<ul class=\"menu\" style=\"margin: 0px 0px 0px 45px;\" ><li>S.no</li><li>Surname</li><li>Name</li><li>Date</li><li>Time</li><li></li></ul>";
            pnlgamelist.Controls.Add(u1);
            string url = HttpContext.Current.Request.Url.AbsoluteUri.Replace(HttpContext.Current.Request.Url.PathAndQuery, "/");
            for (int i = 0; i < ss.Count; i++)
            {
                
                HtmlGenericControl ul1 = new HtmlGenericControl();
                if (ss[i].gameover.Trim() == "False")
                {
                   
                    ul1.InnerHtml = "<ul class=\"menu\" style=\"margin: 0px 0px 0px 45px; background-color:#630100\"><a href=\"" + url + "ScoreTracking.aspx?PlayerId=" + ss[i].id + "\"><li> " + ss[i].noplayers + "</li><li>" + ddFname.Text + "</li><li>" + ddName.SelectedItem.Text + "</li><li>" + ss[i].date + "</li><li>" + ss[i].fromtime + "</li><li><font color=\"YELLOW\"> Real Time</font></li></a></ul>";
                }
                else
                {
                   
                    ul1.InnerHtml = "<ul class=\"menu\" style=\"margin: 0px 0px 0px 45px;\"><a href=\"" + url + "ScoreTracking.aspx?PlayerId=" + ss[i].id + "\"><li> " + ss[i].noplayers + "</li><li>" + ddFname.Text + "</li><li>" + ddName.SelectedItem.Text + "</li><li>" + ss[i].date + "</li><li>" + ss[i].fromtime + "</li><li></li></a></ul>";
                }
                pnlgamelist.Controls.Add(ul1);
            }
            int totalpage = 0;
            if(ss.Count>0)
            {
                
                totalpage = Int32.Parse(ss[0].duration) / 10;
                if (Int32.Parse(ss[0].duration) % 10 > 0)
                    totalpage++;
                if(pg==1)
                    lblbtnpage.Text = (totalpage - pg) + " pages";
                else 
                lblbtnpage.Text = "+ " + (totalpage-pg) + " pages";
            }
            
            if (totalpage==pg)
            {
                btnnext.Visible = false;
                lblbtnpage.Visible = false;
            }
            else
            {

                btnnext.Visible = true;
                lblbtnpage.Visible = true;
            }
            btnpre.CommandName = pg.ToString();
            btnnext.CommandName = pg.ToString();
           

        }
       
        public void Loadbylist( string gid)
        {
                pnlselectScore.Visible = false;
                pnlgamelist.Visible = false;
                UpdatePanel1.Visible = false;
                btnnext.Visible = false;
                lblbtnpage.Visible = false;
                btnpre.Visible = false;
                pnlbodyimage.Visible = true;
                LoaddGameData(gid);
                LoaddScoreData();
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", " GetRendomeImg();", true);            
        }
        protected void ddNation_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnnext.Visible = false;
            lblbtnpage.Visible = false;
            btnpre.Visible = false;
            pnlbodyimage.Visible = false;
            lblselectgame.Text = "Please select Game/Set to see all data & statistic";
            lblwinner.Visible = false;
            LoadddCity();
            ddClub.Items.Clear();
            ddClub.Items.Add("Select");
            ddFname.Items.Clear();
            ddFname.Items.Add("Select");
            ddName.Items.Clear();
            ddName.Items.Add("Select");
        }
        protected void ddCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnnext.Visible = false;
            lblbtnpage.Visible = false;
            btnpre.Visible = false;
            pnlbodyimage.Visible = false;
            lblwinner.Visible = false;
            lblselectgame.Text = "Please select Game/Set to see all data & statistic";
            LoadddClub();
            ddFname.Items.Clear();
            ddFname.Items.Add("Select");
            ddName.Items.Clear();
            ddName.Items.Add("Select");

        }
        protected void ddClub_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnnext.Visible = false;
            lblbtnpage.Visible = false;
            btnpre.Visible = false;
            pnlbodyimage.Visible = false;
            lblwinner.Visible = false;
            lblselectgame.Text = "Please select Game/Set to see all data & statistic";
            LoadddFname();
            ddName.Items.Clear();
            ddName.Items.Add("Select");
        }
        protected void ddFname_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlbodyimage.Visible = false;
            lblbtnpage.Visible = false;
            btnnext.Visible = false;
            btnpre.Visible = false;
            lblwinner.Visible = false;
            lblselectgame.Text = "Please select Game/Set to see all data & statistic";
            LoadddName();
        }
        protected void ddName_SelectedIndexChanged(object sender, EventArgs e)
        {
            pg = 1;
             LoadGameList();
        }

        protected void btnpre_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string value = btn.CommandName;

            pg = int.Parse(value);  
            pg = pg - 1;
            LoadGameList();
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string value = btn.CommandName;

            pg = int.Parse(value);
            pg = pg + 1;
            LoadGameList();
        }
       
    }
}