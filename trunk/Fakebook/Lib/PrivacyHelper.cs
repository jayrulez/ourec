using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fakebook.Models;

namespace Fakebook.Lib
{
    public class PrivacyHelper
    {
        public static bool CanSeeWall(Guid UserId, Guid SubjectId)
        {
            Entities dbContext = new Entities();
            UserPrivacy privacy = dbContext.UserPrivacies.SingleOrDefault(p => p.UserId == UserId);
            if(privacy == null || privacy.SeeMyWall == 0)
            {
                return true;
            }

            return FriendshipHelper.AreFriends(UserId, SubjectId) || UserId == SubjectId;
        }

        public static bool CanSeeInfo(Guid UserId, Guid SubjectId)
        {
            Entities dbContext = new Entities();
            UserPrivacy privacy = dbContext.UserPrivacies.SingleOrDefault(p => p.UserId == UserId);
            if (privacy == null || privacy.SeeMyInfo == 0)
            {
                return true;
            }

            return FriendshipHelper.AreFriends(UserId, SubjectId) || UserId == SubjectId;
        }

        public static bool CanSeePhotos(Guid UserId, Guid SubjectId)
        {
            Entities dbContext = new Entities();
            UserPrivacy privacy = dbContext.UserPrivacies.SingleOrDefault(p => p.UserId == UserId);
            if (privacy == null || privacy.SeeMyPhotos == 0)
            {
                return true;
            }

            return FriendshipHelper.AreFriends(UserId, SubjectId) || UserId == SubjectId;
        }
    }
}