﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;

namespace Fakebook.Controllers
{
    public class PostController : AuthenticatedController
    {
        //
        // GET: /Post/

        public ActionResult Index()
        {
            return View();
        }

    }
}