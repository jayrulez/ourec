using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Collections;

namespace Fakebook.Views.Shared
{
    public partial class Site : System.Web.Mvc.ViewMasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public static bool HasNonEmptyControls(ContentPlaceHolder cph)
        {
            if (cph.Controls.Count == 0)
            {
                return false;
            }
            else if (cph.Controls.Count == 1)
            {
                LiteralControl c = cph.Controls[0] as LiteralControl;

                if (string.IsNullOrEmpty(c.Text) || IsWhiteSpace(c.Text))
                    return false;
            }

            return true;
        }

        public static bool IsWhiteSpace(string s)
        {
            for (int i = 0; i < s.Length; i++)
                if (!char.IsWhiteSpace(s[i]))
                    return false;

            return true;
        }

        static readonly Type _masterType = typeof(MasterPage);
        static readonly PropertyInfo _contentTemplatesProp = _masterType.GetProperty("ContentTemplates", BindingFlags.GetProperty | BindingFlags.NonPublic | BindingFlags.Instance);

        public static bool HasContentPageContent(ContentPlaceHolder cph)
        {
            IDictionary templates = null;
            MasterPage master = cph.Page.Master;

            while (templates == null && master != null)
            {
                templates = (IDictionary)_contentTemplatesProp.GetValue(master, null);
                master = master.Master;
            }

            if (templates == null)
                return false;

            bool isSpecified = false;

            foreach (string key in templates.Keys)
            {
                if (key == cph.ID)
                {
                    isSpecified = true;

                    break;
                }
            }

            return isSpecified;
        }

        public static bool HasContent(ContentPlaceHolder cph)
        {
            return HasNonEmptyControls(cph) || HasContentPageContent(cph);
        }
    }
}