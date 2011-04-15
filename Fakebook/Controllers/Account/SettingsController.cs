using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Fakebook.Models;
using Fakebook.Lib;

namespace Fakebook.Controllers.Account
{
    public class SettingsController : AuthenticatedController
    {
        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }
		
        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

		[Authorize]
        public ActionResult Index()
        {
			
            return View();
        }

        public ActionResult Privacy()
        {
            Entities dbContext = new Entities();

            Guid userGuid = new Guid(UserHelper.getLoggedInUserId());

            UserPrivacy privacy = dbContext.UserPrivacies.SingleOrDefault(p => p.UserId == userGuid);

            if (privacy == null)
            {
                privacy = new UserPrivacy();
                privacy.SeeMyInfo = 0;
                privacy.SeeMyWall = 0;
                privacy.SeeMyPhotos = 0;
            }

            var model = new PrivacyModel { 
                SeeMyInfo = privacy.SeeMyInfo,
                SeeMyWall = privacy.SeeMyWall,
                SeeMyPhotos = privacy.SeeMyPhotos
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult Privacy(PrivacyModel model)
        {
            ViewBag.message = null;

            if(ModelState.IsValid)
            {
                try
                {

                    Entities dbContext = new Entities();

                    Guid userGuid = new Guid(UserHelper.getLoggedInUserId());

                    UserPrivacy privacy = dbContext.UserPrivacies.SingleOrDefault(p => p.UserId == userGuid);

                    if (privacy == null)
                    {
                        privacy = new UserPrivacy();
                        privacy.UserId = userGuid;

                        privacy.SeeMyInfo = model.SeeMyInfo;
                        privacy.SeeMyWall = model.SeeMyWall;
                        privacy.SeeMyPhotos = model.SeeMyPhotos;
                        dbContext.UserPrivacies.AddObject(privacy);
                    }
                    else
                    {
                        privacy.SeeMyInfo = model.SeeMyInfo;
                        privacy.SeeMyWall = model.SeeMyWall;
                        privacy.SeeMyPhotos = model.SeeMyPhotos;
                    }

                    dbContext.SaveChanges();

                    ViewBag.message = "Your privacy settings were saved.";
                }catch(Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }

            return View(model);
        }
    }
}
