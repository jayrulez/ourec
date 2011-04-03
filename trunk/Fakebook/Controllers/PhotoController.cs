using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;

namespace Fakebook.Controllers
{
    public class PhotoController : AuthenticatedController
    {
        //
        // GET: /Photo/

        public ActionResult Index()
        {
            return View();
        }

    }
}
