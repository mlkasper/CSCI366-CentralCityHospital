using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalRecords.Admin
{
    public partial class SendAnnouncment : System.Web.UI.Page
    {
        public static String AdminName
        {
            get
            {
                HospitalDBEntities dbcon = new HospitalDBEntities();
                string username = HttpContext.Current.User.Identity.Name;
                var user = from x in dbcon.UserTables
                           where x.Username == username
                           select x;
                string name = user.First().FirstName + " " + user.First().LastName;
                return name;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            displayName.InnerText = "Welcome, " + AdminName; //load username in navbar
        }

        private void createMessage(HospitalDBEntities dbcon)
        {
            if(announcmentMessage != null)
            {
                AnnouncmentTable announcment = new AnnouncmentTable();
                announcment.announcmentMessage = this.announcmentMessage.Value;
                announcment.announcmentSend = Convert.ToString(AdminName);
                announcment.announcmentDate = DateTime.Now;
                dbcon.AnnouncmentTables.Add(announcment);
                dbcon.SaveChanges(); 
            }

        }

        protected void sendMessage_Click(object sender, EventArgs e)
        {
            using (HospitalDBEntities dbcon = new HospitalDBEntities())
            {
                createMessage(dbcon);

                Page.Response.Redirect("Default.aspx" + "?PreviousPage=SuccessMessage", true);

            }
        }
    }
}