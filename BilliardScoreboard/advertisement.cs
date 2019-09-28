using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BilliardScoreboard
{
    public class advertisement
    {
        public int AdvertisementId { get; set; }
        public string Text  { get; set; }
        public string Color { get; set; }
        public float Discount { get; set; }
        public dynamic Img { get; set; }
        public int UserId { get; set; }
        public bool IsTempStorage { get; set; }
        public string advEmail { get; set; }
    }
}