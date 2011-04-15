using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;

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

        public ActionResult CreateAlbum()
        {
            AlbumModel model = new AlbumModel();

            return View(model);
        }

        [HttpPost]
        public ActionResult CreateAlbum(AlbumModel model)
        {
            return View(model);
        }

        public ActionResult Upload()
        {
            return View();
        }

    }
}
