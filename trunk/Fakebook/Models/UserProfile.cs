using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using Fakebook.Lib;

namespace Fakebook.Models
{
    [Serializable]
    public class UserProfile : ProfileBase
    {
        static public UserProfile GetUser(string userId = null)
        { 
            if(userId == null)
            {
                userId = UserHelper.getLoggedInUserId();
            }

            User user = UserHelper.getUserById(userId);

            return ProfileBase.Create(user != null ? user.UserName : System.Web.Security.Membership.GetUser().UserName) as UserProfile;
        }

        public string GetFullName()
        {
            //string name = (string)base["FirstName"] + "" + (string)base["LastName"];
            //return name;
            return FirstName + " " + LastName;
        }

        [SettingsAllowAnonymous(false)]
        public string FirstName { 
            get { return base["FirstName"] as string; } 
            set { base["FirstName"] = value; } 
        }

        [SettingsAllowAnonymous(false)]
        public string LastName {
            get { return base["LastName"] as string; }
            set { base["LastName"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public DateTime Birthdate {
            get { return ((DateTime)base["Birthdate"]); }
            set { base["Birthdate"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public String Country
        {
            get { return ((string)base["Country"]); }
            set { base["Country"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public String City
        {
            get { return ((string)base["City"]); }
            set { base["City"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public String Profession
        {
            get { return ((string)base["Profession"]); }
            set { base["Profession"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public String RelationshipStatus
        {
            get { return ((string)base["RelationshipStatus"]); }
            set { base["RelationshipStatus"] = value; }
        }

        [SettingsAllowAnonymous(false)]
        public string LastEducationalInstitution
        {
            get { return ((string)base["LastEducationalInstitution"]); }
            set { base["LastEducationalInstitution"] = value; }
        }
    }
}