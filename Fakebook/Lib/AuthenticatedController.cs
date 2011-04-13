using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;

namespace Fakebook.Lib
{
    public abstract class AuthenticatedController : BaseController
    {
        protected override void Initialize(RequestContext requestContext)
        {
            base.Initialize(requestContext);

            if(!requestContext.HttpContext.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.LoginUrl);
            }
        }
    }
}
