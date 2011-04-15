using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Fakebook.Models;
using System.Text;
using System.Xml;

namespace Fakebook
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			Response.Clear();
			Response.ContentType = "text/xml";
			XmlTextWriter objX = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);
			objX.WriteStartDocument();
			objX.WriteStartElement("rss");
			objX.WriteAttributeString("version","2.0");
			objX.WriteStartElement("channel");
			objX.WriteElementString("title", "Nuevo developer news");
			objX.WriteElementString("link",Request.ApplicationPath.TrimEnd('/') + "/News.aspx");
			objX.WriteElementString("description","The latest developer news from Nuevo.");
			objX.WriteElementString("copyright","(c) 2020, Nuevo, LLC. All rights reserved.");
			objX.WriteElementString("ttl","5");

            Entities dbContext = new Entities();
            var articles = dbContext.Articles.OrderBy(a => a.CreatedAt).ToList();

            foreach(Article article in articles)
            {
                objX.WriteStartElement("item");
                objX.WriteElementString("title", article.Title);
                objX.WriteElementString("description", article.Content.Length > 150 ? article.Content.Substring(0, 149)+"..." : article.Content);
                objX.WriteElementString("link", Request.ApplicationPath.TrimEnd('/') + "/Article.aspx?Id=" + article.Id.ToString());
                objX.WriteElementString("pubDate", article.CreatedAt.ToString());
                objX.WriteEndElement();
            }

			objX.WriteEndElement();
			objX.WriteEndElement();
			objX.WriteEndDocument();
			objX.Flush();
			objX.Close();
			Response.End();
        }
    }
}