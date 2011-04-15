using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;

namespace Fakebook.Controllers
{
    public class CommentController : AuthenticatedController
    {
        //
        // GET: /Comment/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create()
        {
            string returnUrl = HttpContext.Request.Params["returnUrl"].Length > 0 ? HttpContext.Request.Params["returnUrl"] : HttpContext.Request.UrlReferrer.ToString();
            
            try
            {

                Guid userGuid = new Guid(UserHelper.getLoggedInUserId());

                Entities dbContext = new Entities();

                int objectId;

                if (!int.TryParse(HttpContext.Request.Params["objectId"], out objectId))
                {
                    throw new Exception("Invalid object id specified.");
                }
                Models.Object obj = dbContext.Objects.SingleOrDefault(o => o.Id == objectId);
                if (obj == null)
                {
                    throw new Exception("The object you are trying to comment on does not exist.");
                }

                if (HttpContext.Request.Params["content"].Length < 1)
                {
                    throw new Exception("You must enter a comment.");
                }
                    
                Comment comment = new Comment();
                comment.UserId = userGuid;
                comment.ObjectId = obj.Id;
                comment.Content = HttpContext.Request.Params["content"];
                comment.CreatedAt = DateTime.Now;

                dbContext.Comments.AddObject(comment);
                dbContext.SaveChanges();

                return Redirect(returnUrl);
            }catch(Exception ex)
            {
                return Content(ex.Message);
            }
        }

    }
}
