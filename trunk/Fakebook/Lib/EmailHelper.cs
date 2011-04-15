using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

namespace Fakebook.Lib
{
    public class EmailHelper
    {
        public static void SendEmail(string ToEmail, string Subject, string Body)
        {
            try
            {
                MailMessage msg = new MailMessage();
                msg.To.Add(ToEmail);
                msg.Subject = Subject;
                msg.Body = Body;
                SmtpClient smtp = new SmtpClient();
                smtp.EnableSsl = true;
                smtp.Send(msg);
            }
            catch (Exception ex)
            { 
                // do nothing
            }
        }
    }
}