using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using System.Web.Routing;
using System.Web.Security;

namespace Fakebook.Controllers
{
    public class DefaultController : BaseController
    {
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);

            if (requestContext.HttpContext.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Home");
            }
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
