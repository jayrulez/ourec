using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Fakebook.Lib;
using Fakebook.Models;

namespace Fakebook.Controllers
{
    public class PostController : AuthenticatedController
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create(PostModel model)
        {
            string returnUrl = HttpContext.Request.Params["returnUrl"].Length > 0 ? HttpContext.Request.Params["returnUrl"] : HttpContext.Request.UrlReferrer.ToString();
            
            if(ModelState.IsValid)
            {
                try
                {
                    Entities dbContext = new Entities();

                    Models.Object obj = new Models.Object();
                    obj.EntityName = "Post";
                    dbContext.Objects.AddObject(obj);
                    dbContext.SaveChanges();

                    Post post = new Post();

                    post.Id = obj.Id;
                    post.UserId = new Guid(UserHelper.getLoggedInUserId());
                    post.PersonId = new Guid(HttpContext.Request.Params["personId"].Length > 0 ? HttpContext.Request.Params["personId"] : UserHelper.getLoggedInUserId());
                    post.Content = model.Content;
                    post.CreatedAt = DateTime.Now;
                    post.UpdatedAt = DateTime.Now;

                    dbContext.Posts.AddObject(post);
                    dbContext.SaveChanges();

                    return Redirect(returnUrl);
                }catch(Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }

            return View(model);
        }
    }
}
