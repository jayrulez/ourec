using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Fakebook.Models;
using System.Web.Mvc;

namespace Fakebook.Lib
{
    public class FriendshipHelper
    {
        public static bool AreFriends(Guid UserId, Guid SubjectId)
        {
            Entities dbContext = new Entities();
            Friendship friendship = dbContext.Friendships.SingleOrDefault(f => f.Status == 1 && ((f.UserId == UserId && f.FriendId == SubjectId) || (f.UserId == SubjectId && f.FriendId == UserId)));

            return friendship != null;
        }

        public static bool HasFriendRequest(Guid UserId, Guid SubjectId)
        {
            Entities dbContext = new Entities();
            Friendship friendship = dbContext.Friendships.SingleOrDefault(f => f.Status == 0 && f.UserId == UserId && f.FriendId == SubjectId);

            return friendship != null;
        }

        public static bool ShowAddFriendLink(Guid UserId, Guid SubjectId)
        {
            if(UserId == SubjectId)
            {
            
            }else if(FriendshipHelper.AreFriends(UserId, SubjectId))
            {
            }else if (FriendshipHelper.HasFriendRequest(UserId, SubjectId))
            {
            }
            else if (FriendshipHelper.HasFriendRequest(SubjectId, UserId))
            {
            }
            else {
                return true;//add
            }
            return false;
        }
    }
}