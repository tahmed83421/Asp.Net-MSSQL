using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BilliardScoreboard
{
    public class Teacher
    {
        public int PlayerId { get; set; }
        public int ClubId { get; set; }
        public string FamilyName { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string PlayerPicture { get; set; }
        public string VatNo { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Cell { get; set; }
        public string Nation { get; set; }
        public string City { get; set; }
        public string Zip { get; set; }
        public string Street { get; set; }
        public string NDegree { get; set; }
        public string ShareData { get; set; }
        public string ClubWebsite { get; set; }
        public string FederationMembership { get; set; }
        public string Category { get; set; }
        public string GameSpeciality { get; set; }
        public string ScoreSponsor { get; set; }
        public string LookingForSponsor { get; set; }
        public string RightsTelevisionImage { get; set; }
        public DateTime? RegisteredOn { get; set; }
        public string Status { get; set; }
        public string login { get; set; }
        public string nbpaypal { get; set; }
        public string nbinfo { get; set; }
        public string nbsponser { get; set; }
        public string nbiscri { get; set; }
        public DateTime? nbexpirydate { get; set; }
        public string nbcodice { get; set; }
        public string nbncarta { get; set; }
        public int? nbEmailVerify { get; set; }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        public Teacher() { }
        public Teacher(int playerid)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from playerdetails where PlayerId=" + playerid, con);//Advised to use parameterized query
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                try
                {
                    Category = dr.GetString(dr.GetOrdinal("Category"));
                    Cell = dr.GetString(dr.GetOrdinal("Cell"));
                    City = dr.GetString(dr.GetOrdinal("City"));
                    ClubId = dr.GetOrdinal("ClubId");
                    ClubWebsite = dr.GetString(dr.GetOrdinal("ClubWebsite"));
                    Email = dr.GetString(dr.GetOrdinal("Email"));
                    FamilyName = dr.GetString(dr.GetOrdinal("FamilyName"));
                    FederationMembership = dr.GetString(dr.GetOrdinal("FederationMembership"));
                    GameSpeciality = dr.GetString(dr.GetOrdinal("GameSpeciality"));
                    Gender = dr.GetString(dr.GetOrdinal("Gender"));
                    login = dr.GetString(dr.GetOrdinal("login"));
                    LookingForSponsor = dr.GetString(dr.GetOrdinal("LookingForSponsor"));
                    Name = dr.GetString(dr.GetOrdinal("Name"));
                    Nation = dr.GetString(dr.GetOrdinal("Nation"));
                    nbcodice = dr.GetString(dr.GetOrdinal("nbcodice"));
                    nbEmailVerify = dr.GetInt32(dr.GetOrdinal("nbEmailVerify"));
                    nbexpirydate = dr.GetDateTime(dr.GetOrdinal("nbexpirydate"));
                    nbinfo = dr.GetString(dr.GetOrdinal("nbinfo"));
                    nbiscri = dr.GetString(dr.GetOrdinal("nbiscri"));
                    nbncarta = dr.GetString(dr.GetOrdinal("nbncarta"));
                    nbpaypal = dr.GetString(dr.GetOrdinal("nbpaypal"));
                    nbsponser = dr.GetString(dr.GetOrdinal("nbsponser"));
                    NDegree = dr.GetString(dr.GetOrdinal("NDegree"));
                    Phone = dr.GetString(dr.GetOrdinal("Phone"));
                    PlayerId = dr.GetOrdinal("PlayerId");
                    PlayerPicture = dr.GetString(dr.GetOrdinal("PlayerPicture"));
                    RegisteredOn = dr.GetDateTime(dr.GetOrdinal("RegisteredOn"));
                    RightsTelevisionImage = dr.GetString(dr.GetOrdinal("RightsTelevisionImage"));
                    ScoreSponsor = dr.GetString(dr.GetOrdinal("ScoreSponsor"));
                    ShareData = dr.GetString(dr.GetOrdinal("ShareData"));
                    Status = dr.GetString(dr.GetOrdinal("Status"));
                    Street = dr.GetString(dr.GetOrdinal("Street"));
                    VatNo = dr.GetString(dr.GetOrdinal("VatNo"));
                    Zip = dr.GetString(dr.GetOrdinal("Zip"));
                    dr.Close();
                }
                catch (Exception)
                {
                }
            }
            con.Close();
        }
    }
}