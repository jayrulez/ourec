using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;

namespace Fakebook.Controllers
{
    public class ProfileController : AuthenticatedController
    {
        private Entities dbContext;

        ProfileController()
        {
            this.dbContext = new Entities();
        }

        public ActionResult Index(string userId = "")
        {
            var user = this.dbContext.Users.Single(u => u.UserId == new Guid(userId));

            return View();
        }
    }
}
