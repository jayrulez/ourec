using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Fakebook
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void DispatchEmail(object sender, MailMessageEventArgs e)
        {
            e.Message.Subject = "Nuevo Password Recovery";
            MailMessage msg = e.Message;
            SmtpClient client = new SmtpClient();
            client.EnableSsl = true;
            client.Send(msg);

            e.Cancel = true;
        }
    }
}