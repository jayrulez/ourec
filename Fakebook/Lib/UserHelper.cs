﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fakebook.Models;

namespace Fakebook.Lib
{
    public class UserHelper
    {
        static public string getLoggedInUserId()
        {
            return (System.Web.Security.Membership.GetUser() == null) ? null : System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
        }

        static public User getUserById(string userId)
        {
            if(userId == null)
            {
                return null;
            }

            Entities dbContext = new Entities();

            Guid userGuid;

            if (Guid.TryParse(userId, out userGuid))
            {
                return dbContext.Users.SingleOrDefault(u => u.UserId == userGuid);
            }

            return null;
        }

        static public string GetDisplayName(string userId = null)
        {
            if(userId == null)
            {
                userId = UserHelper.getLoggedInUserId();
            }

            User user = UserHelper.getUserById(userId);

            if(user != null)
            {
                UserProfile profile = UserProfile.GetUser(user.UserId.ToString());

                if (profile.FirstName.Length > 0 && profile.LastName.Length > 0)
                {
                    return profile.FirstName + " " + profile.LastName;
                }
				
                return user.UserName;
            }

            return "Guest";
        }
    }
}