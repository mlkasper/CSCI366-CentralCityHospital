using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalRecords.Reception
{
    public partial class Default : System.Web.UI.Page
    {
        private static HospitalDBEntities dbcon = new HospitalDBEntities();

        public static String AdminName
        {
            get
            {

                string username = HttpContext.Current.User.Identity.Name;
                var user = from x in dbcon.UserTables
                           where x.Username == username
                           select x;
                string name = user.First().FirstName + " " + user.First().LastName;
                return name;
            }
        }
        private void checkIfAnnouncement() //checks if there are announcements if none remove button and show message
        {
            var checkAnnouncment = from x in dbcon.AnnouncmentTables
                                   select x;
            if (!checkAnnouncment.Any()) //check if there are no announcments
            {
                isAnnouncment.Visible = true;

            }
            else
            {
                isAnnouncment.Visible = false;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            checkIfAnnouncement(); //check if any announcments exist.
            displayName.InnerText = "Welcome, " + AdminName;
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("../Default.aspx"); 
        }
    }
}