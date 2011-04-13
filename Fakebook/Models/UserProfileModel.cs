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
    public class UserProfileModel
    {
        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "First name")]
        public string FirstName { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Last name")]
        public string LastName { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [Display(Name = "Date of birth")]
        public string Birthdate { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Current country")]
        public string Country { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Current city")]
        public string City { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Profession")]
        public string Profession { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Relationship status")]
        public string RelationshipStatus { get; set; }

        [Required]
        [DataType(DataType.Text)]
        [Display(Name = "Last educational institution")]
        public string LastEducationalInstitution { get; set; }
    }
}