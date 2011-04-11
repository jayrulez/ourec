using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Fakebook.Models
{
    [Serializable]
    public class UserProfile
    {
        [Required]
        [Display(Name = "First name")]
        public String FirstName { get; set; }

        [Required]
        [Display(Name = "Last name")]
        public String LastName { get; set; }

        [Required]
        [Display(Name = "Date of birth")]
        public DateTime Birthdate { get; set; }

        [Required]
        [Display(Name = "Current country")]
        public String CurrentCountry { get; set; }

        [Required]
        [Display(Name = "Current city")]
        public String City { get; set; }

        [Required]
        [Display(Name = "Profession")]
        public String Profession { get; set; }

        [Required]
        [Display(Name = "Relationship status")]
        public String RelationshipStatus { get; set; }

        [Required]
        [Display(Name = "Last educational institution")]
        public string LastEducationalInstitution { get; set; }
    }
}