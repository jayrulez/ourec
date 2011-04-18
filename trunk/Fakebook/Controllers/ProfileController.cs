using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;
using System.Web.Routing;

namespace Fakebook.Controllers
{
    public class ProfileController : AuthenticatedController
    {
        private Entities dbContext;
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }
            this.dbContext = new Entities();
        }

        public ActionResult Index(string userId = null)
        {
            if(userId == null)
            {
                userId = UserHelper.getLoggedInUserId();
            }

            var user = UserHelper.getUserById(userId);

            if (user == null)
            {
                return Content("The user you are looking for no longer exists.");
            }
            else
            {
                ViewBag.displayName = UserHelper.GetDisplayName(user.UserId.ToString());
                ViewBag.wallPosts = user.WallPosts.OrderByDescending(p=>p.CreatedAt).ToList();
                return View();
            }
        }

        public ActionResult Info(string userId = null)
        {
            if (userId == null)
            {
                userId = UserHelper.getLoggedInUserId();
            }

            var user = UserHelper.getUserById(userId);

            if (user == null)
            {
                return Content("The user you are looking for no longer exists.");
            }
            else
            {
                ViewBag.profile = UserProfile.GetUser(user.UserId.ToString());
                ViewBag.displayName = UserHelper.GetDisplayName(user.UserId.ToString());
                ViewBag.user = user;
                return View();
            }
        }

        public ActionResult Photos(string userId = null)
        {
            if (userId == null)
            {
                userId = UserHelper.getLoggedInUserId();
            }

            var user = UserHelper.getUserById(userId);

            if (user == null)
            {
                return Content("The user you are looking for no longer exists.");
            }
            else
            {
                ViewBag.displayName = UserHelper.GetDisplayName(user.UserId.ToString());
                ViewBag.photoAlbums = user.Albums;
                ViewBag.user = user;
                return View();
            }
        }

        public ActionResult Edit()
        {
            UserProfile profile = UserProfile.GetUser();

            var model = new UserProfileModel
            {
                FirstName = profile.FirstName,
                LastName = profile.LastName,
                Birthdate = profile.Birthdate.ToShortDateString(),
                Country = profile.Country,
                City = profile.City,
                Profession = profile.Profession,
                RelationshipStatus = profile.RelationshipStatus,
                LastEducationalInstitution = profile.LastEducationalInstitution
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult Edit(UserProfileModel model)
        {
            if (ModelState.IsValid)
            {
                UserProfile profile = UserProfile.GetUser();

                profile.FirstName = model.FirstName;
                profile.LastName = model.LastName;
                profile.Birthdate = System.Convert.ToDateTime(model.Birthdate);
                profile.Country = model.Country;
                profile.City = model.City;
                profile.Profession = model.Profession;
                profile.RelationshipStatus = model.RelationshipStatus;
                profile.LastEducationalInstitution = model.LastEducationalInstitution;

                profile.Save();
                
                return RedirectToAction("Index", "Profile", new { userId = UserHelper.getLoggedInUserId() });
            }

            return View(model);
        }
    }
}
