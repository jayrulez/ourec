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
		
		[Authorize]
        [HttpPost]
        public ActionResult Index()
        {
            return View();
        }
		
		[Authorize]
        public ActionResult Profile()
        {
            return View();
        }
		
		[Authorize]
        [HttpPost]
        public ActionResult Profile()
        {
            return View();
        }
    }
}
