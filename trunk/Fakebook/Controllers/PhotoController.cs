using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;
using System.IO;
using System.Drawing;

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
            return View();
        }

        [HttpPost]
        public ActionResult CreateAlbum(AlbumModel model)
        {
            if (ModelState.IsValid)
            {
                try {
                    Entities dbContext = new Entities();

                    Models.Object obj = new Models.Object();
                    obj.EntityName = "Album";
                    dbContext.Objects.AddObject(obj);
                    dbContext.SaveChanges();

                    Album album = new Album();
                    album.Id = obj.Id;
                    album.UserId = new Guid(UserHelper.getLoggedInUserId());
                    album.Name = model.Name;
                    album.Description = model.Description;
                    album.CreatedAt = DateTime.Now;

                    dbContext.Albums.AddObject(album);

                    dbContext.SaveChanges();

                    return RedirectToAction("Upload", "Photo");

                }catch(Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }
            return View(model);
        }

        public ActionResult Upload()
        {
            Guid userGuid = new Guid(UserHelper.getLoggedInUserId());
            Entities dbContext = new Entities();
            var albums = dbContext.Albums.Where(a => a.UserId == userGuid).ToList();
            ViewBag.albums = albums;
            if (albums != null)
                return View();
            else
            {
                return Content("album is numm");// debugging
            }
        }

        [HttpPost]
        public ActionResult Upload(string var = "")
        {
            try {
                foreach (string photoFile in Request.Files)
                {
                    HttpPostedFileBase file = Request.Files[photoFile];

                    if (!(file.ContentLength > 0))
                    {
                        throw new Exception("File is not a valid image.");
                    }

                    string fileExtension = Path.GetExtension(Path.GetFileName(file.FileName));
                    string fileName = UserHelper.getLoggedInUserId() + "_" + DateTime.Now.Ticks.ToString() + fileExtension;
                    string filePath = Path.Combine(HttpContext.Server.MapPath("~/Uploads"), fileName);

                    file.SaveAs(filePath);

                    int albumId;

                    if(!int.TryParse(HttpContext.Request.Params["albumId"], out albumId))
                    {
                        throw new Exception("The requested album id is not a valid integer.");
                    }

                    Entities dbContext = new Entities();

                    var album = dbContext.Albums.SingleOrDefault(a => a.Id == albumId);

                    Guid userGuid = new Guid(UserHelper.getLoggedInUserId());

                    if(album == null || album.UserId != userGuid)
                    {
                        throw new Exception("The album you are trying to upload the photo to is not available.");
                    }

                    Models.Object obj = new Models.Object();
                    obj.EntityName = "Photo";
                    dbContext.Objects.AddObject(obj);
                    dbContext.SaveChanges();

                    Photo photo = new Photo();
                    photo.Id = obj.Id;
                    photo.AlbumId = album.Id;
                    photo.UserId = userGuid;
                    photo.FilePath = fileName;
                    photo.Caption = HttpContext.Request.Params["caption"];
                    photo.CreatedAt = DateTime.Now;
                    dbContext.Photos.AddObject(photo);
                    dbContext.SaveChanges();
                }
                return RedirectToAction("ViewPhoto", "Photo", new { photoId = 1 });
            }catch(Exception ex)
            {
                return Content(ex.Message);
            }
        }

        public ActionResult Output(string photoId = "")
        {
            try
            {
                int pid;
                if(!int.TryParse(photoId, out pid))
                {
                    throw new Exception("Invalid photo id specified.");
                }

                Entities dbContext = new Entities();

                var photo = dbContext.Photos.SingleOrDefault(p => p.Id == pid);

                if(photo == null)
                {
                    throw new Exception("The image does not exist.");
                }
                string path = Path.Combine(HttpContext.Server.MapPath("~/Uploads"), photo.FilePath);
                Image image = Image.FromFile(path);

                var abort = new Image.GetThumbnailImageAbort(ThumbnailCallback);

                var thumbnail = image.GetThumbnailImage(250,250,abort,IntPtr.Zero);

                using (Graphics g = Graphics.FromImage(thumbnail))
                {
                    Font drawFont = new Font("Arial", 5);
                    SolidBrush drawBrush = new SolidBrush(Color.DarkMagenta);
                    PointF stringPonit = new PointF(0, 0);

                    g.DrawString("Nuevo", drawFont, drawBrush, stringPonit);
                }
                MemoryStream ms = new MemoryStream();

                thumbnail.Save(ms, System.Drawing.Imaging.ImageFormat.Png);

                thumbnail.Dispose();
                image.Dispose();
                return File(ms.ToArray(), "image/png");

            }catch(Exception ex)
            {
                return Content(ex.Message);
            }
            
        }

        public bool ThumbnailCallback()
        {
            return false;
        }

        public ActionResult ViewAlbum(string albumId = "")
        {
            return View();
        }

        public ActionResult ViewPhoto(string photoId = "")
        {
            return View();
        }

    }
}
