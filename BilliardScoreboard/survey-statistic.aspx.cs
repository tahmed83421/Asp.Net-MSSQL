using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Management;

namespace BilliardScoreboard
{
    public partial class survey_statistic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Yess.Text = GetMACAddress().ToString();

        }
        public string GetMACAddress()
        {
            string mac_src = "";
            string macAddress = "";

            foreach (System.Net.NetworkInformation.NetworkInterface nic in System.Net.NetworkInformation.NetworkInterface.GetAllNetworkInterfaces())
            {
                if (nic.OperationalStatus == System.Net.NetworkInformation.OperationalStatus.Up)
                {
                    mac_src += nic.GetPhysicalAddress().ToString();
                    break;
                }
            }

            while (mac_src.Length < 12)
            {
                mac_src = mac_src.Insert(0, "0");
            }

            for (int i = 0; i < 11; i++)
            {
                if (0 == (i % 2))
                {
                    if (i == 10)
                    {
                        macAddress = macAddress.Insert(macAddress.Length, mac_src.Substring(i, 2));
                    }
                    else
                    {
                        macAddress = macAddress.Insert(macAddress.Length, mac_src.Substring(i, 2)) + "-";
                    }
                }
            }
            return macAddress;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Write("okk");

        }
        protected void btn_click(object sender, EventArgs e)
        {
            Response.Write("okk");

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Write("ok");
        }
    }
}