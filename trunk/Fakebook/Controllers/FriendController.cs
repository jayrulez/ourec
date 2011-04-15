using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;

namespace Fakebook.Controllers
{
    public class FriendController : AuthenticatedController
    {
        //
        // GET: /Friend/

        public ActionResult Index()
        {
            var user = UserHelper.getUserById(UserHelper.getLoggedInUserId());
            Entities dbContext = new Entities();

            var friendships = dbContext.Friendships.Where(f => f.Status == 1 && ((f.UserId == user.UserId) || (f.FriendId == user.UserId))).ToList();

            ViewBag.friendships = friendships;

            return View();
        }

        public ActionResult Search(string query = "")
        {
            if(query.Length > 0)
            {
                Entities dbContext = new Entities();

                var users = from u in dbContext.Users
                            join m in dbContext.Memberships on u.UserId equals m.UserId
                            where
                                u.UserName.EndsWith(query) ||
                                u.UserName.StartsWith(query) ||
                                u.UserName.Contains(query) ||
                                (String)m.Email == query
                            select u;
                ViewBag.users = users.ToList();
            }else{
                ViewBag.users = null;
            }

            return View();
        }

        public ActionResult Requests()
        {
            var user = UserHelper.getUserById(UserHelper.getLoggedInUserId());
            Entities dbContext = new Entities();

            var friendships = dbContext.Friendships.Where(f => f.Status == 0 && f.FriendId == user.UserId).ToList();

            ViewBag.friendships = friendships;

            return View();
        }

        public ActionResult Curate(string friendshipId, string option = "")
        {
            try
            {
                int fid;
                if (!int.TryParse(friendshipId, out fid))
                {
                    throw new Exception("The friendship id specified is not a valid integer.");
                }
                Entities dbContext = new Entities();

                var friendship = dbContext.Friendships.SingleOrDefault(f => f.Id == fid);

                if (friendship == null)
                {
                    throw new Exception("The requested friendship does not exist.");
                }

                Guid userGuid = new Guid(UserHelper.getLoggedInUserId());

                if (!(friendship.UserId == userGuid || friendship.FriendId == userGuid))
                {
                    throw new Exception("You are not a part of this friendship.");
                }

                if (option == "0")
                {
                    dbContext.Friendships.DeleteObject(friendship);
                }
                else if (option == "1")
                {
                    if (friendship.Status != 1)
                    {
                        friendship.Status = 1;
                    }
                }

                dbContext.SaveChanges();

                return Redirect(HttpContext.Request.UrlReferrer.ToString());
            }catch(Exception ex)
            {
                return Content(ex.Message);
            }
        }

        public ActionResult Add(string userId = "")
        {
            try
            {
                Guid friendId;
                if (!Guid.TryParse(userId, out friendId))
                {
                    throw new Exception("The specified user id is not valid.");
                }

                var user = UserHelper.getUserById(friendId.ToString());

                if (user == null)
                {
                    throw new Exception("The user you are trying to add as friend is not available.");
                }

                Guid userGuid = new Guid(UserHelper.getLoggedInUserId());
                if (!FriendshipHelper.ShowAddFriendLink(userGuid, friendId))
                {
                    throw new Exception("A friendship or friendship request already exists between you and " + UserHelper.GetDisplayName(friendId.ToString()));
                }
                Entities dbContext = new Entities();

                Friendship friendship = new Friendship();
                friendship.UserId = userGuid;
                friendship.FriendId = friendId;
                friendship.Status = 0;
                friendship.CreatedAt = DateTime.Now;
                dbContext.Friendships.AddObject(friendship);
                dbContext.SaveChanges();

                return RedirectToAction("Index", "Profile", new { userId = friendId.ToString() });
            }catch(Exception ex)
            {
                return Content(ex.Message);
            }
        }
    }
}
