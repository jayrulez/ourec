using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Fakebook.Models
{
    public class PrivacyOption
    {
        public int OptionName;
        public string OptionValue;
    }

    public class PrivacyModel
    {
        public static IEnumerable<PrivacyOption> PrivacyOptions = new List<PrivacyOption>
        {
            new PrivacyOption{
                OptionName = 0,
                OptionValue = "Everyone",
            },
            new PrivacyOption{
                OptionName = 1,
                OptionValue = "Friends Only",
            }
        };

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Who can see my profile info?")]
        public int SeeMyInfo { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Who can see my wall posts?")]
        public int SeeMyWall { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Who can see my photos?")]
        public int SeeMyPhotos { get; set; }
    }
}