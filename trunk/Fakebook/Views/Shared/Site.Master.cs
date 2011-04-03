using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }
}