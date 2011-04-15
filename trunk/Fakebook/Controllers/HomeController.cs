using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;
using System.Data.Objects.DataClasses;
using System.Web.Routing;

namespace Fakebook.Controllers
{
    public class HomeController : AuthenticatedController
    {
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
        }
        public ActionResult Index()
        {
            Entities dbContext = new Entities();
            string myId = UserHelper.getLoggedInUserId();
            if(myId == null)
            {
                return RedirectToAction("Index", "Default");
            }
            Guid userGuid = new Guid(myId);


            var friendsOf = from fo in dbContext.Friendships
                            where fo.FriendId == userGuid && fo.Status == 1
                            select fo.UserId;

            var friendsWith = from fw in dbContext.Friendships
                              where fw.UserId == userGuid && fw.Status == 1
                              select fw.FriendId;

            /*var posts = from p in dbContext.Posts
                        where p.UserId == userGuid || friendsOf.Contains(p.UserId) || friendsWith.Contains(p.UserId)
                        select p;*/

            var posts = dbContext.Posts.Where(p => p.UserId == userGuid || p.PersonId == userGuid || friendsOf.Contains(p.UserId) || friendsWith.Contains(p.UserId)).ToList();

            //List ids = new List();

            //var posts = dbContext.Posts.Where(p => p.UserId == userGuid OR p.UserId in ids);

            ViewBag.posts = posts;
            if (posts != null)
                return View();
            else
                return Content("posts is null");//debugging
        }
    }
}
